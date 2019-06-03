<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>搜索框</title>
    <script type="text/javascript" src="${APP_Path}/static/js/jquery-3.3.1.min.js"></script>
<script>
	$(function() {
		$(".input_btn").click(function() {
			var keyword = $(".input_text").val();
			window.location="${APP_Path}/list?keywork="+keyword+"&pageNum=1";
		});
	});
</script>
</head>
<body>
	<div class="search_bar clearfix">
		<a href="${APP_Path}/index" class="logo fl"><img src="${APP_Path}/static/images/logo.png"></a>
		<div class="search_con fl">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>
		<div class="guest_cart fr">
			<a href="${APP_Path}/cart" class="cart_name fl">我的购物车</a>
			<div class="goods_count fl" id="show_count">1</div>
		</div>
	</div>
</body>
</html>