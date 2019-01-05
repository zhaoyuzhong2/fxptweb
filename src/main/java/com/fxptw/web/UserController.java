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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


	@RequestMapping(value = "/request")
	public String request(int id,Model model){
		Request req = requestDao.getRequestById(id);
		int requesttime = paramSettings.getRequesttime();//从配置文件获取邀请失效时间

		//判断此邀请是否已失效，失效跳转错误页面
		long nd = 1000 * 24 * 60 * 60;
		long nh = 1000 * 60 * 60;


		long diff = new Date().getTime() - req.getCdate().getTime();

		// 计算差多少小时
		long hour = diff % nd / nh;
		if(hour>requesttime){
			//说明此邀请已失效
			return "user/error";
		}else{
			model.addAttribute("reqUserid",req.getUserid());
			model.addAttribute("reqUsername",req.getUsername());
			model.addAttribute("roles",req.getRoles());

			return "user/reg1";
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
    public String login(String mobile,String pwd, HttpServletRequest request, Model model){

        User user = userDao.login(mobile,pwd);
        if(user==null){
			model.addAttribute("error","用户名和密码输入错误！");
            return "login/login";

        }else{
			HttpSession session = request.getSession();
			session.setAttribute("user", user);

			model.addAttribute("tyeji","0.00");
			model.addAttribute("tshouru","0.00");
			model.addAttribute("huokuan","0.00");
			model.addAttribute("yeji","0.00");
			model.addAttribute("shouru","120.00");
			model.addAttribute("money",user.getMoney());

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
		return "user/reg2";
	}



	@RequestMapping(value = "/reg3")
	public String reg3(String mobile,String reqUserid,String reqUsername,String roleid,Model model){


		model.addAttribute("roleid",roleid);
		model.addAttribute("mobile",mobile);
		model.addAttribute("reqUserid",reqUserid);
		model.addAttribute("reqUsername",reqUsername);

		return "user/reg3";
	}



	@RequestMapping(value = "/reg")
	public String reg(User user,HttpServletRequest request,Model model){

		String idcard = user.getIdcard();
		String birthday = idcard.substring(6,14);
		user.setBirthday(birthday);
		int id = userDao.insUser(user);
        if(id>0) {
            Role role = roleDao.getRoleById(user.getRoleid());
            String rolename = "";
            if(role!=null){
                user.setRolename(role.getName());
            }
            user.setId(id);
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            model.addAttribute("tyeji","0.00");
            model.addAttribute("tshouru","0.00");
            model.addAttribute("huokuan","0.00");
            model.addAttribute("yeji","0.00");
            model.addAttribute("shouru","0.00");
            model.addAttribute("money",user.getMoney());

            return "main/index";
        }else{
            return "main/regError";
        }


	}

	
}
