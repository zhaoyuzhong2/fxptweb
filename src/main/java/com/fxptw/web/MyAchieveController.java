package com.fxptw.web;

import com.fxptw.dao.UserDao;
import com.fxptw.dao.UserGoodsDao;
import com.fxptw.dao.UserInComeDao;
import com.fxptw.dto.User;
import com.fxptw.dto.UserInCome;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/myach")
public class MyAchieveController {

    @Autowired
    private UserInComeDao userInComeDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserGoodsDao userGoodsDao;

    /**
     * 根据用户名称获取
     * @param request 请求对象
     * @return 请求结果
     */
    @RequestMapping("/index")
    public String getMyAchievements(HttpServletRequest request) {
        User emp1 = (User) request.getSession().getAttribute("user");
        int userId = emp1.getId();
        UserInCome userInCome = userInComeDao.getUserInCome(userId);
        if(userInCome!=null){
            request.setAttribute("myAchievements", userInCome.getTotalp());
        }else{
            request.setAttribute("myAchievements", 0);
        }
        int subUserSum = userDao.getAllXjnum(userId);
        //获取子用户数量统计
        request.setAttribute("subUserSum", subUserSum);
        double shouru = userDao.getShouru(userId,"1");
        request.setAttribute("shouru",shouru);
        String yearMonth = new SimpleDateFormat("yyyy-MM").format(new Date());
        double byShouru = userDao.getByShouru(userId, yearMonth);
        request.setAttribute("byShouru",byShouru);
        request.setAttribute("yearMonth", yearMonth);
        Integer xjnum = userDao.getXjnum(userId);
        request.setAttribute("xjnum", xjnum);
        request.setAttribute("month", new SimpleDateFormat("MM").format(new Date()));
        Integer allXjnum = userDao.getAllXjnum(userId);
        request.setAttribute("allXjnum", allXjnum);
        List<User> userList = userDao.inviteUsers(userId);
        userGoodsDao.queryUsersByGoodsNum(userList);
        List<User> users = new ArrayList<>(1);
        users.add(emp1);
        String userIds = userGoodsDao.usersByIds(users);
        BigDecimal money = userInComeDao.sumMoney(yearMonth, userIds);
        request.setAttribute("MyMoney", money);
        System.out.println("Moeny:"+money);
        return "MyAchievements/SalesPerEmployee";
    }
}