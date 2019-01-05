package com.fxptw.web;


import com.fxptw.dao.GoodsDao;
import com.fxptw.dao.UserDao;
import com.fxptw.dao.UserGoodsDao;
import com.fxptw.dto.Goods;
import com.fxptw.dto.User;
import org.springframework.beans.factory.ListableBeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "goods")
public class GoodsController  {
	@Autowired
	GoodsDao goodsDao;
	@Autowired
	UserGoodsDao userGoodsDao;
	@Autowired
	UserDao userDao;


	//首页跳转
	@RequestMapping(value = "/goodsList")
	public String goodsList(Model model) {
		List<Goods> gs = goodsDao.getList();
		model.addAttribute("gs",gs);
		return "goods/list";
	}

	@RequestMapping(value = "/goodsinfo")
	public String goodsinfo(Model model,int id) {
		Goods g = goodsDao.getGoodsByid(id);

		model.addAttribute("g",g);
		return "goods/info";
	}


}
