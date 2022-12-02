<%--
  Created by IntelliJ IDEA.
  User: SuQiZhe
  Date: 2022/11/23
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>echarts测试</title>
</head>
<body style="margin: 5% 26% 0% 29%;">
<!-- 1.引入 echarts.js -->
<script type="text/javascript" src="../resources/js/echarts.js"></script>
<!-- 引入jquery.js -->
<script type="text/javascript" src="../resources/js/jquery.min.js"></script>
<div style="text-align: center;">
    <h2>欢迎访问电影后台管理系统</h2>
    <h3>作者：第六组</h3>
    <h3>组员：甄纪元 朱冬阳 莫宇航 李誉謄 山睿铭 胡梦莹</h3>
</div>
<!-- 2.为ECharts准备一个具备大小（宽高）的Dom -->
<div align="center">
<div id="main" align="right" style="width: 800px; height: 400px;"></div>
<div id="news" align="left" style="width: 800px; height: 400px;"></div>
</div>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));

    //3.初始化，默认显示标题，图例和xy空坐标轴
    myChart.setOption({

        title : {
            text : '电影类别信息',
            x: 'center'
        },
        tooltip : {},

        legend : {

            data : [ '类别数量' ]
        },
        xAxis : {
            data : []
        },
        yAxis : {},
        series : [ {
            name : '数量',
            type : 'bar',
            data : []
        } ]
    });

    //4.设置加载动画(非必须)
    myChart.showLoading(); //数据加载完之前先显示一段简单的loading动画
    var result = ${requestScope.json}
    //5.定义数据存放数组(动态变)
    var names = []; //建立一个类别数组（实际用来盛放X轴坐标值）
    var nums = []; //建立一个销量数组（实际用来盛放Y坐标值）

    for (var i = 0; i < result.length; i++) {
        names.push(result[i].filmtype); //迭代取出类别数据并填入类别数组
    }
    for (var i = 0; i < result.length; i++) {
        nums.push(result[i].num); //迭代取出销量并填入销量数组
    }
    myChart.hideLoading(); //隐藏加载动画
    //9.覆盖操作-根据数据加载数据图表
    myChart.setOption({
        xAxis : {
            data : names
        },
        series : [ {
            // 根据名字对应到相应的数据
            name : '数量',
            data : nums
        } ]
    });

    //图2
    var NewsChart = echarts.init(document.getElementById('news'));
    //3.初始化，默认显示标题，图例和xy空坐标轴
    var Newsoption = {

        backgroundColor: '#FFF0F5',

        title: {
            text: '新闻数据',
            subtext: '新闻数据',
            x: 'center'
        },

        legend: {
            // orient 设置布局方式，默认水平布局，可选值：'horizontal'（水平） ¦ 'vertical'（垂直）
            orient: 'horizontal',
            // x 设置水平安放位置，默认全图居中，可选值：'center' ¦ 'left' ¦ 'right' ¦ {number}（x坐标，单位px）
            x: 'left',
            // y 设置垂直安放位置，默认全图顶端，可选值：'top' ¦ 'bottom' ¦ 'center' ¦ {number}（y坐标，单位px）
            y: 'top',
            data: ['实际']
        },

        //  图表距边框的距离,可选值：'百分比'¦ {number}（单位px）
        grid: {
            top: '16%',   // 等价于 y: '16%'
            left: '3%',
            right: '8%',
            bottom: '3%',
            containLabel: true
        },

        // 提示框
        tooltip: {
            trigger: 'axis'
        },

        // //工具框，可以选择
        // toolbox: {
        //     feature: {
        //         saveAsImage: {} //下载工具
        //     }
        // },
    };
    NewsChart.setOption(Newsoption);
    //4.设置加载动画(非必须)
    NewsChart.showLoading(); //数据加载完之前先显示一段简单的loading动画
    //5.定义数据存放数组(动态变)
    var News = ${requestScope.NewsData}
    var NewsDates = []
    var NewsNums = []

    for (var i = 0; i < News.length; i++) {
        NewsDates.push(News[i].newsDate); //迭代取出类别数据并填入类别数组
    }
    for (var i = 0; i < News.length; i++) {
        NewsNums.push(News[i].newsNum); //迭代取出销量并填入销量数组
    }
    NewsChart.hideLoading(); //隐藏加载动画
    NewsChart.setOption({
        xAxis: {
            name: '日期',
            type: 'category',
            axisLine: {
                lineStyle: {
                    // 设置x轴颜色
                    color: '#912CEE'
                }
            },
            // 设置X轴数据旋转倾斜
            axisLabel: {
                rotate: 30, // 旋转角度
                interval: 0  //设置X轴数据间隔几个显示一个，为0表示都显示
            },
            // boundaryGap值为false的时候，折线第一个点在y轴上
            boundaryGap: false,
            data: NewsDates
        },
        yAxis: {
            name: '数值',
            type: 'value',
            // min:0, // 设置y轴刻度的最小值
            // max:1800,  // 设置y轴刻度的最大值
            // splitNumber:9,  // 设置y轴刻度间隔个数
            axisLine: {
                lineStyle: {
                    // 设置y轴颜色
                    color: '#87CEFA'
                }
            },
        },
        series: [
            {
                name: '实际',
                data: NewsNums,
                type: 'line',
                // 设置折线上圆点大小
                symbolSize:8,
                itemStyle:{
                    normal:{
                        // 拐点上显示数值
                        label : {
                            show: true
                        },
                        borderColor:'red',  // 拐点边框颜色
                        lineStyle:{
                            width:5,  // 设置线宽
                            type:'dotted'  //'dotted'虚线 'solid'实线
                        }
                    }
                }
            }
        ],
        color: ['#FF9F7F']
    })

</script>
</body>
</html>

