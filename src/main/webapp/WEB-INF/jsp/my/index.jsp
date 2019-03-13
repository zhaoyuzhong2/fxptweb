<%--
  Created by IntelliJ IDEA.
  User: james
  Date: 2019/1/16
  Time: 9:51
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
    <title>我</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-my">
<div id="app">
    <div class="page">
        <div class="page-content">
            <header class="my-header">
                <div class="my-banner"></div>
                <div class="head-icon">
                    <c:choose>
                        <c:when test="${user.headpath!=null}">
                            <img src="${user.headpath}" width="100%" height="100%"/>
                        </c:when>
                        <c:otherwise>
                            <img src="${ctx}/img/index_head.png" width="100%" height="100%"/>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="user-name">${user.name}</div>
                <div class="tag-box">
                    <div class="tag">
                        <i class="icon"></i>
                        <span class="txt">${user.rolename}</span>
                    </div>
                </div>
                <div class="user-info">
                    <span class="tel">${user.mobile}</span>
                </div>
            </header>

            <ul class="list-box">
                <li>
                    <a href="${ctx}/my/txye" class="external">
                        <div class="left">
                            <i class="icon my-icon1"></i>
                            <div>
                                <div class="name">可提现账户</div>
                                <div class="small-name">待结算0.00元</div>
                            </div>
                        </div>
                        <div class="right">
                            <div class="txt">可提现:<span>${byshouru}元</span></div>
                            <div class="to-icon"></div>
                        </div>
                    </a>
                </li>
            </ul>

            <ul class="list-box">
                <li>
                    <a href="#">
                        <div class="left">
                            <i class="icon my-icon2"></i>
                            <div>
                                <div class="name">货款账户</div>
                            </div>
                        </div>
                        <div class="right">
                            <div class="txt">货款余额:<span>0.00元</span></div>
                            <div class="to-icon"></div>
                        </div>
                    </a>
                </li>
            </ul>

            <%--<ul class="list-box">--%>
                <%--<li>--%>
                    <%--<a href="#">--%>
                        <%--<div class="left">--%>
                            <%--<i class="icon my-icon3"></i>--%>
                            <%--<div>--%>
                                <%--<div class="name">联创团队管理</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="right">--%>
                            <%--<div class="to-icon"></div>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
            <%--</ul>--%>

            <ul class="list-box">
                <li>
                    <a href="${ctx}/my/sztj" class="external">
                        <div class="left">
                            <i class="icon my-icon4"></i>
                            <div>
                                <div class="name">账单</div>
                            </div>
                        </div>
                        <div class="right">
                            <div class="to-icon"></div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="${ctx}/my/spchtj" class="external">
                        <div class="left">
                            <i class="icon my-icon5"></i>
                            <div>
                                <div class="name">商品出货统计</div>
                            </div>
                        </div>
                        <div class="right">
                            <div class="to-icon"></div>
                        </div>
                    </a>
                </li>
            </ul>

            <ul class="my-nav clearfix">
                <li>
                    <a href="#">
                        <i class="icon icon1"></i>
                        <div class="name">保证金</div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon icon2"></i>
                        <div class="name">收款账号</div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon icon3"></i>
                        <div class="name">内购商城</div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="icon icon4"></i>
                        <div class="name">内购订单</div>
                    </a>
                </li>
                <li>
                    <a href="tel:${zbtel}" class="open-vertical">
                        <i class="iconfont icon-kefufenxiermaikefu"></i>
                        <div class="name">联系总部</div>
                    </a>
                </li>
            </ul>

            <div class="footer">
                <img class="logo-icon" src="${ctx}/img/logo.png"/>
                <div class="txt">久康沅</div>
            </div>

        </div>
    </div>
</div>
<div class="bottom-navbar">
    <a href="${ctx}/main/index" class="external">
        <i class="iconfont icon-daili"></i>
        <span class="text">代理</span>
    </a>
    <a href="${ctx}/message/index" class="external">
        <i class="iconfont icon-xiaoxi"></i>
        <span class="text">消息</span>
    </a>
    <a href="${ctx}/my/index" class="active external">
        <i class="iconfont icon-wode1"></i>
        <span class="text">我</span>
    </a>
</div>


<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
<script>
    /*点击联系总部*/
    $$('.open-vertical').on('click', function () {
        app.dialog.create({
            title: '',
            text: '',
            buttons: [
                {
                    text: '13600556666',
                },

            ],
            verticalButtons: true,
        }).open();
    });
</script>
</body>
</html>
