<%--
  Created by IntelliJ IDEA.
  User: james
  Date: 2019/3/5
  Time: 11:14
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
    <title>素材搜索</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-materical-lib">
<div id="app">
    <div class="page">
        <div class="page-content">
            <form class="c-searchbar display-flex align-items-center" id="form" action="${ctx}/message/materialList">
                <input type="hidden" id="typeid" name="typeid" value="${typeid}"/>
                <div class="input-wrap display-flex align-items-center">
                    <i class="iconfont icon-sousuo"></i>
                    <input class="search-ipt" type="text" placeholder="图片名称" name="name" style="width: 40px;"/>
                    <a href="#" class="iconfont icon-cancel-1 clear-btn"></a>
                </div>
                <a href="#" class="search-btn" onclick="sub()">搜索</a>
            </form>

            <div class="item-class" style="margin-top: 0;">
                <ul class="imgs-list row no-gap">
                    <c:forEach var="m" items="${ms}">
                    <li class="col-33">
                        <a href="" class="link external">
                            <div class="material-wrap">
                                <img class="material" src="${ctx}/img_material/${m.imgpath}"/>
                            </div>
                            <div class="txt">${m.name}</div>
                            <div class="date"><fmt:formatDate value="${m.cdate}" pattern="yyyy-MM-dd" /></div>
                        </a>
                    </li>
                    </c:forEach>

                </ul>
            </div>
            <div class="c-load-tip">已全部加载</div>
        </div>
    </div>
</div>


<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>

<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
<script src="${ctx}/js/public.js"></script>

<script>
function sub() {
    $("#form").submit();
}
</script>
</body>
</html>
