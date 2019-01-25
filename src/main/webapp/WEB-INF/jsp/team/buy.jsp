<%--
  Created by IntelliJ IDEA.
  User: james
  Date: 2019/1/5
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
    <title>我的团队</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-myteam">
<div id="app">
    <div class="page">
        <div class="page-content">
            <form class="c-searchbar display-flex align-items-center">
                <div class="input-wrap display-flex align-items-center">
                    <i class="iconfont icon-sousuo"></i>
                    <input class="search-ipt" type="text" placeholder="搜索团队成员" style="width: 100px;"/>
                    <a href="#" class="iconfont icon-cancel-1 clear-btn"></a>
                </div>
                <a href="#" class="search-btn">搜索</a>
            </form>
            <div class="toolbar tabbar tabbar-custom">
                <div class="toolbar-inner">
                    <a href="#tab-1" class="tab-link tab-link-active">进货下级<!--(${zsnum})--></a>
                    <a href="#tab-2" class="tab-link">下级团队<!--(${xjnum})--></a>
                    <a href="#tab-3" class="tab-link">进货上级</a>
                </div>
            </div>
            <div class="tabs">
                <div class="tab tab-active" id="tab-1">
                    <c:choose>
                        <c:when test="${zsnum==0}">
                            <div class="null-tip" style="display: none;">
                                <img src="${ctx}/img/null.png" class="img"/>
                                <div class="info">没有内容可供显示哦</div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <ul class="c-mem-list">
                                <c:forEach items="${zsusers}" var="u">
                                    <li>
                                        <a href="${ctx}/team/buy?userid=${u.id}" class="inner">
                                            <div class="left">
                                                <c:choose>
                                                    <c:when test="${u.headpath==null}">
                                                        <img class="head" src="${ctx}/img/index_head.png"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img class="head" src="${u.headpath}"/>
                                                    </c:otherwise>
                                                </c:choose>


                                                <div>
                                                    <div class="name">${u.name}</div>
                                                    <div class="tag">${u.rolename}</div>
                                                </div>
                                            </div>
                                            <div class="right">
                                                <%--<div>--%>
                                                    <%--<div class="top"><span class="txt">直接:</span><span class="num">${u.xjnum}</span></div>--%>
                                                    <%--<div><span class="txt">团队:</span><span class="num">${u.count}</span></div>--%>
                                                <%--</div>--%>
                                            </div>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>

                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="tab" id="tab-2">
                    <c:choose>
                    <c:when test="${xjnum==0}">
                        <div class="null-tip" style="display: none;">
                            <img src="${ctx}/img/null.png" class="img"/>
                            <div class="info">没有内容可供显示哦</div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <ul class="c-mem-list">
                            <c:forEach items="${xjusers}" var="u">
                                <li>
                                    <a href="${ctx}/team/buy?userid=${u.id}" class="inner">
                                        <div class="left">
                                            <c:choose>
                                                <c:when test="${u.headpath==null}">
                                                    <img class="head" src="${ctx}/img/index_head.png"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <img class="head" src="${u.headpath}"/>
                                                </c:otherwise>
                                            </c:choose>
                                            <div>
                                                <div class="name">${u.name}</div>
                                                <div class="tag">${u.rolename}</div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <%--<div>--%>
                                                <%--<div class="top"><span class="txt">直接:</span><span class="num">${u.xjnum}</span></div>--%>
                                                <%--<div><span class="txt">团队:</span><span class="num">${u.count}</span></div>--%>
                                            <%--</div>--%>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>

                    </c:otherwise>
                    </c:choose>

                </div>





                <div class="tab" id="tab-3">
                    <ul class="higher-list">
                        <li>
                            <a href="#" class="higher-info">
                                <img src="${ctx}/img/index_head.png" class="head"/>
                                <div class="name">陈玲玲</div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>


<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>

<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
<script src="${ctx}/js/public.js"></script>
</body>
</html>