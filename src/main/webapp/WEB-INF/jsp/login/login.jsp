<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/27/027
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
    <title>登录</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
    <link rel="stylesheet" href="${ctx}/css/showBo.css">
</head>
<body class="page-login">
<div id="app">
    <div class="page">
        <div class="page-content">
            <form name="form" id="form" action="${ctx}/user/login" method="post">
                <input type="hidden" id="error" value="${error}"/>
            <div class="c-login-banner">
                <img class="logo" src="${ctx}/img/1.jpg"/>
                <div class="title">聚益恒集团</div>
            </div>

            <div class="list c-list-input">
                <ul>
                    <li class="item-content item-input">
                        <div class="item-media">
                            <i class="iconfont icon-shouji"></i>
                        </div>
                        <div class="item-inner">
                            <div class="item-input-wrap">
                                <input type="text" name="mobile" id="mobile" placeholder="请填写您的手机号码">
                                <span class="input-clear-button"></span>
                            </div>
                        </div>
                    </li>
                    <li class="item-content item-input">
                        <div class="item-media">
                            <i class="iconfont icon-credentials_icon"></i>
                        </div>
                        <div class="item-inner">
                            <div class="item-input-wrap">
                                <input type="password" name="pwd" id="pwd" placeholder="请输入您的密码">
                                <span class="input-clear-button"></span>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="text-align-right f-p-box">
                <a href="./change_password.html" class="forget-password-btn external">忘记密码?</a>
            </div>

            <button class="col button button-big button-fill button-round c-block-btn" onclick="check()">登录</button>
            </form>
        </div>
    </div>
</div>

<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
<script src="${ctx}/js/showBo.js"></script>
<!--<script src="../../js/public.js"></script>-->
<script type="text/javascript">


    $(function(){
        var error1 = $("#error").val();
        if(error1.length>0){
            Showbo.Msg.alert(error1);
        }
    });


    //删除平台
    function check() {
        var mobile=$("#mobile").val();
        var pwd=$("#pwd").val();
        if(mobile.length<1){
            Showbo.Msg.alert("请填写手机号码!");
            return false;
        }

        if(pwd.length<1){
            Showbo.Msg.alert("请填写密码!");
            return false;
        }

        document.getElementById("form").submit();
    }
</script>
</body>
</html>
