package com.video.system.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.video.base.controller.BaseController;
import com.video.base.pojo.ResultDO;
import com.video.domain.entity.User;
import com.video.domain.service.UserService;
import com.video.domain.service.impl.SendEmailService;
import com.video.utils.DateUtil;
import com.video.utils.StringEx;
import com.video.utils.ValidateUtil;
import com.video.utils.Validator;

@Controller
@RequestMapping("/user/login")
public class LoginController extends BaseController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private SendEmailService sendEmailService;

	@RequestMapping(value = "/toUserLogin.do", method = RequestMethod.POST)
	@ResponseBody
	public ResultDO<User> toLogin(@RequestBody String data, HttpServletRequest request, HttpServletResponse response,
			ModelMap map) {

		User search = new User();
		String loginName = JSONObject.parseObject(data).getString("loginName");
		String userPassword = JSONObject.parseObject(data).getString("userPassword");
		User user = null;
		search.setUserPassword(userPassword);
		if (Validator.isPhone(loginName)) {
			search.setUserPhone(loginName);
			user = userService.loginSearch(search, getSession());
		} else if (Validator.isEmail(loginName)) {
			search.setUserEmail(loginName);
			user = userService.loginSearch(search, getSession());
		} else {
			return new ResultDO<User>(false, "500", "参数错误", null);
		}
		if (ValidateUtil.isNotNull(user)) {
			return new ResultDO<User>(true, "200", "查询成功", user);
		} else {
			return new ResultDO<User>(false, "500", "查询失败", null);
		}

	}

	@RequestMapping(value = "/getCurrentLoginUser.do", method = RequestMethod.POST)
	@ResponseBody
	public ResultDO<?> getCurrentLoginUserInfo() {
		String userId = userService.getCurrentLoginInfo(getSession());
		User user = new User();
		if (ValidateUtil.isNotEmpty(userId)) {
			user = userService.getUserInfo(userId);
			return new ResultDO<User>(true, "200", "此sessionId 在 redis中 有 用户登录", user);
		} else {
			return new ResultDO<User>(false, "500", "此sessionId 在  redis没有用户登录", null);
		}
	}

	@RequestMapping(value = "/getUserPhotoImg.do", method = RequestMethod.GET)
	public void getUserPhotoImg(String userId, HttpServletResponse response) {
		// 禁止图像缓存。
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		if (ValidateUtil.isNotEmpty(userId)) {
			try {
				User user = userService.searchPhoto(userId);
				if(ValidateUtil.isNull(user)) {
					user = userService.searchPhoto("default");
				}
				byte[] photo = user.getUserPhoto();
				
				OutputStream os = response.getOutputStream();
				int count = 0;
				InputStream fis = new ByteArrayInputStream(photo);
				byte[] buffer = new byte[1024];
				while ((count = fis.read(buffer)) != -1) {
					os.write(buffer, 0, count);
					os.flush();
				}
				fis.close();
				os.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping(value = "/out.do", method = RequestMethod.POST)
	@ResponseBody
	public ResultDO<?> toUserLoginOut(String userId, HttpServletRequest request, HttpServletResponse response) {
		ResultDO<Object> rDo = null;
		try {
			userService.deleteLoginInfo(request.getSession());
			rDo = new ResultDO<Object>(true, "200", "退出成功", 0);
		}catch(Exception e) {
			rDo = new ResultDO<Object>(false, "500", "退出失败", 1);
		}
		return rDo;
	}
	
	@RequestMapping(value = "/userRegister.do", method = RequestMethod.POST)
	@ResponseBody
	public ResultDO<?> userRegister(@RequestBody String data,HttpServletRequest request, HttpServletResponse response,
			ModelMap map) {
		String phone = JSONObject.parseObject(data).getString("phone");
		String userPassword = JSONObject.parseObject(data).getString("pass");
		String username = JSONObject.parseObject(data).getString("username");
		User user = new User();
		user.setUserId(StringEx.newUUID());
		user.setUpdateTime(DateUtil.formatDate());
		user.setUserNickName(username);
		//user.setUserLoginName(username);
		user.setUserPassword(userPassword);
		if (Validator.isPhone(phone)) {
			user.setUserPhone(phone);
		} else if (Validator.isEmail(phone)) {
			user.setUserEmail(phone);
		} else {
			return new ResultDO<Object>(false, "500", "参数错误", 1);
		}
		user.setDeleteFlag("0");
		user.setIsVip("0");
		user.setLastLoginIp(getIp(request));
		user.setLastLoginTime(DateUtil.formatDate());
		user.setUserIntegral(0);
		user.setUserLevel("0");
		user.setUserRegisterIp(getIp(request));
		user.setUserRegisterTime(DateUtil.formatDate());
		user.setUserStatus("0");
		int flag = userService.insert(user);
		if(flag>0) {
			User search = new User();
			search.setUserPassword(userPassword);
			if (Validator.isPhone(phone)) {
				search.setUserPhone(phone);
			} else if (Validator.isEmail(phone)) {
				search.setUserEmail(phone);
			}
			userService.loginSearch(search, getSession());
			return new ResultDO<Object>(true, "200", "注册成功", 0);
		}else {
			return new ResultDO<Object>(false, "500", "注册失败", 1);
		}
	}
	
	@RequestMapping(value = "/set", method = RequestMethod.POST)
	@ResponseBody
	public ResultDO<?> updateUserInfo(User user,HttpServletRequest request, HttpServletResponse response) {
		user.setUpdateTime(DateUtil.formatDate());
		int flag = userService.updateByPrimaryKeySelective(user);
		if(flag>0) {
			return new ResultDO<Object>(true, "200", "修改成功", 0);
		}else {
			return new ResultDO<Object>(false, "500", "修改失败", 1);
		}
	}
	
	@RequestMapping(value = "/set/photo", method = RequestMethod.POST)
	@ResponseBody
	public ResultDO<?> updateUserPhoto(String userId,HttpServletRequest request, HttpServletResponse response) {
		ResultDO<Object> rDo = null;
		User user = userService.getUserInfo(userId);
		if(Objects.isNull(user)) {
			rDo = new ResultDO<Object>(false, "500", "用户不存在", 1);
		}
		user.setUpdateTime(DateUtil.formatDate());
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setHeaderEncoding("UTF-8"); // 处理中文问题
		sfu.setSizeMax(1024 * 1024 * 10); // 限制文件大小10M
		try {
			List<FileItem> fileItems = sfu.parseRequest(request); // 解码请求
			for (FileItem fi : fileItems) {
				InputStream fis = fi.getInputStream();
				ByteArrayOutputStream bos = new ByteArrayOutputStream();
				byte[] buffer = new byte[1024];
				int n;
				while ((n = fis.read(buffer)) != -1) {
					bos.write(buffer, 0, n);
				}
				byte[] photo = bos.toByteArray();
				user.setUserPhoto(photo);
				int flag = userService.updateByPrimaryKeySelective(user);
				if(flag>0) {
					rDo = new ResultDO<Object>(true, "200", "修改成功", 0);
				}else {
					rDo = new ResultDO<Object>(false, "500", "修改失败", 1);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rDo;
	}
	
	
	@RequestMapping(value = "/sendEmailValidateCode.do", method = RequestMethod.POST)
	@ResponseBody
	public ResultDO<?> sendEmailValidateCode(String phone,HttpServletRequest request) {
		/*String redisphoneCode = sendEmailService.getEmailValidateCode(request.getSession(),phone.trim());
		if(ValidateUtil.isNotEmpty(redisphoneCode)) {
			return new ResultDO<Object>(true, "204", "验证码已发送，请不要恶意发送", 0);
		}*/
		try {
			String code = sendEmailService.send(phone.trim());
			sendEmailService.saveRegistVCodeToRedis(code, request.getSession().getId(),phone.trim());
			//request.getSession().setAttribute("code", code);
			if(code!=null || !"".equals(code)){
				return new ResultDO<Object>(true, "200", "发送成功", 0);
			} else{
				return new ResultDO<Object>(false, "500", "发送失败", 1);
			}
		} catch(Exception e){
			e.printStackTrace();			
		}
		return new ResultDO<Object>(false, "500", "发送失败", 1);
	}
	
	@RequestMapping(value = "/checkEmailValidateCode.do", method = RequestMethod.POST)
	@ResponseBody
	public ResultDO<?> checkEmailValidateCode(String userCode,@RequestParam(required=false) String phone,HttpServletRequest request) {
		String redisphoneCode = sendEmailService.getEmailValidateCode(request.getSession(),phone.trim());
		System.out.println(redisphoneCode);
		if(ValidateUtil.isNotEmpty(redisphoneCode) && ValidateUtil.isNotEmpty(userCode)) {
			if(redisphoneCode.equals(userCode.trim())){
				return new ResultDO<Object>(true, "200", "验证码正确", 0);
			}
		}
		return new ResultDO<Object>(false, "500", "验证码错误", 1);
	}
	
	
	@RequestMapping(value="/regist/exists.do",method = RequestMethod.GET)
	@ResponseBody
	public ResultDO<?> userIsExists(String phone){
		ResultDO<Object> rDo = new ResultDO<Object>(true, "200", "不存在", 0);
		User search = new User();
		if (Validator.isPhone(phone)) {
			search.setUserPhone(phone);
		} else if (Validator.isEmail(phone)) {
			search.setUserEmail(phone);
		} else {
			return new ResultDO<Object>(false, "500", "参数错误", 1);
		}
		int count = userService.registCount(search);
		if(count>0) {
			rDo = new ResultDO<Object>(true, "200", "已存在", count);
		}
		return rDo;
	}
}
