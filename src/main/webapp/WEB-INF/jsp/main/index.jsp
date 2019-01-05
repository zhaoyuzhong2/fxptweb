<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/27/027
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.fxptw.dto.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
    User emp = (User)request.getSession().getAttribute("user");

%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
    <title>首页</title>
    <link rel="stylesheet" href="${ctx}/css/public.css">
    <link rel="stylesheet" href="${ctx}/css/showBo.css">
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/showBo.js"></script>
</head>
<body class="index-page">
<header class="index-header">
    <div class="head"><img src="${ctx}/img/index_head.png"/></div>
    <div class="info">
        <div class="name">${emp.name}</div>
        <div class="tag">
            <i class="icon"></i>
            <span class="txt">${emp.rolename}</span>
        </div>
    </div>
</header>

<ul class="top-nav">
    <li>
        <a href="${ctx}/ug/wantToBy">
            <i class="icon icon1"></i>
            <span class="name">我要进货</span>
        </a>
    </li>
    <li>
        <a href="./buy_cloud_stock/buy_cloudstock.html">
            <i class="icon icon2"></i>
            <span class="name">买云库存</span>
        </a>
    </li>
    <li>
        <a href="./my_order/my_purchase_orders_list.html">
            <i class="icon icon3"></i>
            <span class="name">我的订单</span>
        </a>
    </li>
    <li>
        <a href="./cloud_storage/cloud_storage.html">
            <i class="icon icon4"></i>
            <span class="name">云仓库</span>
        </a>
    </li>
</ul>

<ul class="index-nav clearfix">
    <li>
        <a href="#">
            <i class="icon icon1"></i>
            <span>邀请代理</span>
        </a>
    </li>
    <li>
        <a href="./audit_agent/audit_agent.html">
            <i class="icon icon2"></i>
            <span>审核代理</span>
        </a>
    </li>
    <li>
        <a href="./reward/reward_home.html">
            <i class="icon icon3"></i>
            <span>奖励</span>
        </a>
    </li>
    <li>
        <a href="./my_achievements/my_achievement.html">
            <i class="icon icon4"></i>
            <span>我的业绩</span>
        </a>
    </li>
    <li>
        <a href="#">
            <i class="icon icon5"></i>
            <span>进货关系网</span>
        </a>
    </li>
    <li>
        <a href="./invitation_networks/invitation_team.html">
            <i class="icon icon6"></i>
            <span>邀请关系网</span>
        </a>
    </li>
    <li>
        <a href="#">
            <i class="icon icon7"></i>
            <span>授权证书</span>
        </a>
    </li>
    <li>
        <a href="#">
            <i class="icon icon8"></i>
            <span>升级处理</span>
        </a>
    </li>
</ul>

<ul class="index-nav2">
    <li class="item4">
        <a href="#">
            <div class="name">累计业绩</div>
            <div class="val">¥${tyeji}</div>
        </a>
    </li>
    <li class="item5">
        <a href="#">
            <div class="name">累计收入</div>
            <div class="val">¥${tshouru}</div>
        </a>
    </li>
    <li class="item6">
        <a href="#">
            <div class="name">货款余额</div>
            <div class="val">¥${huokuan}</div>
        </a>
    </li>
    <li class="item7">
        <a href="#">
            <div class="name">当月业绩</div>
            <div class="val">¥${yeji}</div>
        </a>
    </li>
    <li class="item1">
        <a href="#">
            <div class="name">当月收入</div>
            <div class="val">¥${shouru}</div>
        </a>
    </li>

    <li class="item3">
        <a href="#">
            <div class="name">可提现余额</div>
            <div class="val">¥${money}</div>
        </a>
    </li>
</ul>

<div class="index-banner">
    <div class="inner">
        <img src="${ctx}/img/index_banner.jpg"/>
    </div>
</div>

<div class="bottom-navbar">
    <a href="./index.html" class="active">
        <i class="icon icon1"></i>
        <span class="text">代理</span>
    </a>
    <a href="./message/message.html">
        <i class="icon icon2"></i>
        <span class="text">消息</span>
    </a>
    <a href="./my/my.html">
        <i class="icon icon3"></i>
        <span class="text">我</span>
    </a>
</div>

</body>
</html>