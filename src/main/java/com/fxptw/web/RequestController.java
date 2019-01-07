package com.fxptw.web;


import com.fxptw.dao.RequestDao;
import com.fxptw.dao.RoleDao;
import com.fxptw.dao.UserDao;
import com.fxptw.dto.Request;
import com.fxptw.dto.Role;
import com.fxptw.dto.User;
import com.fxptw.util.Zxing;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "request")
public class RequestController {
	@Autowired
	UserDao userDao;
	@Autowired
	RoleDao roleDao;
	@Autowired
	RequestDao requestDao;


	//进入邀请代理首页
	@RequestMapping(value = "/index")
	public String index(Model model,HttpServletRequest request) {
		User emp1 = (User) request.getSession().getAttribute("user");
		int userid = emp1.getId();
		User user = userDao.getUserById(userid);//重新获取用户是担心用户角色有变化
		int roleid = user.getRoleid();

		List<Role> rs = roleDao.getRoles();
		model.addAttribute("roleid",roleid);
		model.addAttribute("rs",rs);
		return "request/index";
	}



	//进入邀请代理首页
	@RequestMapping(value = "/createReq")
	public String createReq(Model model,HttpServletRequest request,int userid,String result) {

		User user = userDao.getUserById(userid);//重新获取用户是担心用户角色有变化
		if(result.length()>1){
			result = result.substring(0,result.length()-1);
		}
		int roleid = user.getRoleid();
		Request req = new Request();
		req.setRoleid(roleid);
		req.setMobile(user.getMobile());
		req.setUserid(userid);
		req.setUsername(user.getName());
		req.setRoles(result);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-DD HH:mm:ss");
		req.setImgpath("/fileupload/ewm/"+user.getMobile()+"-"+sdf.format(new Date())+".png");
		Zxing zxing = new Zxing();
		zxing.createImg("/fileupload/ewm/"+user.getMobile()+"-"+sdf.format(new Date())+".png");
		int id = requestDao.addRequest(req);
		req.setId(id);

		model.addAttribute("req",req);
		model.addAttribute("rolename",user.getRolename());

		return "request/reqinfo";
	}






}
