package com.video.utils;

import java.io.InputStream;
import java.util.Properties;

import org.enhydra.jdbc.util.JdbcUtil;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public final class RedisUtil {
	/**
     * Redis服务器IP
     */
    private static String ADDR = null;//192.168.0.100
    
    /**
     * Redis的端口号
     */
    private static int PORT = 0;//6379
    
    //访问密码
    //private static String AUTH = "admin";
    
    /**
     * 可用连接实例的最大数目，默认值为8；
     * 如果赋值为-1，则表示不限制；如果pool已经分配了maxActive个jedis实例，则此时pool的状态为exhausted(耗尽)。
     */
    private static int MAX_ACTIVE = 0;//1024
    
    /**
     * 控制一个pool最多有多少个状态为idle(空闲的)的jedis实例，默认值也是8。
     */
    private static int  MAX_IDLE = 0;//200
    
    /**
     * 等待可用连接的最大时间，单位毫秒，默认值为-1，表示永不超时。如果超过等待时间，则直接抛出JedisConnectionException；
     */
    private static int MAX_WAIT = 0;//10000
    /**
     * 
     */
    private static int TIMEOUT = 0;////10000
    
    /**
     * 在borrow一个jedis实例时，是否提前进行validate操作；如果为true，则得到的jedis实例均是可用的；
     */
    private static boolean TEST_ON_BORROW = true;
    
    /**
     * 在borrow一个jedis实例时，是否提前进行validate操作；如果为true，则得到的jedis实例均是可用的；
     */
    private static boolean TEST_ON_RETURN = true;
    
    /**
     * 
     */
    private static JedisPool jedisPool = null;
    /**
     * 加载配置文件
     * 使用类路径的读取方式
     *  / : 斜杠表示classpath的根目录
     *     在java项目下，classpath的根目录从bin目录开始
     *     在web项目下，classpath的根目录从WEB-INF/classes目录开始
     */
	static{
        try {
            //读取redis.properties文件
            Properties props = new Properties();
            
            InputStream in = JdbcUtil.class.getResourceAsStream("/redis.properties");
            
            //加载文件
            props.load(in);
            //读取信息
            ADDR = props.getProperty("redis.host").trim();
            PORT = Integer.parseInt(props.getProperty("redis.port").trim());
            if(!"true".equals(props.getProperty("redis.testOnBorrow").trim())) {
            	TEST_ON_BORROW = false;
            }
            if(!"true".equals(props.getProperty("redis.testOnReturn").trim())) {
            	TEST_ON_RETURN = false;
            }
            TIMEOUT = Integer.parseInt(props.getProperty("redis.timeout").trim());
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	
    /**
     * 初始化Redis连接池
     */
    static {
        try {
            JedisPoolConfig config = new JedisPoolConfig();
            config.setMaxWaitMillis(MAX_WAIT);
            config.setMaxIdle(MAX_IDLE);
            config.setTestOnBorrow(TEST_ON_BORROW);
            config.setTestOnReturn(TEST_ON_RETURN);
            jedisPool = new JedisPool(config, ADDR, PORT, TIMEOUT);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    /**
     * 获取Jedis实例
     * @return
     */
    public synchronized static Jedis getJedis() {
        try {
            if (jedisPool != null) {
                Jedis resource = jedisPool.getResource();
                return resource;
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
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
