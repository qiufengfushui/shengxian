<%--
  Created by IntelliJ IDEA.
  User: Mr.Tong
  Date: 2019/3/18
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>天天生鲜-登录</title>
    <link rel="stylesheet" type="text/css" href="${APP_Path}/static/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${APP_Path}/static/css/main.css">


</head>
<body>
<div class="login_top clearfix">
    <a href="${APP_Path}/index" class="login_logo">
        <img src="${APP_Path}/static/images/logo02.png"></a>
</div>

<div class="login_form_bg">
    <div class="login_form_wrap clearfix">
        <div class="login_banner fl"></div>
        <div class="slogan fl">日夜兼程 · 急速送达</div>
        <div class="login_form fr">
            <div class="login_title clearfix">
                <h1>用户登录</h1>
                <a href="${APP_Path}/register">立即注册</a>
            </div>
            <div class="form_input">
                <form id="userLogin">
                    <input type="text" name="userName" id="userName" class="name_input" placeholder="请输入用户名">
                    <div class="user_error">输入错误</div>
                    <input type="password" name="userPwd" id="userPwd" class="pass_input" placeholder="请输入密码">
                    <div class="pwd_error">输入错误</div>
                    <div class="more_input clearfix">
                        <input type="checkbox" name="">
                        <label>记住用户名</label>
                        <a href="#">忘记密码</a>
                    </div>
                    <input type="button" name="" value="登录" class="input_submit" onclick="doLogin()">
                </form>
            </div>
        </div>
    </div>
</div>

<div class="footer no-mp">
    <div class="foot_link">	`
        <a href="#">关于我们</a>
        <span>|</span>
        <a href="#">联系我们</a>
        <span>|</span>
        <a href="#">招聘人才</a>
        <span>|</span>
        <a href="#">友情链接</a>
    </div>
    <p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
    <p>电话：010-****888    京ICP备*******8号</p>
</div>


<script type="text/javascript" src="${APP_Path}/static/js/jquery-3.3.1.min.js"></script>
<script src="${APP_Path}/static/layer/layer.js"></script>
<script>
    function doLogin() {
        //验证登录账号
        var userName =  $("#userName").val();
        if(userName == ''){
            layer.msg("用户登录账户不能为空，请输入！",{time:1500,icon:5,shift:6},function () {

            })
            return;
        }
        //验证登录密码
        var userPwd =  $("#userPwd").val();
        if(userPwd == ""){
            layer.msg("用户登录密码不能为空，请输入！",{time:1500,icon:5,shift:6},function () {

            })
            return;
        }
        //验证通过后，向后台发起AJAX请求
        var data = {
            userName : userName,
            userPwd : userPwd
        }
        $.ajax({
            type:"post",
            url:"doAJAXLogin",
            data:data,
            dataType:"json",
            beforeSend:function () {
                layerIndex = layer.msg('处理中',{icon:16});

            },
            success:function (result) {
                layer.close(layerIndex);
                if(result.success == true){
                    window.location.href = "${APP_Path}/index";
                }else{
                    layer.msg("账号与密码不匹配，请重新输入",{time:1500,icon:5,shift:6},function () {

                    })
                }
            },
            error : function () {
                layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                })
            }
        })
    }
</script>

</body>
</html>
