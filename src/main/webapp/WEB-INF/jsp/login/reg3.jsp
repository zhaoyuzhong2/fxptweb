<%--
  Created by IntelliJ IDEA.
  User: james
  Date: 2018/12/26
  Time: 15:34
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
            <form name="form" action="${ctx}/user/reg" id="form">
                <input type="hidden" id="pid" value="${reqUserid}"/>
                <input type="hidden" id="roleid" value="${roleid}"/>
            <div class="c-login-banner">
                <img class="logo" src="${ctx}/img/1.jpg"/>
                <div class="title">聚益恒集团</div>
                <div class="sub-title">邀请人：${reqUsername}</div>
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

            <div class="list c-list-input" style="margin-top: 0;">
                <ul>
                    <li class="item-content item-input">
                        <div class="item-media">
                            <i class="iconfont icon-shouji"></i>
                        </div>
                        <div class="item-inner">
                            <div class="item-input-wrap">
                                <input type="text" value="${mobile}" id="mobile" class="default-val" readonly>
                                <span class="input-clear-button"></span>
                            </div>
                        </div>
                    </li>
                    <li class="item-content item-input">
                        <div class="item-media">
                            <i class="iconfont icon-ad80"></i>
                        </div>
                        <div class="item-inner">
                            <div class="item-input-wrap">
                                <input type="text" placeholder="短信码" id="yzm">
                                <span class="input-clear-button"></span>
                            </div>
                        </div>
                        <a href="#" class="verification-code">验证码</a><!--点击后添加countdown类-->
                    </li>
                    <li class="item-content item-input">
                        <div class="item-media">
                            <i class="iconfont icon-a501"></i>
                        </div>
                        <div class="item-inner">
                            <div class="item-input-wrap">
                                <input type="password" id="pwd1" placeholder="请填写密码">
                                <span class="input-clear-button"></span>
                            </div>
                        </div>
                    </li>
                    <li class="item-content item-input">
                        <div class="item-media">
                            <i class="iconfont icon-a501"></i>
                        </div>
                        <div class="item-inner">
                            <div class="item-input-wrap">
                                <input type="password" id="pwd2" placeholder="请确认密码">
                                <span class="input-clear-button"></span>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="list c-list-input">
                <ul>
                    <li class="item-content item-input">
                        <div class="item-media">
                            <i class="iconfont icon-xingming"></i>
                        </div>
                        <div class="item-inner">
                            <div class="item-input-wrap">
                                <input type="text" id="name" placeholder="请填写姓名">
                                <span class="input-clear-button"></span>
                            </div>
                        </div>
                    </li>

                    <li class="item-content item-input">
                        <div class="item-media">
                            <i class="iconfont icon-xingming"></i>
                        </div>
                        <div class="item-inner">
                            <div class="item-input-wrap">
                                <input type="text" id="idcard" placeholder="请填写身份证">
                                <span class="input-clear-button"></span>
                            </div>
                        </div>
                    </li>


                    <li class="item-content item-input">
                        <div class="item-media">
                            <i class="iconfont icon-xingming"></i>
                        </div>
                        <div class="item-inner">
                            <div class="item-input-wrap">
                                <input type="text" id="chatno" placeholder="请填写微信号">
                                <span class="input-clear-button"></span>
                            </div>
                        </div>
                    </li>


                    <li class="item-content item-input">
                        <div class="item-media">
                            <i class="iconfont icon-xingming"></i>
                        </div>
                        <div class="item-inner">
                            <div class="item-input-wrap">
                                <select id="sex">
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
                                <div class="item-after">

                                    <select id="province" >

                                        <option value="">请选择省</option>

                                    </select>
                                    <select id="city">
                                        <option value="">请选择市</option>
                                    </select>
                                    <select id="area">
                                        <option value="">请选择区</option>
                                    </select>

                                </div>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="protocol">
                <label class="checkbox"><input type="checkbox" id="checkbox"><i class="icon-checkbox"></i></label>
                <span>我同意并遵守</span><span class="protocol-link">《唤醒记忆代理商协议》</span>
            </div>

            <a href="#" id="button" class="col button button-big button-fill button-round c-block-btn external" style="margin-top: 8px;" onclick="queren()">下一步</a>
            </form>
        </div>
    </div>
</div>

<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>

<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
<script src="${ctx}/js/showBo.js"></script>
<script src="${ctx}/js/area/area.js"></script>
<script src="${ctx}/js/area/select.js"></script>
<!--<script src="../../js/public.js"></script>-->
<script type="text/javascript">
    //删除平台
    function queren() {
        var pwd1 = $("#pwd1").val();
        var pwd2 = $("#pwd2").val();
        var name = $("#name").val();
        var mobile = $("#mobile").val();
        var yzm = $("#yzm").val();
        var idcard = $("#idcard").val();
        var sex = $("#sex").val();

        if(pwd1.trim().length()<1){
            Showbo.Msg.alert('请填写密码！');
            return false;
        }

        if(pwd1!=pwd2){
            Showbo.Msg.alert('两个密码不一致！');
            return false;
        }


        if(name.length()<1){
            Showbo.Msg.alert('请填写姓名！');
            return false;
        }


        if(idcard.length()<1){
            Showbo.Msg.alert('请填写身份证号！');
            return false;
        }


        if(sex.length()<1){
            Showbo.Msg.alert('请选择性别！');
            return false;
        }


        if(area.length()<1){
            Showbo.Msg.alert('请选择所在地区！');
            return false;
        }


        $.post("${ctx}/user/isYzmExist",{mobile:mobile,yzm:yzm},function (d) {

            if(d=="nook") {
                Showbo.Msg.alert('验证码输入错误！');
                return false;
            }else{
                document.getElementById("form").submit();
            }

        });




    }



    function check() {
        var checkbox = document.getElementById("checkbox");
        if(checkbox.checked == true){
            document.getElementById("button").disabled="";
        }
        else{
            document.getElementById("button").disabled="disabled";
        }



    }

</script>
</body>
</html>
