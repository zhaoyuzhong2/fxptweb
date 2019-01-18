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


    //添加库存包括购买
    public int addStock(Stock ug) {
        String sql = "insert into t_stock(userid,username,mobile,goodid,goodname,price,buynum,buyprice,postadd,postname,postmobile,message,cdate,flag,type) values(:userid,:username,:mobile,:goodid,:goodname,:price,:buynum,:buyprice,:postadd,:postname,:postmobile,:message,now(),'1',:type)";
        return baseDao.insert(sql,ug);
    }



    //添加库存  提取
    public int addStock2(Stock ug) {
        String sql = "insert into t_stock(userid,username,mobile,goodid,goodname,price,buynum,buyprice,postadd,postname,postmobile,message,cdate,flag,type) values(:userid,:username,:mobile,:goodid,:goodname,:price,:buynum,:buyprice,:postadd,:postname,:postmobile,:message,now(),'3',:type)";
        return baseDao.insert(sql,ug);
    }



    //查询所有商品库存量
    public List<Goods> getStockByUserid(int userid) {
        String sql = "SELECT goodid as id,goodname as name,SUM(num) AS stock,TYPE FROM t_stock WHERE userid=? GROUP BY goodname";
        return baseDao.query(sql,Goods.class,new Object[]{userid});
    }



    //查询某个人所有的出货量或者购买量
    public int getTotal(int userid,String flag) {
        String sql = "SELECT IFNULL(SUM(buynum),0) AS num FROM t_stock WHERE userid=? and flag=? ";
        return baseDao.queryForInt(sql,new Object[]{userid,flag});
    }



}
