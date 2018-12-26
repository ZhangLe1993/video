package com.video.domain.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.video.domain.entity.User;

public interface UserDao {
    int deleteByPrimaryKey(String userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userId);
    
    User loginSearch(User search);
    
    int countByLogin(String userLoginName,String userPassword);
    
    int countByUserLoginName(String userLoginName);
    
    List<User> selectAll(@Param("limit") int limit,@Param("offset") int offset);
    
    List<User> selectAllBySearch(@Param("start") String start,@Param("end") String end,@Param("search") String search);
    
    int countUser();
    
    int registCount(User record);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKeyWithBLOBs(User record);

    int updateByPrimaryKey(User record);
    
    User searchPhoto(@Param("userId") String userId);
}