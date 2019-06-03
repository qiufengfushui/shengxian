<%--
  Created by IntelliJ IDEA.
  User: Mr.Tong
  Date: 2019/4/17
  Time: 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>天天生鲜-注册</title>
    <link rel="stylesheet" type="text/css" href="${APP_Path}/static/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${APP_Path}/static/css/main.css">
</head>
<body>
<div class="register_con">
    <div class="l_con fl">
        <a class="reg_logo"><img src="${APP_Path}/static/images/logo02.png"></a>
        <div class="reg_slogan">足不出户  ·  新鲜每一天</div>
        <div class="reg_banner"></div>
    </div>

    <div class="r_con fr">
        <div class="reg_title clearfix">
            <h1>用户注册</h1>
            <a href="${APP_Path}/login">登录</a>
        </div>
        <div class="reg_form clearfix">
            <form>
                <ul>
                    <li>
                        <label>用户名:</label>
                        <input type="text" name="userName" id="userName">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>密码:</label>
                        <input type="password" name="userPwd1" id="userPwd1">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>确认密码:</label>
                        <input type="password" name="userPwd2" id="userPwd2">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li>
                        <label>邮箱:</label>
                        <input type="text" name="userEmail" id="userEmail">
                        <span class="error_tip">提示信息</span>
                    </li>
                    <li class="agreement">
                        <input type="checkbox" name="allow" id="allow" checked="checked">
                        <label>同意”天天生鲜用户使用协议“</label>
                        <span class="error_tip2">提示信息</span>
                    </li>
                    <li class="reg_sub">
                        <input type="hidden"name="action" value="register"/>
                        <input type="button" value="注 册" onclick="return register()">
                    </li>
                </ul>
            </form>
        </div>
    </div>

</div>

<div class="footer no-mp">
    <div class="foot_link">
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

<script type="text/javascript" src="${APP_Path}/static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${APP_Path}/static/js/register.js"></script>
<script src="${APP_Path}/static/layer/layer.js"></script>
<script type="text/javascript">
    function checkEmailIsExist() {
        var fals = null ;
        var userEmail = $("#userEmail").val()
        var data = {
            userEmail : userEmail
        }
        $.ajax({
            type:"post",
            url:"doAJAXCheckEmailIsExist",
            data:data,
            dataType:"json",
            async:false,
            success:function (result) {
                fals = result.success;
            },
            error : function () {
                layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                })
            }
        })
        return fals;
    }
    function register() {
        //验证用户名是否为空！
        var userName = $("#userName").val()
        if(userName == ''){
            layer.msg("用户名不能为空，请输入！",{time:1500,icon:5,shift:6},function () {

            })
            return;
        }
        //验证用户密码是否为空！
        var userPwd1 = $("#userPwd1").val()
        if(userPwd1 == ''){
            layer.msg("用户密码不能为空，请输入！",{time:1500,icon:5,shift:6},function () {

            })
            return;
        }
        //验证用户确认密码是否为空！
        var userPwd2 = $("#userPwd2").val()
        if(userPwd2 == ''){
            layer.msg("用户确认密码不能为空，请输入！",{time:1500,icon:5,shift:6},function () {

            })
            return;
        }
        if(userPwd1 != userPwd2){
            layer.msg("两次密码输入不一致！",{time:1500,icon:5,shift:6},function () {

            })
            return;
        }
        //验证用户邮箱是否为空！
        var userEmail = $("#userEmail").val()
        var flag = false;
        var myreg = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
        if(userEmail ==''){
            layer.msg("邮箱不能为空！",{time:1500,icon:5,shift:6},function () {

            })
            return;
        }else if(!myreg.test(userEmail)){
            layer.msg("请输入有效的邮箱地址！",{time:1500,icon:5,shift:6},function () {

            })
            return;
        }else if(checkEmailIsExist()){
            layer.msg("该邮箱地址已经被注册！",{time:1500,icon:5,shift:6},function () {

            })
            return;
        }
        var data = {
            userName : userName,
            userPwd1 : userPwd1,
            userPwd2 : userPwd2,
            userEmail : userEmail
        }
        $.ajax({
            type:"post",
            url:"doAJAXRegister",
            data:data,
            dataType:"json",
            beforeSend:function () {
                layerIndex = layer.msg('处理中',{icon:16});
            },
            success:function (result) {
                layer.close(layerIndex);
                if(result.success == true){
                    window.location.href = "${APP_Path}/login";
                }else{
                    layer.msg("注册失败！",{time:1500,icon:5,shift:6},function () {

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