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
    <title>我的提货订单列表</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-pickup-list">
<div id="app">
    <div class="page">
        <div class="toolbar tabbar tabbar-custom">
            <div class="toolbar-inner">
                <!-- Links have "tab-link" class instead of just "link" to switch tabs -->
                <a href="#tab-1" class="tab-link tab-link-active">全部</a>
                <a href="#tab-2" class="tab-link">待付款</a>
                <a href="#tab-3" class="tab-link">已付款</a>
                <a href="#tab-4" class="tab-link">已申请</a>
                <a href="#tab-5" class="tab-link">已通过</a>
            </div>
        </div>
        <div class="tabs">

            <div class="page-content tab tab-active" id="tab-1">
                <form  id="form" name="form" class="c-searchbar display-flex align-items-center" action="${ctx}/cloud/mypickuporderslist" method="get">
                    <div class="input-wrap display-flex align-items-center">
                        <i class="iconfont icon-sousuo"></i>
                        <input class="search-ipt"  id="search_name" name="search_name" style="text-align: left;width: 100%" value="${search_name}" type="text" placeholder="商品名称/姓名/电话"/>
                        <a href="#" class="iconfont icon-cancel-1 clear-btn"></a>
                    </div>
                    <%--<button  class="search-btn" style="width: 50px;text-align: center" onclick="search()">搜索</button>--%>
                  <%--  <a href="#" class="search-btn"  onclick="search()">搜索</a>--%>
                    <a href="javascript:void(document.form.submit())" class="search-btn" onclick="search()">搜索</a>
               <%--     <a href="#" class="iconfont icon-xq- changelist-btn"  onclick="search()"></a>--%>
                </form>
                <c:choose>
                    <c:when test="${list.size()==0}">
                        <div class="null-tip">
                            <img src="${ctx}/img/null.png" class="img"/>
                            <div class="info">没有内容可供显示</div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${list}" var="stock">

                            <ul class="c-product-list2">
                                <li class="display-flex justify-content-space-between">
                                    <c:choose>
                                        <c:when test="${stock.imgfile}==null">
                                            <img src="${ctx}/img/ala.jpg" class="product-img"/>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${ctx}${stock.imgfile}" class="product-img"/>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="product-detail">
                                        <div class="name">${stock.goodname}</div>
                                        <div class="price">
                                            <span class="inventory">库存:&nbsp;&nbsp;${stock.stock}</span>
                                        </div>
                                    </div>
                                </li>
                            </ul>

                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="page-content tab" id="tab-2">
                <c:choose>
                    <c:when test="${list1.size()==0}">
                        <div class="null-tip">
                            <img src="${ctx}/img/null.png" class="img"/>
                            <div class="info">没有内容可供显示</div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${list1}" var="stock">
                            <ul class="c-product-list2">
                                <li class="display-flex justify-content-space-between">
                                    <c:choose>
                                        <c:when test="${stock.imgfile}==null">
                                            <img src="${ctx}/img/ala.jpg" class="product-img"/>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${ctx}${stock.imgfile}" class="product-img"/>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="product-detail">
                                        <div class="name">${stock.goodname}</div>
                                        <div class="price">
                                            <span class="inventory">库存:&nbsp;&nbsp;${stock.stock}</span>
                                        </div>
                                    </div>
                                </li>
                            </ul>

                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="page-content tab" id="tab-3">
                <c:choose>
                    <c:when test="${list2.size()==0}">
                        <div class="null-tip">
                            <img src="${ctx}/img/null.png" class="img"/>
                            <div class="info">没有内容可供显示</div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${list2}" var="stock">
                            <ul class="c-product-list2">
                                <li class="display-flex justify-content-space-between">
                                    <c:choose>
                                        <c:when test="${stock.imgfile}==null">
                                            <img src="${ctx}/img/ala.jpg" class="product-img"/>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${ctx}${stock.imgfile}" class="product-img"/>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="product-detail">
                                        <div class="name">${stock.goodname}</div>
                                        <div class="price">
                                            <span class="inventory">库存:&nbsp;&nbsp;${stock.stock}</span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="page-content tab" id="tab-4">
                <c:choose>
                    <c:when test="${list3.size()==0}">
                        <div class="null-tip">
                            <img src="${ctx}/img/null.png" class="img"/>
                            <div class="info">没有内容可供显示</div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${list3}" var="stock">
                            <ul class="c-product-list2">
                                <li class="display-flex justify-content-space-between">
                                    <c:choose>
                                        <c:when test="${stock.imgfile}==null">
                                            <img src="${ctx}/img/ala.jpg" class="product-img"/>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${ctx}${stock.imgfile}" class="product-img"/>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="product-detail">
                                        <div class="name">${stock.goodname}</div>
                                        <div class="price">
                                            <span class="inventory">库存:&nbsp;&nbsp;${stock.stock}</span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="page-content tab" id="tab-5">
                <c:choose>
                    <c:when test="${list4.size()==0}">
                        <div class="null-tip">
                            <img src="${ctx}/img/null.png" class="img"/>
                            <div class="info">没有内容可供显示</div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${list4}" var="stock">
                            <ul class="c-product-list2">
                                <li class="display-flex justify-content-space-between">
                                    <c:choose>
                                        <c:when test="${stock.imgfile}==null">
                                            <img src="${ctx}/img/ala.jpg" class="product-img"/>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${ctx}${stock.imgfile}" class="product-img"/>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="product-detail">
                                        <div class="name">${stock.goodname}</div>
                                        <div class="price">
                                            <span class="inventory">库存:&nbsp;&nbsp;${stock.stock}</span>
                                        </div>
                                    </div>
                                </li>
                            </ul>

                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>


<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>

<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
<script src="${ctx}/js/public.js"></script>

<script type="text/javascript">
    function search() {
        console.log("进入搜索方法");
        document.getElementById("form").submit();

    }

</script>
</body>
</html>