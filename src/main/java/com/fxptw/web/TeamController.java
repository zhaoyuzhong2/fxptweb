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
@RequestMapping(value = "team")
public class TeamController {
	@Autowired
	UserDao userDao;


	//进入邀请关系网
	@RequestMapping(value = "/request")
	public String request(Model model,HttpServletRequest request) {
		//System.out.println("我要进货...........");
		try {

			User emp1 = (User) request.getSession().getAttribute("user");


		}catch (Exception e){
			e.printStackTrace();
		}

		return "audit/index";
	}






}
