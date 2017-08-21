<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/comm/mytags.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>后台管理系统登陆</title>
    <link rel="shortcut icon" href="${ctx}/static/img/favicon.ico">
    <link rel="stylesheet" href="${ctx}/static/layui_v2/css/layui.css">
    <link rel="stylesheet" href="${ctx}/static/css/login.css">
    <script type="text/javascript" src="${ctx}/static/layui_v2/layui.js"></script>
</head>
<body>
<div class="layui-carousel video_mask" id="login_carousel" >
    <div carousel-item>
        <div class="carousel_div1"></div>
        <div class="carousel_div2"></div>
        <div class="carousel_div3"></div>
    </div>
    <%--<video class="video-player" preload="auto" autoplay="autoplay"  muted = "true" loop="loop" data-height="1080" data-width="1920" height="1080" width="1920">--%>
    <%--<source src="${ctx}/static/video/video1.mp4" type="video/mp4">--%>
    <%--<!-- 此视频文件为腾讯所有，在此仅供样式参考，如用到商业用途，请自行更换为其他视频或图片，否则造成的任何问题使用者本人承担，谢谢 -->--%>
    <%--</video>--%>
    <%--<div class="video_mask"></div>--%>
    <div class="login layui-anim layui-anim-up">
        <h1>CMS 后台管理系统</h1></p>
        <form class="layui-form" action="" method="post">
            <div class="layui-form-item">
                <input type="text" name="username" lay-verify="required" placeholder="请输入账号" autocomplete="off"  value="" class="layui-input">
            </div>
            <div class="layui-form-item">
                <input type="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" value="" class="layui-input">
            </div>
            <button class="layui-btn login_btn" lay-submit="" lay-filter="login">登陆系统</button>
        </form>

    </div>

</div>
</body>
</html>
<script>
    layui.config({
        base : "${ctx}/static/js/"
    }).use(['form','layer','jquery','common','carousel'], function () {
        var $ = layui.jquery,
                form = layui.form,
                common = layui.common,
                carousel = layui.carousel;

        /**背景图片轮播*/
        carousel.render({
             elem: '#login_carousel',
             width: '100%',
             height: '100%',
             interval:2000,
             arrow: 'none',
             anim: 'fade',
             indicator:'none'
        });

        /**监听登陆提交*/
        form.on('submit(login)', function (data) {
            //弹出loading
            var loginLoading = top.layer.msg('登陆中，请稍候', {icon: 16, time: false, shade: 0.8});
            //记录ajax请求返回值
            var ajaxReturnData;

            //登陆验证
            $.ajax({
                url: '${ctx}/loginCheck.do',
                type: 'post',
                async: false,
                data: data.field,
                success: function (data) {
                    ajaxReturnData = data;
                }
            });
            //登陆成功
            if (ajaxReturnData.returnCode == 0000) {
                window.location.href="${ctx}/main/index.do";
                top.layer.close(loginLoading);
                return false;
            } else {
                top.layer.close(loginLoading);
                common.cmsLayErrorMsg(ajaxReturnData.returnMessage)
                return false;
            }
        });
    });

</script>