<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-提交订单</title>
	<link rel="stylesheet" type="text/css" href="${APP_Path}/static/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${APP_Path}/static/css/main.css">

</head>
<body>
	<%@include file="/static/console_element/top.jsp" %>
	<div class="search_bar clearfix">
		<a href="${APP_Path}/index" class="logo fl"><img src="${APP_Path}/static/images/logo.png"></a>
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;提交订单</div>
		<div class="search_con fr">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>		
	</div>
	
	<h3 class="common_title">确认收货地址</h3>

	<div class="common_list_con clearfix" id="addressInfo">
		<dl>
			<dt>寄送到：</dt>
			<dd><input type="radio" name="" checked="">北京市 海淀区 东北旺西路8号中关村软件园 （李思 收） 182****7528</dd>
		</dl>
		<a href="${APP_Path}/user_center_site" class="edit_site">编辑收货地址</a>
	</div>
	
	<h3 class="common_title">支付方式</h3>
	<div class="common_list_con clearfix">
		<div class="pay_style_con clearfix">
			<input type="radio" name="pay_style" checked>
			<label class="cash">货到付款</label>
			<input type="radio" name="pay_style">
			<label class="weixin">微信支付</label>
			<input type="radio" name="pay_style">
			<label class="zhifubao"></label>
			<input type="radio" name="pay_style">
			<label class="bank">银行卡支付</label>
		</div>
	</div>

	<h3 class="common_title">商品列表</h3>
	<!-- 订单商品信息 -->
	<div class="common_list_con clearfix" id="goods_list_th">
		<%-- 商品列表模块 --%>
			<ul class="goods_list_th clearfix">
				<li class="col01">商品名称</li>
				<li class="col02">商品单位</li>
				<li class="col03">商品价格</li>
				<li class="col04">数量</li>
				<li class="col05">小计</li>
			</ul>
			<ul class="goods_list_td clearfix">
				<%--<li class="col01">1</li>
				<li class="col02"><img src="#"></li>

				<li class="col03">草莓</li>
				<li class="col04">g</li>
				<li class="col05">30</li>
				<li class="col06">3</li>
				<li class="col07">90</li>
				<input type="hidden" name="oiId" id="oiId" value="'+data[i]['oiId']+'">--%>
			</ul>
	</div>

	<h3 class="common_title">总金额结算</h3>

	<div class="common_list_con clearfix">
		<div class="settle_con">
			<%-- 总金额结算模块 --%>
				<div class="total_goods_count">共<em>'+data.length+'</em>件商品，总金额<b>'+total.toFixed(2)+'元</b></div>
				<div class="transit">运费：<b>'+transit+'元</b></div>
				<div class="total_pay">实付款：<b>'+total_pay+'元</b></div>
		</div>
	</div>

	<div class="order_submit clearfix">
		<a href="javascript:;" id="order_btn">提交订单</a>
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

	<div class="popup_con">
		<div class="popup">
			<p>订单提交成功！</p>
		</div>
		
		<div class="mask"></div>
	</div>

	<script src="${APP_Path}/static/js/jquery-1.8.3.min.js"></script>
	<script src="${APP_Path}/static/layer/layer.js"></script>
	<script type="text/javascript">
        $(function() {
            //解析url数据 返回 theRequest对象
            function theRequest() {
                var url = window.location.search;
                var theRequest = new Object();
                if (url.indexOf("?") != -1) {
                    var str = url.substr(1);
                    var strs = str.split("&");
                    for (var i = 0; i < strs.length; i++) {
                        theRequest[strs[i].split("=")[0]] = decodeURI(strs[i].split("=")[1]);
                    }
                    return theRequest;
                }
            }

            var oiId = theRequest().oiId;

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
                        $("#addressInfo dl dd").html('<input type="radio" name="" checked="">'+address)
                    },
                    error : function () {
                        layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                        })
                    }
                })
            }else{
                window.location.href="${APP_Path}/login";
            }


			var data = {
                "oiId" : oiId
			}

            //查询商品列表
			$.ajax({
				type : "post",
				url  : "doAJAXGetOrderByOiId",
				data : data,
				dataType : "json",
                beforeSend:function () {
                    layerIndex = layer.msg('处理中',{icon:16});
                },
				success  : function (result) {
                    layer.close(layerIndex)
                    var object = result.object

                    var title = '<ul class="goods_list_th clearfix">'
                    title += '<li class="col01">商品名称</li>'
                    title += '<li class="col02">商品单位</li>'
                    title += '<li class="col03">商品价格</li>'
                    title += '<li class="col04">数量</li>'
                    title += '<li class="col05">小计</li>'
                    title += '</ul>'
                    var goods_list_td = [];
                    var total = 0.0;
                    for (var j = 0; j < object.length ; j++) {
						var orderItemList = object[j].orderItemList
                        for (var i = 0; i < orderItemList.length; i++) {

                            var price = (parseInt(orderItemList[i]['oipCount']) * parseInt(orderItemList[i]['oipUnitPrice'])).toFixed(2);
                            var goods = '<ul class="goods_list_td clearfix">';

                            goods += '<li class="col01">'+(j+1)+'</li>';
                            goods += '<li class="col02"><img src="${APP_Path}/static/'+orderItemList[i]['product']['pImage']+'"></li>';
                            goods += '<li class="col03">'+orderItemList[i]['product']['pName']+'</li>';
                            goods += '<li class="col04">'+orderItemList[i]['product']['pUnit']+'g</li>';
                            goods += '<li class="col05">'+orderItemList[i]['product']['pUnitPrice'].toFixed(2)+'</li>';
                            goods += '<li class="col06">'+orderItemList[i]['oipCount']+'</li>';
                            goods += '<li class="col07">'+price+'元</li>';
                            goods += '<input type="hidden" name="oiId" id="oiId" value="'+orderItemList[i]['oiId']+'">'
                            goods += '</ul>';
                            goods_list_td.push(goods);
                            total = total+(parseInt(price));
                        }
                    }

                    $("#goods_list_th").html(goods_list_td);
                    var transit =  total>99?0.00:10.00;
                    var total_pay = total>99?total.toFixed(2):(total+10).toFixed(2);
                    var settle_con = '<div class="total_goods_count">共<em>'+orderItemList.length+'</em>件商品，总金额<b>'+total.toFixed(2)+'元</b></div>';
                    settle_con += '<div class="transit">运费：<b>'+transit+'元</b></div>';
                    settle_con += '<div class="total_pay">实付款：<b>'+total_pay+'元</b></div>';
                    $(".settle_con").html(settle_con);
                }
                ,error : function () {
                    layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                    })
                }
			})




                /*
                    alert($("#oiId").val());  订单Id
                    alert($(".total_pay b").html().split("元")[0]);  订单价格
                */

            $("#order_btn").click(function() {
                //解析url数据 返回 theRequest对象
                function theRequest() {
                    var url = window.location.search;
                    var theRequest = new Object();
                    if (url.indexOf("?") != -1) {
                        var str = url.substr(1);
                        var strs = str.split("&");
                        for (var i = 0; i < strs.length; i++) {
                            theRequest[strs[i].split("=")[0]] = decodeURI(strs[i].split("=")[1]);
                        }
                        return theRequest;
                    }
                }
                var oiId = theRequest().oiId;
                var data = {
                    "oiId" : oiId
                }
                $.ajax({
                    type : "post",
                    url  : "doAJAXUpdOrderByOiId",
                    data : data,
                    dataType : "json",
                    beforeSend:function () {
                        layerIndex = layer.msg('处理中',{icon:16});
                    },
                    success  : function (result) {
                        layer.close(layerIndex)
                        var success = result.success
                        if(success == true){
                            //提交成功
                            localStorage.setItem('order_finish',2);
                            $('.popup_con').fadeIn('fast', function() {
                                setTimeout(function(){
                                    $('.popup_con').fadeOut('fast',function(){
                                        window.location.href = '${APP_Path}/user_center_order';
                                    });
                                },3000)
                            });
                        }
                    }
                    ,error : function () {
                        layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                        })
                    }
                })
            });
        });


	</script>
</body>
</html>