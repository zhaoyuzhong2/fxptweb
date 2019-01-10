package com.fxptw.dao;


import com.fxptw.dao.base.BaseDao;
import com.fxptw.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by james on 2018/6/28.
 */
@Component
public class UserDao {
    @Autowired
    BaseDao baseDao;
    public int total = 0;

    //登录系统
    public User login(String mobile, String pwd){
        final String sql ="select * from t_user where mobile = ? and pwd = ? and flag='0'";
        List<User> emps = baseDao.query(sql,User.class,new Object[]{mobile,pwd});
        if(emps.size()>0){
            return emps.get(0);
        }else {
            return null;
        }

    }


    //获取下级销售情况
    public List<User> getDownUserBySail(int userid){
        String sql = "select a.*,(select sum(buynum) as sailnum from t_user_goods where userid=a.id and flag in ('2','3')) from t_user a where a.pid=?";
        return baseDao.query(sql,User.class,new Object[]{userid});
    }


    //获取下级列表
    public List<User> getDownUser(int userid){
        String sql = "select a.*,b.name as rolename from t_user a left join t_role b on a.roleid=b.id where a.pid=?";
        return baseDao.query(sql,User.class,new Object[]{userid});
    }


    //获取某个角色的下级列表
    public List<User> getDownUserRole(int userid,int roleid){
        String sql = "select a.*,(select count(*) from t_user where pid=a.id) as xjnum from t_user a where a.pid=? and a.roleid=?";
        return baseDao.query(sql,User.class,new Object[]{userid,roleid});
    }


    //获取某个用户的直属下级列表
    public List<User> getDownUsers(int userid){
        String sql = "select * from t_user where pid=?";
        return baseDao.query(sql,User.class,new Object[]{userid});
    }


    //获取某个用户的直属下级某个状态的列表
    public List<User> getDownUsersByFlag(int userid,String flag){
        String sql = "select a.*,b.name as rolename,c.mobile as pmobile,c.name as pname from t_user a left join t_role b on a.roleid=b.id left join t_user c on a.pid=c.id where a.pid=? and a.flag=?";
        return baseDao.query(sql,User.class,new Object[]{userid,flag});
    }


    //获取上级信息
    public User getUpUser(int userid){
        String sql = "select a.* from t_user a where a.id=(select b.pid from t_user b where b.id=?)";
        List<User> us =  baseDao.query(sql,User.class,new Object[]{userid});
        if(us.size()>0){
            return us.get(0);
        }else{
            return null;
        }
    }



    //获取某个用户下所有直属子用户的个数
    public int getXjnum(int userid){
        String sql = "select IFNULL(count(*),0) as xjnum from t_user where pid=?";
        return baseDao.queryForInt(sql,new Object[]{userid});

    }



    //获取某个用户下所有子用户的个数
    public int getAllXjnum(int userid){
        List<User> users = getDownUsers(userid);
        for(User user:users){
            int id = user.getId();
            total = total + getXjnum(id);
            getAllXjnum(id);
        }

        return total;

    }


    //获取某个用户下所有子用户,不限于直属是所有层级
    public List<User> getAllXjs(int userid){
        List<User> result = new ArrayList<>();
        List<User> users = getDownUser(userid);
        for(User user:users){
            int id = user.getId();
            result.add(user);
            getAllXjnum(id);
        }

        return result;

    }


    public int isExist(String mobile){
        String sql = "select * from t_user where mobile=?";
        List<User> us = baseDao.query(sql,User.class,new Object[]{mobile});
        if(us.size()>0){
            return 1;
        }else {
            return 0;
        }
    }



    public User getUserById(int id){
        String sql = "select a.*,b.name as rolename from t_user a left join t_role b on a.roleid=b.id where a.id=?";
        List<User> us = baseDao.query(sql,User.class,new Object[]{id});
        if(us.size()>0){
            return us.get(0);
        }else {
            return null;
        }
    }


    public int insUser(User user){

        String sql = "insert into t_user(name,roleid,pid,mobile,chatno,sex,pwd,birthday,idcard,area,cdate,flag) values(:name,:roleid,:pid,:mobile,:chatno,:sex,:pwd,:birthday,:idcard,:area,now(),'0')";
        return baseDao.insert2(user);
    }


    public double getShouru(int userid,String flag){
        String sql = "select IFNULL(sum(totalp),0) from t_user_income where userid=? ";
        if(flag!=null && !flag.equals("")){
            sql = sql + " and flag='"+flag+"'";
        }
        return baseDao.queryForObject(sql,Double.class,new Object[]{userid});
    }



    public double getByShouru(int userid,String yearm){
        String sql = "select IFNULL(sum(totalp),0) from t_user_income where userid=? and yearm=?";
        return baseDao.queryForObject(sql,Double.class,new Object[]{userid,yearm});
    }



}
