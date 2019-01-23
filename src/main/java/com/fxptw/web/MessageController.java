package com.fxptw.web;


import com.fxptw.dao.UserDao;
import com.fxptw.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "audit")
public class MessageController {
	@Autowired
	UserDao userDao;


	//消息首页
	@RequestMapping(value = "/index")
	public String index() {
		return "message/index";
	}


	@RequestMapping(value = "/sys")
	public String sys() {
		return "message/sys";
	}



	@RequestMapping(value = "/material")
	public String material() {
		return "message/material";
	}


	@RequestMapping(value = "/notice")
	public String notice() {
		return "message/notice";
	}





}
