package com.fxptw.web;


import com.fxptw.dao.StockDao;
import com.fxptw.dao.UserDao;
import com.fxptw.dao.UserGoodsDao;
import com.fxptw.dto.User;
import com.fxptw.dto.UserGoods;
import com.fxptw.util.ParamSettings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "my")
public class MyController {
	@Autowired
	UserDao userDao;
    @Autowired
    UserGoodsDao userGoodsDao;
    @Autowired
    StockDao stockDao;
	@Autowired
	ParamSettings paramSettings;


	//进入  首页    我
	@RequestMapping(value = "/index")
	public String index(Model model,HttpServletRequest request) {
		User emp1 = (User) request.getSession().getAttribute("user");

		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM");
		String yearm = sdf.format(new Date());
		double byshouru = userDao.getByShouru(emp1.getId(),yearm);

		model.addAttribute("user",emp1);
		model.addAttribute("zbtel",paramSettings.getTel());
		model.addAttribute("byshouru",byshouru);
		return "my/index";
	}



	@RequestMapping(value = "/txye")
	public String txye(Model model,HttpServletRequest request) {
		User emp1 = (User) request.getSession().getAttribute("user");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		String yearm = sdf.format(new Date());
		double byshouru = userDao.getByShouru(emp1.getId(),yearm);
		double tshouru = userDao.getShouru(emp1.getId(),"");

		model.addAttribute("byshouru",byshouru);
		model.addAttribute("tshouru",tshouru);
		return "my/txye";
	}



	@RequestMapping(value = "/szmx")
	public String szmx(Model model,HttpServletRequest request) {

		return "my/szmx";
	}



    @RequestMapping(value = "/sztj")
    public String sztj(Model model,HttpServletRequest request) {

        return "my/sztj";
    }


    @RequestMapping(value = "/spchtj")
    public String spchtj(Model model,HttpServletRequest request) {
        User emp1 = (User) request.getSession().getAttribute("user");
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM");
        String yearm = sdf.format(new Date());
		int stock = stockDao.getTotal(emp1.getId(),"4");
		int ugs = userGoodsDao.getShopingList(emp1.getId(),"3").size();

        model.addAttribute("yearm",yearm);
		model.addAttribute("total",stock+ugs);
        return "my/spchtj";
    }








}
