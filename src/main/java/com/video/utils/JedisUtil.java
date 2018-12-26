package com.video.utils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class JedisUtil {
	
	private static JedisPool jedisPool;
	
	public static JedisPool getJedisPool() {
		return jedisPool;
	}

	public static void setJedisPool(JedisPool jedisPool) {
		JedisUtil.jedisPool = jedisPool;
	}

	public static Jedis getJedis() {
		if(jedisPool == null) {
			System.out.println("链接池为空");
			return null;
		}
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
        } catch (Exception e) {
            if (jedis!=null)
            jedis.close();
            throw  e;
        }
        return jedis;
    }
	
	
	/**
     * 释放jedis资源
     * @param jedis
     */
    public static void returnResource(final Jedis jedis) {
        if (jedis != null) {
            jedisPool.returnResource(jedis);
            System.out.println("释放成功");
        }
    }
}
