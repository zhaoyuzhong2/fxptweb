<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/7/007
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
    <title>邀请代理</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-inviteagent-interface">
<div id="app">
    <div class="page">
        <div class="page-content">

            <div class="top-info display-flex align-items-flex-start">
                <img class="agent-head" src="${headpath}"/>
                <div class="agent-name">
                    <div>${req.username}</div>
                    <div class="tag">${rolename}</div>
                </div>
            </div>

            <div class="qr-code-box">
                <img class="qr-code" src="${ctx}/${file}"/>
                <div class="txt">扫一扫上面的二维码，即可申请代理。</div>
            </div>
            <div class="invite-btn-box">
                <a href="#" class="col button button-big button-fill button-round c-block-btn external" style="margin-top: 0;" onclick="popTip()">邀请代理</a>
                <div class="txt">在微信中直接分享此页面给意向代理，他点击注册后将成为您的代理商。</div>
                <div class="tip">该链接将<span class="red">于3天内有效</span></div>
            </div>
        </div>
    </div>
</div>

<!--<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>-->
<div class="c-tip-box" id="shareTip">
    <img class="tip" src="${ctx}/img/share_friends.png"/>
</div>

<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
<!--<script src="../../js/public.js"></script>-->
<script>
    function  popTip() {
        $('#shareTip').show();
    }

    $('.c-tip-box').on('click',function(){
        $(this).hide();
    });
</script>
</body>
</html>