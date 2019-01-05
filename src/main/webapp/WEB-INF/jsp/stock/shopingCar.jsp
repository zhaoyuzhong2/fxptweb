<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/30/030
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
    <title>进货车-结算</title>
    <link rel="stylesheet" href="${ctx}/css/public.css">
    <link rel="stylesheet" href="${ctx}/css/showBo.css">
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/showBo.js"></script>
    <style>

    </style>
</head>
<body class="page-truck-entry">
<div class="top">
    <div><span>进货车</span><span class="num">（${total}）</span></div>
    <%--<a class="edit-btn" href="javascript:void(0);">编辑</a>--%>
</div>

<c:forEach var="ug" items="${ugs}">
<div class="product">
    <div class="left">
        <label class="check">
            <input type="checkbox" id="check" name="check" value="${ug.id}" checked/>
            <i class="check-icon"></i>
        </label>
        <img class="product-img" src="${ctx}/img/product_img.png"/>
        <div class="info">
            <div class="product-name">${ug.goodname}</div>
            <div class="price">¥${ug.buyprice}</div>
        </div>
    </div>

        <span>X${ug.buynum}</span>

</div>
</c:forEach>

<div class="bottom">
    <label class="check-custom">
        <input type="checkbox" checked/><i class="check-icon"></i><span class="txt">全选</span>
    </label>
    <div class="right">
        <div class="info">
            <div class="money"><span class="total">合计：</span><span class="num">¥${totalprice}</span></div>
            <div class="tip">不含运费</div>
        </div>
        <a class="btn" href="#" onclick="jsall()" id="js">结算&nbsp;(${total})</a>
    </div>
</div>

<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>
<script>
    function jsall() {
        $("#js").attr("disabled", true);//使结算按钮失效
        var result = "";
        $('input[name="check"]:checked').each(function(){
            result = result + $(this).val() +",";
        });


        Showbo.Msg.confirm('确定要结算进货车吗？',function (btn) {
            if(btn=='yes'){
                $.post("${ctx}/ug/jsShopingCar",{result:result},function (d) {
                    if(d=="ajaxfail"){
                        Showbo.Msg.confirm1("会话过期,请重新登录!",function(btn){
                            if(btn=="yes"){
                                window.location.href="${ctx}/main/tologin";
                            }
                        });
                    }else {
                        if(d=="ok"){
                            Showbo.Msg.alert('结算成功');
                            window.location.href="${ctx}/main/index";

                        }else {
                            Showbo.Msg.alert('结算失败');
                        }
                    }

                });
            }
        })
    }
</script>
</body>
</html>
