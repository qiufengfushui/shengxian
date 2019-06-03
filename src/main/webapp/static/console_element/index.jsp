<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="${APP_Path}/static/js/jquery-1.8.3.min.js"></script>
<script>
		$(function() {
			if('${userSession.userName}' != ''){
				$(".login_info").show();
				$(".login_btn").hide();
			}else{
				$(".login_info").hide();
				$(".login_btn").show();
			}
		});
	</script>
</head>
<body>
	<div class="header_con">
		<div class="header">
			<div class="welcome fl">欢迎来到天天生鲜!</div>
			<div class="fr">
				<div class="login_info fl">
					欢迎您：<em>${userSession.userName}</em>
				</div>
				<div class="login_btn fl">
					<a href="${APP_Path}/login">登录</a>
					<span>|</span>
					<a href="${APP_Path}/register">注册</a>
				</div>
				<div class="user_link fl">
					<span>|</span>
					<a href="${APP_Path}/user_center_info">用户中心</a>
					<span>|</span>
					<a href="${APP_Path}/cart">我的购物车</a>
					<span>|</span>
					<a href="${APP_Path}/user_center_order">我的订单</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>