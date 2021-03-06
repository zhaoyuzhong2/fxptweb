<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/23/023
  Time: 23:55
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
    <title>素材库</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-materical-lib">
<div id="app">
    <div class="page">
        <div class="page-content">
            <%--搜索条件暂时不启用--%>
            <%--<form class="c-searchbar display-flex align-items-center" action="${ctx}/material/material" method="post" id="form">--%>
                <%--<div class="input-wrap display-flex align-items-center">--%>
                    <%--<i class="iconfont icon-sousuo"></i>--%>
                    <%--<input class="search-ipt" type="text" placeholder="搜索素材" style="width: 70px;" id="name"/>--%>
                    <%--<a href="#" class="iconfont icon-cancel-1 clear-btn"></a>--%>
                <%--</div>--%>
                <%--<a href="#" class="search-btn" onclick="search()">搜索</a>--%>
            <%--</form>--%>


            <%--这个是置顶的图片，暂不显示--%>

            <%--<ul class="total-class row no-gap">--%>
                <%--<li class="col-25">--%>
                    <%--<a href="#" class="external link">--%>
                        <%--<div class="material-wrap">--%>
                            <%--<img class="material" src="${ctx}/img/material1.jpg"/>--%>
                        <%--</div>--%>
                        <%--<div class="txt">胶原蛋白反馈</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%----%>
            <%--</ul>--%>
            <c:forEach var="mt" items="${mts}" varStatus="k">
            <div class="item-class">
                <div class="title display-flex justify-content-space-between align-items-center">
                    <div class="txt">${mt.name}</div>
                    <a href="${ctx}/message/materialList?typeid=${mt.id}" class="external">查看全部&nbsp;>></a>
                </div>
                <ul class="imgs-list row no-gap">
                <c:set var="id" value="${k.index}"/>
                    <c:forEach items="${map[id]}" var="m">
                    <li class="col-33">
                        <a href="${ctx}/message/materialDetail?id=${m.id}" class="link external">
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

            </c:forEach>


        </div>
    </div>
</div>


<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>

<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
<script src="${ctx}/js/public.js"></script>
<script>
function search() {
    $("#form").submit();
}
</script>
</body>
</html>
