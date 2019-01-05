package com.fxptw.dao;


import com.fxptw.dao.base.BaseDao;
import com.fxptw.dto.Goods;
import com.fxptw.dto.Stock;
import com.fxptw.dto.UserGoods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by james on 2018/10/8.
 */
@Component
public class StockDao {
    @Autowired
    BaseDao baseDao;


    //查询用户的云库存购买提取明细
    public List<Stock> getList(int userid) {
        String sql = "select * from t_stock where userid=? order by cdate desc";
        return baseDao.query(sql,Stock.class,new Object[]{userid});
    }


    //添加库存包括购买和提取
    public int addStock(Stock ug) {
        String sql = "insert into t_user_goods(userid,username,mobile,roleid,goodid,goodname,buyprice,buynum,totalprice,postadd,postname,postmobile,message,cdate,flag) values(:userid,:username,:mobile,:roleid,:goodid,:goodname,:buyprice,:buynum,:totalprice,:postadd,:postname,:postmobile,:message,now(),'0')";
        return baseDao.insert2(ug);
    }

    //查询所有商品库存量
    public List<Goods> getStockByUserid(int userid) {
        String sql = "SELECT goodid as id,goodname as name,SUM(num) AS stock,TYPE FROM t_stock WHERE userid=? GROUP BY goodname";
        return baseDao.query(sql,Goods.class,new Object[]{userid});
    }



}
