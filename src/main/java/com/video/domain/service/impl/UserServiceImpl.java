package com.video.domain.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.alibaba.fastjson.JSONObject;
import com.video.base.utils.Config;
import com.video.domain.dao.UserDao;
import com.video.domain.entity.User;
import com.video.domain.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private StringRedisTemplate redisTemplate;

	@Transactional
	@Override
	public int deleteByPrimaryKey(String userId) {
		return userDao.deleteByPrimaryKey(userId);
	}

	@Override
	public int insert(User record) {
		
		return userDao.insert(record);
	}

	@Override
	public int insertSelective(User record) {
		return userDao.insertSelective(record);
	}

	@Override
	public User selectByPrimaryKey(String userId) {
		return userDao.selectByPrimaryKey(userId);
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		return userDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKeyWithBLOBs(User record) {
		return userDao.updateByPrimaryKeyWithBLOBs(record);
	}

	@Override
	public int updateByPrimaryKey(User record) {
		return userDao.updateByPrimaryKey(record);
	}

	/**
     * 从Redis中获取浏览器当前登录信息   userId
     * @param session
     * @return userId
     */
	@Override
	public String getCurrentLoginInfo(HttpSession session) {
		Object obj = redisTemplate.opsForValue().get(Config.getLoginSessionKey(session.getId()));
		if(obj == null) {
        	return null;
        }else {
        	JSONObject jsonObject = JSONObject.parseObject(Objects.toString(obj), JSONObject.class);
        	return jsonObject.getString("userId");
        }
	}

	@Override
	public List<User> getAll(int limit,int offset) {
		return userDao.selectAll(limit,offset);
	}

	@Override
	public int countUser() {
		// TODO Auto-generated method stub
		return userDao.countUser();
	}

	@Override
	public List<User> getListBySearch(String start,String end,String search) {
		return userDao.selectAllBySearch(start, end, search);
	}

	@Transactional
	@Override
	public User loginSearch(User search,HttpSession session) {
		User user = userDao.loginSearch(search);
		if (user == null){
        	return null;
        }else {
        	saveUserInfoToRedis(user);
        	saveUserLoginInfoToRedis(user.getUserId(),session.getId());
    		return user;
        }
	}

	@Override
	public int countByLogin(String userLoginName, String userPassword) {
		return userDao.countByLogin(userLoginName, userPassword);
	}

	@Override
	public int countByUserLoginName(String userLoginName) {
		return userDao.countByUserLoginName(userLoginName);
	}
	
	
	/**
     * 保存用户基础信息 --> Redis
     * @param User
     */
    public void saveUserInfoToRedis(User user) {
        String userId = user.getUserId();
        redisTemplate.opsForValue().set(Config.getLoginUserKey(userId), JSONObject.toJSONString(user));
        redisTemplate.expire(Config.getLoginUserKey(userId), Config.USER_INFO_TIMEOUT, TimeUnit.MILLISECONDS);
        
    }
    
    /**
     * 保存用户登录信息 --> Redis
     * @param userId
     * @param sessionId
     */
    public void saveUserLoginInfoToRedis(String userId,String sessionId) {
    	JSONObject userLoginInfo = new JSONObject();
    	userLoginInfo.put("userId", userId);
        redisTemplate.opsForValue().set(Config.getLoginSessionKey(sessionId), userLoginInfo.toJSONString());
        redisTemplate.expire(Config.getLoginSessionKey(sessionId), Config.LOGIN_INFO_TIMEOUT, TimeUnit.MILLISECONDS);
    }
    
    /**
     * 从Redis中获取用户基本信息
     * @param userId
     * @return
     */
    @Override
    public User getUserInfo(String userId) {
        Object obj = redisTemplate.opsForValue().get(Config.getLoginUserKey(userId));
        if(obj == null) return null;
        return JSONObject.parseObject(Objects.toString(obj), User.class);
    }

	@Override
	public User searchPhoto(String userId) {
		return userDao.searchPhoto(userId);
	}

	@Override
	public int registCount(User record) {
		return userDao.registCount(record);
	}
    
	/**
     * 删除用户登录信息
     * @param userId
     */
    public void deleteLoginInfo(HttpSession session) {
        String loginInfoHKey = Config.getLoginSessionKey(session.getId());
        if(redisTemplate.hasKey(loginInfoHKey)) {
            redisTemplate.delete(loginInfoHKey);
            redisTemplate.delete(Config.getLoginSessionKey(session.getId()));
        }
    }
    
	
	
	/**
     * 删除用户基本信息
     * @param userId
     */
    public void deleteUserInfo(String userId) {
        String userInfoHKey = Config.getLoginUserKey(userId);
        if(redisTemplate.hasKey(userInfoHKey)) {
            redisTemplate.delete(userInfoHKey);
            redisTemplate.delete(Config.getLoginUserKey(userId));
        }
    }
    
    /**
     * 批量删除缓存
     * @param markIdList
     */
    public void deleteTaskInfo(Collection<String> userIdList) {
        if (!CollectionUtils.isEmpty(userIdList)) {
            List<String> userInfoHKeys = new ArrayList<>();
            //List<String> taskFileHKeys = new ArrayList<>();
            userIdList.parallelStream().forEach(userId -> {
                String userInfoHKey = Config.getLoginUserKey(userId);
                //String taskFileHKey = Config.getTaskFileHKey(userId);
                userInfoHKeys.add(userInfoHKey);
                //taskFileHKeys.add(taskFileHKey);
            });
            redisTemplate.delete(userInfoHKeys);
            //redisTemplate.delete(taskFileHKeys);
        }
    }
    
    /*public User getCurrentLoginInfo(String sessionId) {
        Object obj = redisTemplate.opsForValue().get(Config.getLoginSessionKey(sessionId));
        if(obj == null) return null;
        return JSONObject.parseObject(Objects.toString(obj), User.class);
    }*/
	
}
