package com.video.utils;

import java.util.ArrayList;
import java.util.List;

import com.video.domain.entity.Sku;

public class SkuDB {
	
	private static List<Sku> list = new ArrayList<Sku>();
	
	
	static {
		list.add(new Sku(10000L, "11", 99.99F, 10));
		list.add(new Sku(10001L, "12", 99.99F, 10));
		list.add(new Sku(10002L, "10", 99.99F, 10));
		list.add(new Sku(20000L, "10", 99.99F, 10));
	}

	public static List<Sku> getUserList(){
		return list;
	}
	
	public static Sku getSkuBySkuId(Long SkuId) {
		Sku search = new Sku();
		search.setSkuId(SkuId);
		for(int i=0;i<list.size();i++) {
			if(SkuId.equals(list.get(i).getSkuId())) {
				System.out.println(list.get(i).getSkuId());
				return list.get(i);
			}
		}
		return null;
	}
	
	
	public static void main(String[] args) {
		getSkuBySkuId(20000L);
	}
}
