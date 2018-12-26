package com.video.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.video.base.controller.BaseController;

@Controller
@RequestMapping("/system")
public class SystemController extends BaseController{
	
	@RequestMapping(value="/toSystemData.do",method= {RequestMethod.GET,RequestMethod.POST})
	public String toSystemData() {
		
		
		return "system/system-data.jsp";
	}
}
