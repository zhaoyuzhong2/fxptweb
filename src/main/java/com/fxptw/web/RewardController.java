package com.fxptw.web;


import com.fxptw.dao.UserDao;
import com.fxptw.dao.UserInComeDao;
import com.fxptw.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "reward")
public class RewardController {
	@Autowired
	UserDao userDao;
	@Autowired
	UserInComeDao userInComeDao;


	//审核代理页面
	@RequestMapping(value = "/index")
	public String index(Model model,HttpServletRequest request) {
		//System.out.println("我要进货...........");
		double totalReward = 0.00;
		try {
			User emp1 = (User) request.getSession().getAttribute("user");
			totalReward = userInComeDao.getRewardByUserid(emp1.getId());

			model.addAttribute("totalReward",totalReward);

		}catch (Exception e){
			e.printStackTrace();
		}

		return "reward/index";
	}




	@RequestMapping(value = "/month")
	public String month(Model model) {
		//System.out.println("我要进货...........");
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM");
		String yearm = sdf.format(new Date());
		model.addAttribute("yearm",yearm);
		return "reward/month";
	}






}
