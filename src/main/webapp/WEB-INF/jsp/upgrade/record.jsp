<%--
  Created by IntelliJ IDEA.
  User: james
  Date: 2019/1/18
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
    <title>升级记录</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="">
<div id="app">
    <div class="page">
        <div class="toolbar tabbar tabbar-custom">
            <div class="toolbar-inner">
                <!-- Links have "tab-link" class instead of just "link" to switch tabs -->
                <a href="#tab-1" class="tab-link tab-link-active">升级中</a>
                <a href="#tab-2" class="tab-link">已完成</a>
                <a href="#tab-3" class="tab-link">已关闭</a>
            </div>
        </div>
        <div class="tabs">

            <div class="page-content tab tab-active" id="tab-1">
                <div class="null-tip">
                    <img src="${ctx}/img/null.png" class="img"/>
                    <div class="info">没有内容可供显示</div>
                </div>
            </div>

            <div class="page-content tab" id="tab-2">
                <div class="null-tip">
                    <img src="${ctx}/img/null.png" class="img"/>
                    <div class="info">没有内容可供显示哦</div>
                </div>
            </div>

            <div class="page-content tab" id="tab-3">
                <div class="null-tip">
                    <img src="${ctx}/img/null.png" class="img"/>
                    <div class="info">没有内容可供显示</div>
                </div>
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
