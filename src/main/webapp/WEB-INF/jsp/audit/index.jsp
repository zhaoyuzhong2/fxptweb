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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
    <title>审核列表</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
    <script src="${ctx}/js/jquery.min.js"></script>
</head>
<body class="page-audit-agent">

<ul class="page-nav">
    <li><a href="javascript:void(0);" class="active">待审核</a></li>
    <li><a href="javascript:void(0);">准代理</a></li>
    <li><a href="javascript:void(0);">已代理</a></li>
    <li><a href="javascript:void(0);">已拒绝</a></li>
</ul>

<div class="pagenav-content" style="display: block;">
    <c:choose>
    <c:when test="${dshn==0}">
    <div class="null-tip">
        <img src="${ctx}/img/null.png" class="img"/>
        <div class="info">没有内容可供显示</div>
    </div>
    </c:when>
        <c:otherwise>
        <ul class="already-agent-list">
            <c:forEach var="d" items="${dsh}">
                <li>
                    <div class="top display-flex justify-content-space-between align-items-center">
                        <div class="left display-flex align-items-center">
                            <div>代理:&nbsp;&nbsp;</div>
                            <div>${d.name}&nbsp;&nbsp;(${d.mobile})</div>
                        </div>
                        <div class="right">待审核</div>
                    </div>
                    <ul class="content">
                        <li class="display-flex justify-content-space-between align-items-center">
                            <div>微信号:&nbsp;&nbsp;${d.chatno}</div>
                            <div class="date">${d.cdate}</div>
                        </li>
                        <li>身份证号:&nbsp;&nbsp;${d.idcard}</li>
                        <li>邀请人:&nbsp;&nbsp;${d.pname} (${d.pmobile})</li>
                        <li>申请等级:&nbsp;&nbsp;${d.rolename}</li>
                    </ul>
                </li>
            </c:forEach>
        </ul>
        </c:otherwise>
    </c:choose>
</div>
<div class="pagenav-content">
    <c:choose>
        <c:when test="${zdln==0}">
            <div class="null-tip">
                <img src="${ctx}/img/null.png" class="img"/>
                <div class="info">没有内容可供显示</div>
            </div>
        </c:when>
        <c:otherwise>
            <ul class="already-agent-list">
                <c:forEach var="d" items="${zdl}">
                    <li>
                        <div class="top display-flex justify-content-space-between align-items-center">
                            <div class="left display-flex align-items-center">
                                <div>代理:&nbsp;&nbsp;</div>
                                <div>${d.name}&nbsp;&nbsp;(${d.mobile})</div>
                            </div>
                            <div class="right">待审核</div>
                        </div>
                        <ul class="content">
                            <li class="display-flex justify-content-space-between align-items-center">
                                <div>微信号:&nbsp;&nbsp;${d.chatno}</div>
                                <div class="date">${d.cdate}</div>
                            </li>
                            <li>身份证号:&nbsp;&nbsp;${d.idcard}</li>
                            <li>邀请人:&nbsp;&nbsp;${d.pname} (${d.pmobile})</li>
                            <li>申请等级:&nbsp;&nbsp;${d.rolename}</li>
                        </ul>
                    </li>
                </c:forEach>
            </ul>
        </c:otherwise>
    </c:choose>
</div>
<div class="pagenav-content">
    <c:choose>
        <c:when test="${ydln==0}">
            <div class="null-tip">
                <img src="${ctx}/img/null.png" class="img"/>
                <div class="info">没有内容可供显示</div>
            </div>
        </c:when>
        <c:otherwise>
            <ul class="already-agent-list">
                <c:forEach var="d" items="${ydl}">
                    <li>
                        <div class="top display-flex justify-content-space-between align-items-center">
                            <div class="left display-flex align-items-center">
                                <div>代理:&nbsp;&nbsp;</div>
                                <div>${d.name}&nbsp;&nbsp;(${d.mobile})</div>
                            </div>
                            <div class="right">已代理</div>
                        </div>
                        <ul class="content">
                            <li class="display-flex justify-content-space-between align-items-center">
                                <div>微信号:&nbsp;&nbsp;${d.chatno}</div>
                                <div class="date">${d.cdate}</div>
                            </li>
                            <li>身份证号:&nbsp;&nbsp;${d.idcard}</li>
                            <li>邀请人:&nbsp;&nbsp;${d.pname} (${d.pmobile})</li>
                            <li>申请等级:&nbsp;&nbsp;${d.rolename}</li>
                        </ul>
                    </li>
                </c:forEach>
            </ul>
        </c:otherwise>
    </c:choose>
</div>
<div class="pagenav-content">
    <c:choose>
        <c:when test="${yjjn==0}">
            <div class="null-tip">
                <img src="${ctx}/img/null.png" class="img"/>
                <div class="info">没有内容可供显示</div>
            </div>
        </c:when>
        <c:otherwise>
            <ul class="already-agent-list">
                <c:forEach var="d" items="${yjj}">
                    <li>
                        <div class="top display-flex justify-content-space-between align-items-center">
                            <div class="left display-flex align-items-center">
                                <div>代理:&nbsp;&nbsp;</div>
                                <div>${d.name}&nbsp;&nbsp;(${d.mobile})</div>
                            </div>
                            <div class="right">已拒绝</div>
                        </div>
                        <ul class="content">
                            <li class="display-flex justify-content-space-between align-items-center">
                                <div>微信号:&nbsp;&nbsp;${d.chatno}</div>
                                <div class="date">${d.cdate}</div>
                            </li>
                            <li>身份证号:&nbsp;&nbsp;${d.idcard}</li>
                            <li>邀请人:&nbsp;&nbsp;${d.pname} (${d.pmobile})</li>
                            <li>申请等级:&nbsp;&nbsp;${d.rolename}</li>
                        </ul>
                    </li>
                </c:forEach>
            </ul>
        </c:otherwise>
    </c:choose>
</div>

<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>


<script>
    $(".page-nav li").on('click',function(){
        $('.pagenav-content').hide();
        $('.pagenav-content').eq($(this).index()).show();

        $('.page-nav a').removeClass('active');
        $(this).find('a').addClass('active');
    });
</script>

</body>
</html>