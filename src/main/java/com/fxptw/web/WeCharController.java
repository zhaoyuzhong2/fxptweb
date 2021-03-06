package com.fxptw.web;


import com.alibaba.fastjson.JSONObject;
import com.fxptw.dao.SiteInDao;
import com.fxptw.dto.SiteIn;
import com.fxptw.dto.User;
import com.fxptw.task.WeCharQuartz;
import com.fxptw.util.ParamSettings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping(value = "/weChar")
public class WeCharController {

    @Autowired
    private ParamSettings paramSettings;

    @Autowired
    SiteInDao siteInDao;

    //后台accessoken内容
    private String accessToken = WeCharQuartz.getAccessToken();

    //初始化执行首页绑定处理
    private String beforeUrl =
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

    @Autowired
    private RestTemplate restTemplate;

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
            beforeUrl = beforeUrl.replace("REDIRECT_URI", URLEncoder.encode(sysUrl,"utf-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        beforeUrl = beforeUrl.replace("AppId",paramSettings.getAppId());
        //这里请不要使用get请求单纯的将页面跳转到该url即可
        System.out.println(beforeUrl);
        response.sendRedirect(beforeUrl);
        return null;
    }

    @RequestMapping(value = "/redirect", method = RequestMethod.GET)
    public String weCharRedirect(HttpServletRequest request, HttpServletResponse response)
            throws UnsupportedEncodingException {
        return "redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid="+paramSettings.getAppId()
                +"&redirect_uri="+URLEncoder.encode(sysUrl,"utf-8")
                +"?response_type=code&scope=snsapi_base&state=1&connect_redirect=1#wechat_redirect";
    }

    /**
     * 签到处理
     * @param request 请求对象
     * @return 操作是否成功
     */
    @RequestMapping("/siteIn")
    public Map<String, Object> siteIn(HttpServletRequest request){
        Object userObj = request.getSession().getAttribute("user");
        User user;
        if(userObj == null){
            return new HashMap() {
                {
                    put("success", new Boolean(false));
                    put("loginOut", new Boolean(false));
                    put("message", "登录超时请重新登录");
                }
            };
        }else {
            user = (User)userObj;
        }
        try {
            SiteIn siteIn = new SiteIn();
            siteIn.setOpenId(user.getOpenid());
            siteInDao.insertSiteIn(siteIn);
            return new HashMap() {
                {
                    put("success", new Boolean(true));
                    put("loginOut", new Boolean(false));
                    put("message", "保存成功");
                }
            };
        }catch (Exception e){
            e.printStackTrace();
            return new HashMap() {
                {
                    put("success", new Boolean(false));
                    put("loginOut", new Boolean(true));
                    put("message", "保存失败，请与管理员联系");
                }
            };
        }
    }

    @RequestMapping("/getByOpenId")
    public Object userInfoByOpenId(){
        accessTokenByOpenId = accessTokenByOpenId.replace("{AppId}", paramSettings.getAppId());
        accessTokenByOpenId = accessTokenByOpenId.replace("{AccessToken}", accessToken);
        return restTemplate.getForObject(accessTokenByOpenId,Map.class,
                new HashMap<String,String>(){{put("AppId",paramSettings.getAppId());put("AccessToken",accessToken);}});
    }
}