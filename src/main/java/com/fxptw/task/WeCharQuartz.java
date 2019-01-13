package com.fxptw.task;

import com.alibaba.fastjson.JSONObject;
import com.fxptw.util.ParamSettings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@Component
@Configurable
@EnableScheduling
public class WeCharQuartz {

    @Autowired
    ParamSettings paramSettings;

    private static String accessToken;

    //每两个小时执行一次
    @Scheduled(fixedRate = 1000 * 7200)
    public void reportCurrentByAccessTokenCron(){
        accessToken = accessToken();
        System.out.println("accessToken:"+accessToken);
    }

    /**
     * 获取访问授权
     * @return access_token
     */
    private String accessToken(){
        System.out.println(paramSettings.getAppId());
        System.out.println(paramSettings.getAppSecret());
        //获取openid的地址
        String getOpenidUri = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential" +
                "&appid="+paramSettings.getAppId()+"&secret="+paramSettings.getAppSecret();
        HttpURLConnection openidConnection = null;
        BufferedReader openidReader = null;
        try{
            //发送请求获取返回参数，使用java原生实现，可以使用httpclient或者第三方库实现
            URL getOpenidUrl = new URL(getOpenidUri);
            openidConnection = (HttpURLConnection) getOpenidUrl.openConnection();
            openidConnection.connect();
            openidReader = new BufferedReader(new InputStreamReader(openidConnection.getInputStream()));
            StringBuffer openidStringBuffer = new StringBuffer();
            String openidLines;
            while ((openidLines = openidReader.readLine()) != null) {
                openidStringBuffer.append(openidLines);
            }
            //返回的参数是json格式
            JSONObject accessTokenJson = JSONObject.parseObject(openidStringBuffer.toString());
            //System.out.println(accessTokenJson);
            accessToken = accessTokenJson.getString("access_token");
        }catch(Exception e){
            //连接异常，请求异常，或者json返回值异常均需要处理
            e.printStackTrace();
        }finally {
            try {
                openidReader.close();
                openidConnection.disconnect();
            }catch (Exception e){
                e.printStackTrace();;
            }
        }
        return accessToken;
    }

    /**
     * 访问accessToken
     * @return
     */
    public static String getAccessToken() {
        return accessToken;
    }
}