<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ page import="com.fxptw.dto.User" %>
<%
    User emp = (User)request.getSession().getAttribute("user");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">    <title>代理个人资料</title>
    <title>立即提货</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-delivery">
<div id="app">
    <div class="page">
        <div class="toolbar toolbar-bottom-md toolbar-bottom-btn">
            <div class="toolbar-inner">
                <span class="link info"><span>合计:</span><span class="num">0件</span></span>
                <a href="#" class="link cart-btn"><i class="icon-cart"></i><span>下单提货(0)</span></a>
            </div>
        </div>
        <div class="page-content">
            <div class="null-tip">
                <img src="${ctx}/img/null.png" class="img"/>
                <div class="info">没有内容可供显示</div>
            </div>
        </div>
    </div>
</div>




<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>

<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
</body>
</html>