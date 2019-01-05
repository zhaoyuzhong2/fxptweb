package com.fxptw.dto;

import java.util.Date;

/**
 * Created by Administrator on 2018/12/25/025.
 */
public class Stock extends BaseDTO {
    private Integer id;
    private Integer userid;
    private Integer goodid;
    private String username;
    private String goodname;
    private String type;//0是购买，1是提取
    private Integer buynum;//购买数量
    private double price;//商品单价
    private double buyprice;//购买总价
    private Date cdate;//购买或者提取时间
    private String postadd;
    private String postname;
    private String postmobile;
    private String message;
    private String flag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getGoodid() {
        return goodid;
    }

    public void setGoodid(Integer goodid) {
        this.goodid = goodid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getGoodname() {
        return goodname;
    }

    public void setGoodname(String goodname) {
        this.goodname = goodname;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getBuynum() {
        return buynum;
    }

    public void setBuynum(Integer buynum) {
        this.buynum = buynum;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getBuyprice() {
        return buyprice;
    }

    public void setBuyprice(double buyprice) {
        this.buyprice = buyprice;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }

    public String getPostadd() {
        return postadd;
    }

    public void setPostadd(String postadd) {
        this.postadd = postadd;
    }

    public String getPostname() {
        return postname;
    }

    public void setPostname(String postname) {
        this.postname = postname;
    }

    public String getPostmobile() {
        return postmobile;
    }

    public void setPostmobile(String postmobile) {
        this.postmobile = postmobile;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }
}
