package com.fxptw.web;


import com.fxptw.dao.UserDao;
import com.fxptw.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "team")
public class TeamController {
	@Autowired
	UserDao userDao;


	//进入邀请关系网
	@RequestMapping(value = "/request")
	public String request(Model model,HttpServletRequest request) {
		User emp1 = (User) request.getSession().getAttribute("user");
		List<User> myReq = userDao.getDownUser(emp1.getId());//获取我直接邀请的列表
		List<User> r1s = new ArrayList<>();
		List<User> r2s = new ArrayList<>();
		List<User> r3s = new ArrayList<>();
		List<User> allusers = userDao.getAllUsers();

		for (int i=0;i<myReq.size();i++){
			User u = (User)myReq.get(i);
			int zs = userDao.getXjnum(u.getId());//我直接邀请的人数
			//int all = userDao.getAllXjnum(u.getId());//团队所有子节点用户之和
			int all = userDao.treeMenuList(allusers,u.getId()).size();//团队所有子节点用户之和
			int roleid = u.getRoleid();
			u.setXjnum(zs);
			u.setCount(all);
			if(roleid==1){
				r1s.add(u);
			}else if(roleid==2){
				r2s.add(u);
			}else if(roleid==3){
				r3s.add(u);
			}
		}


		List<User> allxjs = userDao.treeMenuList(allusers,emp1.getId());//获取所有子节点用户
		List<User> allxjs2 = new ArrayList<>();
		for (int i=0;i<allxjs.size();i++){
			User u = (User)allxjs.get(i);
			int zs = userDao.getXjnum(u.getId());//我直接邀请的人数
			int all = userDao.treeMenuList(allusers,u.getId()).size();//团队所有子节点用户之和
			int roleid = u.getRoleid();
			u.setXjnum(zs);
			u.setCount(all);
			allxjs2.add(u);
		}


		User sj = userDao.getUpUser(emp1.getId());
		User topu = userDao.getTopUser(emp1.getId());

		model.addAttribute("r1s",r1s);
		model.addAttribute("r1sn",r1s.size());
		model.addAttribute("r2s",r2s);
		model.addAttribute("r2sn",r2s.size());
		model.addAttribute("r3s",r3s);
		model.addAttribute("r3sn",r3s.size());
		model.addAttribute("myReqCount",myReq.size());//我直接邀请的人数
		model.addAttribute("myTeamCount",allxjs.size());//我团队邀请的人数
		model.addAttribute("allxjs",allxjs2);
		model.addAttribute("sj",sj);
		model.addAttribute("topu",topu);



		return "team/request";
	}






    //进入进货关系网
    @RequestMapping(value = "/buy")
    public String buy(Model model,HttpServletRequest request) {
        User emp1 = (User) request.getSession().getAttribute("user");
		List<User> allusers = userDao.getAllUsers();

        List<User> xjusers = userDao.treeMenuList1(allusers,emp1.getId());//所有进货 的下级

		List<User> xjusers2 = new ArrayList<>();
		for (int i=0;i<xjusers.size();i++){
			User uu = (User)xjusers.get(i);
			//System.out.println(u.getName()+"        "+userDao.getAllBuyXjnum(u.getId()));
			//uu.setXjnum(userDao.getDownBuyUsers(uu.getId()).size());//所有卖货的直属下级人数
			//uu.setCount(userDao.treeMenuList1(allusers,uu.getId()).size());//所有卖货的下级团队人数
			xjusers2.add(uu);
		}

        int xjnum = xjusers.size();

        List<User> zsusers = userDao.getDownBuyUsers(emp1.getId());//直属的下级
		List<User> zsusers2 = new ArrayList<>();
		for (int i=0;i<zsusers.size();i++){
			User u = (User)zsusers.get(i);
			//u.setXjnum(userDao.getDownBuyUsers(u.getId()).size());//所有卖货的直属下级人数
			//u.setCount(userDao.treeMenuList1(allusers,u.getId()).size());//所有卖货的下级团队人数
			zsusers2.add(u);
		}

        int zsnum = zsusers.size();

        model.addAttribute("xjnum",xjnum);
        model.addAttribute("xjusers",xjusers2);
        model.addAttribute("zsnum",zsnum);
        model.addAttribute("zsusers",zsusers2);

        return "team/buy";
    }






}
