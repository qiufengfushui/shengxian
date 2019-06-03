<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.zxt.shengxian.pojo.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-首页</title>
	<link rel="stylesheet" type="text/css" href="${APP_Path}/static/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${APP_Path}/static/css/main.css">

	<%User user = (User)session.getAttribute("userSession");%>
</head>
<body>
	<%@include file="/static/console_element/index.jsp" %>
	<%@include file="/static/console_element/search_bar.jsp" %>
	<div class="navbar_con">
		<div class="navbar">
			<h1 class="fl">全部商品分类</h1>
			<ul class="navlist fl">
				<li><a href="${APP_Path}/index">首页</a></li>
				<li class="interval">|</li>
				<li><a href="">手机生鲜</a></li>
				<li class="interval">|</li>
				<li><a href="">抽奖</a></li>
			</ul>
		</div>
	</div>
	
	<!-- 页面头部 -->
	<div class="center_con clearfix">
		<!-- 左侧导航栏 -->
		<ul class="subnav fl">

		</ul>
		<!-- 轮播图 -->
		<div class="slide fl">
			<ul class="slide_pics">
				<li><img src="${APP_Path}/static/images/slide.jpg" alt="幻灯片"></li>
				<li><img src="${APP_Path}/static/images/slide02.jpg" alt="幻灯片"></li>
				<li><img src="${APP_Path}/static/images/slide03.jpg" alt="幻灯片"></li>
				<li><img src="${APP_Path}/static/images/slide04.jpg" alt="幻灯片"></li>
			</ul>
			<div class="prev"></div>
			<div class="next"></div>
			<ul class="points"></ul>
		</div>
		<div class="adv fl">
			<a href="#"><img src="${APP_Path}/static/images/adv01.jpg"></a>
			<a href="#"><img src="${APP_Path}/static/images/adv02.jpg"></a>
		</div>
	</div>

	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model01">
				<%-- 商品分类名称 --%>
			</h3>
			<div class="subtitle fl">
				<%-- 商品信息推送 --%>
			</div>
			<%-- 查看更多 --%>
			<a href="#" class="goods_more fr" id="fruit_more">查看更多 &gt;</a>
		</div>
		<div class="goods_con clearfix">
			<div class="goods_banner fl">
				<%-- 商品分类图片 --%>
			</div>
			<ul class="goods_list fl">
				<%-- 商品信息模块 --%>
			</ul>
		</div>
	</div>

	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model02"></h3>
			<div class="subtitle fl"></div>
			<a href="#" class="goods_more fr" id="fruit_more">查看更多 &gt;</a>
		</div>
		<div class="goods_con clearfix">
			<div class="goods_banner fl"></div>
			<ul class="goods_list fl"></ul>
		</div>
	</div>

	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model03"></h3>
			<div class="subtitle fl"></div>
			<a href="#" class="goods_more fr" id="fruit_more">查看更多 &gt;</a>
		</div>
		<div class="goods_con clearfix">
			<div class="goods_banner fl"></div>
			<ul class="goods_list fl"></ul>
		</div>
	</div>

	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model04"></h3>
			<div class="subtitle fl"></div>
			<a href="#" class="goods_more fr" id="fruit_more">查看更多 &gt;</a>
		</div>
		<div class="goods_con clearfix">
			<div class="goods_banner fl"></div>
			<ul class="goods_list fl"></ul>
		</div>
	</div>

	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model05"></h3>
			<div class="subtitle fl"></div>
			<a href="#" class="goods_more fr" id="fruit_more">查看更多 &gt;</a>
		</div>
		<div class="goods_con clearfix">
			<div class="goods_banner fl"></div>
			<ul class="goods_list fl"></ul>
		</div>
	</div>

	<div class="list_model">
		<div class="list_title clearfix">
			<h3 class="fl" id="model06"></h3>
			<div class="subtitle fl"></div>
			<a href="#" class="goods_more fr" id="fruit_more">查看更多 &gt;</a>
		</div>
		<div class="goods_con clearfix">
			<div class="goods_banner fl"></div>
			<ul class="goods_list fl"></ul>
		</div>
	</div>

	<!-- 页面尾部 -->
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
	<script type="text/javascript" src="${APP_Path}/static/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${APP_Path}/static/js/slide.js"></script>
	<script src="${APP_Path}/static/layer/layer.js"></script>
	<script type="text/javascript">
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
                    citiao += '<li><a href="#model0'+(i+1)+'" class="model0'+(i+1)+'">'+list[i]["ptName"]+'</a></li>'

					var id = "model0"+(i+1)
					var href = "${APP_Path}/list?ptId="+list[i]['ptId']
                    document.getElementsByClassName("goods_more")[i].setAttribute("href",href)
                    document.getElementById(id).innerText=list[i]['ptName']
                    document.getElementsByClassName("goods_banner")[i].innerHTML='<img src="${APP_Path}/static/'+list[i]['ptImage']+'">';
                }

                $(".subnav").html(citiao)
            },
			error : function () {
                layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                })
            }
        })

        //查询商品集合
        var data = {
            count : 4
        }
        $.ajax({
            type:"post",
            url:"doAJAXGetProductListByCount",
            data:data,
            dataType:"json",
            async:false,//异步加载
            beforeSend:function () {
                layerIndex = layer.msg('处理中',{icon:16});
            },
			success:function (result) {
                layer.close(layerIndex)
                var list = result.list;
                for (var i = 0; i < list.length; i++) {
                    var citiao = ""
					var citiao2 = "<span>|</span>"
                    for (var j = 0; j < list[i].length; j++) {
                        citiao += '<li><h4><a href="${APP_Path}/detail?pId='+list[i][j]['pId']+'">'+list[i][j]['pName']+'</a></h4><a href="${APP_Path}/detail?pId='+list[i][j]['pId']+'"><img src="${APP_Path}/static/'+list[i][j]['pImage']+'"></a><div class="prize"> '+list[i][j]['pUnitPrice']+'.00</div></li>';
                        citiao2 += ' <a href="${APP_Path}/detail?pId='+list[i][j]['pId']+'">'+list[i][j]['pName']+'</a>';
                    }
                    document.getElementsByClassName("subtitle")[i].innerHTML = citiao2
                    document.getElementsByClassName("goods_list")[i].innerHTML=citiao;
                }
            },
			error : function () {
                layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                })
            }
        })

	</script>
</body>
</html>