package com.video.base.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.video.domain.entity.User;
import com.video.domain.service.UserService;
import com.video.utils.DateConvertEditor;
import com.video.utils.ValidateUtil;

public class BaseController {
	
	/** 默认编码方式 */
	protected final String defaultEncoding = "UTF-8";
	
	/**
	 * 获取请求中的数据信息
	 * @return
	 */
	@SuppressWarnings("unchecked")
	protected Map<String, String> getParameters(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		Enumeration<String> enus = request.getParameterNames();
		while (enus.hasMoreElements()) {
			String key = enus.nextElement();
			String value = request.getParameter(key);
			map.put(key, value);
		}
		return map;
	}
	
	/**
	 * 获取get请求中的数据信息
	 * @return
	 */
	@SuppressWarnings("unchecked")
	protected Map<String, String> getParametersByGet(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		Enumeration<String> enus = request.getParameterNames();
		while (enus.hasMoreElements()) {
			String key = enus.nextElement();
			String value = request.getParameter(key);
			try {
				if(ValidateUtil.isNotEmpty(value)) {
					value = java.net.URLDecoder.decode(value,"UTF-8");
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			map.put(key, value);
		}
		return map;
	}
	
	
	@InitBinder  
	protected void initBinder(HttpServletRequest request,  
	                              ServletRequestDataBinder binder) throws Exception {  
	    //对于需要转换为Date类型的属性，使用DateEditor进行处理  
	    binder.registerCustomEditor(Date.class, new DateConvertEditor());  
	} 
	
	/**
	 * 获取项目基础路径.
	 * @param req
	 * @return
	 */
	protected String getBasePath(HttpServletRequest req){
		StringBuffer baseUrl = new StringBuffer();
		String scheme = req.getScheme();
		int port = req.getServerPort();

		baseUrl.append(scheme); // http, https
		baseUrl.append("://");
		baseUrl.append(req.getServerName());
		if ((scheme.equals("http") && port != 80) || (scheme.equals("https") && port != 443))
		{
			baseUrl.append(':');
			baseUrl.append(req.getServerPort());
		}
		return baseUrl.toString();
	}
	
	/**
     * 向前台输出json字符串
     * @param jsonStr 要输出的json字符串
     * @throws IOException
     *
     * @author zzx
     */
    protected void printOutJson(HttpServletResponse response,String jsonStr) throws IOException{
    	response.setCharacterEncoding(defaultEncoding);
    	response.setContentType("text/json; charset=UTF-8");
    	response.getWriter().print(jsonStr);
	}
	
    /**
	 * 获取用户IP.
	 * @param req
	 * @return
	 */
	protected static String getIp(HttpServletRequest req){
		String ip = req.getHeader("x-forwarded-for");
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = req.getHeader("Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = req.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){
	        ip = req.getRemoteAddr();
	    }
	    ip = ip.equals("0:0:0:0:0:0:0:1")?"127.0.0.1":ip;
	    return ip;
	}
	
    
	protected HttpServletRequest getRequest(){
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}
	protected HttpSession getSession(){
		return getRequest().getSession();
	}

	protected HttpSession getSession(boolean isNew){
		return getRequest().getSession(isNew);
	}
	
	@Autowired
	private UserService userService;
	protected User getCurrentLoginUser(){
		String userId = userService.getCurrentLoginInfo(getSession());
		if(ValidateUtil.isNotEmpty(userId)) {
			return userService.getUserInfo(userId);
		}
		return null;
	}
	
	
	
	//获取CSessionID
    public static String getCSessionId(HttpServletRequest request, HttpServletResponse response){
        //1, 从Request中取Cookie
        Cookie[] cookies = request.getCookies();
        //2, 从Cookie数据中遍历查找, 并取CSessionID
        if (null != cookies && cookies.length > 0) {
            for (Cookie cookie : cookies) {
                if ("CSESSIONID".equals(cookie.getName())) {
                    //有, 直接返回
                    return cookie.getValue();
                }
            }
        }
        //没有, 创建一个CSessionId, 并且放到Cookie再返回浏览器.返回新的CSessionID
        String csessionid = UUID.randomUUID().toString().replaceAll("-", "");
        //并且放到Cookie中
        Cookie cookie = new Cookie("CSESSIONID", csessionid);
        //cookie  每次都带来, 设置路径
        cookie.setPath("/");
        //0:关闭浏览器  销毁cookie. 0:立即消失.  >0 存活时间,秒
        cookie.setMaxAge(-1);
        
        return csessionid;
    }
}
