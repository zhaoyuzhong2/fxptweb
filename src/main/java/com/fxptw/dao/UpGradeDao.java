package com.fxptw.dao;


import com.fxptw.dao.base.BaseDao;
import com.fxptw.dto.Goods;
import com.fxptw.dto.Stock;
import com.fxptw.dto.UpGrade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by james on 2018/10/8.
 */
@Component
public class UpGradeDao {
    @Autowired
    BaseDao baseDao;



    //添加库存包括购买
    public int addUpGrade(UpGrade ug) {
        String sql = "insert into t_upgrade(userid,roleid,uproleid,cdate,flag) values(:userid,:roleid,:uproleid,now(),'0')";
        return baseDao.insert(sql,ug);
    }



    public List<UpGrade> getUpGrade(String flag) {
        String sql = "SELECT * from t_upgrade where flag=? order by cdate desc";
        return baseDao.query(sql,UpGrade.class,new Object[]{flag});
    }




    public int updUpGrade(int id,String flag) {
        String sql = "update t_upgrade set flag=? where id=? ";
        return baseDao.update2(sql,new Object[]{flag,id});
    }



}
