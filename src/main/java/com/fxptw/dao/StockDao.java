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

    //查询所有库存不为零的商品
    public List<Stock> getStockByUseridauwcw(int userid) {
        String sql = "SELECT ts.*,SUM(ts.buynum) AS stock,DATE_FORMAT(ts.cdate,'%Y-%m-%d %H:%i:%s') as ccdate,tg.imgfile as imgfile FROM t_stock ts\n" +
                "LEFT JOIN (SELECT * FROM t_goods_file WHERE flag=0) tg ON tg.goodid=ts.userid\n" +
                " WHERE(ts.flag=2 OR ts.flag=4) AND ts.userid=? GROUP BY ts.goodid  HAVING SUM( ts.buynum)>0 ";
        return baseDao.query(sql,Stock.class,new Object[]{userid});
    }

    //根据flag查询集合
    public List<Stock> getStockListByFlag(String flag,int userid,String search_name ) {
        String sql = "SELECT ts.*,SUM(ts.buynum) AS stock,DATE_FORMAT(ts.cdate,'%Y-%m-%d %H:%i:%s') as ccdate,tg.imgfile AS imgfile FROM t_stock ts\n" +
                "LEFT JOIN (SELECT * FROM t_goods_file WHERE flag=0) tg ON tg.goodid=ts.userid\n" +
                " WHERE ts.flag=?  AND ts.userid=?  and (username=? or  goodname like ? or mobile like ? or postname like ? or postname like ?) GROUP BY ts.goodid   ";
        return baseDao.query(sql,Stock.class,new Object[]{flag,userid,"%"+search_name+"%","%"+search_name+"%","%"+search_name+"%","%"+search_name+"%","%"+search_name+"%"});
    }

    //根据flag查询集合
    public List<Stock> getStock(int userid,String search_name ) {
        String sql = "SELECT ts.*,SUM(ts.buynum) AS stock,DATE_FORMAT(ts.cdate,'%Y-%m-%d %H:%i:%s') as ccdate,tg.imgfile AS imgfile FROM t_stock ts\n" +
                "LEFT JOIN (SELECT * FROM t_goods_file WHERE flag=0) tg ON tg.goodid=ts.userid\n" +
                " WHERE  ts.flag in('3','4') and ts.userid=?  and (username=? or goodname like ? or mobile like ? or postname like ? or postname like ?) GROUP BY ts.goodid   ";
        return baseDao.query(sql,Stock.class,new Object[]{userid,"%"+search_name+"%","%"+search_name+"%","%"+search_name+"%","%"+search_name+"%","%"+search_name+"%"});
    }

}
