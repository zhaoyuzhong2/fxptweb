package com.fxptw.dao;


import com.fxptw.dao.base.BaseDao;
import com.fxptw.dto.Material;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by wcw on 2018/12/29.
 */
@Component
public class MaterialDao {
    @Autowired
    BaseDao baseDao;

    public Material selectMaterialById(Integer id) {
        String sql = "select * from t_material where id=? ";
        return baseDao.queryById(sql,Material.class,new Object[]{id});
    }


    //根据素材类型查询素材列表
    public List<Material> selectMaterialByTypeId(Integer typeid) {
        String sql = "select * from t_material where typeid=? order by cdate desc";
        return baseDao.query(sql,Material.class,new Object[]{typeid});
    }


    //根据素材类型和搜索条件查询素材列表
    public List<Material> selectMaterialByTypeIdName(Integer typeid,String name) {
        if(name!=null && !name.equals("")) {
            String sql = "select * from t_material where typeid=? and name like ? order by cdate desc";
            return baseDao.query(sql, Material.class, new Object[]{typeid,"%"+name+"%"});
        }else{
            String sql = "select * from t_material where typeid=? order by cdate desc";
            return baseDao.query(sql,Material.class,new Object[]{typeid});
        }
    }

    //查询某个类型的素材前几条
    public List<Material> selectLimitMaterialByTypeId(Integer typeid,int num) {
        String sql = "select * from t_material where typeid=? order by cdate desc limit "+num;
        return baseDao.query(sql,Material.class,new Object[]{typeid});
    }




}
