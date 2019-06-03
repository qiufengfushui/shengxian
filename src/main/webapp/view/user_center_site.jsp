<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-用户中心</title>
	<link rel="stylesheet" type="text/css" href="${APP_Path}/static/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${APP_Path}/static/css/main.css">
	
</head>
<body>

	<%@include file="/static/console_element/top.jsp"  %>
	<%@include file="/static/console_element/user_search_bar.jsp" %>

	<div class="main_con clearfix">
		<%@include file="/static/console_element/user_center.jsp"%>
		<div class="right_content clearfix">
				<h3 class="common_title2">收货地址</h3>
				<div class="site_con">
					<dl>
						<dt>当前地址：</dt>
						<dd>暂无</dd>
					</dl>					
				</div>
				<h3 class="common_title2">编辑收货地址</h3>
				<div class="site_con">
					<form id="add_address">
						<div class="form_group">
							<label>收件人：</label>
							<input type="text" name="">
						</div>
						<div class="form_group form_group2">
							<label>详细地址：</label>
							<textarea class="site_area"></textarea>
						</div>
						<div class="form_group">
							<label>邮编：</label>
							<input type="text" name="">
						</div>
						<div class="form_group">
							<label>手机：</label>
							<input type="text" name="">
						</div>
						<input type="button" name="" value="提交" class="info_submit">
					</form>
				</div>
		</div>
	</div>



	<div class="footer">
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
	<script src="${APP_Path}/static/js/jquery-1.8.3.min.js"></script>
	<script src="${APP_Path}/static/layer/layer.js"></script>
	<script>
        $(function() {
            //假如用户对象不等于空，就查询该对象的默认收货地址
            if( '${userSession.userName}' != ""){
                $.ajax({
                    type : "post",
                    url  : "doAJAXGetAddressByUId",
                    dataType : "json",
                    beforeSend:function () {
                        layerIndex = layer.msg('处理中',{icon:16});
                    },
                    success  : function (result) {
                        layer.close(layerIndex)
                        var object = result.object
						var address = object['aAddress']+" ( "+object['aName']+" ) 收 "+object['phone']
						$(".right_content .site_con dl dd").html(address)
                    },
					error : function () {
                        layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                        })
                    }
                })
            }else{
                window.location.href="${APP_Path}/login";
            }

            //编辑收货地址
            $(".info_submit").click(function() {
                //验证用户编号是否为空！
                var uId = '${userSession.userId}'
                if(uId == ''){
                    layer.msg("登录失效，请重新登录！",{time:1500,icon:5,shift:6},function () {

                    })
                    window.location.href = "${APP_Path}/login"
                    return;
                }

                //验证收件人是否为空！
                var aName = $(".form_group input").val()
                if(aName == ''){
                    layer.msg("收件人不能为空，请输入",{time:1500,icon:5,shift:6},function () {

                    })
                    return;
                }

                //验证详细地址是否为空！
                var aAddress = $(".site_area").val()
                if(aAddress == ''){
                    layer.msg("详细地址不能为空，请输入",{time:1500,icon:5,shift:6},function () {

                    })
                    return;
                }

                //验证邮政编码是否为空！
                var zipCode = $(".form_group:eq(2) input").val()
                if(zipCode == ''){
                    layer.msg("邮政编码不能为空，请输入",{time:1500,icon:5,shift:6},function () {

                    })
                    return;
                }

				//验证手机号码是否为空！
                var phone = $(".form_group:eq(3) input").val()
                if(phone == ''){
                    layer.msg("手机号码不能为空，请输入",{time:1500,icon:5,shift:6},function () {

                    })
                    return;
                    //验证手机号码格式是否正确
                }else if(phone.length != 11){
                    layer.msg("手机号码输入有误，请重新输入",{time:1500,icon:5,shift:6},function () {

                    })
                    return;
				}

                data = {
                    "aName":aName,
                    "aAddress":aAddress,
                    "zipCode":zipCode,
                    "phone":phone
                }
                $.ajax({
					type  :  "post",
					url   :  "doAJAXUpdAddress",
					data  :  data,
					dataType  :  "json",
                    beforeSend:function () {
                        layerIndex = layer.msg('处理中',{icon:16});
                    },
					success   :  function (result) {
					    layer.close(layerIndex)
						var success = result.success
						if(success == true){
                            layer.msg("修改收货地址成功！",{time:1500,icon:6,shift:1},function () {
                                location.href = "${APP_Path}/user_center_site"
                            })
						}else{
                            layer.msg("修改收货地址失败！",{time:1500,icon:5,shift:6},function () {

                            })
						}
                    },
					error : function () {
                        layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                        })
                    }
				})
            })

        });
	</script>
</body>
</html>