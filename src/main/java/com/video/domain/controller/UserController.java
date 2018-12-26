package com.video.domain.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.video.base.controller.BaseController;
import com.video.base.pojo.ResultDO;
import com.video.domain.entity.User;
import com.video.domain.entity.Validate;
import com.video.domain.entity.Video;
import com.video.domain.service.UserService;
import com.video.domain.service.ValidateService;
import com.video.domain.service.VideoService;
import com.video.domain.service.impl.SendEmailService;
import com.video.utils.SendEmail;
import com.video.utils.StringEx;
import com.video.utils.TableResult;
import com.video.utils.ValidateUtil;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

	@Autowired
	private UserService userService;
	@Autowired
	private VideoService videoService;
	@Autowired
	private ValidateService validateService;
	
	@Autowired
	private SendEmailService sendEmailService;

	@RequestMapping(value = "/toUploadForm.do", method = RequestMethod.GET)
	public String toUploadForm(Model model, ModelMap map) throws Exception {
		System.out.println("跳转到上传表单");

		return "user/videoUpload.jsp"; // WEB-INF/jsp/list.jsp
	}

	@RequestMapping(value = "/toUserIndex.do", method = RequestMethod.GET)
	public String toUserIndex(Model model, ModelMap map) throws Exception {
		System.out.println("跳转到上传表单");

		return "user/userIndex.jsp"; // WEB-INF/jsp/list.jsp
	}

	@RequestMapping(value = "/toFloatDiv.do", method = RequestMethod.GET)
	public String toFloatDiv(Model model, ModelMap map) throws Exception {
		System.out.println("跳转到上传表单");

		return "user/floatDiv.jsp"; // WEB-INF/jsp/list.jsp
	}

	@RequestMapping(value = "/toUserLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String toUserLogin(Model model, ModelMap map) throws Exception {

		System.out.println("跳转到用户登录页面");
		Validate validate = validateService.selectRandom();
		map.put("validate", validate);
		return "user/userLogin2.jsp"; // WEB-INF/jsp/list.jsp
	}

	@RequestMapping(value = "/toUserRegister.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String toUserRegister(Model model, ModelMap map) throws Exception {

		System.out.println("跳转到用户注册页面");

		return "user/userRegister.jsp"; // WEB-INF/jsp/list.jsp
	}

	@RequestMapping(value = "/toUserForget.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String toUserForget(Model model, ModelMap map, @RequestParam(required = false) String type)
			throws Exception {
		System.out.println("跳转到忘记密码页面");
		if (ValidateUtil.isNotEmpty(type) && "phone".equals(type)) {
			return "user/userForget.jsp"; // WEB-INF/jsp/list.jsp
		} else {
			return "user/userForget2.jsp"; // WEB-INF/jsp/list.jsp
		}
	}

	@RequestMapping(value = "/toQQLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String toQQLogin(Model model, ModelMap map) throws Exception {

		System.out.println("跳转到QQ登录页面");

		return "user/qqLogin.jsp"; // WEB-INF/jsp/list.jsp
	}

	@RequestMapping(value = "/toWeiboLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String toWeiboLogin(Model model, ModelMap map) throws Exception {

		System.out.println("跳转到微博登录页面");

		return "user/weiboLogin.jsp"; // WEB-INF/jsp/list.jsp
	}

	@RequestMapping(value = "/toUserDonate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String toUserDonate(Model model, ModelMap map) throws Exception {

		System.out.println("跳转到用户捐助页面");

		return "web/donate.jsp"; // WEB-INF/jsp/list.jsp
	}
	
	@RequestMapping(value = "/toToolsDownForm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String toToolsDownForm(Model model, ModelMap map) throws Exception {

		System.out.println("跳转到工具箱页面");

		return "web/tools.jsp"; // WEB-INF/jsp/list.jsp
	}

	@RequestMapping(value = "/toUserManageIndex.html", method = RequestMethod.GET)
	public String toUserManageIndex(Model model, ModelMap map) throws Exception {

		System.out.println("跳转到用户管理页面");

		return "user/manage/userIndex2.jsp"; // WEB-INF/jsp/list.jsp
	}

	@RequestMapping(value = "/toLogin.html", method = RequestMethod.GET)
	public String toMain(Model model, ModelMap map) throws Exception {

		System.out.println("跳转到用户登录页面");

		return "account/main.jsp"; // WEB-INF/jsp/list.jsp
	}

	@RequestMapping(value = "/toLeft.html", method = RequestMethod.GET)
	public String toLeft(Model model, ModelMap map) throws Exception {

		System.out.println("跳转到用户登录页面");

		return "account/left.jsp"; // WEB-INF/jsp/list.jsp
	}

	@RequestMapping(value = "/toWelcome.html", method = RequestMethod.GET)
	public String toWelcome(Model model, ModelMap map) throws Exception {

		System.out.println("跳转到用户登录页面");

		return "account/awelcome.jsp"; // WEB-INF/jsp/list.jsp
	}

	@RequestMapping(value = "/toMemberList.html", method = RequestMethod.GET)
	public String toMemberList(Model model, ModelMap map) throws Exception {

		System.out.println("跳转到用户登录页面");

		return "account/member-list.html"; // WEB-INF/jsp/list.jsp
	}
	
	@RequestMapping(value = "/toDisclaimer.html", method = RequestMethod.GET)
	public String toDisclaimer(Model model, ModelMap map) throws Exception {

		System.out.println("跳转到免责声明页面");

		return "web/disclimer.jsp"; // WEB-INF/jsp/list.jsp
	}

	@RequestMapping(value = "/insertUser.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map<String, String> insertUser(HttpServletRequest request, ModelMap map1) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			
			/*for (int i = 0; i < 10; i++) {
				User record = new User();
				record.setUserId(StringEx.newUUID());
				record.setDeleteFlag("0");
				record.setIsVip("0");
				record.setLastLoginIp(getIp(request));
				record.setLastLoginTime("2018-03-12 09:53");
				record.setUserEmail("test@sina.com");
				record.setUserIntegral(0);
				record.setUserLevel("0");
				record.setUserLoginName("admin");
				record.setUserPassword("admin");
				record.setUserPhone("14755117607");

				record.setUserAddressDivisions("广西省玉林市");
				record.setUserAddressDetail("广西省玉林市");
				record.setUserEducationStatus("4");
				record.setUserAge(24);
				record.setUserSex("2");

				record.setUserNickName("罗奎");
				record.setUserRealName("瓜几");
				// String path = "C:\\Users\\admin\\Pictures\\电脑桌面\\511921500401943974.jpg";
				File file = new File("C:\\Users\\admin\\Pictures\\电脑桌面\\511921500401943974.jpg");
				FileInputStream fis = new FileInputStream(file);
				ByteArrayOutputStream bos = new ByteArrayOutputStream();
				byte[] buffer = new byte[1024];
				int n;
				while ((n = fis.read(buffer)) != -1) {
					bos.write(buffer, 0, n);
				}
				byte[] photo = bos.toByteArray();
				record.setUserPhoto(photo);
				record.setUserRegisterIp(getIp(request));
				record.setUserRegisterTime(DateUtil.formatDate());
				record.setUserStatus("0");
				record.setVipEffectiveTime("0");
				userService.insert(record);
				fis.close();
				bos.close();
				
			}

			for (int i = 0; i < 10; i++) {
				User record = new User();
				record.setUserId(StringEx.newUUID());
				record.setDeleteFlag("0");
				record.setIsVip("0");
				record.setLastLoginIp(getIp(request));
				record.setLastLoginTime("2018-03-12 09:53");
				record.setUserEmail("test@sina.com");
				record.setUserIntegral(0);
				record.setUserLevel("0");
				record.setUserLoginName("admin");
				record.setUserPassword("admin");
				record.setUserPhone("14755117607");

				record.setUserAddressDivisions("安徽省合肥市");
				record.setUserAddressDetail("安徽省合肥市");
				record.setUserEducationStatus("4");
				record.setUserAge(24);
				record.setUserSex("1");

				record.setUserNickName("张宇乐");
				record.setUserRealName("人鬼殊途");
				File file = new File("C:\\Users\\admin\\Pictures\\电脑桌面\\511921500401943974.jpg");
				FileInputStream fis = new FileInputStream(file);
				ByteArrayOutputStream bos = new ByteArrayOutputStream();
				byte[] buffer = new byte[1024];
				int n;
				while ((n = fis.read(buffer)) != -1) {
					bos.write(buffer, 0, n);
				}
				byte[] photo = bos.toByteArray();
				record.setUserPhoto(photo);
				record.setUserRegisterIp(getIp(request));
				record.setUserRegisterTime("2018-03-12 09:53");
				record.setUserStatus("0");
				record.setVipEffectiveTime("0");
				userService.insert(record);
				fis.close();
				bos.close();
				// io.close();
			}
			
			map.put("key", "success");
			return map;*/
			User record = new User();
			record.setUserId("default");
			record.setDeleteFlag("0");
			record.setIsVip("0");
			record.setLastLoginIp("default");
			record.setLastLoginTime("default");
			record.setUserEmail("default@sina.com");
			record.setUserIntegral(0);
			record.setUserLevel("0");
			record.setUserLoginName("default");
			record.setUserPassword("default");
			record.setUserPhone("default");

			record.setUserAddressDivisions("000000");
			record.setUserAddressDetail("default");
			record.setUserEducationStatus("0");
			record.setUserAge(0);
			record.setUserSex("0");

			record.setUserNickName("default");
			record.setUserRealName("default");
			File file = new File("C:\\Users\\zhang\\Desktop\\古风\\19023750184368974.jpg");
			FileInputStream fis = new FileInputStream(file);
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			byte[] buffer = new byte[1024];
			int n;
			while ((n = fis.read(buffer)) != -1) {
				bos.write(buffer, 0, n);
			}
			byte[] photo = bos.toByteArray();
			record.setUserPhoto(photo);
			record.setUserRegisterIp("default");
			record.setUserRegisterTime("default");
			record.setUserStatus("0");
			record.setVipEffectiveTime("0");
			userService.insert(record);
			fis.close();
			bos.close();
			map.put("key", "success");
			return map;
			
		} catch (Exception e) {
			e.printStackTrace();
			map.put("key", "failure");
			return map;
		}
	}

	@RequestMapping(value = "/downloadVideo.do", method = RequestMethod.GET)

	public ResultDO<?> downloadVideo(HttpServletRequest request, String videoId) {
		if (ValidateUtil.isNotNull(getCurrentLoginUser())) {

		} else {

		}
		return null;
	}

	@RequestMapping(value = "/getCurrentUser.do", method = RequestMethod.GET)
	public User getCurrentLoginUser(HttpServletRequest request) {

		return null;
	}
	
	/** 下载视频 */
	@RequestMapping(value = "/toolDownload.do")
	public void toolDownload(String toolRelativeSrc,HttpServletRequest req, HttpServletResponse resp) throws IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String toolRealSrc = req.getRealPath(toolRelativeSrc);
		ServletOutputStream out = null;
		FileInputStream in = null;
		ByteArrayOutputStream bos = null;
		ByteArrayInputStream ios = null;
		try {
			//String fileType = toolRealSrc.substring(toolRealSrc.lastIndexOf("."));
			//String videoName = ValidateUtil.isNotEmpty(video.getVideoName())?video.getVideoName():"未知";
			
			File file = new File(toolRealSrc);
			String fileName = file.getName();
			fileName = URLDecoder.decode(fileName, "utf-8");
			in = new FileInputStream(file);
			bos = new ByteArrayOutputStream();
			byte[] buffer = new byte[1024];
			int n;
			while ((n = in.read(buffer)) != -1) {
				bos.write(buffer, 0, n);
			}
			byte[] bytes = bos.toByteArray();
			ios = new ByteArrayInputStream(bytes);
			String _fileName = URLEncoder.encode(fileName, "UTF-8");
			if (fileName.length() > 150) {
				String guessCharset = "UTF-8"; 
				_fileName = new String(fileName.getBytes(guessCharset),"ISO8859-1");
			}
			resp.setHeader("Content-Disposition", "attachment;filename="+ _fileName.replace("+", "%20").replaceAll("%28", "(").replaceAll("%29", ")"));
			byte[] buff = new byte[1024];
			out = resp.getOutputStream();
			int leng = ios.read(buff);
			while (leng > 0) {
				out.write(buff, 0, leng);
				leng = ios.read(buff);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (out != null) {
				try {
					out.flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	
	@RequestMapping(value="/getVideoListMore.do",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public TableResult getVideoListMore(int limit,int page,String channelType,String videoType,String videoSource) throws Exception
	{
		TableResult resultMap = new TableResult();
		List<Video> list = new ArrayList<Video>();
		try {
			list = videoService.selectMore(limit, (page-1)*limit,channelType,videoType,videoSource);
	        resultMap.setCode(0);  
	        resultMap.setCount(videoService.countMore(channelType,videoType,videoSource));
	        resultMap.setMsg("获取数据成功");
	        resultMap.setData(list);
	        System.out.println("获取数据成功");
		}catch(Exception e) {
			resultMap.setCode(500);  
	        resultMap.setCount(0);
	        resultMap.setMsg("获取数据失败");
	        resultMap.setData(null);
	        System.out.println("获取数据失败");
	        e.printStackTrace();
		}
		return resultMap;	
	}
	
	/*@RequestMapping(value="/getRpcList.do",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ApiResult getRpcList(int limit,int page,String channelType,String videoType,String videoSource) throws Exception
	{
		ApiResult resultMap = new ApiResult();
		List<Video> list = new ArrayList<Video>();
		try {
			list = videoService.selectMore(limit, (page-1)*limit,channelType,videoType,videoSource);
		}catch(Exception e) {
	        e.printStackTrace();
		}
		return this.success(list);
	}
	*/
	

	@RequestMapping(value="/getVideoListKey.do",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public TableResult getVideoListKey(int limit,int page,String keyword) throws Exception
	{
		TableResult resultMap = new TableResult();
		List<Video> list = new ArrayList<Video>();
		try {
			list = videoService.selectKey(limit, (page-1)*limit,keyword);
	        resultMap.setCode(0);  
	        resultMap.setCount(videoService.countKey(keyword));
	        resultMap.setMsg("获取数据成功");
	        resultMap.setData(list);
	        System.out.println("获取数据成功");
		}catch(Exception e) {
			resultMap.setCode(500);  
	        resultMap.setCount(0);
	        resultMap.setMsg("获取数据失败");
	        resultMap.setData(null);
	        System.out.println("获取数据失败");
	        e.printStackTrace();
		}
		return resultMap;	
	}
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String toUserManageHome(Model model, ModelMap map) throws Exception {
		return "user/manage/userHome.jsp"; // WEB-INF/jsp/list.jsp
	}
	
	@RequestMapping(value = "/center", method = RequestMethod.GET)
	public String toUserManageCenter(Model model, ModelMap map) throws Exception {
		return "user/manage/userCenter.jsp"; // WEB-INF/jsp/list.jsp
	}
	
	@RequestMapping(value = "/settings", method = RequestMethod.GET)
	public String toUserManageSettings(Model model, ModelMap map) throws Exception {
		return "user/manage/userSettings.jsp"; // WEB-INF/jsp/list.jsp
	}
	
	@RequestMapping(value = "/message/", method = RequestMethod.GET)
	public String toUserManageMessages(Model model, ModelMap map) throws Exception {
		return "user/manage/userMessages.jsp"; // WEB-INF/jsp/list.jsp
	}
	
	@RequestMapping(value = "/provide/", method = RequestMethod.GET)
	public String toUserProvide(Model model, ModelMap map) throws Exception {
		return "user/manage/userVideoManage.jsp"; // WEB-INF/jsp/list.jsp
	}

	@RequestMapping(value = "/settings/photo/", method = RequestMethod.GET)
	public String toUserSetPhoto(Model model, ModelMap map) throws Exception {
		return "user/manage/user-settings-photo.jsp"; // WEB-INF/jsp/list.jsp
	}
	
	
	@RequestMapping(value = "/activate/", method = RequestMethod.GET)
	public String toActivate(Model model, ModelMap map,HttpServletRequest request) throws Exception {
		User user = getCurrentLoginUser();
		String code = SendEmail.send(user.getUserEmail(), StringEx.newUUID());
		sendEmailService.saveActivateVCodeToRedis(code, request.getSession().getId(),user.getUserEmail().trim());
		return "user/manage/user-activate.jsp"; 
	}
}
