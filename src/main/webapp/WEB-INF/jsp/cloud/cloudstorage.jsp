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
    <title>云仓库</title>
    <link rel="stylesheet" href="${ctx}/css/framework7.min.css">
    <link rel="stylesheet" href="${ctx}/css/public.css">
    <style>

    </style>
</head>
<body class="page-cloud-storage">
<div id="app">
    <div class="page">
        <div class="page-content">
            <div class="swiper-container swiper-init cloud-stock-swiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="echart-title">云库存一周数据趋势图</div>
                        <div class="echart-box" id="echartWeakData"></div>
                    </div>
                    <div class="swiper-slide">
                        <div class="echart-title">实体库存一周数据趋势图</div>
                        <div class="echart-box" id="echartWeakData2"></div>
                    </div>
                </div>
                <div class="swiper-pagination cloud-stock-swiper-pagination"></div>
            </div>

            <div class="echart-proportion">
                <div class="echart-title">云库存占比</div>
                <div class="echart-box" id="echatPie"></div>
            </div>

            <ul class="row storage-nav">
                <li class="col-25">
                    <a id="cloudinventory"  class="external" href="${ctx}/cloud/cloudinventory">
                        <i class="icon icon1"></i>
                        <div  class="name">云库存</div>
                        <span class="badge color-red">60</span>
                    </a>
                </li>
                <li class="col-25">
                    <a id="physicalinventory"  class="external" href="${ctx}/cloud/physicalinventory">
                        <i class="icon icon2"></i>
                        <div  class="name">实体库存</div>
                        <span class="badge color-red">99+</span>
                    </a>
                </li>
                <li class="col-25">
                    <a  id="mypickuporderslist" class="external" href="${ctx}/cloud/mypickuporderslist">
                        <i   class="icon icon3"></i>
                        <div  class="name">提货订单</div>
                    </a>
                </li>
                <li  class="col-25">
                    <a  id="inventoryrecord"  class="external" href="${ctx}/cloud/inventoryrecord">
                        <i class="icon icon4"></i>
                        <div  class="name">库存记录</div>
                    </a>
                </li>
            </ul>

            <div class="take-goods-btn">
                <a href="${ctx}/cloud/promptdelivery" class="col button button-big button-fill button-round c-block-btn external">立即提货</a>
            </div>
        </div>
    </div>
</div>


<a href="javascript:history.back(-1);" class="goback" id="goBack"></a>


<script src="${ctx}/js/framework7.min.js"></script>
<script src="${ctx}/js/jquery.min.js"></script>
<script src="${ctx}/js/my-app.js"></script>
<script>
  /*  //云库存
    $("#cloudinventory").click(function () {

        $.post("${ctx}/cloud/cloudinventory",{},function (d) {
            console.log(d)
        });
    });

    $("#physicalinventory").click(function () {

        $.post("${ctx}/cloud/physicalinventory",{},function (d) {
        });
    });

    $("#mypickuporderslist").click(function () {

        $.post("${ctx}/cloud/mypickuporderslist",{},function (d) {
        });
    });

    $("#inventoryrecord").click(function () {

        $.post("${ctx}/cloud/inventoryrecord",{},function (d) {
        });
    });
*/
    var mySwiper = new Swiper('.cloud-stock-swiper', {
        speed: 800,
        autoplay: {
            delay: 3000,
        },
        pagination: {
            el: '.cloud-stock-swiper-pagination',
            clickable: true
        }
    });
