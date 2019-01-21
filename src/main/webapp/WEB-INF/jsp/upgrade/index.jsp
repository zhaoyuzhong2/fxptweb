
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/19/019
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
    <title>升级列表</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-goup-list">
<div id="app">
    <div class="page">
        <div class="toolbar tabbar tabbar-custom">
            <div class="toolbar-inner">
                <a href="#tab-1" class="tab-link tab-link-active">我要升级</a>
                <a href="#tab-2" class="tab-link">下级升级(0)</a>
            </div>
        </div>
        <div class="tabs">

            <div class="page-content tab tab-active" id="tab-1">

                <div class="list top-btn">
                    <ul>
                        <li>
                            <a href="${ctx}/upgrade/record" class="item-link item-content external">
                                <div class="item-media"><i class="iconfont icon-dengji"></i></div>
                                <div class="item-inner">
                                    <div class="item-title">
                                        <div class="item-header">当前代理等级</div>
                                        ${user.rolename}
                                    </div>
                                    <div class="item-after">升级记录</div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <c:choose>
                <c:when test="${roleid==3}">
                <div class="highest-level" style="display: none;"><!--当前为最高等级时显示内容-->
                    <img src="${ctx}/img/highest_level.png"/>
                    <div class="txt">当前已是最高等级了</div>
                </div>
                </c:when>
                <c:otherwise>
                    <ul class="goup-condition-list">
                        <c:forEach items="${rs}" var="r">
                        <li>
                            <div class="title display-flex align-items-center">
                                <div class="name">可升级代理等级:</div>
                                <div class="tag">${r.name}</div>
                            </div>
                            <ul class="goup-info">
                                <li class="display-flex align-items-center">
                                    <div class="step">升级条件一</div>
                                    <div class="tip">满足升级条件后可以申请升级</div>
                                </li>
                                <li>
                                    <div>${r.parm}</div>
                                    <div class="red-tip">申请升级后需要完成一次性补货才能升级成功</div>
                                </li>
                                <li class="display-flex align-items-center justify-content-flex-end">
                                    <div class="tip">当前可以发起升级</div>
                                    <a href="#" class="goup-btn" onclick="goupTip(${r.id})">我要升级</a>
                                </li>
                                <div class="cornermark">已达标</div>
                            </ul>
                        </li>
                        </c:forEach>
                    </ul>
                </c:otherwise>
                </c:choose>


            </div>

            <div class="page-content tab" id="tab-2">
                <div class="list c-list-link">
                    <ul>
                        <li>
                            <a href="#" class="item-link item-content">
                                <div class="item-inner">
                                    <div class="item-title">当前处理中升级申请:<span class="num">0</span></div>
                                    <div class="item-after">下级升级记录</div>
                                </div>
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
<script>


    function goup(roleid) {
        Showbo.Msg.confirm("确定要升级？",function(btn){
            if(btn=="yes"){
                $.post("${ctx}/upgrade/goup",{roleid:roleid},function (d) {
                    if(d=="ajaxfail"){
                        Showbo.Msg.confirm("会话过期,请重新登录!",function(btn){
                            if(btn=="yes"){
                                window.location.href="${ctx}/sys/index";
                            }
                        });
                    }else {
                        if(d=="ok"){
                            Showbo.Msg.alert('申请成功，请等待审核！');
                        }else {
                            Showbo.Msg.alert('程序错误，请联系管理员！');
                        }
                    }

                });
            }
        })
    }



    /* 帮助弹窗 */
    function goupTip(roleid) {
        app.dialog.create({
            title: '升级提示',
            text: '',
            cssClass: 'c-custom-dialog',
            content: '<div class="info">您申请升级的代理需先完善资料因为您升级的代理等级等于或超过当前上级代理，升级后，将不再是当前代理的下级。是否确认发起升级？</div>',
            buttons: [
                {
                    text: '取消',
                },
                {
                    text: '确定',
                    cssClass: 'btn-confirm',
                    onClick: function (e){

                    }
                }
            ],

            verticalButtons: false,
        }).open();
    }
</script>
</body>
</html>
