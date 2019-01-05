package com.fxptw.util;


import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import java.io.IOException;

/**
 * Created by Administrator on 2018/10/28/028.
 */
public class HuyiSms2 {


    private static String Url = "http://api.yx.ihuyi.com/webservice/sms.php?method=Submit";

    public String sendSms(String mobile,String name,String code1){

        HttpClient client = new HttpClient();
        PostMethod method = new PostMethod(Url);

        client.getParams().setContentCharset("GBK");
        method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=GBK");

        int mobile_code = (int)((Math.random()*9+1)*100000);

        String content = new String("“一种夺目的吸引，一种优雅的气味”！亲爱的【"+name+"】，恭喜您成为我们天惊人体卫士360的合伙人，您的唯一授权编号是【"+code1+"】。退订回T【天惊人体卫士】");

        NameValuePair[] data = {//提交短信
                new NameValuePair("account", "M55820741"), //查看用户名是登录用户中心->验证码短信->产品总览->APIID
                new NameValuePair("password", "4bf42166d76537af159c93714c228e4b"),  //查看密码请登录用户中心->验证码短信->产品总览->APIKEY
                //new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
                new NameValuePair("mobile", mobile),
                new NameValuePair("content", content),
        };
        method.setRequestBody(data);

        try {
            client.executeMethod(method);

            String SubmitResult =method.getResponseBodyAsString();

            //System.out.println(SubmitResult);

            Document doc = DocumentHelper.parseText(SubmitResult);
            Element root = doc.getRootElement();

            String code = root.elementText("code");
            String msg = root.elementText("msg");
            String smsid = root.elementText("smsid");

            System.out.println(code);
            System.out.println(msg);
            System.out.println(smsid);

            if("2".equals(code)){
                System.out.println("短信提交成功");
            }

        } catch (HttpException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (DocumentException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "1";

    }
}
