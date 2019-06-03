<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="${APP_Path}/static/js/jquery-1.8.3.min.js"></script>
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
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;用户中心</div>
		<div class="search_con fr">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>		
	</div>
</body>
</html>