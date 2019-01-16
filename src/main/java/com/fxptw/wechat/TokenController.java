package com.fxptw.wechat;


import com.fxptw.dao.UserDao;
import com.fxptw.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Enumeration;

@Controller
@RequestMapping(value = "token")
public class TokenController {

	private static String token = "zhaoyuzhong";
	//进入邀请关系网
	@RequestMapping(value = "/index")
	public void request(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Enumeration pNames = request.getParameterNames();
		System.out.println("     请求微信token来了.........");
		while (pNames.hasMoreElements()) {
			String name = (String) pNames.nextElement();
			String value = request.getParameter(name);
			// out.print(name + "=" + value);

			String log = "name =" + name + "     value =" + value;
		}

		PrintWriter out = response.getWriter();

		out.print(token);

		out.close();
		out = null;


	}








}
