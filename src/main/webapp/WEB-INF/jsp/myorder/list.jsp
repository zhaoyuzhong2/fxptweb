<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/27/027
  Time: 20:51
  To change this template use File | Settings | File Templates.
--%>
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
    <title>我的进货订单列表</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-mypurchase-orderlist">
<div id="app">
    <div class="page">
        <div class="toolbar tabbar tabbar-custom">
            <div class="toolbar-inner">
                <!-- Links have "tab-link" class instead of just "link" to switch tabs -->
                <a href="#tab-1" class="tab-link tab-link-active">全部</a>
                <a href="#tab-3" class="tab-link">待付款</a>
                <a href="#tab-4" class="tab-link">待发货</a>
                <a href="#tab-5" class="tab-link">待收货</a>
            </div>
        </div>
        <div class="tabs">
            <div class="page-content tab tab-active" id="tab-1">
                <div class="pagenav-content" style="display: block;">
                    <form id="form" name="form" class="c-searchbar c-searchbar-fixed display-flex align-items-center" action="${ctx}/myorder/getList" method="post">
                        <div class="input-wrap display-flex align-items-center">
                            <i class="iconfont icon-sousuo"></i>
                            <input class="search-ipt" id="search_name" name="search_name" style="text-align: left;width: 100%" value="${search_name}" type="text" placeholder="订单号/姓名/电话"/>
                            <a href="#" class="iconfont icon-cancel-1 clear-btn"></a>
                        </div>
                        <%--<a  href="#" class="search-btn"  onclick="search()">搜索</a>--%>
                        <%--<a href="javascript:void(0)" class="search-btn"  onclick="search()">搜索</a>--%>
                        <a href="javascript:void(document.form.submit())" class="search-btn"  >搜索</a>
                      <%--  <button  class="search-btn" style="width: 50px;text-align: center" onclick="search()">搜索</button>--%>
                        <a href="#" class="iconfont icon-xq- changelist-btn"  ></a>
 <%--                       <button class="col button button-big button-fill button-round c-block-btn" onclick="search()">搜索</button>--%>
                    </form>
                    <c:choose>
                        <c:when test="${list.size()==0}">
                             <div class="info">没有商品可供显示哦</div>
                        </c:when>
                        <c:otherwise>
                            <ul class="order-list">
                                <c:forEach items="${list}" var="map" >
                                    <li>
                                        <div class="top">
                                            <div class="number">订单编号: ${map.code}</div>
                                            <div class="status">已完成</div>
                                        </div>
                                        <div class="tag-box"><span class="tag">云订单</span></div>
                                        <c:forEach items="${map.goodlist}" var="usergood">
                                            <div class="order-detail">
                                                <c:choose>
                                                    <c:when test="${usergood.imgfile}==null">
                                                        <img src="${ctx}/img/ala.jpg" width="70" height="70" class="pro-img"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="${ctx}/img_goods/${usergood.imgfile}" width="70" height="70" class="pro-img"/>
                                                    </c:otherwise>
                                                </c:choose>
                                                <div class="pro">
                                                    <div class="pro-name">${usergood.goodname}</div>
                                                    <div class="price-box">
                                                        <div class="price">¥${usergood.buyprice}</div>
                                                        <div class="num">×${usergood.buynum}</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <div class="total-price clearfix">
                                            <div class="right"><span class="pri">总计:&nbsp;&nbsp;¥${map.totalprice}</span><span class="freight">( 运费:&nbsp;&nbsp;0.00 )</span></div>
                                        </div>
                                        <%--<div class="btn-box">--%>
                                            <%--<a href="${ctx}/ug/wantToBy" class="btn">再次购买</a>--%>
                                        <%--</div>--%>
                                    </li>
                                </c:forEach>
                            </ul>
                            <div class="loading-info">已全部加载</div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <%--<div class="page-content tab" id="tab-2">--%>
                <%--<div class="null-tip">--%>
                    <%--<c:choose>--%>
                    <%--<c:when test="${list0.size()==0}">--%>
                        <%--<div class="info">没有商品可供显示哦</div>--%>
                    <%--</c:when>--%>
                    <%--<c:otherwise>--%>
                        <%--<ul class="order-list">--%>
                            <%--<c:forEach items="${list0}" var="map" >--%>
                                <%--<li>--%>
                                    <%--<div class="top">--%>
                                        <%--<div class="number">订单编号: ${map.code}</div>--%>
                                        <%--<div class="status">已完成</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="tag-box"><span class="tag">云订单</span></div>--%>
                                    <%--<c:forEach items="${map.goodlist}" var="usergood">--%>
                                        <%--<div class="order-detail">--%>
                                            <%--<c:choose>--%>
                                                <%--<c:when test="${usergood.imgfile}==null">--%>
                                                    <%--<img src="${ctx}/img/ala.jpg" width="70" height="70" class="pro-img"/>--%>
                                                <%--</c:when>--%>
                                                <%--<c:otherwise>--%>
                                                    <%--<img src="${ctx}${usergood.imgfile}" width="70" height="70" class="pro-img"/>--%>
                                                <%--</c:otherwise>--%>
                                            <%--</c:choose>--%>
                                            <%--<img src="${ctx}${usergood.imgfile}" width="70" height="70" class="pro-img"/>--%>
                                            <%--<div class="pro">--%>
                                                <%--<div class="pro-name">${usergood.goodname}</div>--%>
                                                <%--<div class="price-box">--%>
                                                    <%--<div class="price">¥${usergood.buyprice}</div>--%>
                                                    <%--<div class="num">×${usergood.buynum}</div>--%>
                                                <%--</div>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</c:forEach>--%>
                                    <%--<div class="total-price clearfix">--%>
                                        <%--<div class="right"><span class="pri">总计:&nbsp;&nbsp;¥${map.totalprice}</span><span class="freight">( 运费:&nbsp;&nbsp;0.00 )</span></div>--%>
                                    <%--</div>--%>
                                    <%--<div class="btn-box">--%>
                                        <%--<a href="${ctx}/ug/wantToBy" class="btn">再次购买</a>--%>
                                    <%--</div>--%>
                                <%--</li>--%>
                            <%--</c:forEach>--%>
                        <%--</ul>--%>
                        <%--<div class="loading-info">已全部加载</div>--%>
                    <%--</c:otherwise>--%>
                <%--</c:choose>--%>
                <%--</div>--%>
            <%--</div>--%>

            <div class="page-content tab" id="tab-3">
                <c:choose>
                    <c:when test="${list1.size()==0}">
                        <div class="null-tip">
                            <div class="info">没有商品可供显示哦</div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <ul class="order-list">
                            <c:forEach items="${list1}" var="map" >
                                <li>
                                    <div class="top">
                                        <div class="number">订单编号: ${map.code}</div>
                                        <div class="status">未付款</div>
                                    </div>
                                    <div class="tag-box"><span class="tag">云订单</span></div>
                                    <c:forEach items="${map.goodlist}" var="usergood">
                                        <div class="order-detail">
                                            <c:choose>
                                                <c:when test="${usergood.imgfile}==null">
                                                    <img src="${ctx}/img/ala.jpg" width="70" height="70" class="pro-img"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${ctx}/img_goods/${usergood.imgfile}" width="70" height="70" class="pro-img"/>
                                                </c:otherwise>
                                            </c:choose>

                                            <div class="pro">
                                                <div class="pro-name">${usergood.goodname}</div>
                                                <div class="price-box">
                                                    <div class="price">¥${usergood.buyprice}</div>
                                                    <div class="num">×${usergood.buynum}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <div class="total-price clearfix">
                                        <div class="right"><span class="pri">总计:&nbsp;&nbsp;¥${map.totalprice}</span><span class="freight">( 运费:&nbsp;&nbsp;0.00 )</span></div>
                                    </div>
                                    <%--<div class="btn-box">--%>
                                        <%--<a href="${ctx}/ug/wantToBy" class="btn">再次购买</a>--%>
                                    <%--</div>--%>
                                </li>
                            </c:forEach>
                        </ul>
                        <div class="loading-info">已全部加载</div>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="page-content tab" id="tab-4">
                <c:choose>
                    <c:when test="${list2.size()==0}">
                        <div class="null-tip">
                            <div class="info">没有商品可供显示哦</div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <ul class="order-list">
                            <c:forEach items="${list2}" var="map" >
                                <li>
                                    <div class="top">
                                        <div class="number">订单编号: ${map.code}</div>
                                        <div class="status">未发货</div>
                                    </div>
                                    <div class="tag-box"><span class="tag">云订单</span></div>
                                    <c:forEach items="${map.goodlist}" var="usergood">
                                        <div class="order-detail">
                                            <c:choose>
                                                <c:when test="${usergood.imgfile}==null">
                                                    <img src="${ctx}/img/ala.jpg" width="70" height="70" class="pro-img"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${ctx}/img_goods/${usergood.imgfile}" width="70" height="70" class="pro-img"/>
                                                </c:otherwise>
                                            </c:choose>

                                            <div class="pro">
                                                <div class="pro-name">${usergood.goodname}</div>
                                                <div class="price-box">
                                                    <div class="price">¥${usergood.buyprice}</div>
                                                    <div class="num">×${usergood.buynum}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <div class="total-price clearfix">
                                        <div class="right"><span class="pri">总计:&nbsp;&nbsp;¥${map.totalprice}</span><span class="freight">( 运费:&nbsp;&nbsp;0.00 )</span></div>
                                    </div>
                                    <%--<div class="btn-box">--%>
                                        <%--<a href="${ctx}/ug/wantToBy" class="btn">再次购买</a>--%>
                                    <%--</div>--%>
                                </li>
                            </c:forEach>
                        </ul>
                        <div class="loading-info">已全部加载</div>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="page-content tab" id="tab-5">
                <c:choose>
                    <c:when test="${list3.size()==0}">
                        <div class="null-tip">
                            <div class="info">没有商品可供显示哦</div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <ul class="order-list">
                            <c:forEach items="${list3}" var="map" >
                                <li>
                                    <div class="top">
                                        <div class="number">订单编号:</div>
                                        <div class="status">已发货</div>
                                    </div>
                                    <div class="tag-box">
                                        <span class="tag">云订单</span>&nbsp;&nbsp;
                                        <c:if test="${map.postcom!=null}">
                                            ${map.postcom}:${map.postnum}
                                        </c:if>
                                    </div>
                                    <c:forEach items="${map.goodlist}" var="usergood">
                                        <div class="order-detail">
                                            <c:choose>
                                                <c:when test="${usergood.imgfile}==null">
                                                    <img src="${ctx}/img/ala.jpg" width="70" height="70" class="pro-img"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${ctx}/img_goods/${usergood.imgfile}" width="70" height="70" class="pro-img"/>
                                                </c:otherwise>
                                            </c:choose>

                                            <div class="pro">
                                                <div class="pro-name">${usergood.goodname}</div>
                                                <div class="price-box">
                                                    <div class="price">¥${usergood.buyprice}</div>
                                                    <div class="num">×${usergood.buynum}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <div class="total-price clearfix">
                                        <div class="right"><span class="pri">总计:&nbsp;&nbsp;¥${map.totalprice}</span><span class="freight">( 运费:&nbsp;&nbsp;0.00 )</span></div>
                                    </div>
                                    <%--<div class="btn-box">--%>
                                        <%--<a href="${ctx}/ug/wantToBy" class="btn">再次购买</a>--%>
                                    <%--</div>--%>
                                </li>
                            </c:forEach>
                        </ul>
                        <div class="loading-info">已全部加载</div>
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

    $(function(){
        function search() {
            console.log("进入搜索方法");
            document.getElementById("form").submit();

        }
    });
   function search() {
       var search_name=$("search_name").val();

       console.log("进入搜索方法");
       document.getElementById("form").submit();

   }
</script>
</body>
</html>
