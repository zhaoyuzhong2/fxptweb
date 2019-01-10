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
	public String wantToBy(Model model,HttpServletRequest request) {
		//System.out.println("我要进货...........");
		try {

			User emp1 = (User) request.getSession().getAttribute("user");
			List<User> dsh = userDao.getDownUsersByFlag(emp1.getId(),"0");//待审核
			List<User> zdl = userDao.getDownUsersByFlag(emp1.getId(),"0");//准代理
			List<User> ydl = userDao.getDownUsersByFlag(emp1.getId(),"1");//已代理
			List<User> yjj = userDao.getDownUsersByFlag(emp1.getId(),"2");//已拒绝

			model.addAttribute("dsh",dsh);
			model.addAttribute("dshn",dsh.size());
			model.addAttribute("zdl",zdl);
			model.addAttribute("zdln",zdl.size());
			model.addAttribute("ydl",ydl);
			model.addAttribute("ydln",ydl.size());
			model.addAttribute("yjj",yjj);
			model.addAttribute("yjjn",yjj.size());

		}catch (Exception e){
			e.printStackTrace();
		}

		return "audit/index";
	}






}
