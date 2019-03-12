package com.fxptw.web;


import com.fxptw.dao.UserDao;
import com.fxptw.dto.User;
import com.fxptw.util.ImageTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "cert")
public class CertController {
	@Autowired
	UserDao userDao;


	//审核代理页面
	@RequestMapping(value = "/index")
	public String index(Model model,HttpServletRequest request) {
		if(request.getSession().getAttribute("user")==null){
			return "login/login";
		}else {
			User emp1 = (User) request.getSession().getAttribute("user");
			ImageTest it = new ImageTest();
			String mobanPath = request.getRealPath("")+"/img/zhengshu.jpg";//证书模板路径
			File moban = new File(mobanPath);
			String newFile = "D://fxpt_upload//zs//"+emp1.getMobile()+".jpg";//生成证书路径
			String code = emp1.getCode();
			if(code==null || code.equals("")){
				code = "JKY"+new Date().getTime();
			}
			String rolename = emp1.getRolename();
			String name = emp1.getName();
			String wechat = emp1.getChatno();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String cdate = sdf.format(emp1.getCdate());
			String yxq = (Integer.parseInt(cdate.substring(0,4))+1)+cdate.substring(4,10);//有效期年数+1
			File f = new File(newFile);
			String filename = emp1.getMobile()+".jpg";
			if(!f.exists()) {
				//图片不存在，需要生成证书图片
				it.createZhengshu(moban,newFile,code,rolename,name,wechat,emp1.getMobile(),emp1.getIdcard(),yxq,"久康元" );

			}
			model.addAttribute("filename",filename);
			return "cert/index";
		}
	}






}
