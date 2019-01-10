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
@RequestMapping(value = "team")
public class TeamController {
	@Autowired
	UserDao userDao;


	//进入邀请关系网
	@RequestMapping(value = "/request")
	public String request(Model model,HttpServletRequest request) {
		User emp1 = (User) request.getSession().getAttribute("user");
		List<User> myReq = userDao.getDownUser(emp1.getId());//获取我直接邀请的列表
		List<User> r1s = new ArrayList<>();
		List<User> r2s = new ArrayList<>();
		List<User> r3s = new ArrayList<>();
		for (User u : myReq){
			int zs = userDao.getXjnum(u.getId());//我直接邀请的人数
			int all = userDao.getAllXjnum(u.getId());//团队所有子节点用户之和
			int roleid = u.getRoleid();
			u.setXjnum(zs);
			u.setCount(all);
			if(roleid==1){
				r1s.add(u);
			}else if(roleid==2){
				r2s.add(u);
			}else if(roleid==3){
				r3s.add(u);
			}
		}


		List<User> allxjs = userDao.getAllXjs(emp1.getId());//获取所有子节点用户
		User sj = userDao.getUpUser(emp1.getId());


		model.addAttribute("r1s",r1s);
		model.addAttribute("r1sn",r1s.size());
		model.addAttribute("r2s",r2s);
		model.addAttribute("r2sn",r2s.size());
		model.addAttribute("r3s",r3s);
		model.addAttribute("r3sn",r3s.size());
		model.addAttribute("myReqCount",myReq.size());//我直接邀请的人数
		model.addAttribute("allxjs",allxjs);
		model.addAttribute("sj",sj);



		return "team/request";
	}






}
