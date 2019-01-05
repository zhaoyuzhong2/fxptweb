package com.fxptw.dao;


import com.fxptw.dao.base.BaseDao;
import com.fxptw.dto.Goods;
import com.fxptw.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by james on 2018/10/8.
 */
@Component
public class GoodsDao {
    @Autowired
    BaseDao baseDao;


    //获取商品列表
    public List<Goods> getList() {
        String sql = "select * from t_goods where flag='0' order by cdate desc ";
        return baseDao.query(sql,Goods.class,new Object[]{});
    }


    //获取购物车商品列表，查询出num是几
    public List<Goods> getGoodsList(int userid) {
        String sql = "select a.*,(select buynum from t_user_goods where userid=? and flag='0' and goodid=a.id) from t_goods a where a.flag='0' order by a.cdate desc ";
        return baseDao.query(sql,Goods.class,new Object[]{userid});
    }



    //根据商品id获取商品详情
    public Goods getGoodsByid(int id){
        String sql ="select * from t_goods where id=?";
        List<Goods> gs = baseDao.query(sql,Goods.class,new Object[]{id});
        if(gs.size()>0){
            return gs.get(0);
        }else {
            return null;
        }
    }

}
