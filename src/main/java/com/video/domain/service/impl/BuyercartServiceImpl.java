package com.video.domain.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.video.domain.entity.Buyercart;
import com.video.domain.entity.Buyeritem;
import com.video.domain.entity.Sku;
import com.video.domain.service.BuyercartService;
import com.video.utils.RedisUtil;
import com.video.utils.SkuDB;

import redis.clients.jedis.Jedis;

@Service
public class BuyercartServiceImpl implements BuyercartService{
	
	private Jedis jedis = null;

	@Transactional
	@Override
	public void insertBuyerCartToRedis(Buyercart entity, String loginName) {
		jedis = RedisUtil.getJedis();
		List<Buyeritem> list = entity.getList();
		if(list.size() > 0) {
			Map<String,String> map = new HashMap<String,String>();
			for(Buyeritem temp : list) {
				System.out.println("存入Redis中");
				System.out.println(String.valueOf(temp.getSku().getSkuId()));
				System.out.println(jedis.hlen("buyerCart:"+loginName));
				if(jedis.hexists("buyerCart:"+loginName,String.valueOf(temp.getSku().getSkuId()))) {
					System.out.println(jedis.hlen("buyerCart:"+loginName));
					jedis.hincrBy("buyerCart:"+loginName, String.valueOf(temp.getSku().getSkuId()), temp.getAmount());
				}else {
					map.put(String.valueOf(temp.getSku().getSkuId()), String.valueOf(temp.getAmount()));
				}	
			}
			if(map.size()>0) {
				jedis.hmset("buyerCart:"+loginName, map);
			}
		}
		RedisUtil.returnResource(jedis);
	}
	
	
	public String getAttributterForLoginname(String jessionId){
        String value = jedis.get(jessionId + ":LOGIN_NAME");
        if(null != value){
            //计算session过期时间是 用户最后一次请求开始计时.
            jedis.expire(jessionId + ":LOGIN_NAME", 60*30);
            return value;
        }
        return null;
    }
	
	
	public String getAttributterForUid(String jessionId){
        String value = jedis.get(jessionId + ":Uid");
        if(null != value){
            //计算session过期时间是 用户最后一次请求开始计时.
            jedis.expire(jessionId + ":Uid", 60*30);
            return value;
        }
        return null;
    }


	@Override
	public Sku selectSkuById(Long skuId) {
		Sku sku = SkuDB.getSkuBySkuId(skuId);
        //颜色
        //sku.setColor(colorDao.selectByPrimaryKey(sku.getColorId()));
        //添加商品信息
        //sku.setProduct(productDao.selectByPrimaryKey(sku.getProductId()));
        return sku;
	}


	@Override
	public Buyercart selectBuyerCartFromRedis(String loginname) {
		jedis = RedisUtil.getJedis();
		Buyercart buyerCart = new Buyercart();
        //获取所有商品, redis中保存的是skuId 为key , amount 为value的Map集合
        Map<String, String> hgetAll = jedis.hgetAll("buyerCart:"+loginname);
        Set<Entry<String, String>> entrySet = hgetAll.entrySet();
        for (Entry<String, String> entry : entrySet) {
            //entry.getKey(): skuId
            Sku sku = new Sku();
            sku.setSkuId(Long.parseLong(entry.getKey()));
            Buyeritem buyerItem = new Buyeritem();
            buyerItem.setSku(sku);
            //entry.getValue(): amount
            buyerItem.setAmount(Integer.parseInt(entry.getValue()));
            //添加到购物车中
            buyerCart.addItem(buyerItem);
        }
        RedisUtil.returnResource(jedis);
        return buyerCart;
	}
}
