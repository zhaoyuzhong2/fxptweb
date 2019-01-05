package com.fxptw.dto;

import java.util.Date;

/**
 * Created by james on 2018/12/14.
 */
public class Goods extends BaseDTO {
    private Integer id;
    private String name;
    private double price;
    private double buyprice1;
    private double buyprice2;
    private double buyprice3;
    private String spec;
    private String taste;
    private String proadd;
    private String fitpeople;
    private String stuff;
    private String detail;
    private Integer stock;
    private Date cdate;
    private Integer cuser;
    private String flag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getBuyprice1() {
        return buyprice1;
    }

    public void setBuyprice1(double buyprice1) {
        this.buyprice1 = buyprice1;
    }

    public double getBuyprice2() {
        return buyprice2;
    }

    public void setBuyprice2(double buyprice2) {
        this.buyprice2 = buyprice2;
    }

    public double getBuyprice3() {
        return buyprice3;
    }

    public void setBuyprice3(double buyprice3) {
        this.buyprice3 = buyprice3;
    }

    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
    }

    public String getTaste() {
        return taste;
    }

    public void setTaste(String taste) {
        this.taste = taste;
    }

    public String getProadd() {
        return proadd;
    }

    public void setProadd(String proadd) {
        this.proadd = proadd;
    }

    public String getFitpeople() {
        return fitpeople;
    }

    public void setFitpeople(String fitpeople) {
        this.fitpeople = fitpeople;
    }

    public String getStuff() {
        return stuff;
    }

    public void setStuff(String stuff) {
        this.stuff = stuff;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
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
