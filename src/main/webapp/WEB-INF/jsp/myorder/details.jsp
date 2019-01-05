<%--
  Created by IntelliJ IDEA.
  User: wangchunwei
  Date: 2019/1/5/
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
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">    <title>代理个人资料</title>
    <title>我的进货订单详情</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-myorder-details">
<div id="app">
    <div class="page">
        <div class="page-content">
            <div class="banner-box">
                <div class="banner display-flex align-items-center">交易完成</div>
            </div>

            <div class="list list-icon">
                <ul>
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-seller"></i></div>
                            <div class="item-inner">
                                <div class="item-title">卖家：聚益恒集团</div>
                                <div class="item-after"><a href="#" class="phone-link"><i class="phone-red2"></i><span class="txt">联系卖家</span></a></div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="display-flex justify-content-space-between product-show">
                <div class="display-flex">
                    <img class="product-img" src="../../img/product1.png"/>
                    <div class="product-name">唤醒记忆减脂餐</div>
                </div>
                <div class="right display-flex justify-content-space-between text-align-right">
                    <div class="price">¥180</div>
                    <div class="num">X80</div>
                </div>
            </div>

            <ul class="proinfo-list">
                <li>
                    <div><span>买家留言:</span><span class="message-con">无</span></div>
                </li>
                <li>
                    <div>支付方式</div>
                    <div class="pay-method">贷款支付</div>
                </li>
                <li>
                    <div>商品总价</div>
                    <div class="pay-method">¥14400.00</div>
                </li>
                <li>
                    <div></div>
                    <div class="pay-method"><span>合计:</span><span class="price">¥14400.00</span></div>
                </li>
            </ul>

            <ul class="trade-detail">
                <li>订单编号：2018042709425027823</li>
                <li>下单时间：2018-04-27 09:42:52</li>
                <li>付款时间：2018-04-27 09:43:02</li>
                <li>发货时间：2018-04-27 09:43:39</li>
                <li>成交时间：2018-04-27 09:43:38</li>
            </ul>

            <div class="bottom display-flex justify-content-flex-end">
                <a class="buy-btn" href="#">再次购买</a>
            </div>

            <a href="javascript:history.back(-1);" class="goback" id="goBack"></a>
        </div>
    </div>
</div>




<script src="../../js/framework7.min.js"></script>
<script src="../../js/jquery.min.js"></script>
<script src="../../js/my-app.js"></script>


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
