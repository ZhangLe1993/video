package com.video.utils;

import java.util.ArrayList;
import java.util.List;

import com.video.system.entity.User;

public class UserDB {
	
	private static List<User> list = new ArrayList<User>();
	
	
	static {
		list.add(new User("test1","张宇乐","iflytek"));
		list.add(new User("test2","杜文昂","iflytek"));
		list.add(new User("test3","成吉思汗","iflytek"));
	}

	public static List<User> getUserList(){
		return list;
	}
	
	public static String getUidByLoginName(String loginName) {
		User search = new User();
		search.setLoginname(loginName);
		for(int i=0;i<list.size();i++) {
			if(loginName.equals(list.get(i).getLoginname())) {
				System.out.println(list.get(i).getUid());
				return list.get(i).getUid();
			}
			break;
		}
		return null;
	}
	
	
	public static void main(String[] args) {
		getUidByLoginName("张宇乐");
	}
}
