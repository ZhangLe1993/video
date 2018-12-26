package com.video.cache;

import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import org.apache.ibatis.cache.Cache;
import org.apache.log4j.Logger;
import org.springframework.data.redis.connection.jedis.JedisConnection;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;

import com.video.utils.MD5;

import redis.clients.jedis.exceptions.JedisConnectionException;

public class RedisCache implements Cache {
	private static final Logger logger = Logger.getLogger(RedisCache.class);

	private static JedisConnectionFactory jedisConnectionFactory;

	private final String id;

	/**
	 * The {@code ReadWriteLock}.
	 */
	private final ReadWriteLock readWriteLock = new ReentrantReadWriteLock();

	public RedisCache(final String id) {
		if (id == null) {
			throw new IllegalArgumentException("Cache instances require an ID");
		}
		logger.debug(">>>>>>>>>>>>>>>>>>>>>MybatisRedisCache:id=" + id);
		this.id = id;
	}

	public void clear() {
		JedisConnection connection = null;
		try {
			connection = jedisConnectionFactory.getConnection();
			connection.flushDb();
			connection.flushAll();
			logger.debug("出现CUD操作，清空对应Mapper缓存======>");
		} catch (JedisConnectionException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				connection.close();
			}
		}
	}

	public String getId() {
		return this.id;
	}

	public Object getObject(Object key) {
		Object result = null;
		JedisConnection connection = null;
		try {
			key = MD5.getMD5Str(key.toString());
			connection = jedisConnectionFactory.getConnection();
			RedisSerializer<Object> serializer = new JdkSerializationRedisSerializer();
			result = serializer.deserialize(connection.get(serializer.serialize(key)));
			if (result == null) {
				removeObject(key);
				return null;
			}
			logger.debug("从缓存中获取-----key=:" + key);
		} catch (JedisConnectionException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				connection.close();
			}
		}
		return result;
	}

	public ReadWriteLock getReadWriteLock() {
		return this.readWriteLock;
	}

	public int getSize() {
		int result = 0;
		JedisConnection connection = null;
		try {
			connection = jedisConnectionFactory.getConnection();
			result = Integer.valueOf(connection.dbSize().toString());
			logger.debug(this.id + "---->>>>总缓存数:" + result);
		} catch (JedisConnectionException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				connection.close();
			}
		}
		return result;
	}

	public void putObject(Object key, Object value) {
		if (value.toString().equals("[]")) {
			logger.info("key:="+key+"--- value 为空:" + value);
			return;
		}
		JedisConnection connection = null;
		try {
			RedisSerializer<Object> serializer = new JdkSerializationRedisSerializer();
			key = MD5.getMD5Str(key.toString());
			connection = jedisConnectionFactory.getConnection();
			connection.set(serializer.serialize(key), serializer.serialize(value));
			logger.debug("添加缓存--------key:=" + key + "  value:=" + value);
		} catch (JedisConnectionException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				connection.close();
			}
		}
	}

	public Object removeObject(Object key) {
		JedisConnection connection = null;
		Object result = null;
		try {
			key = MD5.getMD5Str(key.toString());
			connection = jedisConnectionFactory.getConnection();
			RedisSerializer<Object> serializer = new JdkSerializationRedisSerializer();
			result = connection.expire(serializer.serialize(key), 0);
			logger.debug("LRU算法从缓存中移除-----" + this.id + " key" + key);
		} catch (JedisConnectionException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				connection.close();
			}
		}
		return result;
	}

	public static void setJedisConnectionFactory(JedisConnectionFactory jedisConnectionFactory) {
		RedisCache.jedisConnectionFactory = jedisConnectionFactory;
	}

}
