package com.video.base.utils;

public class Config {
	
    /**
     * 线程名规范化
     */
    public static String THREAD_NAME_FORMAT = "video-download-at-%d";
	
	public static final String LOGIN_USER_SESSION = "login:user:session";
	public static final String LOGIN_USER_INFO = "login:user:info";
	
	public static final String REGIST_SESSION_VCODE = "regist:session:vcode";
	
	public static final String ACTIVATE_SESSION_VCODE = "activate:session:vcode";
	
	/**
	 * 登录信息过期时间，与session保持一致为30分钟
	 */
	public static final Long LOGIN_INFO_TIMEOUT = 60*30*1000L;
	
	/**
	 * 邮箱验证码过期时间过期时间，与session保持一致为10分钟
	 */
	public static final Long ACTIVATE_INFO_TIMEOUT = 60*10*1000L;
	
	/**
	 * 用户信息保存在session中，为7天（一周）
	 */
	public static final Long USER_INFO_TIMEOUT = 7*24*3600*1000L;

	public static String getLoginSessionKey(String sessionId) {
		
        return LOGIN_USER_SESSION + ":" + sessionId;
    }
	
	public static String getLoginUserKey(String userId) {
		
        return LOGIN_USER_INFO + ":" + userId;
    }
	
	public static String getRegistSessionVCodeKey(String sessionId,String phone) {
		
        return REGIST_SESSION_VCODE + ":" + sessionId + ":" + phone;
    }
	
	public static String getActivateSessionVCodeKey(String sessionId,String phone) {
		
        return ACTIVATE_SESSION_VCODE + ":" + sessionId + ":" + phone;
    }
}
