package com.fxptw.web;

import com.fxptw.dao.UserDao;
import com.fxptw.dao.UserInComeDao;
import com.fxptw.dto.User;
import com.fxptw.dto.UserInCome;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping(value = "/userInCome")
public class UserInComeController {

    @Autowired
    private UserInComeDao userInComeDao;

    @Autowired
    private UserDao userDao;

    /**
     * 根据用户名称获取
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/myAchievements")
    public String getMyAchievements(Model model, HttpServletRequest request) {
        User emp1 = (User) request.getSession().getAttribute("user");
        int userId = emp1.getId();
        UserInCome userInCome = userInComeDao.getUserInCome(userId);
        if(userInCome!=null){
            model.addAttribute("myAchievements", userInCome.getTotalp());
        }else{
            model.addAttribute("myAchievements", 0);
        }
        int subUserSum = userDao.getAllXjnum(userId);
        //获取子用户数量统计
        model.addAttribute("subUserSum", subUserSum);
        double shouru = userDao.getShouru(userId,"1");
        model.addAttribute("shouru",shouru);
        String yearMonth = new SimpleDateFormat("yyyy-MM").format(new Date());
        double byShouru = userDao.getByShouru(userId, yearMonth);
        model.addAttribute("byShouru",byShouru);
        model.addAttribute("yearMonth", yearMonth);
        return "/MyAchievements/SalesPerEmployee";
    }
}