package com.fxptw.dao;

import com.fxptw.dao.base.BaseDao;
import com.fxptw.dto.UserInCome;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Hibernate_XC on 2019/01/08.
 */
@Component
public class UserInComeDao {

    @Autowired
    BaseDao baseDao;
    public int total = 0;

    /**
     * 根据用户id获取当月统计数量
     * @param userId
     * @return 统计结构内容
     */
    public UserInCome getUserInCome(Integer userId){
        String sql = "SELECT\n" +
                "\t*\n" +
                "FROM\n" +
                "\tt_user_income\n" +
                "WHERE\n" +
                "\tuserid =?\n" +
                "AND cdate > DATE_ADD(curdate(),interval -day(curdate())+1 day) AND cdate < last_day(curdate())\n" +
                "AND flag = '1';";
        List<UserInCome> gs = baseDao.query(sql,UserInCome.class,new Object[]{userId});
        if(gs.size()>0){
            return gs.get(0);
        }else {
            return null;
        }
    }
}
