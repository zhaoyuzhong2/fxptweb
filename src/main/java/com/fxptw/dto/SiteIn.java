package com.fxptw.dto;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 签到信息收集
 * @author hibernate_xc
 * @since 2019-03-03
 */
public class SiteIn extends BaseDTO implements Serializable {

    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

    //唯一标识
    private Integer uid;

    //用户唯一标识
    private String openId;

    //创建时间
    private Date createDate;

    //定位经纬度数据（未实现）
    private String site;

    //定位地址（未实现）
    private String siteAddress;

    //-----------用户信息----------
    //用户姓名
    private String name;

    //用户编号
    private Long id;

    //用户头像
    private String headPath;

    //身份证号
    private String idCard;

    //用户手机
    private String mobile;

    /**
     * @return 唯一标识
     */
    public Integer getUid() {
        return uid;
    }

    /**
     * @param uid 唯一标识
     */
    public void setUid(Integer uid) {
        this.uid = uid;
    }

    /**
     * @return 用户唯一标识
     */
    public String getOpenId() {
        return openId;
    }

    /**
     * @param openId 用户唯一标识
     */
    public void setOpenId(String openId) {
        this.openId = openId;
    }

    /**
     * @return 创建时间
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate 创建时间
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return 定位经纬度数据（未实现）
     */
    public String getSite() {
        return site;
    }

    /**
     * @param site 定位经纬度数据（未实现）
     */
    public void setSite(String site) {
        this.site = site;
    }

    /**
     * @return 定位地址（未实现）
     */
    public String getSiteAddress() {
        return siteAddress;
    }

    /**
     * @param siteAddress 定位地址（未实现）
     */
    public void setSiteAddress(String siteAddress) {
        this.siteAddress = siteAddress;
    }

    /**
     * @return 用户姓名
     */
    public String getName() {
        return name;
    }

    /**
     * @param name 用户姓名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return 用户编号
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id 用户编号
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return 用户头像
     */
    public String getHeadPath() {
        return headPath;
    }

    /**
     * @param headPath 头像信息
     */
    public void setHeadPath(String headPath) {
        this.headPath = headPath;
    }

    /**
     * @return 身份证号
     */
    public String getIdCard() {
        return idCard;
    }

    /**
     * @param idCard 身份证号
     */
    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    /**
     * @return 手机电话
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * @param mobile 手机电话
     */
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    /**
     * @return 签到时间
     */
    public String getCreateDateStr() {
        return this.sdf.format(this.createDate);
    }
}