<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/31/031
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en" class="md">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
    <title>云库存提货</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
    <link rel="stylesheet" href="${ctx}/css/showBo.css">
    <script src="${ctx}/js/showBo.js"></script>
</head>
<body class="page-placeorder">

<div id="app">
    <div class="page-subtip">提取库存成功，请等待管理员审核！</div>

</div>

<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>
</body>
</html>