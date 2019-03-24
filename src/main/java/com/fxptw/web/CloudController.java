package com.fxptw.web;


import com.fxptw.dao.GoodsDao;
import com.fxptw.dao.StockDao;
import com.fxptw.dao.UserGoodsDao;
import com.fxptw.dto.Goods;
import com.fxptw.dto.Stock;
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
@RequestMapping(value = "/cloud")
public class CloudController {
	@Autowired
	private StockDao stockDao;
	@Autowired
	GoodsDao goodsDao;

	@RequestMapping(value = "/cloudstorage")
	public String index(){
		return  "cloud/cloudstorage";
	}
	//云库存
	@RequestMapping(value = "/cloudinventory")
	public String cloudinventory(Model model,HttpServletRequest request){
		User emp1 = (User) request.getSession().getAttribute("user");
		List<Stock> stocks=stockDao.getStockByUseridauwcw(emp1.getId());
		model.addAttribute("list",stocks);
		return  "cloud/cloudinventory";
	}

	//实体库存
	@RequestMapping(value = "/physicalinventory")
	public String physicalinventory(Model model,HttpServletRequest request){
		User emp1 = (User) request.getSession().getAttribute("user");
		List<Stock> stocks=stockDao.getStockByUseridauwcw(emp1.getId());
		model.addAttribute("list",stocks);
		return  "cloud/physicalinventory";
	}
	//提货订单
	@RequestMapping(value = "/mypickuporderslist")
	public String mypickuporderslist(Model model,HttpServletRequest request,String search_name ){
		User emp1 = (User) request.getSession().getAttribute("user");
		if(search_name==null){
			search_name="";
		}
		List<Stock> list=stockDao.getStock(emp1.getId(),search_name);
		//待付款  1、已付款   2、已申请   3、已通过   4
		List<Stock> list1=stockDao.getStockListByFlag("1",emp1.getId(),search_name);
		List<Stock> list2=stockDao.getStockListByFlag("2",emp1.getId(),search_name);
		List<Stock> list3=stockDao.getStockListByFlag("3",emp1.getId(),search_name);
		List<Stock> list4=stockDao.getStockListByFlag("4",emp1.getId(),search_name);
		List<Stock> list4change=new ArrayList<>();
		//把集合中的负数变为正数
		for(int i=0;i<list4.size();i++){
		    Stock stock=list4.get(i);
			stock.setStock(0-stock.getStock());
			list4change.add(stock);
		}
		model.addAttribute("list",list);
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("list4",list4change);
        model.addAttribute("search_name",search_name);
		return  "cloud/mypickuporderslist";
	}

	@RequestMapping(value = "/inventoryrecord")
	public String inventoryrecord(Model model,HttpServletRequest request){
		return  "cloud/inventoryrecord";
	}

	@RequestMapping(value = "/cloudreplacement")
	public String cloudreplacement(Model model,HttpServletRequest request){
		return  "cloud/cloudreplacement";
	}

	@RequestMapping(value = "/promptdelivery")
	public String promptdelivery(Model model,HttpServletRequest request){
		User emp1 = (User) request.getSession().getAttribute("user");
		List<Stock> stocks=stockDao.getStockByUseridauwcw(emp1.getId());
		String ids = "";
		for(Stock stock : stocks){
			ids = ids + stock.getGoodid() + ",";
		}
		if(ids.length()>1){
			ids = ids.substring(0,ids.length()-1);
		}
		model.addAttribute("ids",ids);
		model.addAttribute("list",stocks);
		return  "cloud/promptdelivery";

	}

	@RequestMapping(value = "/entityexchangerecord")
	public String entityexchangerecord(Model model,HttpServletRequest request){
		return  "cloud/entityexchangerecord";
	}



	//增加提货功能
	@RequestMapping(value = "/th")
	private String th(String param,HttpServletRequest request){
		User emp1 = (User) request.getSession().getAttribute("user");
		System.out.println("param:"+param);
		if(param.length()>0){
			param = param.substring(0,param.length()-1);
		}
		int userid = emp1.getId();
		try {
			//解析param增加或者修改t_user_goods表flag为0的记录
			if (param.indexOf(",") >= 0) {
				String goods[] = param.substring(0, param.length() - 1).split(",");//获取商品集合
				for (int i = 0; i < goods.length; i++) {
					int goodid = Integer.parseInt(goods[i].split("#")[0]);//商品id
					int num = Integer.parseInt(goods[i].split("#")[1]);//放进货车的商品数量

					if (num > 0) {
						Goods g = goodsDao.getGoodsByid(goodid);
						//购买数量大于0放进进货车，等于0的不处理
						Stock st = new Stock();
						st.setUserid(userid);
						st.setUsername(emp1.getName());
						st.setMobile(emp1.getMobile());

						st.setPrice(g.getBuyprice1());

						st.setBuynum(-num);//提货时buynum数量为负数
						st.setGoodid(goodid);
						st.setGoodname(g.getName());
						st.setPostname("");
						st.setPostadd("");
						st.setPostname("");
						st.setMessage("");
						st.setType("1");


						stockDao.addStock2(st);
					}
				}
			}else{
				int goodid = Integer.parseInt(param.split("#")[0]);//商品id
				int num = Integer.parseInt(param.split("#")[1]);//放进货车的商品数量

				if (num > 0) {
					Goods g = goodsDao.getGoodsByid(goodid);
					//购买数量大于0放进进货车，等于0的不处理
					Stock st = new Stock();
					st.setUserid(userid);
					st.setUsername(emp1.getName());
					st.setMobile(emp1.getMobile());

					st.setPrice(g.getBuyprice1());

					st.setBuynum(-num);//提货时buynum数量为负数
					st.setGoodid(goodid);
					st.setGoodname(g.getName());
					st.setPostname("");
					st.setPostadd("");
					st.setPostname("");
					st.setMessage("");
					st.setType("0");


					stockDao.addStock2(st);
				}
			}


		}catch (Exception e){
			e.printStackTrace();
		}
		return "cloud/th";
	}


}
