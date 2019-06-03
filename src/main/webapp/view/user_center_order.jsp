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
	<%@include file="/static/console_element/top.jsp" %>
	<%@include file="/static/console_element/user_search_bar.jsp" %>


	<div class="main_con clearfix">
		<%@include file="/static/console_element/user_center.jsp"%>
		<div class="right_content clearfix">
				<h3 class="common_title2">全部订单</h3>
				<ul class="order_list_th w978 clearfix">
					<li class="col01">2016-8-21 17:36:24</li>
					<li class="col02">订单号：56872934</li>
					<li class="col02 stress">未支付</li>		
				</ul>

				<table class="order_list_table w980">
					<tbody>
						<tr>
							<td width="55%">
								<ul class="order_goods_list clearfix">					
									<li class="col01"><img src="${APP_Path}/static/images/goods02.jpg"></li>
									<li class="col02">嘎啦苹果嘎啦苹果<em>11.80元/500g</em></li>	
									<li class="col03">1</li>
									<li class="col04">11.80元</li>	
								</ul>
								<ul class="order_goods_list clearfix">					
									<li class="col01"><img src="${APP_Path}/static/images/goods02.jpg"></li>
									<li class="col02">嘎啦苹果嘎啦苹果<em>11.80元/500g</em></li>	
									<li class="col03">1</li>
									<li class="col04">11.80元</li>	
								</ul>
							</td>
							<td width="15%">33.60元</td>
							<td width="15%">待付款</td>
							<td width="15%"><a href="#" class="oper_btn">去付款</a></td>
						</tr>
					</tbody>
				</table>
				
				<ul class="order_list_th w978 clearfix">
					<li class="col01">2016-8-21 17:36:24</li>
					<li class="col02">订单号：56872934</li>
					<li class="col02 stress">已支付</li>			
				</ul>
				<table class="order_list_table w980">
					<tbody>
						<tr>
							<td width="55%">
								<ul class="order_goods_list clearfix">
									<li class="col01"><img src="${APP_Path}/static/images/goods02.jpg"></li>
									<li class="col02">嘎啦苹果嘎啦苹果<em>11.80元/500g</em></li>
									<li class="col03">1</li>
									<li class="col04">11.80元</li>
								</ul>
								<ul class="order_goods_list clearfix">					
									<li class="col01"><img src="${APP_Path}/static/images/goods02.jpg"></li>
									<li class="col02">嘎啦苹果嘎啦苹果<em>11.80元/500g</em></li>	
									<li class="col03">1</li>
									<li class="col04">11.80元</li>	
								</ul>
							</td>
							<td width="15%">33.60元</td>
							<td width="15%">已付款</td>
							<td width="15%"><a href="#" class="oper_btn">查看物流</a></td>
						</tr>
					</tbody>
				</table>

				<div class="pagenation">
					<a href="#">上一页</a>
					<a href="#" class="active">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#">下一页></a>
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
	<script type="text/javascript" src="${APP_Path}/static/js/jquery-1.8.3.min.js"></script>
	<script src="${APP_Path}/static/layer/layer.js"></script>
	<script type="text/javascript">
		$.ajax({
			type : "get",
			url  : "doAJAXGetOrderProduct",
			dataType : "json",
			success  : function (result) {
			    var object = result.object
			    var right_content = '<h3 class="common_title2">全部订单</h3>'
                for (var i = 0; i < object.length ; i++) {
                    var state = ""
					var href = "${APP_Path}/查看物流"
					var oper_btn = "查看物流"
                    if(object[i]['state'] == 1){
						state = "未支付"
                        oper_btn = "去付款"
						href = "${APP_Path}/place_order?oiId="+object[i]['oiId']
					}else if (object[i]['state'] == 2){
                        state = "未发货"
					}else if (object[i]['state'] == 3){
                        state = "未收货"
                    }else if (object[i]['state'] == 4){
                        state = "交易成功"
                    }
                    right_content += '<ul class="order_list_th w978 clearfix"><li class="col01">'+object[i]["dateTime"]+'</li><li class="col02">订单号：'+object[i]["oiId"]+'</li><li class="col02 stress">'+state+'</li></ul>'
					right_content += '<table class="order_list_table w980"><tbody><tr><td width="55%">'
					var orderItemList = object[i]['orderItemList']
                    for (var j = 0; j < orderItemList.length; j++) {
                        right_content += '<ul class="order_goods_list clearfix">' +
							'<li class="col01">' +
							'<img src="${APP_Path}/static/'+orderItemList[j]["product"]["pImage"]+'">' +
							'</li>' +
							'<li class="col02">'+orderItemList[j]["product"]["pName"]+'<em>'+orderItemList[j]["product"]["pUnitPrice"]+'元/'+orderItemList[j]["product"]["pUnit"]+'g</em>' +
							'</li>' +
							'<li class="col03">'+orderItemList[j]["oipCount"]+'</li>' +
							'<li class="col04">'+(orderItemList[j]["product"]["pUnitPrice"] * orderItemList[j]["oipCount"])+'元</li><ul>'

                    }
                    right_content += '</td><td width="15%">'+object[i]["total"]+'元</td><td width="15%">'+state+'</td><td width="15%"><a href="'+href+'" class="oper_btn">'+oper_btn+'</a></td></tr></tbody></table>'
                }
				$(".right_content").html(right_content)
            }
		})
	</script>
</body>
</html>