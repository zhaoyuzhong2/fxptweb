package com.fxptw.dto;

import java.math.BigDecimal;
import java.util.Date;

public class UserInCome extends BaseDTO {

    private long id;

    private Integer userid;

    private String username;

    private String mobile;

    private String yearm;

    private BigDecimal money;

    private BigDecimal reward;

    private BigDecimal totalp;

    private Date cdate;

    private Integer cuser;

    private String flag;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getYearm() {
        return yearm;
    }

    public void setYearm(String yearm) {
        this.yearm = yearm;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public BigDecimal getReward() {
        return reward;
    }

    public void setReward(BigDecimal reward) {
        this.reward = reward;
    }

    public BigDecimal getTotalp() {
        return totalp;
    }

    public void setTotalp(BigDecimal totalp) {
        this.totalp = totalp;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }

    public Integer getCuser() {
        return cuser;
    }

    public void setCuser(Integer cuser) {
        this.cuser = cuser;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }
}