<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/16/016
  Time: 22:07
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
    <title>提现余额</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-cash-sum">
<div id="app">
    <div class="page">
        <div class="page-content">
            <div class="c-top-banner">
                <div class="wave-box">
                    <div class="waves1">
                        <img src="${ctx}/img/wave1.png" class="wave">
                        <img src="${ctx}/img/wave1.png" class="wave">
                        <img src="${ctx}/img/wave1.png" class="wave">
                        <img src="${ctx}/img/wave1.png" class="wave">
                    </div>
                    <div class="waves2">
                        <img src="${ctx}/img/wave2.png" class="wave">
                        <img src="${ctx}/img/wave2.png" class="wave">
                        <img src="${ctx}/img/wave2.png" class="wave">
                        <img src="${ctx}/img/wave2.png" class="wave">
                    </div>
                    <div class="waves3">
                        <img src="${ctx}/img/wave3.png" class="wave">
                        <img src="${ctx}/img/wave3.png" class="wave">
                        <img src="${ctx}/img/wave3.png" class="wave">
                        <img src="${ctx}/img/wave3.png" class="wave">
                    </div>
                </div>
                <div class="content">
                    <div class="info">可提现余额</div>
                    <div class="money">1344.00</div>
                    <div class="info">满100.00元可提现</div>
                </div>
            </div>

            <ul class="c-money-list">
                <li>
                    <a href="#" class="external">
                        <div class="money">¥<span class="num">0.00</span></div>
                        <div class="name">待结算</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="external">
                        <div class="money">¥<span class="num">0.00</span></div>
                        <div class="name">提现中</div>
                    </a>
                </li>
                <li>
                    <a href="#" class="external">
                        <div class="money">¥<span class="num">0.00</span></div>
                        <div class="name">充值货款中</div>
                    </a>
                </li>
            </ul>

            <ul class="list-box">
                <li>
                    <a href="#">
                        <div class="left">
                            <i class="iconfont icon-money" style="color: #f8715d"></i>
                            <div>
                                <div class="name">收入账单</div>
                            </div>
                        </div>
                        <div class="right">
                            <div class="txt">全部账单</div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="${ctx}/my/szmx">
                        <div class="left">
                            <i class="iconfont icon-bill"></i>
                            <div>
                                <div class="name">累计收入明细</div>
                            </div>
                        </div>
                        <div class="right">
                            <div class="txt"><span>¥${tshouru}</span></div>
                            <div class="to-icon"></div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="${ctx}/my/szmx">
                        <div class="left">
                            <i class="iconfont icon-wallet-copy"></i>
                            <div>
                                <div class="name">累计支出明细</div>
                            </div>
                        </div>
                        <div class="right">
                            <div class="txt"><span>¥${tshouru-byshouru}</span></div>
                            <div class="to-icon"></div>
                        </div>
                    </a>
                </li>
            </ul>

            <a href="#" class="col button button-big button-fill button-round c-block-btn sheet-open" data-sheet=".c-add-address">申请提现</a>

            <a href="javascript:history.back(-1);" class="goback" id="goBack"></a>
        </div>
    </div>
</div>


<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
<script src="${ctx}/js/public.js"></script>
</body>
</html>
