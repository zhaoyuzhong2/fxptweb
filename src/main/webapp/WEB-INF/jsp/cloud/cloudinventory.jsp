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
    <title>云库存</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">

</head>
<body class="page-cloud-inventory">
<div id="app">
    <div class="page">
        <div class="toolbar tabbar tabbar-custom2">
            <div class="toolbar-inner">
                <a href="#tab-1" class="tab-link tab-link-active">云库存商品</a>
                <a  id="cloudreplacement" href="${ctx}/cloud/cloudreplacement" class="tab-link external">换货记录</a>
            </div>
        </div>
        <div class="tabs">
            <div class="page-content tab tab-active" id="tab-1">
                <div>
                    <c:choose>
                        <c:when test="${list.size()==0}">
                            <div class="null-tip">
                                <img src="${ctx}/img/null.png" class="img"/>
                                <div class="info">没有内容可供显示</div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <ul class="c-product-list3">
                                <c:forEach items="${list}" var="stock">
                                    <li>
                                        <c:choose>
                                            <c:when test="${stock.imgfile}==null">
                                                <img src="${ctx}/img/ala.jpg" width="70" height="70" class="product-img"/>
                                            </c:when>
                                            <c:otherwise>
                                                <img src="${ctx}/img_goods/${stock.imgfile}" width="70" height="70" class="product-img"/>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="pro-detail">
                                            <div class="name">${stock.goodname}</div>
                                            <div class="bottom-box">
                                                <div class="price">¥${stock.price}</div>
                                                <div class="num">X${stock.stock}</div>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </div>
                <a  id="promptdelivery" href="${ctx}/cloud/promptdelivery" class="col button button-big button-fill c-bottom-btn external">立即提货</a>
            </div>
        </div>
    </div>
</div>


<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>
<script>
/*    $("#cloudreplacement").click(function () {
        $.post("${ctx}/cloud/cloudreplacement",{},function (d) {
        });
    });


    $("#promptdelivery").click(function () {
        $.post("${ctx}/cloud/promptdelivery",{},function (d) {
        });
    });*/
</script>
<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
</body>
</html>