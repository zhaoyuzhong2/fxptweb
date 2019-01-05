package com.fxptw.dao;


import com.fxptw.dao.base.BaseDao;
import com.fxptw.dto.Goods;
import com.fxptw.dto.Vericode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by james on 2018/10/8.
 */
@Component
public class VericodeDao {
    @Autowired
    BaseDao baseDao;


    //判断验证码是否输入正确
    public int getYzmExist(String mobile,String code) {
        String sql = "select * from t_vericode where mobile=? and code=?";
        List<Vericode> vs = baseDao.query(sql,Vericode.class,new Object[]{mobile,code});
        if(vs.size()>0){
            return 1;
        }else{
            return 0;
        }
    }



}
