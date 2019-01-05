
<%--
  Created by IntelliJ IDEA.
  User: james
  Date: 2018/12/26
  Time: 15:26
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
    <title>申请代理商</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
    <link rel="stylesheet" href="${ctx}/css/showBo.css">
</head>
<body class="page-app-agent2">
<div id="app">
    <div class="page">
        <div class="page-content">
            <form name="form" action="${ctx}/user/reg3" id="form">
                <input type="hidden" id="mobile" value="${mobile}"/>
                <input type="hidden" id="reqUserid" value="${reqUserid}"/>
                <input type="hidden" id="reqUsername" value="${reqUsername}"/>

            <div class="wrapper">
                <div class="title">选择您想代理的商品</div>
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

                <div class="title">选择代理商级别</div>
                <div class="list media-list radio-list">
                    <c:forEach var="r" items="${rs}">
                    <ul>
                        <li>
                            <label class="item-radio item-content">
                                <input type="radio" id="roleid" name="agent-class" value="${r.id}" />
                                <div class="item-inner">
                                    <div class="item-title-row">
                                        <div class="item-title">${r.name}</div>
                                    </div>
                                    <div class="item-subtitle">首次进货金额至少达到:<span class="money">¥${r.price}</span>元</div>
                                </div>
                                <i class="iconfont icon-past"></i>
                                <div class="item-bg"></div>
                            </label>
                        </li>
                    </ul>

                    </c:forEach>
                </div>
            </div>

            <a href="#" class="col button button-big button-fill c-bottom-btn external" onclick="queren()">下一步</a>
            </form>
        </div>
    </div>
</div>

<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>

<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
<script src="${ctx}/js/showBo.js"></script>
<!--<script src="../../js/public.js"></script>-->
<script type="text/javascript">
    //删除平台
    function queren() {
        var roleid=$('input:radio[name="roleid"]:checked').val();
        if(roleid==null){
            Showbo.Msg.alert("请选择代理级别!");
            return false;
        }
        document.getElementById("form").submit();




    }
</script>
</body>

</html>
