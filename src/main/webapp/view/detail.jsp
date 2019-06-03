<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-商品详情</title>
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
				<!-- 商品分类 -->	
				<ul class="subnav"></ul>
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
		<a href="${APP_Path}/list?pName= &pageNum=1">全部分类</a>
		<span>></span>
		<a href="${APP_Path}/list">新鲜水果</a>
		<span>></span>
		<a href="#">商品详情</a>
	</div>
	
	<!-- 商品信息 -->
	<div class="goods_detail_con clearfix">
		<!-- 商品详情图 -->
		<div class="goods_detail_pic fl"></div>
		<!-- 商品信息 -->
		<div class="goods_detail_list fr"></div>
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
			<ul class="detail_tab clearfix">
				<li class="active">商品介绍</li>
				<li>评论</li>
			</ul>
			<div class="tab_content">
				<dl>
					<dt>商品详情：</dt>
					<dd>草莓采摘园位于北京大兴区 庞各庄镇四各庄村 ，每年1月-6月面向北京以及周围城市提供新鲜草莓采摘和精品礼盒装草莓，草莓品种多样丰富，个大香甜。所有草莓均严格按照有机标准培育，不使用任何化肥和农药。草莓在采摘期间免洗可以直接食用。欢迎喜欢草莓的市民前来采摘，也欢迎各大单位选购精品有机草莓礼盒，有机草莓礼盒是亲朋馈赠、福利送礼的最佳选择。 </dd>
				</dl>
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
	
	<div class="add_jump"></div>
	<script src="${APP_Path}/static/js/jquery-1.8.3.min.js"></script>
	<script src="${APP_Path}/static/layer/layer.js"></script>
	<script type="text/javascript">
        $(function() {
            //过滤url参数
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
            if (theRequest().pId == "" && theRequest().pId == 0) {
                window.location.href = "${APP_Path}/index";
                return;
            }
            data = {
                "pId": theRequest().pId
            }

            /* 查询单个商品信息 */
            $.ajax({
				type : "post",
				url  : "doAJAXGetProductByPId",
				data : data,
				dataType : "json",
                beforeSend:function () {
                    layerIndex = layer.msg('处理中',{icon:16});
                },
				success  : function (result) {
				    layer.close(layerIndex)
					var data = result.object;
                    var img = "<img src='${APP_Path}/static/"+data['pBigImage']+"'>";
                    $(".goods_detail_pic").html(img);
                    var pId = '<input type="hidden" value="'+data['pId']+'" id="pId">'
                    var h3 = "<h3>"+data['pName']+"</h3>";
                    var p = "<p>"+data['pTitle']+"</p>"
                    var prize_bar = "<div class='prize_bar'><span class='show_pirze'>¥<em>"+data['pUnitPrice'].toFixed(2)+"</em></span><span class='show_unit'>单  位："+data['pUnit']+"g</span></div>";
                    var goods_num = "<div class='goods_num clearfix'><div class='num_name fl'>数 量：</div><div class='num_add fl'><input type='text' class='num_show fl' value='1'><a href='javascript:;' class='add fr' onclick='add()'>+</a><a href='javascript:;' class='minus fr' onclick='minus()'>-</a></div></div>";
                    var total = '<div class="total">总价：<em>'+data['pUnitPrice'].toFixed(2)+'元</em></div>'
                    var operate_btn = '<div class="operate_btn"><a href="javascript:;" class="buy_btn" onclick="buy_btn('+data['pId']+')">立即购买</a><a href="javascript:;" class="add_cart" id="add_cart" onclick = add_cart('+data['pId']+');>加入购物车</a></div>';
                    var goods_detail_list = pId+h3 + p + prize_bar + goods_num + total + operate_btn;
                    $(".goods_detail_list").html(goods_detail_list);
                    /* 绑定二级分类 */
                	var citiao = '<a href="${APP_Path}/list?pName= &pageNum=1">全部分类</a><span>></span><a href="${APP_Path}/list?ptId='+data["pType"]+'">'+data['productType']['ptName']+'</a><span>></span><a href="#">商品详情</a>'
                    $(".breadcrumb").html(citiao);
                },
				error : function () {
                    layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                    })
                }
			})

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
                }/*,
				error : function () {
                    layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                    })
                }*/
            })



        })

		function buy_btn(pId){
            var total = $(".total em").html()
            var data = {
                "pId"    : pId,
                "pCount" : $(".num_show").val(),
				"total"  : parseFloat(total)
            }
            $.ajax({
                type: "post",
                url: "doAJAXAddOrder",
                data: data,
                dataType: "json",
                beforeSend:function () {
                    layerIndex = layer.msg('处理中',{icon:16});
                },
                success: function (result) {
                    layer.close(layerIndex)
                    var success = result.success;
                    var object = result.object;
                    if (success == true) {
                        location.href = '${APP_Path}/place_order?oiId='+object;
                    } else {
                        layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                        })
                    }
                }/*,
                error : function () {
                    layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                    })
                }*/
            })
		}

       //加入购物车事件
        function add_cart(pId) {
            var data = {
                "pId":pId,
                "pCount":$(".num_show").val()
            }
            $.ajax({
				type  :  "post",
				url   :  "doAJAXAddShopping",
				data  :  data,
				dataType  :  "json",
                beforeSend:function () {
                    layerIndex = layer.msg('处理中',{icon:16});
                },
				success  :  function (result) {
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
                },error  :  function () {
                    layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                    })
                }

			})

        }

       /* 计算总价 */
        function total(num) {
            var prize = parseFloat($(".show_pirze em").html())*num;
            prize = prize.toFixed(2);
            $(".total em").html(prize+"元");
        }

		/* 减少数量 */
        function minus() {
            var num_show = $(".num_show").val();
            var num = parseInt(num_show)-1;
            if(num>0){
                $(".num_show").val(num);
                total(num);
            }
        }

        /* 增加数量 */
        function add() {
            var num_show = $(".num_show").val();
            var num = parseInt(num_show)+1;
            $(".num_show").val(num);
            total(num);
        }
	</script>
</body>
</html>