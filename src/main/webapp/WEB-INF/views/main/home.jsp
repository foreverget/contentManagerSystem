<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="后台管理系统">
    <meta name="description" content="致力于提供通用版本后台管理解决方案">

    <link rel="shortcut icon" href="${ctx}/static/img/favicon.ico">
    <link rel="stylesheet" href="${ctx}/static/layui_v2/css/layui.css">

    <link rel="stylesheet" href="${ctx}/static/css/global.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/personal.css" media="all">
    <link rel="stylesheet" href="${ctx}/static/css/main.css">

    <link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_9h680jcse4620529.css">

    <script src="${ctx}/static/layui_v2/layui.js"></script>

    <script src="${ctx}/static/js/jquery-1.8.3.js"></script>
    <script src="${ctx}/static/js/jquery.leoweather.min.js"></script>

    <script type="text/javascript" src="${ctx}/static/echarts/echarts.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/static/echarts/macarons.js" charset="utf-8"></script>

</head>
<body>
<div class="larry-grid layui-anim layui-anim-upbit larryTheme-A" >
    <div class="larry-personal" >
        <div class="layui-tab" >
            <blockquote class="layui-elem-quote col-md-12 head-con">
                <div>${LOGIN_NAME.userName}<span id="weather"></span></div>
            </blockquote>
            <div class="larry-separate"></div>
            <!-- 菜单列表 -->
            <div class="layui-show" style="padding: 10px 15px;">
                <div class="panel_box row">
                    <div class="panel col">
                        <a href="javascript:;" data-url="page/message/message.html">
                            <div class="panel_icon">
                                <i class="layui-icon" data-icon="&#xe63a;">&#xe63a;</i>
                            </div>
                            <div class="panel_word newMessage">
                                <span>22</span>
                                <cite>站内公告</cite>
                            </div>
                        </a>
                    </div>
                    <div class="panel col">
                        <a href="javascript:;" data-url="page/message/message.html">
                            <div class="panel_icon">
                                <i class="layui-icon" data-icon="&#xe63a;">&#xe63a;</i>
                            </div>
                            <div class="panel_word newMessage">
                                <span>0</span>
                                <cite>待定</cite>
                            </div>
                        </a>
                    </div>
                    <div class="panel col">
                        <a href="javascript:;" data-url="page/user/allUsers.html">
                            <div class="panel_icon" style="background-color:#F7B824;">
                            <i class="layui-icon" data-icon="&#xe613;">&#xe613;</i>
                            </div>
                            <div class="panel_word waitNews">
                                <span>0</span>
                                <cite>待定</cite>
                            </div>
                        </a>
                    </div>
                    <div class="panel col max_panel">
                        <a href="javascript:;" data-url="page/img/images.html">
                            <div class="panel_icon" style="background-color:#5FB878;">
                                <i class="layui-icon" data-icon="&#xe64a;">&#xe64a;</i>
                            </div>
                            <div class="panel_word imgAll">
                                <span>0</span>
                                <cite>待定</cite>
                            </div>
                        </a>
                    </div>

                </div>

            </div>
            <div class="larry-separate"></div>
            <div class="row">
                <div class="sysNotice col">
                    <div class="layui-collapse" >
                        <div class="layui-colla-item">
                            <h2 class="layui-colla-title" style="background-color: #ffffff;">网站访问情况统计</h2>
                            <div class="layui-colla-content layui-show" >
                                <div id="container" style="height: 300px; margin: 0 auto;width: 100%;"></div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="sysNotice col">
                    <div class="layui-collapse">
                        <div class="layui-colla-item">
                            <h2 class="layui-colla-title" style="background-color: #ffffff;">网站访问情况统计</h2>
                            <div class="layui-colla-content layui-show" >
                                <div id="container2" style="height: 300px; margin: 0 auto;width: 100%;"></div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
    layui.config({
        base : "${ctx}/static/js/"
    }).use(['form','jquery','common','element'],function() {
        var $ = layui.$,
                form = layui.form,
                element = layui.element,
                common = layui.common;
        $('#weather').leoweather({format:'，{时段}好！，<span id="colock">现在时间是：<strong>{年}年{月}月{日}日 星期{周} {时}:{分}:{秒}</strong>，</span> <b>{城市}天气</b> {天气} {夜间气温}℃ ~ {白天气温}℃ '});


        //图表
        var psLineChar = echarts.init(document.getElementById('container'),'macarons');
        var option = {
            title : {
                text: '网站访问量',
                subtext: '纯属虚构'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['访问量']
            },
            toolbox: {
                show : true,
                feature : {
                    magicType : {type: ['line', 'bar']}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : ['周一','周二','周三','周四','周五','周六','周日']
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'访问量',
                    type:'line',
                    data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 0.2]
                }
            ]
        };


        //查询
        function loadDrugs() {
            psLineChar.clear();
            psLineChar.showLoading({text: '正在努力的读取数据中...'});
            psLineChar.setOption(option, true);
            psLineChar.hideLoading();

        }


        //载入图表
        loadDrugs();


        //图表
        var psLineChar2 = echarts.init(document.getElementById('container2'),'macarons');
        var option = {
            title : {
                text: '网站访问量',
                subtext: '纯属虚构'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['访问量']
            },
            toolbox: {
                show : true,
                feature : {
                    magicType : {type: ['line', 'bar']}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : ['周一','周二','周三','周四','周五','周六','周日']
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'访问量',
                    type:'bar',
                    data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 0.2]
                }
            ]
        };


        //查询
        function loadDrugs2() {
            psLineChar2.clear();
            psLineChar2.showLoading({text: '正在努力的读取数据中...'});
            psLineChar2.setOption(option, true);
            psLineChar2.hideLoading();

        }


        //载入图表
        loadDrugs2();

        //浏览器大小改变时重置大小
        window.onresize = function () {
            psLineChar.resize();
            psLineChar2.resize();

        };


    });

</script>
</body>
</html>