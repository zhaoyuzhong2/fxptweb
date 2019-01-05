<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/27/027
  Time: 20:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <a href="#tab-2" class="tab-link">待确认</a>
                <a href="#tab-3" class="tab-link">待付款</a>
                <a href="#tab-4" class="tab-link">待发货</a>
                <a href="#tab-5" class="tab-link">待收货</a>
            </div>
        </div>
        <div class="tabs">
            <div class="page-content tab tab-active" id="tab-1">
                <div class="pagenav-content" style="display: block;">
                    <form class="c-searchbar display-flex align-items-center">
                        <div class="input-wrap display-flex align-items-center">
                            <i class="iconfont icon-sousuo"></i>
                            <input class="search-ipt" type="text" placeholder="订单号/姓名/电话"/>
                            <a href="#" class="iconfont icon-cancel-1 clear-btn"></a>
                        </div>
                        <a href="#" class="search-btn">搜索</a>
                        <a href="#" class="iconfont icon-xq- changelist-btn"></a>
                    </form>
                    <c:choose>
                        <c:when test="${list}.size==0">
                             <div class="info">没有内容可供显示哦</div>
                        </c:when>
                        <c:otherwise>

                            <ul class="order-list">
                                <c:forEach items="${list}" var="map" >
                                    <li>
                                        <div class="top">
                                            <div class="number">map.code</div>
                                            <div class="status">已完成</div>
                                        </div>
                                        <div class="tag-box"><span class="tag">云订单</span></div>
                                        <c:forEach items="${map.list}" var="usergood">
                                            <div class="order-detail">
                                                <img src="${ctx}${usergood.imgfile}" width="70" height="70" class="pro-img"/>
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
                                            <div class="right"><span class="pri">总计:&nbsp;&nbsp;¥map.totalprice</span><span class="freight">( 运费:&nbsp;&nbsp;0.00 )</span></div>
                                        </div>
                                        <div class="btn-box">
                                            <a href="${ctx}/ug/wantToBy" class="btn">再次购买</a>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                            <div class="loading-info">已全部加载</div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="page-content tab" id="tab-2">
                <div class="null-tip">
                    <img src="../../img/null.png" class="img"/>
                    <div class="info">没有内容可供显示</div>
                </div>
            </div>

            <div class="page-content tab" id="tab-3">
                <div class="null-tip">
                    <img src="../../img/null.png" class="img"/>
                    <div class="info">没有内容可供显示哦</div>
                </div>
            </div>

            <div class="page-content tab" id="tab-4">
                <div class="null-tip">
                    <img src="../../img/null.png" class="img"/>
                    <div class="info">没有内容可供显示</div>
                </div>
            </div>

            <div class="page-content tab" id="tab-5">
                <div class="null-tip">
                    <img src="../../img/null.png" class="img"/>
                    <div class="info">没有内容可供显示哦</div>
                </div>
            </div>
        </div>
    </div>
</div>


<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>

<script src="../../js/framework7.min.js"></script>
<script src="../../js/jquery.min.js"></script>
<script src="../../js/my-app.js"></script>
<script src="../../js/public.js"></script>




<script type="text/javascript">
    var ids = ${ids};

    //删除平台
    function addShoping() {
        var id = ids.split(",");
        var param = "";
        if(id.length<1){
            Showbo.Msg.alert('没有商品，无法加入进货车！');
            return false;
        }else{
            for(var i=0;i<id.length;i++){
                var num =$("#num"+id[i]).val();//直接拼接字符串就可以了
                param = param + id+"#"+num+",";
            }

            $("#param").val(param);
            document.getElementById("form").submit();
        }


    }
    </script>
</body>
</html>
