package com.video.domain.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.video.annotation.RequestLog;
import com.video.annotation.SystemLog;
import com.video.base.controller.BaseController;
import com.video.domain.entity.User;
import com.video.domain.entity.Video;
import com.video.domain.service.UserService;
import com.video.domain.service.VideoService;
import com.video.utils.CodeUtils;
import com.video.utils.DateUtil;
import com.video.utils.StringEx;
import com.video.utils.TableResult;
import com.video.utils.ValidateUtil;

@Controller
@RequestMapping("/account")
public class AccountController extends BaseController{
	
	@Autowired
	private UserService userService;
	@Autowired
	private VideoService videoService;
	
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	@RequestMapping(value="/getPath.do",method=RequestMethod.GET)
	@ResponseBody
	public String getPath(HttpServletRequest request) throws Exception
	{
		return getBasePath(request);
	}

	@RequestMapping(value="/toUploadForm.do",method=RequestMethod.GET)
	public String toUploadForm(Model model,ModelMap map) throws Exception
	{
		System.out.println("跳转到上传表单");
		
		return "user/videoUpload.jsp";    //WEB-INF/jsp/list.jsp
	}
	
	@RequestMapping(value="/toUserIndex.do",method=RequestMethod.GET)
	public String toUserIndex(Model model,ModelMap map) throws Exception
	{
		System.out.println("跳转到上传表单");
		
		return "user/userIndex.jsp";    //WEB-INF/jsp/list.jsp
	}
	
