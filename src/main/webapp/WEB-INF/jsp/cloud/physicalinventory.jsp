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
    <title>实体库存</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-physical-inventory">
<div id="app">
    <div class="page">
        <div class="toolbar tabbar tabbar-custom2">
            <div class="toolbar-inner">
                <!-- Links have "tab-link" class instead of just "link" to switch tabs -->
                <a href="#tab-1" class="tab-link tab-link-active">实体库存商品</a>
                <a  id="entityexchangerecord" href="${ctx}/cloud/entityexchangerecord" class="tab-link external">换货记录</a>
            </div>
        </div>
        <div class="tabs">
            <div class="page-content tab tab-active" id="tab-1">
                <c:choose>
                    <c:when test="${list.size()==0}">
                        <div class="null-tip">
                            <img src="${ctx}/img/null.png"/>
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
                                            <div class="num">${stock.stock}</div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </div>
</div>


<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>
<script>
/*    $("#entityexchangerecord").click(function () {
        $.post("${ctx}/cloud/entityexchangerecord",{},function (d) {
        });
    });*/


</script>
<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
</body>
</html>