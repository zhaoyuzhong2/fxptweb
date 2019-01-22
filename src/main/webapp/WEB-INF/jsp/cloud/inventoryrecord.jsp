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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
    <title>库存记录</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-inventory-record">
<div id="app">
    <div class="page">
        <div class="toolbar tabbar c-topnav">
            <div class="toolbar-inner segmented segmented-raised segmented-round">
                <!-- Links have "tab-link" class instead of just "link" to switch tabs -->
                <a href="#tab-1" class="tab-link tab-link-active button button-round">云库存</a>
                <a href="#tab-2" class="tab-link button button-round">实体库存</a>
            </div>
        </div>
        <div class="tabs">
            <!-- First tab, active -->
            <div class="page-content tab tab-active" id="tab-1">
                <%--<div class="null-tip">
                    <img src="${ctx}/img/null.png" class="img"/>
                    <div class="info">没有内容可供显示</div>
                </div>--%>

                <ul class="c-cproduct-list">
                    <li class="display-flex justify-content-space-between align-items-center">
                        <div class="display-flex">
                            <img src="${ctx}/img/ala.jpg" width="70" height="70" class="product-img"/>
                            <div class="pro">
                                <div class="pro-name">胶原蛋白小分子钛饮</div>
                                <div class="price">¥150.00</div>
                            </div>
                        </div>
                        <div class="num">X50</div>
                    </li>
                </ul>
            </div>
            <!-- Second tab -->
            <div class="page-content tab" id="tab-2">
                <%--<div class="null-tip">
                    <img src="${ctx}/img/null.png" class="img"/>
                    <div class="info">没有内容可供显示哦</div>
                </div>--%>

                <ul class="c-cproduct-list">
                    <li class="display-flex justify-content-space-between align-items-center">
                        <div class="display-flex">
                            <img src="${ctx}/img/ala.jpg" width="70" height="70" class="product-img"/>
                            <div class="pro">
                                <div class="pro-name">胶原蛋白小分子钛饮</div>
                                <div class="price">¥150.00</div>
                            </div>
                        </div>
                        <div class="num">X50</div>
                    </li>
                </ul>
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