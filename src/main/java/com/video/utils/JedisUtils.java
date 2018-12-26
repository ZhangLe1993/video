package com.video.utils;

import java.io.InputStream;
import java.util.List;
import java.util.Properties;

import org.enhydra.jdbc.util.JdbcUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;
import redis.clients.jedis.exceptions.JedisConnectionException;

public class JedisUtils {
	private static Logger logger = LoggerFactory.getLogger(JedisUtils.class);  
    private List<JSONObject> resultList;  
    private static JedisPool jedisPool;  
    private static String ADDR = null;
    private static int PORT = 0;
    private static int TIMEOUT = 0;
  
    /** 
     * 初始化Redis连接池 
     */  
    private static void initializePool() {  
        try {
            //读取redis.properties文件
            Properties props = new Properties();
            
            InputStream in = JdbcUtil.class.getResourceAsStream("/redis.properties");
            
            //加载文件
            props.load(in);
            //读取信息
            ADDR = props.getProperty("redis.host").trim();
            PORT = Integer.parseInt(props.getProperty("redis.port").trim());
            TIMEOUT = Integer.parseInt(props.getProperty("redis.timeout").trim());
            
        } catch (Exception e) {
            e.printStackTrace();
        }
  
        JedisPoolConfig config = new JedisPoolConfig();  
        //设置最大连接数（100个足够用了，没必要设置太大）  
        config.setMaxTotal(100);  
        //最大空闲连接数  
        config.setMaxIdle(10);  
        //获取Jedis连接的最大等待时间（50秒）   
        config.setMaxWaitMillis(50 * 1000);  
        //在获取Jedis连接时，自动检验连接是否可用  
        config.setTestOnBorrow(true);  
        //在将连接放回池中前，自动检验连接是否有效  
        config.setTestOnReturn(true);  
        //自动测试池中的空闲连接是否都是可用连接  
        config.setTestWhileIdle(true);  
        //创建连接池  
        jedisPool = new JedisPool(config, ADDR,PORT,TIMEOUT);  
    }  
  
    /** 
     * 多线程环境同步初始化（保证项目中有且仅有一个连接池） 
     */  
    private static synchronized void poolInit() {  
        if (null == jedisPool) {  
            initializePool();  
        }  
    }  
  
    /** 
     * 获取Jedis实例 
     */  
    private static Jedis getJedis() {  
        if (null == jedisPool) {  
            poolInit();  
        }  
  
        int timeoutCount = 0;  
        while (true) {  
            try {  
                if (null != jedisPool) {  
                    return jedisPool.getResource();  
                }  
            } catch (Exception e) {  
                if (e instanceof JedisConnectionException) {  
                    timeoutCount++;  
                    logger.warn("getJedis timeoutCount={}", timeoutCount);  
                    if (timeoutCount > 3) {  
                        break;  
                    }  
                } else {  
                    logger.warn("jedisInfo ... NumActive=" + jedisPool.getNumActive()  
                            + ", NumIdle=" + jedisPool.getNumIdle()  
                            + ", NumWaiters=" + jedisPool.getNumWaiters()  
                            + ", isClosed=" + jedisPool.isClosed());  
                    logger.error("GetJedis error,", e);  
                    break;  
                }  
            }  
            break;  
        }  
        return null;  
    }  
  
    /** 
     * 释放Jedis资源 
     * 
     * @param jedis 
     */  
    public static void returnResource(Jedis jedis) {  
        if (null != jedis) {  
        	jedisPool.returnResourceObject(jedis);  
        }  
    }  
  
    /** 
     * 绝对获取方法（保证一定能够使用可用的连接获取到 目标数据） 
     * Jedis连接使用后放回  
     * @param key 
     * @return 
     */  
    private String safeGet(String key) {  
        Jedis jedis = getJedis();  
        while (true) {  
            if (null != jedis) {  
                break;  
            } else {  
                jedis = getJedis();  
            }  
        }  
        String value = jedis.get(key);  
        returnResource(jedis);  
        return value;  
    }  
  
    /** 
     * 绝对设置方法（保证一定能够使用可用的链接设置 数据） 
     * Jedis连接使用后返回连接池 
     * @param key 
     * @param time 
     * @param value 
     */  
    private void safeSet(String key, int time, String value) {  
        Jedis jedis = getJedis();  
        while (true) {  
            if (null != jedis) {  
                break;  
            } else {  
                jedis = getJedis();  
            }  
        }  
        jedis.setex(key, time, value);  
        returnResource(jedis);  
    }  
  
    /** 
     * 绝对删除方法（保证删除绝对有效） 
     * Jedis连接使用后返回连接池</span> 
     * @param key 
     */  
    private void safeDel(String key) {  
        Jedis jedis = getJedis();  
        while (true) {  
            if (null != jedis) {  
                break;  
            } else {  
                jedis = getJedis();  
            }  
        }  
        jedis.del(key);  
        returnResource(jedis);  
    }  
  
    /**自定义的一些 get set del 方法，方便使用**/  
    public JSONObject getByCache(String key) {  
        String result = safeGet(key);  
        if (result != null) {  
            return (JSONObject) JSONObject.parse(result);  
        }  
        return null;  
  
    }  
  
    public String getByCacheToString(String key) {  
        String result = safeGet(key);  
        if (result != null) {  
            return result;  
        }  
        return null;  
  
    }  
  
    public List<JSONObject> getArrayByCache(String key) {  
        String result = safeGet(key);  
        if (result != null) {  
            resultList = JSONArray.parseArray(result, JSONObject.class);  
            return resultList;  
        }  
        return null;  
    }  
  
    public JSONArray getJSONArrayByCache(String key) {  
        String result = safeGet(key);  
        if (result != null) {  
            return JSONArray.parseArray(result);  
        }  
        return null;  
    }  
  
    public void setByCache(String key, String s) {  
        safeSet(key, 86400, s);  
    }  
  
    public void setByCacheOneHour(String key, String s) {  
        safeSet(key, 3600, s);  
    }  
  
    public void setByCacheOneHour(String key, List<JSONObject> json) {  
        safeSet(key, 86400, JSONObject.toJSONString(json));  
        resultList = json;  
    }  
  
    public void setByCache(String key, JSONObject json) {  
        safeSet(key, 86400, JSONObject.toJSONString(json));  
    }  
  
    public void setByCache(String key, List<JSONObject> list) {  
        safeSet(key, 86400, JSONObject.toJSONString(list));  
        resultList = list;  
    }  
  
    public void setByCache(String key, JSONArray array) {  
        safeSet(key, 86400, JSONArray.toJSONString(array));  
    }  
  
    public void setByCacheCusTime(String key, String s, int time) {  
        safeSet(key, time, s);  
    }  
  
  
    public void delByCache(String key) {  
        if (null != safeGet(key)) {  
            safeDel(key);  
        }  
    }  
  
    /*public JSONObject toJSON(DBObject db) {  
        return (JSONObject) JSONObject.toJSON(db);  
    }  
  
    public List<JSONObject> toJSON(List<DBObject> list) {  
        List<JSONObject> json = new ArrayList<>();  
        for (DBObject aList : list) {  
            json.add((JSONObject) JSONObject.toJSON(aList));  
        }  
        return json;  
    }  */
  
    public boolean notNull() {  
        return resultList != null && resultList.size() > 0;  
    }  
  
    public List<JSONObject> getResult() {  
        return resultList;  
    }  
}
