<%--
  Created by IntelliJ IDEA.
  User: james
  Date: 2018/12/26
  Time: 15:18
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
    <title>申请代理商</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
    <link rel="stylesheet" href="${ctx}/css/showBo.css">
</head>
<body class="page-login">
<div id="app">
    <div class="page">
        <div class="page-content">
            <form name="form" action="${ctx}/user/reg2" id="form">
                <input type="hidden" id="reqUserid" value="${reqUserid}"/>
                <input type="hidden" id="reqUsername" value="${reqUsername}"/>
                <input type="hidden" id="roles" value="${roles}"/>
            <div class="c-login-banner">
                <img class="logo" src="${ctx}/img/1.jpg"/>
                <div class="title">聚益恒集团</div>
            </div>

            <div class="list c-list-input">
                <ul>
                    <li class="item-content item-input">
                        <div class="item-media">
                            <i class="iconfont icon-shouji"></i>
                        </div>
                        <div class="item-inner">
                            <div class="item-input-wrap">
                                <input type="text" id="mobile" placeholder="请填写手机号码">
                                <span class="input-clear-button"></span>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

            <a href="#" class="col button button-big button-fill button-round c-block-btn external" onclick="queren()">确定</a>
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
</body>


<script type="text/javascript">
    //删除平台
    function queren() {
        var mobile = $("#mobile").val();
        if(mobile.length()!=11){
            Showbo.Msg.alert('请输入正确的手机号码！');
            return false;
        }

        $.post("${ctx}/user/isExist",{mobile:mobile},function (d) {

            if(d=="you") {
                Showbo.Msg.alert('手机号已被注册');
                return false;
            }else{
                document.getElementById("form").submit();
            }

        });

    }





    //删除平台
    function queren2() {
        var mobile = $("#mobile").value();
        Showbo.Msg.confirm('确定要删除吗？',function (btn) {
            if(btn=='yes'){
                $.post("${ctx}/tplat/deletePlat",{id:id},function (d) {
                    if(d=="ajaxfail"){
                        Showbo.Msg.confirm1("会话过期,请重新登录!",function(btn){
                            if(btn=="yes"){
                                window.location.href="${ctx}/sys/index";
                            }
                        });
                    }else {
                        if(d=="ok"){
                            Showbo.Msg.alert('删除成功');
                            $('#teacher_table').bootstrapTable('refresh');
                        }else {
                            Showbo.Msg.alert('删除失败');
                        }
                    }

                });
            }
        })
    }



</script>


</html>
