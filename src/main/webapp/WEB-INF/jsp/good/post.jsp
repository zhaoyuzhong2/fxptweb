<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/31/031
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en" class="md">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
    <title>物流订单下单</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
    <link rel="stylesheet" href="${ctx}/css/showBo.css">
    <script src="${ctx}/js/showBo.js"></script>
</head>
<body class="page-placeorder">
<form id="form" action="${ctx}/ug/addpost">
    <input id="result" type="hidden" value="${result}"/>
    <input id="userid" type="hidden" value="${userid}"/>
<div id="app">
    <div class="page-subtip">请核对订单信息！</div>
    <div class="order-line"></div>

    <a href="#" class="local-btn sheet-open" data-sheet=".add-address">
        <div><i class="local-icon"></i><span class="txt">请先填写地址</span></div>
        <div class="to-icon"></div>
    </a>
    <c:forEach var="ug" items="${ugs}">
    <div class="product">
        <div class="left">
            <img class="product-img" src="${ctx}/img/product_img.png"/>
            <div class="product-name">${ug.goodname}</div>
        </div>
        <div class="right text-right">
            <div class="price">¥${ug.buyprice}</div>
            <div class="num">X${ug.buynum}</div>
        </div>
    </div>
    </c:forEach>
    <div class="freight">
        <div class="txt">运费</div>
        <div class="price">¥0</div>
    </div>

    <ul class="order-detail">
        <li>
            <div>配送方式</div>
            <div>快递</div>
        </li>
        <li>
            <div>卖家留言</div>
            <input class="word-ipt" type="text" id="message" value=""/>
        </li>
        <li>
            <div>商品总价</div>
            <div class="price">¥${totalprice}</div>
        </li>
    </ul>

    <div class="submit-order">
        <div class="money"><span class="total">合计：</span><span class="price">¥${totalprice}</span></div>
        <a href="./truck_entry_complete.html" class="btn external">提交订单</a>
    </div>

    <div class="sheet-modal add-address">
        <div class="toolbar">
            <div class="toolbar-inner">
                <div class="right" style="visibility:hidden;"><a class="link sheet-close" href="#"></a></div>
                <div class="left">新建收货地址</div>
                <div class="right"><a class="link sheet-close" href="#"></a></div>
            </div>
        </div>
        <div class="sheet-modal-inner">
            <div class="intel-address display-flex justify-content-space-between align-items-center">
                <div class="display-flex left">
                    <div class="intel-icon"></div>
                    <div class="name">智能地址</div>
                    <div class="tip display-flex align-items-center flex-shrink-1">(在下方粘贴整段地址信息，系统自动识别)</div>
                </div>
                <div class="to-icon"></div>
            </div>

            <div class="list inline-labels no-hairlines-md list-ipt">
                <ul>
                    <li class="item-content item-input">
                        <div class="item-inner">
                            <div class="item-title item-label">收货人</div>
                            <div class="item-input-wrap">
                                <input type="text" placeholder="请填写收货人" id="postname" onblur="queryAdd()">
                            </div>
                        </div>
                    </li>
                    <li class="item-content item-input">
                        <div class="item-inner">
                            <div class="item-title item-label">手机号码</div>
                            <div class="item-input-wrap">
                                <input type="password" placeholder="请填写手机号码" id="postmobile">
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

            <%--<div class="list list-link">--%>
                <%--<ul>--%>
                    <%--<li>--%>
                        <%--<a href="#" class="item-link item-content">--%>
                            <%--<div class="item-inner">--%>
                                <%--<div class="item-title">省市区选择</div>--%>
                                <%--<div class="item-after">请选择</div>--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</div>--%>

            <textarea class="street-info" placeholder="请输入收货地址" id="postadd"></textarea>

            <div class="obtain-address display-flex justify-content-flex-end">
                <a href="#" class="weixin-address">获取微信收货地址</a>
                <a href="#" class="clear-address" onclick="clear()">清空当前地址</a>
            </div>
        </div>
        <button class="button button-fill button-big save-btn sheet-close" onclick="save()">保存</button>
    </div>
</div>


<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>
</form>
<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
<script>
    function clear() {
        $("#postadd").val("");
    }

    function queryAdd() {
        var postname = $("#postname").val();
        var userid = $("#userid").val();
        $.post("${ctx}/ug/queryAdd",{postname:postname,userid:userid},function (d) {
            if(d=="ajaxfail"){
                Showbo.Msg.confirm1("会话过期,请重新登录!",function(btn){
                    if(btn=="yes"){
                        window.location.href="${ctx}/sys/index";
                    }
                });
            }else {
                if(d.length<1){
                    Showbo.Msg.alert('该用户之前没有购买无法检测到地址');
                }else {
                    var fh = d.split("###");
                    $("#postmobile").val(fh[0]);
                    $("#postadd").val(fh[1]);
                }
            }

        });
    }

function save() {
    var postname = $("#postname").val();
    var postadd = $("#postadd").val();
    var postmobile = $("#postmobile").val();

    if(postname.length<1){
        Showbo.Msg.alert('请填写邮寄人信息！');
        return false;
    }

    if(postmobile.length<1){
        Showbo.Msg.alert('请填写手机号码！');
        return false;
    }


    if(postadd.length<1){
        Showbo.Msg.alert('请填写收货地址！');
        return false;
    }

    document.getElementById("form").submit();

}
</script>
</body>
</html>