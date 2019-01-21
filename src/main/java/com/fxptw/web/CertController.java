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
@RequestMapping(value = "cert")
public class CertController {
	@Autowired
	UserDao userDao;


	//审核代理页面
	@RequestMapping(value = "/index")
	public String index(Model model,HttpServletRequest request) {
		//System.out.println("我要进货...........");
		try {

			User emp1 = (User) request.getSession().getAttribute("user");

			model.addAttribute("user",emp1);

		}catch (Exception e){
			e.printStackTrace();
		}

		return "cert/index";
	}






}
