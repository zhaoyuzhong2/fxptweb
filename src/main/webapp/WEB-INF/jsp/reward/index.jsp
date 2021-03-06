<%--
  Created by IntelliJ IDEA.
  User: james
  Date: 2019/1/21
  Time: 13:53
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
    <title>奖励首页</title>
    <link rel="stylesheet" href="${ctx}/css/public.css">
</head>
<body class="page-reward">

<div class="new-reward">
    <a href="#">
        <div class="icon"></div>
        <div class="detail">
            <div class="row">
                <div class="info">
                    <span class="tag">获得</span>
                    <span class="num">¥4536.00元奖励</span>
                    <span class="status">（已完成）</span>
                </div>
                <div class="time">182天前</div>
            </div>
            <div class="row">
                <div class="info">
                    <span class="tag">获得</span>
                    <span class="num">¥180.00元奖励</span>
                    <span class="status">（已完成）</span>
                </div>
                <div class="time">183天前</div>
            </div>
        </div>
        <div class="to-icon"></div>
    </a>
</div>

<div class="total-reward">
    <div class="info-box">
        <div class="info">
            <div class="top">总奖励（元）</div>
            <div class="money">${totalReward}</div>
            <div class="bottom">带核算奖励0.00元</div>
        </div>
        <a href="${ctx}/reward/month" class="link external"><span class="txt">按月查询</span><i class="to-icon"></i></a>
    </div>
    <div id="pieChart" class="echart-box"></div>
</div>

<div class="offline-reward">
    <h3 class="title"><span class="txt">线下奖励处理</span><span class="stxt">非线下奖励已存入我-可提现账户内</span></h3>
    <div class="detail">
        <div class="col">
            <div class="money">0.00</div>
            <div class="name">未提取奖励</div>
        </div>
        <div class="col">
            <div class="money">0.00</div>
            <div class="name">未支出奖励</div>
        </div>
        <div class="col">
            <div class="money">1296.00</div>
            <div class="name">线下累计奖励</div>
        </div>
    </div>
</div>

<ul class="reward-account">
    <li>
        <div class="header">
            <div class="title"><i class="icon icon1"></i><span class="txt">提取奖励账户</span></div>
            <a href="#" class="link"><span class="money">¥1290.00提取中</span><i class="to-icon"></i></a>
        </div>
        <div class="content">
            <a href="" class="seeall">查看全部</a>
        </div>
    </li>
    <li>
        <div class="header">
            <div class="title"><i class="icon icon2"></i><span class="txt">支出奖励账户</span></div>
            <a href="#" class="link"><span class="money">¥0.00支出中</span><i class="to-icon"></i></a>
        </div>
        <div class="content">
            <a href="" class="seeall">查看全部</a>
        </div>
    </li>
</ul>

<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/echarts.common.min.js"></script>
<script>
    var myChart = echarts.init(document.getElementById('pieChart'));

    var data = [
        {value:16452.00, name:'获得'},
        {value:0.00, name:'给出'},
    ];

    var option = {
        /*tooltip: {
         trigger: 'item',
         formatter: "{a} <br/>{b}: {c} ({d}%)"
         },*/
        color: ['#f9ac61', '#5d8cfb'],
        legend: {
            orient: 'vertical',
            x: 'left',
            top: '28%',
            left: 15,
            // data:['获得','给出'],
            formatter: function(name) {
                var index = 0;
                var clientlabels = ['获得','给出'];
                clientlabels.forEach(function(value,i){
                    if(value == name){
                        index = i;
                    }
                });
                return name + "  " + data[index].value.toFixed(2);
            },
            data: [
                {
                    name: '获得',
                    // 强制设置图形为圆。
                    icon: 'circle',
                    // 设置文本颜色
                    textStyle: {
                        color: '#3c3c3c'
                    }
                },
                {
                    name: '给出',
                    // 强制设置图形为圆。
                    icon: 'circle',
                    // 设置文本颜色
                    textStyle: {
                        color: '#3c3c3c'
                    }
                },
            ],
            itemGap: 18,
            itemWidth: 8,
            itemHeight: 8,
        },
        series: [
            {
                //name:'访问来源',
                type:'pie',
                center: ['75%', '50%'],
                radius: ['33%', '80%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        show: false,
                        position: 'center'
                    },
                    emphasis: {
                        show: true,
                        textStyle: {
                            fontSize: '14',
                            fontWeight: 'normal'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                itemStyle: {
                    shadowColor: 'rgba(0, 0, 0, 0.2)',
                    shadowBlur: 10
                },
                data:data,
            }
        ]
    };

    myChart.setOption(option);

</script>
</body>
</html>
