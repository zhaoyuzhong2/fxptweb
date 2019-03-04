package com.fxptw.dao;

import com.fxptw.dao.base.BaseDao;
import com.fxptw.dto.BaseDTO;
import com.fxptw.dto.SiteIn;
import com.fxptw.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SiteInDao {

    @Autowired
    BaseDao baseDao;

    /**
     * 存储签到信息数据
     * @param siteIn 签到对象
     */
    public void insertSiteIn(SiteIn siteIn){
        StringBuffer sqlBuffer = new StringBuffer("INSERT INTO t_site_in(openId,site,site_address)");
        sqlBuffer.append(" VALUES('").append(siteIn.getOpenId()).append("','").append(siteIn.getSite());
        sqlBuffer.append("','").append(siteIn.getSiteAddress()).append("')");
        baseDao.insert(sqlBuffer.toString(), siteIn);
    }

    /**
     * 分页查询签到信息表
     * @param pageSize 页大小
     * @param count 总记录数量
     * @param <T> 查询类型为签到信息
     * @return 签到信息列表
     */
    public <T extends BaseDTO> Page<SiteIn> querySiteIn(Integer pageSize, Integer count){
        StringBuffer sqlBuffer = new StringBuffer("SELECT\n\tu.`name`,\n\tu.id,\n\tu.headpath,\n\tu.idcard,\n");
        sqlBuffer.append("\tu.mobile,\n\ttsi.create_date\nFROM\n\tt_user u\n INNER JOIN t_site_in tsi ");
        sqlBuffer.append("ON u.openid = tsi.openId");
        return baseDao.queryByPage(sqlBuffer.toString(), SiteIn.class,null,pageSize,count);
    }
}
