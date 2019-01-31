package com.video.annotation;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.fastjson.JSONObject;
import com.video.utils.JsonUtils;

@Component
@Aspect
public class RequestLog {
	
	private static final Logger logger = LoggerFactory.getLogger(RequestLog.class);
	
	/**
	 * 定义一个切点
	 */
	//@Pointcut("execution(* com.video.controller.*.*(..))")
	@Pointcut("@annotation(com.video.annotation.SystemLog)")
	public void controllerLog() {}
	
	

	/**
	 * 在调用前打印日志
	 * @param joinPoint
	 * @throws Exception
	 */
	@Before("controllerLog()")
	public void before(JoinPoint joinPoint) throws Exception {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		
		logger.info("请求的IP:{}",request.getRemoteAddr());
		
		logger.info("请求的路径:{}",request.getRequestURI());
		
		logger.info("请求的方式:{}",request.getMethod());
		
		logger.info("方法描述:{}",getMethodDescription(joinPoint));
		
		logger.info("请求的参数:{}",JSONObject.toJSONString(request.getParameterMap()));
	}
	
	/**
	 * 获取注解目标方法的说明
	 * @param joinPoint
	 * @return
	 * @throws Exception
	 */
	private String getMethodDescription(JoinPoint joinPoint) throws Exception {
		
		String targetName = joinPoint.getTarget().getClass().getName();
		
		String methodName = joinPoint.getSignature().getName();
		
		Object[] arguments = joinPoint.getArgs();
		
		Class<?> targetClass = Class.forName(targetName);
		
		Method[] methods = targetClass.getDeclaredMethods();
		
		String description = "";
		
		for(Method method : methods) {
			if(method.getName().equals(methodName)) {
				Class<?>[] classz = method.getParameterTypes();
				if(classz.length == arguments.length) {
					description = method.getAnnotation(SystemLog.class).desc();
					break;
				}
			}
		}
		
		return description;
	}
	
	/**
	 * 打印请求方法执行花费的时间和返回值
	 * @param joinPoint
	 * @return
	 * @throws Throwable
	 */
	@Around("controllerLog()")
	public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
		long startTime = System.currentTimeMillis();
		
		Object[] arguments = joinPoint.getArgs();
		
		Object retVal = joinPoint.proceed(arguments);
		
		long endTime = System.currentTimeMillis();
		
		logger.info("执行时间:{} ms",endTime - startTime);
		
		logger.info("返回值:{} \n\t",JsonUtils.obj2Json(retVal));
		
		return retVal;
		
	}
	
	/**
	 * 打印异常
	 * @param e
	 * @throws Exception
	 */
	@AfterThrowing(throwing = "e", pointcut = "controllerLog()")
	public void afterThrowing(Throwable e) throws Exception {
		logger.info("发生异常:{}",e.toString());
	}
	
}
