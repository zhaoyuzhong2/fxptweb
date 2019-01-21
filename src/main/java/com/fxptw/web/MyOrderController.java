package com.fxptw.web;


import com.fxptw.dao.*;
import com.fxptw.dto.User;
import com.fxptw.dto.UserGoods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping(value = "/myorder")
public class MyOrderController {
	@Autowired
	UserGoodsDao userGoodsDao;



	//查询与搜索全部方法
	@RequestMapping(value = "/getList")
	public String getList(Model model,HttpServletRequest request,String search_name){
		User emp1 = (User) request.getSession().getAttribute("user");
		if(search_name==null){
			search_name="";
		}
		List<UserGoods> codelist=userGoodsDao.getCodeByUserid(emp1.getId(),search_name);
		List list=new ArrayList();
		try {
			for (UserGoods userGoods : codelist) {
				Map map = new HashMap<>();
				Double totalprice = 0.0;
				List<UserGoods> goodlist = userGoodsDao.selectGoodsByCode(userGoods.getCode());
				for (UserGoods userGoods1 : goodlist) {
					totalprice = totalprice + userGoods1.getTotalprice();
				}
				map.put("goodlist", goodlist);
				map.put("code", userGoods.getCode());
				map.put("totalprice", totalprice);
				list.add(map);
				//list.add(userGoods.getCode());
			}
		}catch (Exception e){
			e.printStackTrace();
		}

		model.addAttribute("list",list);
		model.addAttribute("total",codelist.size());


		List<UserGoods> codelist0=userGoodsDao.getCodeByUseridByFlag(emp1.getId(),"0",search_name);
		List list0=new ArrayList();
		for(UserGoods userGoods:codelist0){
			Map map = new HashMap<>();
			Double totalprice = 0.0;
			List<UserGoods> goodlist=userGoodsDao.selectGoodsByCodeAndFlag("0",userGoods.getCode());
			for (UserGoods userGoods1 : goodlist) {
				totalprice = totalprice + userGoods1.getTotalprice();
			}
			map.put("goodlist", goodlist);
			map.put("code", userGoods.getCode());
			map.put("totalprice", totalprice);
			list0.add(map);
		}
		model.addAttribute("list0",list0);
		model.addAttribute("total0",codelist0.size());




		List<UserGoods> codelist1=userGoodsDao.getCodeByUseridByFlag(emp1.getId(),"1",search_name);
		List list1=new ArrayList();
		for(UserGoods userGoods:codelist1){
			Map map = new HashMap<>();
			Double totalprice = 0.0;
			List<UserGoods> goodlist=userGoodsDao.selectGoodsByCodeAndFlag("1",userGoods.getCode());
			for (UserGoods userGoods1 : goodlist) {
				totalprice = totalprice + userGoods1.getTotalprice();
			}
			map.put("goodlist", goodlist);
			map.put("code", userGoods.getCode());
			map.put("totalprice", totalprice);
			list1.add(map);

		}
		model.addAttribute("list1",list1);
		model.addAttribute("total1",codelist1.size());




		List<UserGoods> codelist2=userGoodsDao.getCodeByUseridByFlag(emp1.getId(),"2",search_name);
		List list2=new ArrayList();
		for(UserGoods userGoods:codelist2){
			Map map = new HashMap<>();
			Double totalprice = 0.0;
			List<UserGoods> goodlist=userGoodsDao.selectGoodsByCodeAndFlag("2",userGoods.getCode());
			for (UserGoods userGoods1 : goodlist) {
				totalprice = totalprice + userGoods1.getTotalprice();
			}
			map.put("goodlist", goodlist);
			map.put("code", userGoods.getCode());
			map.put("totalprice", totalprice);
			list2.add(map);
		}
		model.addAttribute("list2",list2);
		model.addAttribute("total2",codelist2.size());




		List<UserGoods> codelist3=userGoodsDao.getCodeByUseridByFlag(emp1.getId(),"3",search_name);
		List list3=new ArrayList();
		for(UserGoods userGoods:codelist3){
			Map map = new HashMap<>();
			Double totalprice = 0.0;
			List<UserGoods> goodlist=userGoodsDao.selectGoodsByCodeAndFlag("3",userGoods.getCode());
			for (UserGoods userGoods1 : goodlist) {
				totalprice = totalprice + userGoods1.getTotalprice();
			}
			map.put("goodlist", goodlist);
			map.put("code", userGoods.getCode());
			map.put("totalprice", totalprice);
			list3.add(map);
		}
		model.addAttribute("list3",list3);
		model.addAttribute("total3",codelist3.size());
		model.addAttribute("search_name",search_name);
		return "myorder/list";
	}


	//查询与搜索全部方法
	@RequestMapping(value = "/getListByCode")
	public String getOrderByCode(Model model,HttpServletRequest request,String code){
		User emp1 = (User) request.getSession().getAttribute("user");
		List<UserGoods> goodlist=userGoodsDao.selectGoodsByCode(code);
		UserGoods userGoods=null;
		if(goodlist.size()>0){
			userGoods=goodlist.get(0);
		}
		Double totalprice = 0.0;
		for (UserGoods userGoods1 : goodlist) {
			totalprice = totalprice + userGoods1.getTotalprice();
		}
		model.addAttribute("list",goodlist);
		model.addAttribute("code",code);
		model.addAttribute("totalprice",totalprice);
		model.addAttribute("userGoods",userGoods);
		return "myorder/details";
	}
}
