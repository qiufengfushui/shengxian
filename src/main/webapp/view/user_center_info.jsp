<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-用户中心</title>
	<link rel="stylesheet" type="text/css" href="${APP_Path}/static/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${APP_Path}/static/css/main.css">

</head>
<body>
<%@include file="/static/console_element/top.jsp" %>
<%@include file="/static/console_element/user_search_bar.jsp" %>
	

	<div class="main_con clearfix">
		<%@include file="/static/console_element/user_center.jsp"%>
		<div class="right_content clearfix">
				<div class="info_con clearfix">
				<h3 class="common_title2">基本信息</h3>
						<ul class="user_info_list">
							<li>
								<span>用户名：</span>
								${userSession.userName}
							</li>
							<li>
								<span>联系方式：</span>
								${userSession.userPhone}
							</li>
							<li>
								<span>联系地址：</span>
								${userSession.userAddress}
							</li>
						</ul>
				</div>
				
				<h3 class="common_title2">最近浏览</h3>
				<div class="has_view_list">
					<ul class="goods_type_list clearfix">
				<li>
					<a href="${APP_Path}/detail"><img src="${APP_Path}/static/images/goods/goods003.jpg"></a>
					<h4><a href="${APP_Path}/detail">大兴大棚草莓</a></h4>
					<div class="operate">
						<span class="prize">￥16.80</span>
						<span class="unit">16.80/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>

				<li>
					<a href="#"><img src="${APP_Path}/static/images/goods/goods004.jpg"></a>
					<h4><a href="#">吐鲁番梨光杏</a></h4>
					<div class="operate">
						<span class="prize">￥5.50</span>
						<span class="unit">5.50/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>

				<li>
					<a href="#"><img src="${APP_Path}/static/images/goods/goods005.jpg"></a>
					<h4><a href="#">黄肉桃</a></h4>
					<div class="operate">
						<span class="prize">￥10.00</span>
						<span class="unit">10.00/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>

				<li>
					<a href="#"><img src="${APP_Path}/static/images/goods/goods006.jpg"></a>
					<h4><a href="#">进口西梅</a></h4>
					<div class="operate">
						<span class="prize">￥28.80</span>
						<span class="unit">28.8/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>

				<li>
					<a href="#"><img src="${APP_Path}/static/images/goods/goods007.jpg"></a>
					<h4><a href="#">香梨</a></h4>
					<div class="operate">
						<span class="prize">￥6.45</span>
						<span class="unit">6.45/500g</span>
						<a href="#" class="add_goods" title="加入购物车"></a>
					</div>
				</li>
			</ul>
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
<script src='${APP_Path}/static/js/jquery-1.8.3.min.js'></script>
<script src="${APP_Path}/static/layer/layer.js"></script>
</body>
</html>