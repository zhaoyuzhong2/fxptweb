<%--
  Created by IntelliJ IDEA.
  User: james
  Date: 2019/1/21
  Time: 14:19
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
    <title>月奖励</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-monthly-reward">
<div id="app">
    <div class="page">
        <div class="page-content">
            <div class="display-flex justify-content-space-between align-itmes top-title" style="margin-bottom: 5px;">
                <div>${yearm}</div>
                <i class="iconfont icon-rili"></i>
            </div>

            <div class="data-box">
                <div class="nodata-tip">
                    <img src="${ctx}/img/nodata.png"/>
                    <div>当前月还没有数据</div>
                </div>
            </div>

            <div class="display-flex justify-content-space-between align-itmes top-title">
                <div>获得总奖励</div>
                <span class="money">+0.00</span>
            </div>

            <div class="data-box">
                <div class="nodata-tip">
                    <img src="${ctx}/img/nodata.png"/>
                    <div>当前月还没有数据</div>
                </div>
            </div>

            <div class="display-flex justify-content-space-between align-itmes top-title">
                <div>给出总奖励</div>
                <span class="money">-0.00</span>
            </div>

            <div class="data-box">
                <div class="nodata-tip">
                    <img src="${ctx}/img/nodata.png"/>
                    <div>当前月还没有数据</div>
                </div>
            </div>

            <a href="javascript:history.back(-1);" class="goback" id="goBack"></a>
        </div>
    </div>
</div>

<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>

</body>
</html>
