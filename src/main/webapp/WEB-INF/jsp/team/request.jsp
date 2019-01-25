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
    <title>我的邀请团队</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-myinvite-team">
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
                    <a href="#tab-1" class="tab-link tab-link-active">我邀请的(${myReqCount})</a>
                    <a href="#tab-2" class="tab-link">邀请团队(${myTeamCount})</a>
                    <a href="#tab-3" class="tab-link">邀请我的</a>
                </div>
            </div>
            <div class="tabs">
                <div class="tab tab1 tab-active" id="tab-1">

                    <div class="list role-list">
                        <ul>
                            <c:if test="${r1sn>0}">
                                <li class="accordion-item">

                                    <a href="#" class="item-content item-link">
                                        <div class="item-inner">
                                            <div class="item-title"><i class="iconfont icon-right1"></i>唤醒联创</div>
                                            <div class="role-num">${r1sn}</div>
                                        </div>
                                    </a>
                                    <div class="accordion-item-content">
                                        <ul class="member-list">
                                            <c:forEach var="u" items="${r1s}">
                                            <li>
                                                <a href="${ctx}/team/request?userid=${u.id}" class="member-inner display-flex justify-content-space-between align-items-center">
                                                    <div class="left display-flex align-items-center">
                                                        <c:choose>
                                                            <c:when test="${u.headpath==null}">
                                                                <img class="head" src="${ctx}/img/index_head.png"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img class="head" src="${u.headpath}"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <div class="member-name">${u.name}</div>
                                                    </div>
                                                    <div class="right">
                                                        <div>直接:<span class="num">${u.xjnum}</span></div>
                                                        <div>团队:<span class="num">${u.count}</span></div>
                                                    </div>
                                                </a>
                                            </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </li>
                            </c:if>

                            <c:if test="${r2sn>0}">
                                <li class="accordion-item">

                                    <a href="#" class="item-content item-link">
                                        <div class="item-inner">
                                            <div class="item-title"><i class="iconfont icon-right1"></i>唤醒大区</div>
                                            <div class="role-num">${r2sn}</div>
                                        </div>
                                    </a>
                                    <div class="accordion-item-content">
                                        <ul class="member-list">
                                            <c:forEach var="u" items="${r2s}">
                                                <li>
                                                    <a href="${ctx}/team/request?userid=${u.id}" class="member-inner display-flex justify-content-space-between align-items-center">
                                                        <div class="left display-flex align-items-center">
                                                            <c:choose>
                                                                <c:when test="${u.headpath==null}">
                                                                    <img class="head" src="${ctx}/img/index_head.png"/>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <img class="head" src="${u.headpath}"/>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <div class="member-name">${u.name}</div>
                                                        </div>
                                                        <div class="right">
                                                            <div>直接:<span class="num">${u.xjnum}</span></div>
                                                            <div>团队:<span class="num">${u.count}</span></div>
                                                        </div>
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </li>
                            </c:if>


                            <c:if test="${r3sn>0}">
                                <li class="accordion-item">

                                    <a href="#" class="item-content item-link">
                                        <div class="item-inner">
                                            <div class="item-title"><i class="iconfont icon-right1"></i>唤醒联创</div>
                                            <div class="role-num">${r3sn}</div>
                                        </div>
                                    </a>
                                    <div class="accordion-item-content">
                                        <ul class="member-list">
                                            <c:forEach var="u" items="${r3s}">
                                                <li>
                                                    <a href="${ctx}/team/request?userid=${u.id}" class="member-inner display-flex justify-content-space-between align-items-center">
                                                        <div class="left display-flex align-items-center">
                                                            <c:choose>
                                                                <c:when test="${u.headpath==null}">
                                                                    <img class="head" src="${ctx}/img/index_head.png"/>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <img class="head" src="${u.headpath}"/>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <div class="member-name">${u.name}</div>
                                                        </div>
                                                        <div class="right">
                                                            <div>直接:<span class="num">${u.xjnum}</span></div>
                                                            <div>团队:<span class="num">${u.count}</span></div>
                                                        </div>
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </li>
                            </c:if>



                        </ul>
                    </div>

                </div>

                <div class="tab" id="tab-2">
                    <!--<div class="null-tip">
                        <img src="../../img/null.png" class="img"/>
                        <div class="info">没有内容可供显示哦</div>
                    </div>-->
                    <ul class="mem-list">
                        <c:forEach items="${allxjs}" var="u">
                        <li>
                            <a href="#" class="inner">
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
                                    <div>
                                        <div class="top"><span class="txt">直接:</span><span class="num">${u.xjnum}</span></div>
                                        <div><span class="txt">团队:</span><span class="num">${u.count}</span></div>
                                    </div>
                                    <div class="to-icon"></div>
                                </div>
                            </a>
                        </li>
                        </c:forEach>


                    </ul>

                </div>

                <div class="tab" id="tab-3">
                    <div class="title">邀请我的代理</div>
                    <div class="list img-media-list">
                        <c:if test="${sj!=null}">
                        <ul>
                            <li>
                                <a href="#" class="item-link item-content">
                                    <div class="item-media">
                                        <c:choose>
                                            <c:when test="${sj.headpath==null}">
                                                <img class="head" src="${ctx}/img/index_head.png"/>
                                            </c:when>
                                            <c:otherwise>
                                                <img class="head" src="${sj.headpath}"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="item-inner">
                                        <div class="item-title">
                                            <div class="item-header">${sj.name}(${sj.mobile})</div>
                                            ${sj.rolename}
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        </c:if>
                    </div>

                    <div class="title">邀请关系最高代理</div>
                    <div class="list img-media-list">
                        <c:if test="${topu!=null}">
                            <ul>
                                <li>
                                    <a href="#" class="item-link item-content">
                                        <div class="item-media"><img class="head" src="${ctx}/img/index_head.png"/></div>
                                        <div class="item-inner">
                                            <div class="item-title">
                                                <div class="item-header">${topu.name}(${topu.mobile})</div>
                                                    ${topu.rolename}
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </c:if>
                    </div>
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