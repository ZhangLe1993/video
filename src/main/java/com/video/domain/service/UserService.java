package com.video.domain.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.video.domain.entity.User;

public interface UserService {
	int deleteByPrimaryKey(String userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKeyWithBLOBs(User record);

    int updateByPrimaryKey(User record);
    
    int registCount(User record);
    
	public String getCurrentLoginInfo(HttpSession session);
	
	public User getUserInfo(String userId);
	
	public List<User> getAll(int limit,int offset);
	
	public List<User> getListBySearch(String start,String end,String search);
	
	public int countUser();
	
	public User loginSearch(User search,HttpSession session);
    
	public int countByLogin(String userLoginName,String userPassword);
    
	public int countByUserLoginName(String userLoginName);
	
    public User searchPhoto(String userId);
    
    public void deleteLoginInfo(HttpSession session);
}
