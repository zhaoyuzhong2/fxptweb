package com.fxptw.web;


import com.fxptw.dao.GoodsDao;
import com.fxptw.dao.StockDao;
import com.fxptw.dao.UserDao;
import com.fxptw.dao.UserGoodsDao;
import com.fxptw.dto.Goods;
import com.fxptw.dto.Stock;
import com.fxptw.dto.User;
import com.fxptw.dto.UserGoods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping(value = "stock")
public class StockController {
	@Autowired
	UserGoodsDao userGoodsDao;
	@Autowired
	GoodsDao goodsDao;
	@Autowired
	UserDao userDao;
	@Autowired
	StockDao stockDao;


	//进入我要进货首页
	@RequestMapping(value = "/wantToBy")
	public String wantToBy(Model model,HttpServletRequest request) {
		//System.out.println("我要进货...........");
		try {

			User emp1 = (User) request.getSession().getAttribute("user");
			List<Goods> gs = goodsDao.getList();
			//System.out.println("            " + gs.size());
			User user = userDao.getUserById(emp1.getId());//重新获取用户是担心用户角色有变化

			List<Goods> gs1 = new ArrayList<>();

			int roleid = user.getRoleid();
			int total = 0;
			double price = 0.00;
			String ids = "";

			for (Goods g : gs) {
				int num = userGoodsDao.getMyGoodNum(emp1.getId(), g.getId());
				ids = ids + g.getId() + ",";
				total = total + num;
				g.setCount(num);
				if (roleid == 2) {
					g.setPrice(g.getBuyprice1());
					price = price + g.getBuyprice1() * num;
				} else if (roleid == 3) {
					g.setPrice(g.getBuyprice2());
					price = price + g.getBuyprice2() * num;
				} else if (roleid == 4) {
					g.setPrice(g.getBuyprice3());
					price = price + g.getBuyprice3() * num;
				}

				gs1.add(g);
			}
			if (ids.indexOf(",") > 0) {
				ids = ids.substring(0, ids.length() - 1);
			}
			model.addAttribute("total", total);
			model.addAttribute("price", price);
			model.addAttribute("ids", ids);
			model.addAttribute("gs", gs1);
		}catch (Exception e){
			e.printStackTrace();
		}

		return "stock/buy";
	}





	//购买云库存
	@RequestMapping(value = "/shopingCar")
	public String shopingCar(Model model,HttpServletRequest request,String param) {
		User emp1 = (User) request.getSession().getAttribute("user");
		int userid = emp1.getId();
		User user = userDao.getUserById(userid);//重新获取用户是担心用户角色有变化
		int roleid = user.getRoleid();

		try {
			//解析param增加或者修改t_user_goods表flag为0的记录
			if (param.indexOf(",") > 0) {
				String goods[] = param.substring(0, param.length() - 1).split(",");//获取商品集合
				for (int i = 0; i < goods.length; i++) {
					int goodid = Integer.parseInt(goods[i].split("#")[0]);//商品id
					int num = Integer.parseInt(goods[i].split("#")[1]);//放进货车的商品数量

					if (num > 0) {
						Goods g = goodsDao.getGoodsByid(goodid);
						//购买数量大于0放进进货车，等于0的不处理
						Stock st = new Stock();
						st.setUserid(userid);
						st.setUsername(user.getName());
						st.setMobile(user.getMobile());
						if (roleid == 2) {
							st.setPrice(g.getBuyprice1());
							st.setBuyprice(g.getBuyprice1() * num);
						} else if (roleid == 3) {
							st.setPrice(g.getBuyprice2());
							st.setBuyprice(g.getBuyprice2() * num);
						} else if (roleid == 4) {
							st.setPrice(g.getBuyprice3());
							st.setBuyprice(g.getBuyprice3() * num);
						}
						st.setBuynum(num);
						st.setGoodid(goodid);
						st.setGoodname(g.getName());
						st.setPostname("");
						st.setPostadd("");
						st.setPostname("");
						st.setMessage("");
						st.setType("0");


						stockDao.addStock(st);
					}
				}
			}


		}catch (Exception e){
			e.printStackTrace();
		}
		return "stock/success";
	}







}
