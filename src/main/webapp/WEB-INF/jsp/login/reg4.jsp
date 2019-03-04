<%--
  Created by IntelliJ IDEA.
  User: james
  Date: 2018/12/26
  Time: 15:39
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
<body class="page-register">
<div id="app">
    <div class="page">
        <div class="page-content">
            <div class="c-login-banner">
                <img class="logo" src="${ctx}/img/1.jpg"/>
                <div class="title">久康沅</div>
                <div class="sub-title">邀请人：赵丽颖</div>
            </div>

            <ul class="c-register-steps">
                <li class="active">
                    <a href="#">
                        <div class="step">1</div>
                        <div class="step-title">填写代理资料</div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="step">2</div>
                        <div class="step-title">代理资质审核</div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="step">3</div>
                        <div class="step-title">进行首次操作</div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="step">4</div>
                        <div class="step-title">正式成为代理商</div>
                    </a>
                </li>
            </ul>

            <div class="list inline-labels c-list-input no-hairlines-md">
                <ul>
                    <li class="item-content item-input">
                        <div class="item-inner">
                            <div class="item-title item-label">身份证</div>
                            <div class="item-input-wrap">
                                <input type="text" placeholder="请填写该信息" id="idcard" class="default-val">
                                <span class="input-clear-button"></span>
                            </div>
                        </div>
                    </li>
                    <li class="item-content item-input">
                        <div class="item-inner">
                            <div class="item-title item-label">微信号</div>
                            <div class="item-input-wrap">
                                <input type="tel" placeholder="请填写该信息" id="chatno" class="default-val">
                                <span class="input-clear-button"></span>
                            </div>
                        </div>
                    </li>
                    <li class="item-content item-input">
                        <div class="item-inner">
                            <div class="item-title item-label">性别</div>
                            <div class="item-input-wrap">
                                <select placeholder="Please choose...">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="#" class="item-link item-content">
                            <div class="item-inner">
                                <div class="item-title">地区</div>
                                <div class="item-after">黑龙江省，哈尔滨市，松北区</div>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>

            <button class="col button button-big button-fill button-round c-block-btn" style="margin-top: 15px;">完成</button>
        </div>
    </div>
</div>

<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>

<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
<script src="${ctx}/js/showBo.js"></script>
<!--<script src="../../js/public.js"></script>-->
</body>
</html>
