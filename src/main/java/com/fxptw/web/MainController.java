package com.fxptw.web;


import com.alibaba.fastjson.JSONObject;
import com.fxptw.dao.RequestDao;
import com.fxptw.dao.RoleDao;
import com.fxptw.dao.UserDao;
import com.fxptw.dao.VericodeDao;
import com.fxptw.dto.Request;
import com.fxptw.dto.Role;
import com.fxptw.dto.User;
import com.fxptw.util.ParamSettings;
import com.fxptw.wechat.HttpGetUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.fxptw.task.WeCharQuartz;
import org.springframework.web.client.RestTemplate;


@Controller
@RequestMapping(value = "main")
public class MainController {
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

	@Autowired
	RestTemplate restTemplate;


	@RequestMapping(value = "/main")
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


	//登录功能
	@RequestMapping(value = "/tologin")
	public String tologin(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String code = request.getParameter("code");//获取code
		Map<String, String> params = new HashMap<>();
		params.put("secret", paramSettings.getAppSecret());
		params.put("appid", paramSettings.getAppId());
		params.put("grant_type", "authorization_code");
		params.put("code", code);
		String result = HttpGetUtil.httpRequestToString(
				"https://api.weixin.qq.com/sns/oauth2/access_token", params);
		JSONObject jsonObject = JSONObject.parseObject(result);
		String openid = jsonObject.get("openid").toString();
		String url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token="+WeCharQuartz.getAccessToken()
				+"&openid="+openid+"&lang=zh_CN";
		Map user = restTemplate.getForEntity(url,Map.class,new HashMap<>()).getBody();
		System.out.println("得到的openid为:"+openid+"\tuser:"+user);
		return "login/login";
	}



	//登录功能
    @RequestMapping(value = "/login")
    public String login(String mobile,String pwd,HttpServletRequest request,Model model){

        User user = userDao.login(mobile,pwd);
        if(user==null){
            return "login/login";
        }else{
			HttpSession session = request.getSession();
			session.setAttribute("user", user);

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

//			model.addAttribute("tyeji","0.00");
//			model.addAttribute("tshouru","0.00");
//			model.addAttribute("huokuan","0.00");
//			model.addAttribute("yeji","0.00");
//			model.addAttribute("shouru","0.00");
//			model.addAttribute("money",user.getMoney());

            return "main/index";
        }
    }


	//跳转到首页
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		if(session.getAttribute("user")==null){
			return "login/login";
		}else {
			User user = (User) session.getAttribute("user");

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

//			model.addAttribute("tyeji", "0.00");
//			model.addAttribute("tshouru", "0.00");
//			model.addAttribute("huokuan", "0.00");
//			model.addAttribute("yeji", "0.00");
//			model.addAttribute("shouru", "0.00");
//			model.addAttribute("money", user.getMoney());

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
			double tshouru = userDao.getShouru(user.getId(),"");
			model.addAttribute("tshouru",tshouru);
			model.addAttribute("huokuan","0.00");
			model.addAttribute("yeji","0.00");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM");
			String yearm = sdf.format(new Date());
			double byshouru = userDao.getByShouru(user.getId(),yearm);
			model.addAttribute("shouru",byshouru);
			model.addAttribute("money",byshouru);


//            model.addAttribute("tyeji","0.00");
//            model.addAttribute("tshouru","0.00");
//            model.addAttribute("huokuan","0.00");
//            model.addAttribute("yeji","0.00");
//            model.addAttribute("shouru","0.00");
//            model.addAttribute("money",user.getMoney());

            return "main/index";
        }else{
            return "main/regError";
        }
	}
}