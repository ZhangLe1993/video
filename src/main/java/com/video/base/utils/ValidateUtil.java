package com.video.base.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.util.CollectionUtils;

import com.alibaba.fastjson.JSONObject;
import com.video.domain.entity.User;

public class ValidateUtil {
	
	/**
	 * 为方便测试，只验证这几个字段，具体要根据业务需要进行修改
     * 验证必要字段信息
     */
    public static List<String> BASE_FILE_COLUMNS = Arrays.asList(
            "userId",   		// ID
            "userPassword",     // 密码
            "userSex",      	// 性别
            "userAge"			// 年龄
    );
	
	/**
     * 验证用户字段
     * @param jsonList
     * @return
     */
    public static boolean validateColumns(List<JSONObject> jsonList) {
        if(!CollectionUtils.isEmpty(jsonList)) {
            Iterator<JSONObject> iterator = jsonList.iterator();
            while (iterator.hasNext()) {
                JSONObject file = iterator.next();
                boolean b = BASE_FILE_COLUMNS.stream().allMatch(
                        c -> file.containsKey(c) && Optional.ofNullable(file.get(c)).isPresent());
                if(!b) return false;
            }
            return true;
        }
        return false;
    }
    
    /**
     * 测试验证
     * @param args
     */
    public static void main(String[] args) {
    	//String类型json校验
		String userJson = "[{\"userId\":\"1\",\"userPassword\":\"123456\",\"userSex\":\"男\",\"userAge\":25},{\"userId\":\"2\",\"userPassword\":\"123456\",\"userSex\":\"女\",\"userAge\":25}]";
    	List<JSONObject> sJsonList = JSONObject.parseArray(userJson, JSONObject.class);
		
    	boolean flag = validateColumns(sJsonList);
    	
    	System.out.println(flag);
    	
    	
    	String userJson2 = "[{\"userId\":\"1\",\"userPassword\":\"123456\",\"userSex\":\"男\"},{\"userId\":\"2\",\"userPassword\":\"123456\",\"userSex\":\"女\",\"userAge\":25}]";
    	List<JSONObject> sJsonList2 = JSONObject.parseArray(userJson2, JSONObject.class);
		
    	boolean flag2 = validateColumns(sJsonList2);
    	
    	System.out.println(flag2);
    	
    	//List类型校验
		List<User> userList = new ArrayList<User>();
		User user = new User("3","root","女",24);
		userList.add(user);
		List<JSONObject> jsonList = JSONObject.parseArray(Objects.toString(userList), JSONObject.class);
		
		boolean v = validateColumns(jsonList);
		
		System.out.println(v);
		
	}

}
