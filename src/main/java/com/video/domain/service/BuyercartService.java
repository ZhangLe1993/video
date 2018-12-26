package com.video.domain.service;

import com.video.domain.entity.Buyercart;
import com.video.domain.entity.Sku;

public interface BuyercartService {
   public void insertBuyerCartToRedis(Buyercart entity,String loginname);

   public Sku selectSkuById(Long skuId);

   public Buyercart selectBuyerCartFromRedis(String loginname);
}
