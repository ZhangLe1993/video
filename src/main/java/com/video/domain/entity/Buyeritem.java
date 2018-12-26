package com.video.domain.entity;

public class Buyeritem {

	private Sku sku;
	private Boolean isHave = true;
	private Integer amount = 1;
	
	
	
	public Buyeritem() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Sku getSku() {
		return sku;
	}
	
	public void setSku(Sku sku) {
		this.sku = sku;
	}
	
	public Boolean getIsHave() {
		return isHave;
	}
	
	public void setIsHave(Boolean isHave) {
		this.isHave = isHave;
	}
	
	public Integer getAmount() {
		return amount;
	}
	
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	
	public int hasCode() {
		final int prime = 31;
		int result = 1;
		result = prime *result + ((sku==null)?0:sku.hashCode());
		return result;
	}
	
	public boolean equals(Object object) {
		if(this==object) {
			return true;
		}
		if(object==null) {
			return false;
		}
		if(this.getClass()!=object.getClass()) {
			return false;
		}
		Buyeritem item = (Buyeritem) object;
		if(sku==null) {
			if(item.sku!=null) {
				return false;
			}
		}else if(!sku.getSkuId().equals(item.sku.getSkuId())) {
			return false;
		}
		return true;
	}
}
