package com.fxptw.web;


import com.fxptw.dao.SiteInDao;
import com.fxptw.dto.SiteIn;
import com.fxptw.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/site")
public class SiteInController {

    @Autowired
    SiteInDao siteInDao;


    //签到
    @ResponseBody
    @RequestMapping("/in")
    public String siteInData(HttpServletRequest request){
        User emp1 = (User) request.getSession().getAttribute("user");
        SiteIn si = new SiteIn();
        si.setName(emp1.getName());
        si.setMobile(emp1.getMobile());
        si.setIdCard(emp1.getIdcard());

        si.setOpenId(emp1.getOpenid());

        int flag = siteInDao.insertSiteIn(si);
        if(flag>0){
            return "ok";
        }else{
            return "nook";
        }
    }
}