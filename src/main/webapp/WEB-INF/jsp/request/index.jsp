<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/6/006
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
    <title>邀请代理</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/showBo.js"></script>
    <script src="${ctx}/js/framework7.min.js"></script>
    <script src="${ctx}/js/my-app.js"></script>


</head>
<body class="page-app-agent2">
<div id="app">
    <div class="page">
        <div class="page-content">
            <form name="form" id="form" action="${ctx}/request/createReq">
                <input type="hidden" name="userid" id="userid" value="${userid}"/>
                <input type="hidden" name="result" id="result" value=""/>
                <input type="hidden" name="roleid" id="roleid" value="${roleid}"/>
            <div class="wrapper">
                <div class="title">邀请代理想代理的产品(单选)</div>
                <div class="list media-list radio-list">
                    <ul>
                        <li>
                            <label class="item-radio item-content">
                                <input type="radio" name="agent-product" value="2" checked />
                                <div class="item-inner">
                                    <div class="item-title-row">
                                        <div class="item-title">全部</div>
                                    </div>
                                    <div class="item-subtitle">健康减脂，从唤醒记忆开始</div>
                                </div>
                                <i class="iconfont icon-past"></i>
                                <div class="item-bg"></div>
                            </label>
                        </li>
                    </ul>
                </div>

                <div class="title">您想发展代理的级别(可单选或多选)</div>
                <div class="list media-list radio-list">
                    <ul>
                        <c:forEach items="${rs}" var="r">
                        <li>
                            <label class="item-radio item-content">
                                <input type="checkbox" name="check" value="${r.id}" checked />
                                <div class="item-inner">
                                    <div class="item-title-row">
                                        <div class="item-title">${r.name}<span class="tag">
                                            <c:choose>

                                                <c:when test="${roleid == r.id}">

                                                    平级推荐

                                                </c:when>
                                                <c:otherwise>

                                                    跨级推荐

                                                </c:otherwise>

                                            </c:choose>

                                        </span></div>
                                    </div>
                                    <div class="item-subtitle">首次进货金额至少达到:<span class="money">¥${r.price}</span>元</div>
                                </div>
                                <i class="iconfont icon-past"></i>
                                <div class="item-bg"></div>
                            </label>
                        </li>
                        </c:forEach>


                    </ul>
                </div>
            </div>

            <a href="#" class="col button button-big button-fill c-bottom-btn external" id="create" onclick="createReq()">生成邀请链接</a>
                </form>

        </div>
    </div>
</div>

<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>


<!--<script src="../../js/public.js"></script>-->
<script>
function createReq() {
    $("#create").attr("disabled", true);//使按钮失效
    var result = "";
    $('input[name="check"]:checked').each(function(){
        result = result + $(this).val() +",";
    });
    $("#result").val(result);

    if(result.length<1){
        //Showbo.Msg.alert('请选择商品！');
        alert('请至少选择一个代理级别！');
        return false;
    }


    document.getElementById("form").submit();

}
</script>
</body>
</html>
