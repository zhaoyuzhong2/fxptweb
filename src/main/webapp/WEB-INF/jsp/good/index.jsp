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
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
    <title>商品分类</title>
    <link rel="stylesheet" href="${ctx}/css/public.css">
    <link rel="stylesheet" href="${ctx}/css/showBo.css">
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/showBo.js"></script>
    <style>
        html {
            height: 100%;
        }
    </style>
</head>
<body class="page-stock">

<div class="page-tip">向总部（0431-81752818）进货，购买后商品将会邮寄给您。</div>
<form name="form" action="${ctx}/ug/shopingCar" id="form">
    <input type="hidden" id="param" value=""/>

<div class="stock-list">
    <ul class="class-list">
        <li>
            <a href="javascript:void(0);">
                <i class="class-icon icon1"></i>
                <span class="name">食品</span>
            </a>
        </li>
    </ul>
    <div class="product-list">
        <h3 class="title">蛋圆饼干</h3>
        <ul class="list-detail">
            <c:forEach items="${gs}" var="g">
            <li>
                <img src="${ctx}/img/product1.png" width="70" height="70"/>
                <div class="product-detail">
                    <div class="name">${g.name}</div>
                    <div class="price"><span class="pri">¥${g.price}</span><span class="inventory">库存:&nbsp;&nbsp;${g.stock}</span></div>
                    <div class="num clearfix">
                        <div class="right">
                            <%--<i class="sub-btn" id="jian${g.id}" onclick="changenum(${g.id},-1)">-</i>--%>
                            <input class="val" type="text" id="num${g.id}" value="${g.count}" />
                            <%--<i class="add-btn" id="jia${g.id}"  onclick="changenum(${g.id},1)">＋</i>--%>
                        </div>
                    </div>
                </div>
            </li>
            </c:forEach>
        </ul>
    </div>
</div>

<div class="stock-bar">
    <div class="price">合计:<span id="total">¥${price}</span></div>
    <a href="#" class="stock-btn" onclick="addShoping()">
        <i class="icon-cart"></i>
        <span class="txt" id="totalnum">进货车（${total}）</span>
    </a>
</div>

<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>

</form>

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
