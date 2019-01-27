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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.video.annotation.SystemLog;
import com.video.base.controller.BaseController;
import com.video.base.pojo.ResultDO;
import com.video.domain.entity.DownRecord;
import com.video.domain.entity.Video;
import com.video.domain.service.DownRecordService;
import com.video.domain.service.VideoService;
import com.video.utils.CodeUtils;
import com.video.utils.DateUtil;
import com.video.utils.StringEx;
import com.video.utils.ValidateUtil;

@Controller
@RequestMapping("/video")
public class VideoController  extends BaseController {
	@Autowired
	private VideoService videoService;
	@Autowired
	private DownRecordService downRecordService;
	
	@SystemLog(desc="跳转到首页")
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String toVideoList(Model model,ModelMap map) throws Exception
	{
		System.out.println("跳转到首页");
		return "video/videoList2.jsp";    //WEB-INF/jsp/list.jsp
	}
	
	@RequestMapping(value="/toVideoAddList",method=RequestMethod.GET)
	public String toVideoAddList(Model model,ModelMap map) throws Exception
	{
		System.out.println("跳转到添加页面");
		
		return "video/videoUpload";    //WEB-INF/jsp/list.jsp
	}
	
	@RequestMapping("/play.do")
	public String play(String id,ModelMap map,HttpServletRequest request,HttpServletResponse response) {
        Video media = null;
        try {
            media = videoService.selectByPrimaryKey(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("media", media);
        map.put("media", media);
        return "video/media_play.jsp";
	}
	
	public void queryAll() {
		
	}
	
	@RequestMapping(value="/upload.do",method = RequestMethod.POST)
	public String upload(HttpServletRequest request) {
		
		String message = "";
        
        String uri = request.getRequestURI();
        String path = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
        
        if("/upload".equals(path)){
            //提供解析时的一些缺省配置
        	DiskFileItemFactory factory = new DiskFileItemFactory();
            
            //创建一个解析器,分析InputStream,该解析器会将分析的结果封装成一个FileItem对象的集合
            //一个FileItem对象对应一个表单域
        	ServletFileUpload sfu = new ServletFileUpload(factory);
        
            try {
                Video media = new Video();
                List<FileItem> items = sfu.parseRequest(request);
                boolean flag = false;    //转码成功与否的标记
                for(int i=0; i<items.size(); i++){
                	FileItem item = items.get(i);
                    //要区分是上传文件还是普通的表单域
                    if(item.isFormField()){//isFormField()为true,表示这不是文件上传表单域
                        //普通表单域
                        String paramName = item.getFieldName();
                        /*
                            String paramValue = item.getString();
                            System.out.println("参数名称为:" + paramName + ", 对应的参数值为: " + paramValue);
                        */
                        if(paramName.equals("title")){
                            //media.setTitle(new String(item.getString().getBytes("ISO8859-1"),"UTF-8"));
                        	media.setVideoTitle(item.getString());
                        }
                        if(paramName.equals("descript")){
                            //media.setDescript(new String(item.getString().getBytes("ISO8859-1"),"UTF-8"));
                        	media.setVideoDescript(item.getString());
                        }
                    }else{
                        //上传文件
                        //System.out.println("上传文件" + item.getName());
                    	//ServletContext sctx = request.getSession().getServletContext();
                    	//获得保存文件的路径
                        //String basePath = sctx.getRealPath("videos");
                    	//String basePath = "F:\\";
                    	String basePath = request.getSession().getServletContext().getRealPath("/");
                    	//getServletContext().getRealPath("/");
                        
                        //获得文件名
                        String fileUrl= item.getName();
                        //在某些操作系统上,item.getName()方法会返回文件的完整名称,即包括路径
                        String fileType = fileUrl.substring(fileUrl.lastIndexOf(".")); //截取文件格式
                        //自定义方式产生文件名
                        String serialName = String.valueOf(System.currentTimeMillis());
                        //待转码的文件
                        File uploadFile = new File(basePath + "videos" + File.separator + "temp" + File.separator + serialName + fileType);
                        item.write(uploadFile);
                        
                        if(item.getSize()>500*1024*1024){
                            message = "<li>上传失败！您上传的文件太大,系统允许最大文件500M</li>";
                        }
                        String codcFilePath = basePath + "videos" + File.separator + "temp" + File.separator + serialName + ".flv";                //设置转换为flv格式后文件的保存路径
                        String relaiveFilePath = "videos" + File.separator + "temp" + File.separator + serialName + ".flv";
                        String mediaPicPath = basePath + "videos" + File.separator+"images" + File.separator + serialName + ".jpg";    //设置上传视频截图的保存路径
                        String relativePicPath = "videos" + File.separator + "images" + File.separator + serialName + ".jpg";
                        // 获取配置的转换工具（ffmpeg.exe）的存放路径
                        //String ffmpegPath = request.getSession().getServletContext().getRealPath("/tools/ffmpeg.exe");
                        String ffmpegPath = basePath + "tools" + File.separator + "ffmpeg.exe";
                        //media.setSrc("videos\\" + serialName + ".flv");
                        //media.setSrc(relaiveFilePath);
                        // media.setPicture("videos\\images\\" +serialName + ".jpg");
                        //media.setPicture(relativePicPath);
                        //media.setUptime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                        media.setChannelType("1");
                        media.setUploadType("1");
                        media.setVideoType("1");
                        media.setVideoState("0");
                        media.setVideoId(StringEx.newUUID());
                        media.setVideoName("国色仙香");
                        media.setVideoSource("1");
                        
                        media.setVideoCover(null);
                        media.setVideoContent(null);
                        //转码
                        
                        flag = CodeUtils.executeCodecs(ffmpegPath, uploadFile.getAbsolutePath(), codcFilePath, mediaPicPath);
                    }
                }
                if(flag){
                    //转码成功,向数据表中添加该视频信息
                    //videoService.saveMedia(media);
                    message = "<li>上传成功!</li>";
                }
                request.setAttribute("message", message);
            }
            catch(Exception e) {
            	e.printStackTrace();
            }
        }
       return "video/videoUpload";
	}
	
	
	
	@RequestMapping(value = "/updateVideoState",method = RequestMethod.POST)
	@ResponseBody
	public Map<String,String> updateVideoState(HttpServletRequest request,String videoState,String videoId)
	{
		Map<String,String> map = new HashMap<String,String>();
		try
		{
			Video video = new Video();
			video.setVideoId(videoId);
			video.setVideoState(videoState);
			int counts = videoService.updateState(video);
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
	
	

	@RequestMapping(value = "/batchDelete",method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public boolean batchDelete(@RequestParam("videoIds[]") String [] videoIds)
	{
		try
		{
			int count = videoService.batchDeleteVideo(videoIds);
			if(count>0) {
				return true;
			}
			return false;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
		
	}
	
	
	@RequestMapping(value="/getVideoListBySearch.do",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<Video> getVideoListBySearch(@RequestParam("data") String data) throws Exception
	{
		List<Video> resultMap = new ArrayList<Video>();
		try {
			resultMap = extracted(data);
	        System.out.println("获取数据成功");
		}catch(Exception e) {
	        e.printStackTrace();
		}
		return resultMap;	
	}

	private List<Video> extracted(String data) {
		List<Video> resultMap;
		JSONObject jsonObject = JSONObject.parseObject(data);
		String start = jsonObject.getString("start");
		String end = jsonObject.getString("end");
		String search = jsonObject.getString("search");
		resultMap = videoService.selectAllBySearch(start, end, search);
		return resultMap;
	} 
	
	@RequestMapping(value="/skip/to/download/form.do")
	public String toDownloadFormHtml(String videoId, String videoSrc,ModelMap map) {
		map.put("videoId", videoId);
		map.put("videoSrc", videoSrc);
		return "web/downloadAsk.jsp";
		
	}
	
	@RequestMapping(value="/videoPrevDownload.do",method=RequestMethod.GET)
	@ResponseBody
	public ResultDO<?> videoPrevDownload(String videoId, String videoSrc,HttpServletRequest req, HttpServletResponse resp){
		if(ValidateUtil.isEmpty(videoId) && ValidateUtil.isEmpty(videoSrc)) {
			return new ResultDO<Object>(false, "412", "参数错误", 1);
		}
		ResultDO<Object> rDo = new ResultDO<Object>(false, "500", "文件状态异常", 1);
		try {
			String videoRealPath = req.getRealPath(videoSrc);
			File file = new File(videoRealPath);
			Video video = videoService.selectByPrimaryKey(videoId);
			if(ValidateUtil.isNotNull(video) && file.exists()) {
				rDo = new ResultDO<Object>(true, "200", "文件状态正常,可以下载", 0);
			}
		}catch(Exception e) {
			rDo = new ResultDO<Object>(false, "500", "文件状态异常", 1);
		}
		return rDo;
	}
	/**
	 * 1、--> 	FileInputStream 
	 * 2、-->	ByteArrayOutputStream
	 * 3、-->	byte[]  
	 * 4、-->	ByteArrayInputStream  
	 * 5、--> 	ServletOutputStream
	 */
	/** 下载视频 */
	@Scope(value="prototype")
	@RequestMapping(value = "/filedownload.do")
	public void fileDownload(String videoId, String videoSrc,HttpServletRequest req, HttpServletResponse resp) throws IOException {
			ServletOutputStream out = null;
			FileInputStream in = null;
			ByteArrayOutputStream bos = null;
			ByteArrayInputStream ios = null;
			try {
				req.setCharacterEncoding("UTF-8");
				resp.setCharacterEncoding("UTF-8");
				String videoRealPath = req.getRealPath(videoSrc);
				Video video = videoService.selectByPrimaryKey(videoId);
				String fileType = videoRealPath.substring(videoRealPath.lastIndexOf("."));
				String videoName = ValidateUtil.isNotEmpty(video.getVideoName())?video.getVideoName():"未知";
				String fileName = URLDecoder.decode(videoName, "utf-8") + fileType;
				File file = new File(videoRealPath);
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
				DownRecord record = new DownRecord();
				record.setDownloadIp(getIp(req));
				record.setDownloadTime(DateUtil.formatDate());
				record.setId(StringEx.newUUID());
				record.setUserId(getCurrentLoginUser().getUserId());
				record.setUserNickName(getCurrentLoginUser().getUserNickName());
				record.setVideoId(videoId);
				downRecordService.insertSelective(record);
				videoService.updateDownCount(video);
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
	
}
