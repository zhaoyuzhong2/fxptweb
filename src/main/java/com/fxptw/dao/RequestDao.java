package com.fxptw.dao;


import com.fxptw.dao.base.BaseDao;
import com.fxptw.dto.Request;
import com.fxptw.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by james on 2018/6/28.
 */
@Component
public class RequestDao {
    @Autowired
    BaseDao baseDao;
    public int total = 0;



    //获取邀请信息
    public Request getRequestById(int id){
        String sql = "select * from t_request where id=?";
        List<Request> rs = baseDao.query(sql,Request.class,new Object[]{id});
        if(rs.size()>0){
            return rs.get(0);
        }else {
            return null;
        }

    }





}
