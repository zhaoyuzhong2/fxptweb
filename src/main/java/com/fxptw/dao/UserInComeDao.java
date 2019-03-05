package com.fxptw.dao;

import com.fxptw.dao.base.BaseDao;
import com.fxptw.dto.UserInCome;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
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
     * @param userId 用户id
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

    /**
     * 我的收入、如传入数组则代表累计金额
     * @param yearMonth 执行年月
     * @param userIds 用户id数组
     * @return 统计用户金额
     */
    public BigDecimal sumMoney(String yearMonth, String userIds){
        String sql = "SELECT\n" +
                "\tSUM(ic.money) AS TotalMoney\n" +
                "FROM\n" +
                "\tt_user_income ic\n" +
                "WHERE  1 =1 \n";
                if(!StringUtils.isEmpty(yearMonth)) {
                    sql += "\t AND ic.yearm = '" + yearMonth + "'\n";
                }
                sql += " AND ic.userid IN ("+userIds+")";
        return baseDao.queryForObject(sql,BigDecimal.class,null);
    }

    /**
     * 我的收入、如传入数组则代表奖励金额
     * @param yearMonth 执行年月
     * @param userIds 用户id数组
     * @return 奖励金额
     */
    public BigDecimal sumReward(String yearMonth, String userIds){
        String sql = "SELECT\n" +
                "\tSUM(ic.reward) AS TotalMoney\n" +
                "FROM\n" +
                "\tt_user_income ic\n" +
                "WHERE 1 =1 \n";
        if(!StringUtils.isEmpty(yearMonth)) {
            sql += "\t AND ic.yearm = '" + yearMonth + "'\n";
        }
        sql += " AND ic.userid  IN ("+userIds+")";
        return baseDao.queryForObject(sql,BigDecimal.class,null);
    }


    //获得某个人总收入
    public Double getMoneyByUserid(int userid){
        String sql = "SELECT SUM(money) AS TotalMoney FROM t_user_income WHERE userid=?";

        return baseDao.queryForObject(sql,Double.class,new Object[]{userid});
    }

    //获得某个人最近3个月的个人收入
    public double getMoneyBy3Month(int userid){
        String sql = "SELECT IFNULL(SUM(money),0) FROM t_user_income WHERE userid=? AND cdate>DATE_SUB(NOW(), INTERVAL 3 MONTH)";
        return baseDao.queryForObject(sql,Double.class,new Object[]{userid});
    }


    //获得某个人某个月收入
    public Double getMoneyByUseridYearm(int userid,String yearm){
        String sql = "SELECT SUM(money) AS TotalMoney FROM t_user_income WHERE userid=? and yearm=?";

        return baseDao.queryForObject(sql,Double.class,new Object[]{userid,yearm});
    }


    //获得某个人总奖励
    public Double getRewardByUserid(int userid){
        String sql = "SELECT SUM(reward) AS TotalMoney FROM t_user_income WHERE userid=?";

        return baseDao.queryForObject(sql,Double.class,new Object[]{userid});
    }


    //获得某个人某个月的奖励
    public Double getRewardByUseridYearm(int userid,String yearm){
        String sql = "SELECT SUM(reward) AS TotalMoney FROM t_user_income WHERE userid=? and yearm=?";

        return baseDao.queryForObject(sql,Double.class,new Object[]{userid,yearm});
    }


}