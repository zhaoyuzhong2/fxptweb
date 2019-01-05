package com.fxptw.dto;

/**
 * Created by james on 2018/12/14.
 */
public class User extends BaseDTO {
    private Integer id;
    private String name;
    private Integer roleid;
    private Integer pid;
    private String mobile;
    private String chatno;
    private String sex;
    private String pwd;
    private String birthday;
    private Integer educationid;
    private String education;
    private String idcard;
    private String idcardpath;
    private String address;
    private String headpath;
    private String area;
    private String areaname;
    private String flag;
    private String rolename;
    private int sailnum;
    private int xjnum;
    private double money;

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public int getXjnum() {
        return xjnum;
    }

    public void setXjnum(int xjnum) {
        this.xjnum = xjnum;
    }

    public int getSailnum() {
        return sailnum;
    }

    public void setSailnum(int sailnum) {
        this.sailnum = sailnum;
    }

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

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getChatno() {
        return chatno;
    }

    public void setChatno(String chatno) {
        this.chatno = chatno;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public Integer getEducationid() {
        return educationid;
    }

    public void setEducationid(Integer educationid) {
        this.educationid = educationid;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public String getIdcardpath() {
        return idcardpath;
    }

    public void setIdcardpath(String idcardpath) {
        this.idcardpath = idcardpath;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHeadpath() {
        return headpath;
    }

    public void setHeadpath(String headpath) {
        this.headpath = headpath;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getAreaname() {
        return areaname;
    }

    public void setAreaname(String areaname) {
        this.areaname = areaname;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }
}
