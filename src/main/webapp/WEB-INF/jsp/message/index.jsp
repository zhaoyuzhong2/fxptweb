<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/23/023
  Time: 23:26
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
    <title>消息</title>
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-message">

<ul class="list-box">
    <li>
        <a href="${ctx}/message/proxy">
            <div>
                <i class="icon icon1"></i><span class="name">代理圈</span>
            </div>
            <div class="to-icon"></div>
        </a>
    </li>
</ul>

<ul class="message-nav">
    <li>
        <a href="${ctx}/message/sys">
            <i class="icon icon1"></i>
            <span class="name">系统消息</span>
        </a>
    </li>
    <li>
        <a href="${ctx}/message/notice">
            <i class="icon icon2"></i>
            <span class="name">公告资讯</span>
        </a>
    </li>
    <li>
        <a href="${ctx}/message/material">
            <i class="icon icon3"></i>
            <span class="name">素材库</span>
        </a>
    </li>
</ul>


<div class="bottom-navbar">
    <a href="${ctx}/main/index">
        <i class="icon icon1"></i>
        <span class="text">代理</span>
    </a>
    <a href="${ctx}/message/index" class="active">
        <i class="icon icon2"></i>
        <span class="text">消息</span>
    </a>
    <a href="${ctx}/my/index">
        <i class="icon icon3"></i>
        <span class="text">我</span>
    </a>
</div>

</body>
</html>