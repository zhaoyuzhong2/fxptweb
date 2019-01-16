package com.fxptw.web;


import com.fxptw.dao.UserDao;
import com.fxptw.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "my")
public class MyController {
	@Autowired
	UserDao userDao;


	//进入  首页    我
	@RequestMapping(value = "/index")
	public String request(Model model,HttpServletRequest request) {
		User emp1 = (User) request.getSession().getAttribute("user");




		return "my/index";
	}








}
