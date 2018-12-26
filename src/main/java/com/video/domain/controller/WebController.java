package com.video.domain.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.video.base.controller.BaseController;
import com.video.domain.service.DownRecordService;
import com.video.domain.service.UserService;
import com.video.domain.service.ValidateService;

@Controller
@RequestMapping("/webapp")
public class WebController extends BaseController {

	@Autowired
	private UserService userService;
	@Autowired
	private ValidateService validateService;

	
	@RequestMapping(value = "/toWebMoreSearch.do", method = RequestMethod.GET)
	public String toWebMoreSearch(Model model, ModelMap map) throws Exception {
		System.out.println("跳转到more-search页面");
		return "web/more-search.jsp"; // WEB-INF/jsp/list.jsp
	}
	
	@RequestMapping(value = "/toVideoPlayTest.do", method = RequestMethod.GET)
	public String toVideoPlayTest(Model model, ModelMap map) throws Exception {
		return "video/video-play.jsp"; // WEB-INF/jsp/list.jsp
	}
}
