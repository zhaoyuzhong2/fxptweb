package com.fxptw.dto;

import java.util.Date;

/**
 * Created by james on 2018/12/14.
 */
public class GoodsFile extends BaseDTO {
    private Integer id;
    private Integer goodid;
    private String imgfile;
    private Date cdate;
    private Integer cuser;
    private String flag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodid() {
        return goodid;
    }

    public void setGoodid(Integer goodid) {
        this.goodid = goodid;
    }

    public String getImgfile() {
        return imgfile;
    }

    public void setImgfile(String imgfile) {
        this.imgfile = imgfile;
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