</script>
<script src="${ctx}/js/echarts.common.min.js"></script>
<script>











    /* 云库存一周数据趋势图*/
    var echartWeakData = echarts.init(document.getElementById('echartWeakData'));
    option = {
        title: {
            show:false,
            text: '堆叠区域图'
        },
        color: ['#fb6072','#67da9f'],
        tooltip : {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                label: {
                    backgroundColor: '#6a7985'
                }
            }
        },
        legend: {
            data:[
                {name: '入库',icon: 'circle'},
                {name: '出库',icon: 'circle'},
            ],
            itemWidth: 10,
            itemHeight: 10,
            itemGap: 15,
            bottom: 0,
            textStyle: {
                color: '#a7a7a7',
            }
        },
        /*toolbox: {
            feature: {
                saveAsImage: {}
            }
        },*/
        grid: {
            left: '10',
            right: '15',
            top: '10',
            bottom: '35',
            containLabel: true
        },
        xAxis : [
            {
                type : 'category',
                boundaryGap : false,
                data : ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'],
                axisLine: {
                    show: false,
                },
                axisTick: {
                    show: false,
                },
                axisLabel: {
                    color: '#a7a7a7',
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                min: 0,
                max: 1,
                axisLine: {
                    show: false,
                },
                axisTick: {
                    show: false,
                },
                axisLabel: {
                    color: '#a7a7a7',
                },
                splitLine: {
                    lineStyle: {
                        color: ['#cccccc'],
                    }
                }
            }
        ],
        series : [
            {
                name:'入库',
                type:'line',
                stack: '总量',
                areaStyle: {
                    color: {
                        type: 'linear',
                        x: 0,
                        y: 0,
                        x2: 0,
                        y2: 1,
                        colorStops: [{
                            offset: 0, color: 'rgba(251, 96, 114,0.5)' // 0% 处的颜色
                        }, {
                            offset: 1, color: 'rgba(251, 96, 114,0.1)' // 100% 处的颜色
                        }],
                        globalCoord: false // 缺省为 false
                    }
                },
                data:[0, 0.2, 0.5, 0.3, 0.5, 0.7, 0.6]
            },
            {
                name:'出库',
                type:'line',
                stack: '总量',
                areaStyle: {
                    color: {
                        type: 'linear',
                        x: 0,
                        y: 0,
                        x2: 0,
                        y2: 1,
                        colorStops: [{
                            offset: 0, color: 'rgba(103, 218, 159,0.5)' // 0% 处的颜色
                        }, {
                            offset: 1, color: 'rgba(103, 218, 159,0.1)' // 100% 处的颜色
                        }],
                        globalCoord: false // 缺省为 false
                    }
                },
                data:[0, 0.1, 0.2, 0.6, 0.3, 0.3, 0.1]
            }
        ]
    };
    echartWeakData.setOption(option);

    /* 实体库存一周数据趋势图*/
    var echartWeakData2 = echarts.init(document.getElementById('echartWeakData2'));
    option = {
        title: {
            show:false,
            text: '堆叠区域图'
        },
        color: ['#fb6072','#67da9f'],
        tooltip : {
            trigger: 'axis',
            axisPointer: {
                type: 'cross',
                label: {
                    backgroundColor: '#6a7985'
                }
            }
        },
        legend: {
            data:[
                {name: '入库',icon: 'circle'},
                {name: '出库',icon: 'circle'},
            ],
            itemWidth: 10,
            itemHeight: 10,
            itemGap: 15,
            bottom: 0,
            textStyle: {
                color: '#a7a7a7',
            }
        },
        /*toolbox: {
         feature: {
         saveAsImage: {}
         }
         },*/
        grid: {
            left: '10',
            right: '15',
            top: '10',
            bottom: '35',
            containLabel: true
        },
        xAxis : [
            {
                type : 'category',
                boundaryGap : false,
                data : ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'],
                axisLine: {
                    show: false,
                },
                axisTick: {
                    show: false,
                },
                axisLabel: {
                    color: '#a7a7a7',
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                min: 0,
                max: 1,
                axisLine: {
                    show: false,
                },
                axisTick: {
                    show: false,
                },
                axisLabel: {
                    color: '#a7a7a7',
                },
                splitLine: {
                    lineStyle: {
                        color: ['#cccccc'],
                    }
                }
            }
        ],
        series : [
            {
                name:'入库',
                type:'line',
                stack: '总量',
                areaStyle: {
                    color: {
                        type: 'linear',
                        x: 0,
                        y: 0,
                        x2: 0,
                        y2: 1,
                        colorStops: [{
                            offset: 0, color: 'rgba(251, 96, 114,0.5)' // 0% 处的颜色
                        }, {
                            offset: 1, color: 'rgba(251, 96, 114,0.1)' // 100% 处的颜色
                        }],
                        globalCoord: false // 缺省为 false
                    }
                },
                data:[0, 0.2, 0.5, 0.3, 0.5, 0.7, 0.6]
            },
            {
                name:'出库',
                type:'line',
                stack: '总量',
                areaStyle: {
                    color: {
                        type: 'linear',
                        x: 0,
                        y: 0,
                        x2: 0,
                        y2: 1,
                        colorStops: [{
                            offset: 0, color: 'rgba(103, 218, 159,0.5)' // 0% 处的颜色
                        }, {
                            offset: 1, color: 'rgba(103, 218, 159,0.1)' // 100% 处的颜色
                        }],
                        globalCoord: false // 缺省为 false
                    }
                },
                data:[0, 0.1, 0.2, 0.6, 0.3, 0.3, 0.1]
            }
        ]
    };
    echartWeakData2.setOption(option);

    /* 云库存占比 */
    var echatPie = echarts.init(document.getElementById('echatPie'));

    option = {
        backgroundColor: '#fff',
        color: ['#fa3a53', 'transparent'],
        series: [
            {
                name: '进度条',
                type: 'pie',
                clockWise: true,
                hoverAnimation: false,
                /*radius: [119, 120],*/
                radius: [70, 71],
                label: {
                    show: false
                },
                labelLine: {
                    show: false,
                },
                data: [
                    {
                        name: '进度条',
                        value: 20, //进度条占比
                        itemStyle: {
                            normal: {
                                borderWidth: 6,
                                shadowBlur: 40,
                                borderColor: "#fa3a53",
                                shadowColor: 'rgba(0, 0, 0, 0)' //内环边框阴影
                            }
                        },
                    },
                    {
                        name: '底线',
                        value: 80, //底线占比
                        itemStyle: {
                            normal: {
                                color: "#d2d2d2",
                                borderColor: "#d2d2d2",
                                borderWidth: 0
                            },
                            emphasis: {
                                color: "#d2d2d2",
                                borderColor: "#d2d2d2",
                                borderWidth: 0
                            }
                        },
                    }
                ]
            },
            {
                name: '环内文字',
                type: 'pie',
                clockWise: true,
                hoverAnimation: false,
                radius: [0, 65],
                label: {
                    normal: {
                        position: 'center',
                        /*formatter: ['{a}'],*/
                        /*backgroundColor: '#2d313b',
                         textStyle: {
                         color: '#fff',
                         fontSize: 26,
                         },*/
                        formatter: [
                            '{a|20%}', //百分比值
                        ].join(''),
                        rich: {
                            a: {
                                color: '#fff',
                                //lineHeight: 10,
                                width: 120,
                                height: 70,
                                padding: [50,0,0,0],
                                fontSize: 24,
                                borderRadius: 120,
                                //backgroundColor: '#2d313b',
                                backgroundColor: {
                                    image: '${ctx}/img/echartbg.png',
                                }
                            }
                        }
                    }
                },
                data: [{
                    value: 1
                }]
            }
        ]
    };

    echatPie.setOption(option);




</script>
</body>
</html>