<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/14/014
  Time: 20:29
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
    <title>注册结果</title>
    <link rel="stylesheet" href="${ctx}/css/public.css">
    <style>
        html {
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body class="page-certificate">
注册失败

<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>
</body>
</html>
