<%--
  Created by IntelliJ IDEA.
  User: james
  Date: 2019/3/5
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
    <title>${name}</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-material-details">
<div id="app">
    <div class="page">
        <div class="page-content" id="vueWrap">


            <div class="imgs-box">
                <img class="material" src="${ctx}/img_material/${imgpath}"/>
            </div>


        </div>
    </div>
</div>


<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>


<script src="${ctx}/js/vue.js"></script>
<script>

</script>
<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
<script src="${ctx}/js/public.js"></script>
<script>

</script>
</body>
</html>
