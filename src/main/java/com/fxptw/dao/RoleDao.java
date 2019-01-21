package com.fxptw.dao;


import com.fxptw.dao.base.BaseDao;
import com.fxptw.dto.Role;
import com.fxptw.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by james on 2018/6/28.
 */
@Component
public class RoleDao {
    @Autowired
    BaseDao baseDao;


    //获取所有显示的角色
    public List<Role> getRoles(){
        String sql = "select * from t_role order by id asc";
        return baseDao.query(sql,Role.class,new Object[]{});
    }


    //查询可升级的角色信息
    public List<Role> getUpRoles(int roleid){
        String sql = "select * from t_role where id>? order by id asc";
        return baseDao.query(sql,Role.class,new Object[]{roleid});
    }



    //获取邀请所属的角色列表
    public List<Role> getRolesByReq(String roles){
        String sql = "select * from t_role where id in ("+roles+")";
        return baseDao.query(sql,Role.class,new Object[]{});
    }


    //根据角色id获取角色
    public Role getRoleById(int roleid){
        String sql = "select * from t_role where id =?";
        List<Role> rs = baseDao.query(sql,Role.class,new Object[]{roleid});
        if(rs.size()>0){
            return rs.get(0);
        }else{
            return null;
        }
    }




}
