<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.zxt.shengxian.pojo.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>新闻发布系统管理后台</title>
<script type="text/javascript" src="${APP_Path}/static/js/jquery-1.8.3.min.js"></script>
<link href="${APP_Path}/static/css/main.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
$(function () {
	  <%User userSession = (User)session.getAttribute("userSession");%>;
	if( '${userSession.userName}' != ""){
		$(".login_info").show();
		$(".login_btn").hide();
	}else{
		window.location.href="${APP_Path}/login";
		return;
	}
});
</script>

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
</head>
<body>
