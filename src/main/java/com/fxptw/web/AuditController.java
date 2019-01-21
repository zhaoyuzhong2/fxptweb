package com.fxptw.web;


import com.fxptw.dao.GoodsDao;
import com.fxptw.dao.StockDao;
import com.fxptw.dao.UserDao;
import com.fxptw.dao.UserGoodsDao;
import com.fxptw.dto.Goods;
import com.fxptw.dto.Stock;
import com.fxptw.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "audit")
public class AuditController {
	@Autowired
	UserDao userDao;


	//审核代理页面
	@RequestMapping(value = "/index")
	public String index(Model model,HttpServletRequest request) {
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
