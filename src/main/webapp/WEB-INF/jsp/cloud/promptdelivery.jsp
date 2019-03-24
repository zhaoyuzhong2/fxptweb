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
    <title>立即提货</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
    <link rel="stylesheet" href="${ctx}/css/showBo.css">
    <script src="${ctx}/js/showBo.js"></script>
</head>
<body class="page-delivery">
<div id="app">
    <div class="page">
        <form id="form" action="${ctx}/cloud/th">
            <input type="hidden" id="param" name="param" value=""/>
        <div class="toolbar toolbar-bottom-md toolbar-bottom-btn">
            <div class="toolbar-inner">
                <span class="link info"><span>合计:</span><span class="num" id="num">0件</span></span>
                <a href="#" class="link cart-btn" onclick="check()"><i class="icon-cart"></i><span>下单提货</span></a>
            </div>
        </div>
        <div class="page-content">
            <c:choose>
                <c:when test="${list.size()==0}">
                    <div class="null-tip">
                        <img src="${ctx}/img/null.png"/>
                        <div class="info">没有内容可供显示</div>
                    </div>
                </c:when>
                <c:otherwise>
                    <ul class="c-cproduct-list">
                        <c:forEach items="${list}" var="stock">
                            <li class="display-flex justify-content-space-between align-items-center">
                                <div class="display-flex">
                                    <c:choose>
                                        <c:when test="${stock.imgfile}==null">
                                            <img src="${ctx}/img/ala.jpg" width="70" height="70" class="product-img"/>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${ctx}${stock.imgfile}" width="70" height="70" class="product-img"/>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="product-detail">
                                        <div class="name">${stock.goodname}</div>
                                        <div class="price"><span class="pri">¥${stock.price}</span><span class="inventory">库存:&nbsp;&nbsp;${stock.stock}</span></div>
                                        <div class="num clearfix">
                                            <div class="right">
                                                    <%--<i class="sub-btn" id="jian${g.id}" onclick="changenum(${g.id},-1)">-</i>--%>
                                                <input class="val" type="text" id="num${stock.id}" value="0" />
                                                    <%--<i class="add-btn" id="jia${g.id}"  onclick="changenum(${g.id},1)">＋</i>--%>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>
        </form>
    </div>
</div>




<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>
<script>
function check() {
    var ids = "${ids}";
    var param = "";
    var total = 0;

    if(ids.length<1){
        Showbo.Msg.alert('没有库存，无法提货！');
        return false;
    }else{

        if(ids.indexOf(",")>0) {
            var id = ids.split(",");
            for (var i = 0; i < id.length; i++) {
                var num = $("#num" + id[i]).val();//直接拼接字符串就可以了

                if (num > 0) {
                    param = param + id[i] + "#" + num + ",";
                }
                total = total + num;
            }
        }else{
            var num = $("#num" + ids).val();//直接拼接字符串就可以了

            if (num > 0) {
                param = param + ids + "#" + num + ",";
            }
            total = total + num;
        }

        if (total < 1) {
            Showbo.Msg.alert('没有输入产品数量，无法提货！');
            return false;
        }

        $("#num").text(total+"件");
        $("#param").val(param);
        Showbo.Msg.confirm('确定要提货吗？',function (btn) {
            if(btn=='yes'){
                document.getElementById("form").submit();
            }
        })


    }
}    
</script>
<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
</body>
</html>