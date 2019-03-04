package com.fxptw.web;


import com.fxptw.dao.MaterialDao;
import com.fxptw.dao.MaterialTypeDao;
import com.fxptw.dao.UserDao;
import com.fxptw.dto.Material;
import com.fxptw.dto.MaterialType;
import com.fxptw.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "message")
public class MessageController {
	@Autowired
	UserDao userDao;
	@Autowired
	MaterialDao materialDao;
	@Autowired
	MaterialTypeDao materialTypeDao;


	//消息首页
	@RequestMapping(value = "/index")
	public String index() {
		return "message/index";
	}


	@RequestMapping(value = "/sys")
	public String sys() {
		return "message/sys";
	}


	@RequestMapping(value = "/proxy")
	public String proxy() {
		return "message/proxy";
	}


	@RequestMapping(value = "/material")
	public String material(Model model,String name) {
		List<MaterialType> mts = materialTypeDao.getMaterialTypes();
		model.addAttribute("mts",mts);
		for(int i=0;i<mts.size();i++){
			MaterialType mt = mts.get(i-1);
			List<Material> ms = materialDao.selectLimitMaterialByTypeId(mt.getId(),9);//取某个素材的前9条

			model.addAttribute("ms"+i,ms);
		}

		return "message/material";
	}


	@RequestMapping(value = "/notice")
	public String notice() {
		return "message/notice";
	}





}
