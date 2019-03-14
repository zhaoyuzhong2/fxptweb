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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
    <title>我的业绩</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/showBo.js"></script>
</head>
<body class="page-my-achievement">
<div class="achievement-tag">
    <span class="tag"><i class="icon icon1"></i>个人业绩</span>
</div>
<div class="achievement-box">
    <div class="banner banner1">
        <div class="date">
            <a href="#" class="month"><span class="txt">${yearMonth}</span> <i class="to-icon"></i></a>
        </div>
        <div class="money-box">
            <div class="money">
                <span class="num">${money}</span><span class="unit">元</span>
            </div>
        </div>
        <%--<div class="not-opened">当前未开启月任务</div>--%>
    </div>

</div>

<%--<div class="achievement-tag">--%>
    <%--<span class="tag"><i class="icon icon2"></i>顶级团队业绩</span>--%>
<%--</div>--%>
<%--<div class="achievement-box">--%>
    <%--<div class="banner banner2">--%>
        <%--<div class="date">--%>
            <%--<a href="#" class="month"><span class="txt">${yearMonth}</span> <i class="to-icon"></i></a>--%>
        <%--</div>--%>
        <%--<div class="money-box">--%>
            <%--<div class="money">--%>
                <%--<span class="num">28800.00</span><span class="unit">元</span>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<a href="#" class="peonum-box">--%>
            <%--<div class="inner">--%>
                <%--<div class="num">99</div>--%>
                <%--<div class="name">顶级团队人数</div>--%>
            <%--</div>--%>
            <%--<div class="inner">--%>
                <%--<div class="num">18</div>--%>
                <%--<div class="name">直推人数</div>--%>
            <%--</div>--%>
        <%--</a>--%>
    <%--</div>--%>
    <%--<div class="bottom">11月个人业绩：&nbsp;0.00元</div>--%>
<%--</div>--%>

<div class="achievement-tag">
    <span class="tag"><i class="icon icon3"></i>邀请团队业绩</span>
</div>
<div class="achievement-box">
    <div class="banner banner3">
        <div class="date">
            <a href="#" class="month"><span class="txt">${yearMonth}</span> <i class="to-icon"></i></a>
        </div>
        <div class="money-box">
            <div class="money">
                <span class="num">0.00</span><span class="unit">元</span>
            </div>
        </div>
        <a href="#" class="peonum-box">
            <div class="inner">
                <div class="num">${allXjnum}</div>
                <div class="name">邀请团队人数</div>
            </div>
            <div class="inner">
                <div class="num">${xjnum}</div>
                <div class="name">直推人数</div>
            </div>
        </a>
    </div>

</div>

<%--<div class="achievement-tag">--%>
    <%--<span class="tag"><i class="iconfont icon-jinhuo"></i>进货团队业绩</span>--%>
<%--</div>--%>
<%--<div class="achievement-box">--%>
    <%--<div class="banner banner4">--%>
        <%--<div class="decorate5"></div>--%>
        <%--<div class="decorate6"></div>--%>
        <%--<div class="decorate7"><div class="decorate8"></div></div>--%>
        <%--<div class="content">--%>
            <%--<div class="date">--%>
                <%--<a href="#" class="month"><span class="txt">${yearMonth}</span> <i class="to-icon"></i></a>--%>
            <%--</div>--%>
            <%--<div class="money-box">--%>
                <%--<div class="money">--%>
                    <%--<span class="num">0.00</span><span class="unit">元</span>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<a href="#" class="peonum-box">--%>
                <%--<div class="inner">--%>
                    <%--<div class="num">1</div>--%>
                    <%--<div class="name">进货团队人数</div>--%>
                <%--</div>--%>
                <%--<div class="inner">--%>
                    <%--<div class="num">0</div>--%>
                    <%--<div class="name">直推人数</div>--%>
                <%--</div>--%>
            <%--</a>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bottom">01月个人业绩：&nbsp;${MyMoney}元</div>--%>
<%--</div>--%>


<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>
</body>
</html>