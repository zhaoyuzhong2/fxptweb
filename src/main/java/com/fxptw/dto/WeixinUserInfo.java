package com.fxptw.dto;

/**
 * 微信用户基础信息
 * @author hibernate_xc
 * @since 2019-01-15
 */
public class WeixinUserInfo {

    // 用户的标识
    private String openId;

    // 关注状态（1是关注，0是未关注），未关注时获取不到其余信息
    private int subscribe;

    // 用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间
    private String subscribeTime;

    // 昵称
    private String nickname;

    // 用户的性别（1是男性，2是女性，0是未知）
    private int sex;

    // 用户所在国家
    private String country;

    // 用户所在省份
    private String province;

    // 用户所在城市
    private String city;

    // 用户的语言，简体中文为zh_CN
    private String language;

    // 用户头像
    private String headImgUrl;

    /**
     * @return 用户的标识
     */
    public String getOpenId() {
        return openId;
    }

    /**
     * @param openId 用户的标识
     */
    public void setOpenId(String openId) {
        this.openId = openId;
    }

    /**
     * @return 关注状态（1是关注，0是未关注），未关注时获取不到其余信息
     */
    public int getSubscribe() {
        return subscribe;
    }

    /**
     * @param subscribe 关注状态（1是关注，0是未关注），未关注时获取不到其余信息
     */
    public void setSubscribe(int subscribe) {
        this.subscribe = subscribe;
    }

    /**
     * @return 用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间
     */
    public String getSubscribeTime() {
        return subscribeTime;
    }

    /**
     * @param subscribeTime 用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间
     */
    public void setSubscribeTime(String subscribeTime) {
        this.subscribeTime = subscribeTime;
    }

    /**
     * @return 昵称
     */
    public String getNickname() {
        return nickname;
    }

    /**
     * @param nickname 昵称
     */
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    /**
     * @return 用户的性别（1是男性，2是女性，0是未知）
     */
    public int getSex() {
        return sex;
    }

    /**
     * @param sex 用户的性别（1是男性，2是女性，0是未知）
     */
    public void setSex(int sex) {
        this.sex = sex;
    }

    /**
     * @return 用户所在国家
     */
    public String getCountry() {
        return country;
    }

    /**
     * @param country 用户所在国家
     */
    public void setCountry(String country) {
        this.country = country;
    }

    /**
     * @return 用户所在省份
     */
    public String getProvince() {
        return province;
    }

    /**
     * @param province 用户所在省份
     */
    public void setProvince(String province) {
        this.province = province;
    }

    /**
     * @return 用户所在城市
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city 用户所在城市
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return 用户的语言，简体中文为zh_CN
     */
    public String getLanguage() {
        return language;
    }

    /**
     * @param language 用户的语言，简体中文为zh_CN
     */
    public void setLanguage(String language) {
        this.language = language;
    }

    /**
     * @return 用户头像
     */
    public String getHeadImgUrl() {
        return headImgUrl;
    }

    /**
     * @param headImgUrl 用户头像
     */
    public void setHeadImgUrl(String headImgUrl) {
        this.headImgUrl = headImgUrl;
    }
}