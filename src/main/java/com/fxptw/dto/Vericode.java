package com.fxptw.dto;

import java.util.Date;

/**
 * Created by Administrator on 2018/12/26/026.
 */
public class Vericode extends BaseDTO {
    private Integer id;
    private String mobile;
    private String code;
    private Date cdate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }
}
