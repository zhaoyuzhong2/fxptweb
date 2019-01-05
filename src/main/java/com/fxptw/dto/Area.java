package com.fxptw.dto;

import java.util.Date;

/**
 * Created by james on 2018/12/14.
 */
public class Area extends BaseDTO {
    private Integer id;
    private String area_name;
    private String area_code;
    private String area_short;
    private String area_is_hot;
    private Integer area_sequence;
    private Integer area_parent_id;
    private Date init_date;
    private String init_addr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getArea_name() {
        return area_name;
    }

    public void setArea_name(String area_name) {
        this.area_name = area_name;
    }

    public String getArea_code() {
        return area_code;
    }

    public void setArea_code(String area_code) {
        this.area_code = area_code;
    }

    public String getArea_short() {
        return area_short;
    }

    public void setArea_short(String area_short) {
        this.area_short = area_short;
    }

    public String getArea_is_hot() {
        return area_is_hot;
    }

    public void setArea_is_hot(String area_is_hot) {
        this.area_is_hot = area_is_hot;
    }

    public Integer getArea_sequence() {
        return area_sequence;
    }

    public void setArea_sequence(Integer area_sequence) {
        this.area_sequence = area_sequence;
    }

    public Integer getArea_parent_id() {
        return area_parent_id;
    }

    public void setArea_parent_id(Integer area_parent_id) {
        this.area_parent_id = area_parent_id;
    }

    public Date getInit_date() {
        return init_date;
    }

    public void setInit_date(Date init_date) {
        this.init_date = init_date;
    }

    public String getInit_addr() {
        return init_addr;
    }

    public void setInit_addr(String init_addr) {
        this.init_addr = init_addr;
    }
}
