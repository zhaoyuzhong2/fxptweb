package com.fxptw.web;


import com.fxptw.dao.*;
import com.fxptw.dto.Goods;
import com.fxptw.dto.Role;
import com.fxptw.dto.UpGrade;
import com.fxptw.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "upgrade")
public class UpGradeController {

	@Autowired
	UserGoodsDao userGoodsDao;
	@Autowired
	UserDao userDao;
	@Autowired
	RoleDao roleDao;

    @Autowired
    UpGradeDao upGradeDao;


	//跳往升级处理  首页
	@RequestMapping(value = "/index")
	public String index(Model model, HttpServletRequest request) {
		User emp1 = (User) request.getSession().getAttribute("user");
		int userid = emp1.getId();
		User user = userDao.getUserById(userid);//重新获取用户是担心用户角色有变化
		int roleid = user.getRoleid();
		List<Role> rs = roleDao.getUpRoles(roleid);

        model.addAttribute("roleid",roleid);
		model.addAttribute("rs",rs);
		model.addAttribute("user",user);
		return "upgrade/index";
	}



    //跳往升级记录页
    @RequestMapping(value = "/record")
    public String record() {
        return "upgrade/record";
    }


    @ResponseBody
    @RequestMapping(value = "/goup")
    public String goup(int roleid,HttpServletRequest request) {
        User emp1 = (User) request.getSession().getAttribute("user");
        int userid = emp1.getId();
        User user = userDao.getUserById(userid);//重新获取用户是担心用户角色有变化
        int roleidzx = user.getRoleid();

        String result = "nook";
        UpGrade ug = new UpGrade();
        ug.setRoleid(roleidzx);
        ug.setUserid(userid);
        ug.setUproleid(roleid);

        int flag = upGradeDao.addUpGrade(ug);
        if(flag>0){
            result = "ok";
        }
        return result;


    }



}