	@RequestMapping(value="/toFloatDiv.do",method=RequestMethod.GET)
	public String toFloatDiv(Model model,ModelMap map) throws Exception
	{
		System.out.println("跳转到上传表单");
		
		return "user/floatDiv.jsp";    //WEB-INF/jsp/list.jsp
	}
	
	
	@RequestMapping(value="/toUserLogin.html",method=RequestMethod.GET)
	public String toUserLogin(Model model,ModelMap map) throws Exception
	{
		
		System.out.println("跳转到用户登录页面");
		
		return "user/userLogin2.jsp";    //WEB-INF/jsp/list.jsp
	}
	
	
	@RequestMapping(value="/toAdminIndex.html",method=RequestMethod.GET)
	public String toAdminIndex(Model model,ModelMap map) throws Exception
	{
		
		System.out.println("跳转到后台管理页面");
		
		return "account/aindex.jsp";    //WEB-INF/jsp/list.jsp
	}
	
	
	
	
	@RequestMapping(value="/toWelcome.html",method=RequestMethod.GET)
	public String toWelcome(Model model,ModelMap map) throws Exception
	{
		
		System.out.println("跳转到用户登录页面");
		
		return "account/awelcome.jsp";    //WEB-INF/jsp/list.jsp
	}
	
	
	@RequestMapping(value="/toMemberList.html",method=RequestMethod.GET)
	public String toMemberList(Model model,ModelMap map) throws Exception
	{
		
		System.out.println("跳转到会员列表页面");
		return "account/member-list.jsp";    //WEB-INF/jsp/list.jsp
	}
	
	
	@RequestMapping(value="/getMemberList.do",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public TableResult getMemberList(int limit,int page) throws Exception
	{
		TableResult resultMap = new TableResult();
		try {
	        List<User> list = userService.getAll(limit,(page-1)*limit);
	        for(User temp:list) {
				temp.setUserPhoto(null);
			}
	        resultMap.setCode(0);  
	        resultMap.setCount(userService.countUser());
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
	
	
	
	@RequestMapping(value="/toAddMember.html",method=RequestMethod.GET)
	public String toAddMember(Model model,ModelMap map) throws Exception
	{
		
		System.out.println("跳转到添加会员页面");
		
		return "account/member-add.html";    //WEB-INF/jsp/list.jsp
	}
	
	
	@RequestMapping(value="/toMemberShow.do",method=RequestMethod.GET)
	public String toMemberShow(Model model,ModelMap map,String userId) throws Exception
	{
		User user = new User();
		user = userService.selectByPrimaryKey(userId);
		System.out.println("跳转到会员查看页面");
		map.put("user", user);
		return "account/member-show.jsp";    //WEB-INF/jsp/list.jsp
	}
	
	
	@RequestMapping(value="/toChangeUserPwd.html",method=RequestMethod.GET)
	public String toChangeUserPwd(Model model,ModelMap map) throws Exception
	{
		
		System.out.println("跳转到修改用户密码页面");
		
		return "account/change-password.html";    //WEB-INF/jsp/list.jsp
	}
	
	@RequestMapping(value="/toLeft.html",method=RequestMethod.GET)
	public String toLeft(Model model,ModelMap map) throws Exception
	{
		
		System.out.println("跳转到用户登录页面");
		
		return "account/left.jsp";    //WEB-INF/jsp/list.jsp
	}
	
	
	@RequestMapping(value="/deleteMemberByUserId.do",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String, String> deleteMemberByUserId(String userId) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			userService.deleteByPrimaryKey(userId);
			map.put("key", "success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("key", "failure");
		}
		System.out.println("success");
		return map;
	}
	
	
	@RequestMapping(value="/getMemberListBySearch.do",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<User> getMemberListBySearch(@RequestParam("data") String data) throws Exception
	{
		List<User> resultMap = new ArrayList<User>();
		try {
			resultMap = extracted(data);
	        System.out.println("获取数据成功");
		}catch(Exception e) {
	        e.printStackTrace();
		}
		return resultMap;	
	}

	private List<User> extracted(String data) {
		List<User> resultMap;
		JSONObject jsonObject = JSONObject.parseObject(data);
		String start = jsonObject.getString("start");
		String end = jsonObject.getString("end");
		String search = jsonObject.getString("search");
		resultMap = userService.getListBySearch(start, end, search);
		return resultMap;
	} 
	
	@RequestMapping(value="/toVideoListPage.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String toVideoListPage() {
		
		
		return "account/video/video-list.jsp";
	}
	
	@RequestMapping(value="/toVideoAddForm.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String toVideoAddForm() {
		
		
		return "account/video/video-add.jsp";
	}
	
	@RequestMapping(value="/prevUpload.do",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public JSONObject uploadVideo(HttpServletRequest request,HttpServletResponse response,ModelMap map) throws Exception {
		JSONObject result = new JSONObject();
		JSONObject data = new JSONObject();
		/******************************************************************/
		String videoSrc = "";
		String pictureSrc = "";
		/******************************************************************/
		String videoUpPath = request.getRealPath(File.separator + "upload"+ File.separator +"videos");
		File videoUpFile = new File(videoUpPath);
		if (!videoUpFile.exists()) {
			videoUpFile.mkdirs();
		}
		String screenPicPath = request.getRealPath(File.separator + "upload"+ File.separator +"images");
		File picFile = new File(screenPicPath);
		if (!picFile.exists()) {
			picFile.mkdirs();
		}
		
		/**上传文件处理内容**/
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setHeaderEncoding("UTF-8"); // 处理中文问题
		sfu.setSizeMax(1024 * 1024 * 200); // 限制文件大小50M
		try {
			List<FileItem> fileItems = sfu.parseRequest(request); // 解码请求
			for (FileItem fi : fileItems) {
				//先将视频文件上传到服务器
				//获得文件名
                String fileUrl= fi.getName();
                //在某些操作系统上,item.getName()方法会返回文件的完整名称,即包括路径
                String fileType = fileUrl.substring(fileUrl.lastIndexOf(".")); //截取文件格式
                //自定义方式产生文件名
                String serialName = String.valueOf(System.currentTimeMillis());
				
				File uploadFile = new File(videoUpPath, serialName+fileType);
				FileUtils.copyInputStreamToFile(fi.getInputStream(), uploadFile);
				fi.write(uploadFile);
				
				//获取截图工具
				String basePath = request.getSession().getServletContext().getRealPath(File.separator);
				String osName = System.getProperty("os.name");
				
				String ffmpegPath = basePath + "tools" + File.separator + "ffmpeg.exe";
				if(osName.indexOf("Linux") != -1) {
					ffmpegPath = "ffmpeg";
				}
				//转码成flv格式
				//设置转换为flv格式后文件的保存路径
				String codcFilePath = videoUpPath + File.separator + serialName + ".flv";                
				
				//截图保存到服务器
				Long picName = System.currentTimeMillis();
				String mediaPicPath = screenPicPath + File.separator + picName + ".jpg";    //设置上传视频截图的保存路径
				CodeUtils.executeCodecs(ffmpegPath, uploadFile.getAbsolutePath(),codcFilePath, mediaPicPath);
				//videoSrc = getBasePath(request) + "/video/upload/videos/"+serialName + ".flv";
				videoSrc = "/upload/videos/"+serialName + ".flv";
				String videoRealPath = basePath + "upload" + File.separator + "videos" + File.separator + serialName + ".flv";                //设置转换为flv格式后文件的保存路径
				
				//pictureSrc = getBasePath(request) + "/video/upload/images/" + picName +".jpg";
				pictureSrc = "/upload/images/" + picName + ".jpg";
				String picRealPath = basePath + "upload" + File.separator + "images" + File.separator + picName + ".jpg";
				
				fi.delete();
				result.put("code", 200);
				result.put("msg", "请求成功");
				
				data.put("pictureSrc", pictureSrc);
				data.put("videoSrc", videoSrc);
				data.put("videoRealPath", videoRealPath);
				data.put("picRealPath", picRealPath);
				
				result.put("data", data);
			}
		} catch (Exception e) {
			result.put("code", 500);
			result.put("msg", "数据请求失败");
			e.printStackTrace();
		}
		/**********************************************************************************/
		return result;
	}
	
	
	/**
	 * 保存（保存并提交视频）
	 */
	
	@RequestMapping(value = "/saveVideo",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> saveVideo(HttpServletRequest request,String videoState)
	{
		Map<String,String> map = new HashMap<String,String>();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(factory);
		try
		{
			Video video = new Video();
			//获取所有的值
			List<FileItem> allfileitems = sfu.parseRequest(request);
			int count = allfileitems.size();
			
			//获取视频文件内容
			String videoContent = allfileitems.get(0).getString("UTF-8");
			video.setVideoContent(videoContent);
			//获取封面
			String videoCover = allfileitems.get(1).getString("UTF-8");
			video.setVideoCover(videoCover);
			
			//获取视频名称
			String videoName = allfileitems.get(2).getString("UTF-8");
			video.setVideoName(videoName);
			
			String videoTitle = allfileitems.get(3).getString("UTF-8");
			video.setVideoTitle(videoTitle);
			
			String videoDescript = allfileitems.get(4).getString("UTF-8");
			video.setVideoDescript(videoDescript);
			
			String channelType = allfileitems.get(5).getString("UTF-8");
			video.setChannelType(channelType);
			
			String videoType = allfileitems.get(6).getString("UTF-8");
			video.setVideoType(videoType);
			
			String videoSource = allfileitems.get(7).getString("UTF-8");
			video.setVideoSource(videoSource);
			
			video.setVideoId(StringEx.newUUID());
			video.setUploadType("1");
			video.setVideoState("0");
			video.setCreatePersonId("D52AF7867E294513B4888827776877D2");
			video.setCreatePersonName("张宇乐");
			video.setCreateTime(DateUtil.formatDate());

			int counts = videoService.insert(video);
			if(counts>0) {
				map.put("key", "success");
			}else {
				map.put("key", "failure");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			map.put("key", "failure");
		}
		return map;
	}
	
	@RequestMapping(value="/getVideoList.do",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	@SystemLog(desc="获取视频列表")
	public TableResult getVideoList(int limit,int page,String channelType) throws Exception
	{
		TableResult resultMap = new TableResult();
		List<Video> list = new ArrayList<Video>();
		try {
			if(ValidateUtil.isNotEmpty(channelType)) {
				list = videoService.selectChanelType(limit, (page-1)*limit, channelType);
			}else {
				list = videoService.getAll(limit,(page-1)*limit);
			}
	        resultMap.setCode(0);  
	        resultMap.setCount(videoService.countVideo());
	        resultMap.setMsg("获取数据成功");
	        resultMap.setData(list);
	        logger.info("获取数据成功");
		}catch(Exception e) {
			resultMap.setCode(500);  
	        resultMap.setCount(0);
	        resultMap.setMsg("获取数据失败");
	        resultMap.setData(null);
	        logger.info("获取数据失败");
	        e.printStackTrace();
		}
		return resultMap;	
	}
	
	public static void main(String[] args) {
		System.out.println(StringEx.newUUID());
	}
}
