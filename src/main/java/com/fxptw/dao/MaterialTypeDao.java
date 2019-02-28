package com.fxptw.dao;


import com.fxptw.dao.base.BaseDao;
import com.fxptw.dto.MaterialType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by wcw on 2018/12/29.
 */
@Component
public class MaterialTypeDao {
    @Autowired
    BaseDao baseDao;

    public List<MaterialType> getMaterialTypes() {
        String sql = "select * from t_material_type where flag='0' ";
        return baseDao.query(sql,MaterialType.class,new Object[]{});
    }




}
