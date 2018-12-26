package com.video.domain.entity;

import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;

public class Buyercart {
	
	/**
	 * 购物车
	 */
	private List<Buyeritem> list = new ArrayList<Buyeritem>();

	public List<Buyeritem> getList() {
		return list;
	}

	public void setList(List<Buyeritem> list) {
		this.list = list;
	}
	
	
	/**
	 * 添加购物项到购物车
	 * @param item
	 */
	public void addItem(Buyeritem item) {
		/**
		 * 判断要添加的购物项是否已经存在购物车里面
		 */
		if(list.contains(item)) {
			/**
			 * 追加数量
			 */
			for(Buyeritem temp:list) {
				if(temp.equals(item)) {
					temp.setAmount(item.getAmount()+temp.getAmount());
				}
			}
		}else {
			list.add(item);
		}
	}
	
	
	/**
	 * 数量小计
	 * @return
	 */
	@JsonIgnore
	public Integer getProductAmount() {
		Integer result = 0;
		
		for(Buyeritem temp:list) {
			result += temp.getAmount();
		}
		return result;
	}
	
	/**
	 * 金额统计
	 * @return
	 */
	@JsonIgnore
	public Float getProductPrice() {
		Float result = 0f;
		for(Buyeritem temp:list) {
			result += temp.getAmount() *temp.getSku().getPrice();
		}
		return result;
	}
	
	
	/**
	 * 运费
	 * @return
	 */
	@JsonIgnore
	public Float getFee() {
		Float fee = 0f;
		if(getProductPrice()<79) {
			fee = 5f;
		}
		return fee;
	}
	
	/**
	 * 总价=商品总额+运费
	 * @return
	 */
	@JsonIgnore
	public Float getTotalPrice() {
		return getProductPrice()+getFee();
	}
}
