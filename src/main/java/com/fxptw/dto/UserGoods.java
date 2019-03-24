package com.fxptw.dto;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.SimpleFormatter;

/**
 * Created by wcw on 2019/1/10.
 */
public class UserGoods extends BaseDTO {
    private static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    private int id;
    private int goodid;
    private double buyprice;
    private int userid;
    private int buynum;
    private Date cdate;
    private String ccdate;
    private int cuser;
    private String goodname;
    private String username;
    private String cusername;
    private String mobile;
    private Integer roleid;
    private String postname;
    private String postmobile;
    private String postadd;
    private String postcom;
    private String postnum;
    private String message;
    private double totalprice;
    private String flag;
    private String code;
    private String imgfile;
    private Date qrdate;
    private Date fhdate;
    private Date qxdate;
    private String cqrdate;
    private String cfhdate;
    private String cqxdate;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGoodid() {
        return goodid;
    }

    public void setGoodid(int goodid) {
        this.goodid = goodid;
    }

    public double getBuyprice() {
        return buyprice;
    }

    public void setBuyprice(double buyprice) {
        this.buyprice = buyprice;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getBuynum() {
        return buynum;
    }

    public void setBuynum(int buynum) {
        this.buynum = buynum;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }

    public int getCuser() {
        return cuser;
    }

    public void setCuser(int cuser) {
        this.cuser = cuser;
    }

    public String getGoodname() {
        return goodname;
    }

    public void setGoodname(String goodname) {
        this.goodname = goodname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getCusername() {
        return cusername;
    }

    public void setCusername(String cusername) {
        this.cusername = cusername;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
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

    public String getPostadd() {
        return postadd;
    }

    public void setPostadd(String postadd) {
        this.postadd = postadd;
    }

    public String getPostcom() {
        return postcom;
    }

    public void setPostcom(String postcom) {
        this.postcom = postcom;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }


    public String getImgfile() {
        return imgfile;
    }

    public void setImgfile(String imgfile) {
        this.imgfile = imgfile;
    }

    public String getCcdate() {
        return ccdate;
    }

    public void setCcdate(String ccdate) {
        this.ccdate = ccdate;
    }

    public Date getQrdate() {
        return qrdate;
    }

    public void setQrdate(Date qrdate) {
        this.qrdate = qrdate;
    }

    public Date getFhdate() {
        return fhdate;
    }

    public void setFhdate(Date fhdate) {
        this.fhdate = fhdate;
    }

    public Date getQxdate() {
        return qxdate;
    }

    public void setQxdate(Date qxdate) {
        this.qxdate = qxdate;
    }

    public String getCqrdate() {
        return cqrdate;
    }

    public void setCqrdate(String cqrdate) {
        this.cqrdate = cqrdate;
    }

    public String getCfhdate() {
        return cfhdate;
    }

    public void setCfhdate(String cfhdate) {
        this.cfhdate = cfhdate;
    }

    public String getCqxdate() {
        return cqxdate;
    }

    public void setCqxdate(String cqxdate) {
        this.cqxdate = cqxdate;
    }

    public String getPostnum() {
        return postnum;
    }

    public void setPostnum(String postnum) {
        this.postnum = postnum;
    }
}
