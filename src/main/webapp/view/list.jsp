<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-商品列表</title>

	<link rel="stylesheet" type="text/css" href="${APP_Path}/static/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${APP_Path}/static/css/main.css">
</head>
<body>
	<%@include file="/static/console_element/index.jsp" %>
	<%@include file="/static/console_element/search_bar.jsp" %>

	<div class="navbar_con">
		<div class="navbar clearfix">
			<div class="subnav_con fl">
				<h1>全部商品分类</h1>	
				<span></span>			
				<ul class="subnav">
					<%-- 商品分类信息 --%>
				</ul>
			</div>
			<ul class="navlist fl">
				<li><a href="">首页</a></li>
				<li class="interval">|</li>
				<li><a href="">手机生鲜</a></li>
				<li class="interval">|</li>
				<li><a href="">抽奖</a></li>
			</ul>
		</div>
	</div>

	<div class="breadcrumb">

	</div>

	<div class="main_wrap clearfix">
		<div class="l_wrap fl clearfix">
			<div class="new_goods">
				<h3>新品推荐</h3>
				<ul>
					<li>
						<a href="#"><img src="${APP_Path}/static/images/goods/goods001.jpg"></a>
						<h4><a href="#">进口柠檬</a></h4>
						<div class="prize">￥3.90</div>
					</li>
					<li>
						<a href="#"><img src="${APP_Path}/static/images/goods/goods002.jpg"></a>
						<h4><a href="#">玫瑰香葡萄</a></h4>
						<div class="prize">￥16.80</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="r_wrap fr clearfix">
			<div class="sort_bar">
				<a href="#" class="active">默认</a>
				<a href="#">价格</a>
				<a href="#">人气</a>
			</div>
			
			<!-- 商品信息模块 -->
			<ul class="goods_type_list clearfix">

			</ul>

			<div class="pagenation">
				<a href="#">上一页</a>
				<a href="#" class="active">1</a>
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

            //查询关键字
            var pName = theRequest().keywork;
            var ptId = theRequest().ptId;
            var pageNum = theRequest().pageNum;
            var qingqiu = ""
            if (pName != null) {
                qingqiu = "pName=" + pName;
            } else if (ptId != null) {
                qingqiu = "ptId=" + ptId;
            }
			/*
            if(ptId == null && pName == null ){
                window.location="${APP_Path}/index";
            }*/
            var ptName = "";
            if(ptId == 1){
                ptName = "新鲜水果";
            }else if(ptId == 2){
                ptName = "海鲜水产";
            }else if(ptId == 3){
                ptName = "猪肉羊肉";
            }else if(ptId == 4){
                ptName = "禽类蛋品";
            }else if(ptId == 5){
                ptName = "新鲜蔬菜";
            }else if(ptId == 6){
                ptName = "速冻视频";
            }
            var breadcrumb = '<a href="${APP_Path}/list?pName= &pageNum=1">全部分类</a><span>></span><a href="${APP_Path}/list?ptId='+ptId+'&pageNum=1">'+ptName+'</a>'
            $(".breadcrumb").html(breadcrumb);

            var uId = $(".login_info em").html();

            //查取商品分类集合
            $.ajax({
                type:"post",
                url:"doAJAXGetProductTypeList",
                dataType:"json",
                beforeSend:function () {
                    layerIndex = layer.msg('处理中',{icon:16});
                },
                success:function (result) {
                    layer.close(layerIndex)
                    var list = result.list;
                    var citiao = ""
                    for (var i = 0 ;i < list.length;i++){
                        citiao+= "<li><a href='${APP_Path}/list?ptId="+list[i]['ptId']+"&pageNum=1' class='model0"+list[i]['ptId']+"'>" + list[i]['ptName'] + "</a></li>";
                    }
                    $(".subnav").html(citiao)
                },
				error : function () {
                    layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                    })
                }
            })

            var data = {
                'ptId':ptId,
                'pName': pName,
                "pageNum":pageNum
            }
            /* 根据类型查询商品集合信息 */
            $.ajax({
                type:"post",
                url:"doAJAXGetProductListByType",
                data:data,
                dataType:"json",
                beforeSend:function () {
                    layerIndex = layer.msg('处理中',{icon:16});
                },
                success:function (result) {
                    layer.close(layerIndex)
                    var list = result.list;
                    var pageBean = result.pageBean
                    var goods_type_list = [];
                    for (var i = 0; i < list.length; i++) {
                        var li_begin = "<li id = " + list[i]['pId'] + ">";
                        var a = "<a href='${APP_Path}/detail?pId=" + list[i]['pId'] + "'><img src='${APP_Path}/static/" + list[i]['pImage'] + "'></a>";
                        var h4 = "<h4><a href='${APP_Path}/detail?pId=" + list[i]['pId'] + "'>" + list[i]['pName'] + "</a></h4>";
                        var div_begin = "<div class='operate'>";
                        var span_price = "<span class='prize'>" + list[i]['pUnitPrice'] + ".00</span>";
                        var span_unit = "<span class='unit'>" + list[i]['pUnit'] + "g</span>";
                        var add_goods = "<a href='javascript:;' onclick='add_cart(" + list[i]['pId'] + ")' class='add_goods' title='加入购物车'></a>";
                        var div_finish = "</div>";
                        var li_finish = "</li>";
                        var goods_type = li_begin + a + h4 + div_begin + span_price + span_unit + add_goods + div_finish + li_finish;
                        goods_type_list.push(goods_type);
                    }
                    //分页显示
                    var start = pageBean['start'];
                    var end = pageBean['end'];
                    var totalPage = pageBean['totalPage'];
                    //点击上一页
                    var previousPage = '<a href="javascript:;" style="opacity: 0.2">上一页</a>';
                    if(pageNum > 1){
                        //点击上一页发送请求 未实现
                        previous_page = pageNum - 1;
                        previousPage = '<a href="${APP_Path}/list?'+qingqiu+'&pageNum='+previous_page+'">上一页</a>'
                    }
                    //显示页码
                    var pagenation = '';
                    for (var i = start; i <= end; i++) {
                        if(i == pageNum){
                            pagenation += '<a href="javascript:;" style="opacity: 0.2" class="active">'+i+'</a>';
                        }else{
                            pagenation += '<a href="${APP_Path}/list?'+qingqiu+'&pageNum='+i+'" class="active">'+i+'</a>';
                        }
                    }

                    var nextPage = '<a href="javascript:;" style="opacity: 0.2">下一页></a>';
                    if(end > pageNum){
                        var next_Page = parseInt(pageNum) + 1;
                        nextPage = '<a href="${APP_Path}/list?'+qingqiu+'&pageNum='+next_Page+'">下一页></a>'
                    }
                    $(".pagenation").html(previousPage+pagenation+nextPage);

                    //绑定商品信息
                    if(goods_type_list == ""){
                        $(".goods_type_list").html("无此商品！");
                    }else{
                        $(".goods_type_list").html(goods_type_list);
                    }
                },
				error : function () {
                    layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                    })
                }
            })
        });
        /* 添加购物车事件 */
		function add_cart(pId) {

            var data = {
                "pId": pId,
                "pCount": 1
            }

            $.ajax({
                type: "post",
                url: "doAJAXAddShopping",
                data: data,
                dataType: "json",
                beforeSend:function () {
                    layerIndex = layer.msg('处理中',{icon:16});
                },
                success: function (result) {
                    layer.close(layerIndex)
                    var status = result.status;
                    if(status == "true"){
                        layer.msg("购物车添加商品成功！",{time:1500,icon:6,shift:1},function () {

                        })
					}else if(status == "false"){
                        layer.msg("购物车添加商品失败！",{time:1500,icon:5,shift:6},function () {

                        })
					}else if(status == "null"){
                        layer.msg("登录失效，请重新验证！",{time:1500,icon:5,shift:6},function () {

                        })
						window.location.href = "${APP_Path}/login";
					}else{
                        layer.msg("未知错误",{time:1500,icon:5,shift:6},function () {

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