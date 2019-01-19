<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/16/016
  Time: 22:14
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
    <title>商品统计</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/font.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-budget-statis">
<div id="app">
    <div class="view view-main">
        <div class="page">
            <div class="page-content">
                <form class="c-searchbar display-flex align-items-center">
                    <div class="input-wrap display-flex align-items-center">
                        <i class="iconfont icon-sousuo"></i>
                        <input class="search-ipt" type="text" placeholder="请输入商品名称进行搜索"/>
                        <a href="#" class="iconfont icon-cancel-1 clear-btn"></a>
                    </div>
                    <a href="#" class="search-btn">搜索</a>
                </form>

                <div class="toolbox display-flex justify-content-space-between align-items-center">
                    <div class="display-flex align-items-center">
                        <div id="date">${yearm}</div>
                        <a href="#" class="iconfont icon-calendar" id="picker-date"></a>
                        <a href="#" class="iconfont icon-question" onclick="helpTip()"></a>
                    </div>
                    <div class="display-flex align-items-center info">
                        <div>总出货量&nbsp;:</div>
                        <div class="num">${total}</div>
                    </div>
                </div>

                <div>
                    <div class="null-tip">
                        <img src="${ctx}/img/null.png" class="img"/>
                        <div class="info">没有内容可供显示</div>
                    </div>
                </div>

                <a href="javascript:history.back(-1);" class="goback" id="goBack"></a>
            </div>
        </div>
    </div>
</div>


<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
<script src="${ctx}/js/public.js"></script>
<script>
    var mainView = app.views.create('.view-main',{});


    /* 日期选择 */
    var pickerDevice = app.picker.create({
        inputEl: '#picker-date',
        renderToolbar: function () {
            return '<div class="toolbar">' +
                    '<div class="toolbar-inner">' +
                    '<div class="left">' +
                    '<a href="#" class="link toolbar-cancel-link">取消</a>' +
                    '</div>' +
                    '<div class="title"></div>'+
                    '<div class="right">' +
                    '<a href="#" class="link popover-close sure-btn">确定</a>' +
                    '</div>' +
                    '</div>' +
                    '</div>';
        },
        cssClass: 'c-custom-picker',
        openIn: 'sheet',
        cols: [
            {
                textAlign: 'center',
                values: ['2016', '2017', '2018'],
                displayValues: ['2016年', '2017年', '2018年'],
            },
            {
                textAlign: 'center',
                values: ['10', '11', '12'],
                displayValues: ['10月', '11月', '12月'],
            }
        ],
        on: {
            open: function (picker) {
                $(picker.$el[0]).before('<div class="sheet-backdrop" style="z-index: 12500;"></div>');
                picker.$el.prev().addClass('backdrop-in');

                picker.$el.find('.toolbar-cancel-link').on('click', function () {
                    picker.close();
                });
                picker.$el.find('.sure-btn').on('click', function () {
                    $('#date').html(picker.getValue().join('-'));
                    picker.close();
                });
            },
            close: function (picker) {
                picker.$el.prev().remove();
            }
            /*opened: function (picker) {
             $(picker.$el[0]).before('<div class="sheet-backdrop"></div>');
             picker.$el.prev().addClass('backdrop-in');
             }*/
        }
    });


    /* 帮助弹窗 */
    function helpTip() {
        app.dialog.create({
            title: '商品统计说明',
            text: '',
            cssClass: 'c-custom-dialog',
            content: '<div class="info">统计采购订单、客户订单、提货订单中代理自己发货且以实体库存发货的商品数量，以及总部将代理追溯码划拨给其他人、总部或代理自己手动减少代理实体库存、代理进行实体库存换货换出去的商品数量。</div>',
            buttons: [
                {
                    text: '知道了',
                    cssClass: 'btn-confirm',
                },
            ],

            verticalButtons: false,
        }).open();
    }


</script>
</body>
</html>