package com.fxptw.web;


import com.alibaba.fastjson.JSONObject;
import com.fxptw.task.WeCharQuartz;
import com.fxptw.util.ParamSettings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@RestController
@RequestMapping(value = "/weChar")
public class WeCharController {

    @Autowired
    private ParamSettings paramSettings;

    //后台accessoken内容
    private String accessToken = WeCharQuartz.getAccessToken();

    //初始化执行首页绑定处理
    private String beforUrl =
            "https://open.weixin.qq.com/connect/oauth2/authorize?appid=AppId"
                    +"&redirect_uri=REDIRECT_URI&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";

    //获取用户唯一标识
    private String accessTokenByOpenId =
            "https://api.weixin.qq.com/sns/oauth2/refresh_token?appid={AppId}"
                    +"&grant_type=refresh_token&refresh_token={AccessToken}";

    //获取用户基础信息
    private String openIdByUserInfoUrl =
            "https://api.weixin.qq.com/sns/userinfo?access_token={AccessToken}&openid=OPENID&lang=zh_CN";

    //系统默认地址
    private final String sysUrl = "http://www.paipaigou.com/fxptweb/main/tologin";

    /**
     * 用户基础信息获取
     * @param request 用户参数
     * @return 用户基础信息
     */
    @RequestMapping("/getWeCharOne")
    public JSONObject getOpenId(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            beforUrl = beforUrl.replace("REDIRECT_URI", URLEncoder.encode(sysUrl,"utf-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        beforUrl = beforUrl.replace("AppId",paramSettings.getAppId());
        //这里请不要使用get请求单纯的将页面跳转到该url即可
        System.out.println(beforUrl);
        response.sendRedirect(beforUrl);
        return null;
    }

    @RequestMapping(value = "/redirect", method = RequestMethod.GET)
    public String weCharRedirect(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        return "redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid="+paramSettings.getAppId()
                +"&redirect_uri="+URLEncoder.encode(sysUrl,"utf-8")
                +"?response_type=code&scope=snsapi_base&state=1&connect_redirect=1#wechat_redirect";
    }
}
