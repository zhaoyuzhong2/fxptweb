package com.fxptw.web;


import com.fxptw.dao.GoodsDao;
import com.fxptw.dao.UserDao;
import com.fxptw.dao.UserGoodsDao;
import com.fxptw.dto.Goods;
import com.fxptw.dto.User;
import com.fxptw.dto.UserGoods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "ug")
public class UserGoodsController {
	@Autowired
	UserGoodsDao userGoodsDao;
	@Autowired
	GoodsDao goodsDao;
	@Autowired
	UserDao userDao;
	//首页跳转
	@RequestMapping(value = "/myList")
	public String myList(Model model) {
		List<UserGoods> ugs = userGoodsDao.getList(1,"0","");
		model.addAttribute("ugs",ugs);
		return "ug/myList";
	}


	@ResponseBody
	@RequestMapping(value = "/updateUserGoodsNum")
	public String updateUserGoodsNum(int userid,int goodid,int num){
		userGoodsDao.updateUserGoodsNum(userid,goodid,num);
		return "";
	}




	//进入我要进货首页
	@RequestMapping(value = "/wantToBy")
	public String wantToBy(Model model,HttpServletRequest request) {
		//System.out.println("我要进货...........");
		try {

			User emp1 = (User) request.getSession().getAttribute("user");
			List<Goods> gs = goodsDao.getList();
			System.out.println("            " + gs.size());
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

		return "good/index";
	}





	//进入我的购物车
	@RequestMapping(value = "/shopingCar")
	public String shopingCar(Model model,HttpServletRequest request,String param) {
		User emp1 = (User) request.getSession().getAttribute("user");
        int userid = emp1.getId();
		User user = userDao.getUserById(userid);//重新获取用户是担心用户角色有变化
		int roleid = user.getRoleid();

        //解析param增加或者修改t_user_goods表flag为0的记录
        if(param.indexOf(",")>0){
            String goods[] = param.substring(0,param.length()-1).split(",");//获取商品集合
            for (int i=0;i<goods.length;i++){
                int goodid = Integer.parseInt(goods[i].split("#")[0]);//商品id
                int num = Integer.parseInt(goods[i].split("#")[1]);//放进货车的商品数量
                if(num>0){
                    //购买数量大于0放进进货车，等于0的不处理
                    UserGoods ug = userGoodsDao.getMyGoods(userid,goodid);
                    if(ug==null){
                        //说明进货车没有该商品信息，是新增
                        UserGoods xug = new UserGoods();
                        Goods g = goodsDao.getGoodsByid(goodid);
                        xug.setBuynum(num);
                        xug.setRoleid(roleid);
                        xug.setGoodid(goodid);
                        xug.setGoodname(g.getName());
						if (roleid==2){
							xug.setBuyprice(g.getBuyprice1());
							xug.setTotalprice(g.getBuyprice1()*num);
						}else if (roleid==3){
							xug.setBuyprice(g.getBuyprice2());
							xug.setTotalprice(g.getBuyprice2()*num);
						}else if (roleid==4){
							xug.setBuyprice(g.getBuyprice3());
							xug.setTotalprice(g.getBuyprice3()*num);
						}
						xug.setUserid(userid);
						xug.setUsername(user.getName());
						xug.setFlag("0");

						userGoodsDao.addUserGoods(xug);
                    }else{
						//有进货车信息，说明是修改
						userGoodsDao.updateUserGoodsNum(userid,goodid,num);
					}
                }
            }
        }
        List<UserGoods> ugs = userGoodsDao.getShopingList(userid,"0");

		int total = userGoodsDao.getMyGoodsNum(userid);//进货车所有商品之和
		String totalprice = userGoodsDao.getMyGoodsPrice(userid);

		model.addAttribute("userid",userid);
		model.addAttribute("total",total);
		model.addAttribute("totalprice",totalprice);
		model.addAttribute("ugs",ugs);
		return "good/shopingCar";
	}



	//结算保存
	@RequestMapping(value = "/jsShopingCar")
	public String jsShopingCar(String result,String userid,Model model){
		if(result.indexOf(",")>0){
			result= result.substring(0,result.length()-1);
			String ugids[] = result.split(",");
            List<UserGoods> uggs = new ArrayList<>();
			int total = 0;
			double totalprice = 0.00;
			for (int i=0;i<ugids.length;i++){
				int ugid = Integer.parseInt(ugids[i]);
                UserGoods ug = userGoodsDao.getUserGoodsById(ugid);
				total = total + ug.getBuynum();
				totalprice = totalprice + ug.getBuyprice();
                uggs.add(ug);

			}
			model.addAttribute("userid",userid);
			model.addAttribute("result",result);
			model.addAttribute("total",total);
			model.addAttribute("totalprice",totalprice);
            model.addAttribute("ugs",uggs);
			return "goods/post";
		}else{
			return "goods/error";
		}

	}



	@ResponseBody
	@RequestMapping(value = "/queryAdd")
	public String queryAdd(String postname,Integer userid){
		UserGoods ug = userGoodsDao.getMyPostAdd(userid,postname);
		if(ug!=null){
			String mobile = ug.getPostmobile();
			String add = ug.getPostadd();
			return mobile+"###"+add;
		}else{
			return "";
		}
	}


	//保存收货地址，flag状态变为1，等待付款
	@RequestMapping(value = "/addpost")
	public String addpost(String message,String result,String postname,String postmobile,String postadd,Model model){
		if(result.indexOf(",")>0){
			result= result.substring(0,result.length()-1);
			String ugids[] = result.split(",");

			for (int i=0;i<ugids.length;i++){
				int ugid = Integer.parseInt(ugids[i]);
				//更改进货车的状态以及邮寄信息
				userGoodsDao.updateUgFlag(ugid,postname,postmobile,postadd,message);

			}


			return "good/post";
		}else{
			return "good/error";
		}

	}



}
