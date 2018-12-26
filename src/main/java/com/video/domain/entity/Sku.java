package com.video.domain.entity;

public class Sku {
	private Long skuId;
	private String goodId;
	private Float price;
	private Integer quantity;
	
	
	
	public Sku() {
		super();
	}
	
	public Sku(Long skuId, String goodId, Float price, Integer quantity) {
		super();
		this.skuId = skuId;
		this.goodId = goodId;
		this.price = price;
		this.quantity = quantity;
	}
	
	public Long getSkuId() {
		return skuId;
	}
	public void setSkuId(Long skuId) {
		this.skuId = skuId;
	}
	
	public String getGoodId() {
		return goodId;
	}
	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}
	
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
}
