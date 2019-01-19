package com.fxptw.web;


import com.fxptw.dao.GoodsDao;
import com.fxptw.dao.RoleDao;
import com.fxptw.dao.UserDao;
import com.fxptw.dao.UserGoodsDao;
import com.fxptw.dto.Goods;
import com.fxptw.dto.Role;
import com.fxptw.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "upgrade")
public class UpGradeController {

	@Autowired
	UserGoodsDao userGoodsDao;
	@Autowired
	UserDao userDao;
	@Autowired
	RoleDao roleDao;


	//跳往升级处理  首页
	@RequestMapping(value = "/goodsList")
	public String goodsList(Model model, HttpServletRequest request) {
		User emp1 = (User) request.getSession().getAttribute("user");
		int userid = emp1.getId();
		User user = userDao.getUserById(userid);//重新获取用户是担心用户角色有变化
		int roleid = user.getRoleid();
		List<Role> rs = roleDao.getUpRoles(roleid);

		model.addAttribute("rs",rs);
		model.addAttribute("user",emp1);
		return "upgrade/index";
	}





}
