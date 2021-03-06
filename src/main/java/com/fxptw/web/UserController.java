package com.fxptw.web;


import com.fxptw.dao.RequestDao;
import com.fxptw.dao.RoleDao;
import com.fxptw.dao.UserDao;
import com.fxptw.dao.VericodeDao;
import com.fxptw.dto.Request;
import com.fxptw.dto.Role;
import com.fxptw.dto.User;
import com.fxptw.util.ParamSettings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "user")
public class UserController {
	@Autowired
	UserDao userDao;

	@Autowired
	RequestDao requestDao;

	@Autowired
	ParamSettings paramSettings;

	@Autowired
	RoleDao roleDao;

	@Autowired
	VericodeDao vericodeDao;

	@ResponseBody
	@RequestMapping(value = "/test")
	public String test(int id){

		int total = userDao.treeMenuList(userDao.getAllUsers(),id).size();
		int buy = userDao.treeMenuList1(userDao.getAllUsers(),id).size();;
		return "所有子用户："+total+"    购买产品："+buy;
	}


	@RequestMapping(value = "/request")
	public String request(int id,String result,Model model){
		Request req = requestDao.getRequestById(id);
		int requesttime = paramSettings.getRequesttime();//从配置文件获取邀请失效时间
		System.out.println("requesttime:"+requesttime);
		//判断此邀请是否已失效，失效跳转错误页面
		long nd = 1000 * 24 * 60 * 60;
		long nh = 1000 * 60 * 60;


		long diff = new Date().getTime() - req.getCdate().getTime();

		// 计算差多少小时
		long hour = diff % nd / nh;
		if(hour>requesttime){
			//说明此邀请已失效
			return "login/error";
		}else{
			model.addAttribute("reqUserid",req.getUserid());
			model.addAttribute("reqUsername",req.getUsername());
			model.addAttribute("roles",req.getRoles());

			return "login/reg1";
		}


	}



	@ResponseBody
	@RequestMapping(value = "/isExist")
	public String isExist(String mobile){
		int flag = userDao.isExist(mobile);
		if(flag==0){
			return "ok";
		}else{
			return "you";
		}
	}


    @PostMapping(value = "/login")
    public String login(String mobile,String pwd,String openid,String headimgurl, HttpServletRequest request, Model model){
		User user = userDao.login(mobile,pwd);
        if(user==null){
			model.addAttribute("error","用户名和密码输入错误！");
			model.addAttribute("headimgurl",headimgurl);
			model.addAttribute("openid",openid);
            return "login/login";

        }else if(user.getFlag().equals("0")){
			model.addAttribute("error","您的账号并未审核！");
			model.addAttribute("headimgurl",headimgurl);
			model.addAttribute("openid",openid);
			return "login/login";

		}else if(user.getFlag().equals("2")){
			model.addAttribute("error","您的账号审核未通过！");
			model.addAttribute("headimgurl",headimgurl);
			model.addAttribute("openid",openid);
			return "login/login";

		}else if(user.getFlag().equals("3")){
			model.addAttribute("error","您的账号已被注销！");
			model.addAttribute("headimgurl",headimgurl);
			model.addAttribute("openid",openid);
			return "login/login";

		}else{
			HttpSession session = request.getSession();
			Role role = roleDao.getRoleById(user.getRoleid());
			user.setOpenid(openid);
			user.setHeadpath(headimgurl);
			user.setRolename(role.getName());
			session.setAttribute("user", user);

			userDao.updUser(user);//更改openid和headpath

			model.addAttribute("tyeji","0.00");
			double tshouru = userDao.getShouru(user.getId(),"");
			model.addAttribute("tshouru",tshouru);
			model.addAttribute("huokuan","0.00");
			model.addAttribute("yeji","0.00");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM");
			String yearm = sdf.format(new Date());
			double byshouru = userDao.getByShouru(user.getId(),yearm);
			model.addAttribute("shouru",byshouru);
			model.addAttribute("money",byshouru);
			model.addAttribute("emp",user);

            return "main/index";
        }
    }



	@ResponseBody
	@RequestMapping(value = "/isYzmExist")
	public String isYzmExist(String mobile,String yzm){
		int flag = vericodeDao.getYzmExist(mobile,yzm);
		if(flag==0){
			return "nook";
		}else{
			return "ok";
		}
	}



	@RequestMapping(value = "/reg2")
	public String reg2(String mobile,String reqUserid,String reqUsername,String roles,Model model){
		List<Role> rs = roleDao.getRolesByReq(roles);

		model.addAttribute("mobile",mobile);
		model.addAttribute("reqUserid",reqUserid);
		model.addAttribute("reqUsername",reqUsername);
		model.addAttribute("rs",rs);
		return "login/reg2";
	}



	@RequestMapping(value = "/reg3")
	public String reg3(String mobile,String reqUserid,String reqUsername,String roleid,Model model){


		model.addAttribute("roleid",roleid);
		model.addAttribute("mobile",mobile);
		model.addAttribute("reqUserid",reqUserid);
		model.addAttribute("reqUsername",reqUsername);

		return "login/reg3";
	}



	@RequestMapping(value = "/reg")
	public String reg(User user,HttpServletRequest request,Model model){

		String idcard = user.getIdcard();
		String birthday = idcard.substring(6,14);
		user.setBirthday(birthday);
		user.setCode("JKY"+new Date().getTime());
		int id = userDao.insUser(user);
        if(id>0) {
            Role role = roleDao.getRoleById(user.getRoleid());
            if(role!=null){
                user.setRolename(role.getName());
            }
            user.setId(id);
			user.setFlag("0");//注册默认是0

			HttpSession session = request.getSession();
			session.setAttribute("user", user);


			model.addAttribute("tyeji","0.00");
			model.addAttribute("tshouru","0.00");
			model.addAttribute("huokuan","0.00");
			model.addAttribute("yeji","0.00");

			model.addAttribute("shouru","0.00");
			model.addAttribute("money","0.00");
			model.addAttribute("emp",user);


            return "main/index";
        }else{
            return "main/regError";
        }


	}

	
}
