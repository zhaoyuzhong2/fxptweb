package com.fxptw.dao;


import com.fxptw.dao.base.BaseDao;
import com.fxptw.dto.Goods;
import com.fxptw.dto.User;
import com.fxptw.dto.UserGoods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by james on 2018/10/8.
 */
@Component
public class UserGoodsDao {
    @Autowired
    BaseDao baseDao;


    //查询不同状态的购买物品数量
    public List<UserGoods> getList(int userid,String flag,String search_name) {
        String sql = "select * from t_user_goods where flag=? and userid=?  ";
        List<String> arr = new ArrayList<>();
        arr.add(flag);
        arr.add(userid+"");
        if(search_name!=null && !search_name.equals("")){
            sql = sql + " and (username like ? or goodname like ? or mobile like ?) ";
            arr.add("%"+search_name+"%");
            arr.add("%"+search_name+"%");
            arr.add("%"+search_name+"%");
        }
        sql = sql + " order by cdate desc";
        return baseDao.query(sql,UserGoods.class,arr.toArray());
    }


    //添加购物车货品数量
    public int addUserGoods(UserGoods ug) {
        String sql = "insert into t_user_goods(userid,username,mobile,roleid,goodid,goodname,buyprice,buynum," +
                "totalprice,postadd,postname,postmobile,message,cdate,flag) values(:userid,:username,:mobile,:roleid," +
                ":goodid,:goodname,:buyprice,:buynum,:totalprice,:postadd,:postname,:postmobile,:message,now(),'0')";
        return baseDao.insert(sql,ug);
    }

    //更改购物车的货品数量
    public int updateUserGoodsNum(int userid,int goodid,int num) {
        String sql = "update t_user_goods set buynum=?,totalprice=buyprice*? where userid=? and goodid=? and flag='0'";
        return baseDao.update2(sql,new Object[]{num,num,userid,goodid});
    }


    //查看自己的购物车商品购买数量
    public int getMyGoodNum(int userid,int goodid) {
        String sql = "select * from t_user_goods where userid=? and goodid=? and flag='0'";
        List<UserGoods> gs = baseDao.query(sql,UserGoods.class,new Object[]{userid,goodid});
        if(gs!=null && gs.size()>0){
            return gs.get(0).getBuynum();
        }else {
            return 0;
        }
    }



    //查看自己的购物车所有商品购买数量之和
    public int getMyGoodsNum(int userid) {
        String sql = "select sum(buynum) as total from t_user_goods where userid=? and flag='0'";
        int total = baseDao.queryForInt(sql,new Object[]{userid});
        return total;
    }


    //查看自己的购物车所有商品购买总价
    public String getMyGoodsPrice(int userid) {
        String sql = "select sum(totalprice) as total from t_user_goods where userid=? and flag='0'";
        String total = baseDao.queryForObject(sql,String.class,new Object[]{userid});
        return total;
    }



    //根据用户id和商品id，查询是否有存进货车
    public UserGoods getMyGoods(int userid,int goodid) {
        String sql = "select * from t_user_goods where userid=? and goodid=? and flag='0'";
        List<UserGoods> gs = baseDao.query(sql,UserGoods.class,new Object[]{userid,goodid});
        if(gs.size()>0){
            return gs.get(0);
        }else {
            return null;
        }
    }



    //根据主键查询购货
    public UserGoods getUserGoodsById(int id) {
        String sql = "select * from t_user_goods where id=?";
        List<UserGoods> gs = baseDao.query(sql,UserGoods.class,new Object[]{id});
        if(gs.size()>0){
            return gs.get(0);
        }else {
            return null;
        }
    }



    //查询不同状态的购买物品数量
    public List<UserGoods> getShopingList(int userid,String flag) {
        String sql = "select * from t_user_goods where flag=? and userid=?  order by cdate desc ";

        return baseDao.query(sql,UserGoods.class,new Object[]{flag,userid});
    }



    //更改某个商品的状态
    public int updateUgFlag(int id,String postname,String postmobile,String postadd,String message,String code) {
        String sql = "update t_user_goods set flag='1',postname=?,postmobile=?,postadd=?,message=?,code=? where id=?";
        return baseDao.update2(sql,new Object[]{postname,postmobile,postadd,message,code,id});
    }


    //查询以往自己销售的用户地址
    public UserGoods getMyPostAdd(int userid,String postname) {
        String sql = "select * from t_user_goods where userid=? and postname=? and flag!='0'";

        List<UserGoods> ugs = baseDao.query(sql,UserGoods.class,new Object[]{userid,postname});
        if(ugs.size()>0){
            return ugs.get(0);
        }else{
            return null;
        }
    }



    //王春伟添加的方法
    //查询出所有的订单号
    public List<UserGoods> getCodeByUserid(Integer userid,String search_name) {
        String sql = "select code From t_user_goods where flag!=9 and userid=? and (code like ? or postmobile like ? or postname like ?) group by code";
        return baseDao.query(sql,UserGoods.class,new Object[]{userid,"%"+search_name+"%","%"+search_name+"%","%"+search_name+"%"});
    }
    //查询出所有的订单号
    public List<UserGoods> getCodeByUseridByFlag(Integer userid,String flag,String search_name) {
        String sql = "select code From t_user_goods where flag=? and userid=? and (code like ? or postmobile like ? or postname like ?) group by code";
        return baseDao.query(sql,UserGoods.class,new Object[]{flag,userid,"%"+search_name+"%","%"+search_name+"%","%"+search_name+"%"});
    }

    //根据订单号查询订单
    public List<UserGoods> selectGoodsByCode(String code) {
        String sql="SELECT tug.*,tgf.imgfile FROM t_user_goods  tug LEFT JOIN t_goods tgf ON tug.goodid=tgf.id" ;
        sql = sql +  " WHERE tug.flag!='9'  AND tug.code=? ";
        return baseDao.query(sql,UserGoods.class,new Object[]{code});
    }
    //根据订单号查询订单
    public List<UserGoods> selectGoodsByCodeAndFlag(String flag,String code) {
        String sql="SELECT tug.*,tgf.imgfile FROM t_user_goods  tug\n" +
                "LEFT JOIN t_goods tgf ON tug.goodid=tgf.id\n" +
                "WHERE tug.flag=? \n" +
                "AND tug.code=?";
        return baseDao.query(sql,UserGoods.class,new Object[]{flag,code});
    }




    //获取订货数量（是传入人数类型而定）
    public Integer queryUsersByGoodsNum(List<User> users){
        String ids = this.usersByIds(users);
        if(ids == null)
            return null;
        String sql = "SELECT COUNT(1) AS totalPersons FROM t_user_goods WHERE userid IN (" +
                ids + ") AND flag IN ('1','2','3')";
        int total = baseDao.queryForInt(sql,null);
        return total;
    }

    //计算用户列表内的消费总金额
    public BigDecimal queryUsersByGoodsMoney(List<User> users){
        String ids = this.usersByIds(users);
        if(ids == null)
            return null;
        String sql = "SELECT SUM(money) AS totalUserMoney FROM t_user_income WHERE userid IN (" +
                ids + ") AND flag IN ('1','2','3')";
        BigDecimal total = baseDao.queryForObject(sql,BigDecimal.class,null);
        return total;
    }

    public String usersByIds(List<User> users){
        if(users == null)
            return null;
        StringBuffer ids = new StringBuffer();
        for (int i = 0; i < users.size(); i++){
            ids.append("'").append(users.get(i).getId()).append("',");
        }
        if(users.isEmpty()){
            return "''";
        }
        return ids.substring(0,ids.length() - 1);
    }
}
