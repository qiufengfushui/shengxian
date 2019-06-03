<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>天天生鲜-购物车</title>
	<link rel="stylesheet" type="text/css" href="${APP_Path}/static/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${APP_Path}/static/css/main.css">
</head>
<body>
	<%@include file="/static/console_element/top.jsp" %>
	<div class="search_bar clearfix">
		<a href="${APP_Path}/index" class="logo fl"><img src="${APP_Path}/static/images/logo.png"></a>
		<div class="sub_page_name fl">|&nbsp;&nbsp;&nbsp;&nbsp;购物车</div>
		<div class="search_con fr">
			<input type="text" class="input_text fl" name="" placeholder="搜索商品">
			<input type="button" class="input_btn fr" name="" value="搜索">
		</div>		
	</div>
	<!-- ajax请求返回json数据 绑定json数据的长度 -->
	<div class="total_count">全部商品<em></em>件</div>	
	<ul class="cart_list_th clearfix">
		<li class="col01">商品名称</li>
		<li class="col02">商品单位</li>
		<li class="col03">商品价格</li>
		<li class="col04">数量</li>`
		<li class="col05">小计</li>
		<li class="col06">操作</li>
	</ul>
	
	<ul class="settlements">
		<li class="col01"><input type="checkbox" name="" onclick="zong(this)"></li>
		<li class="col02">全选</li>
		<li class="col03">合计(不含运费)：<span>¥</span><em>0.00</em><br>共计<b>0</b>件商品</li>
		<li class="col04"><a href="javascript:;" id = "closeAnAccount">去结算</a></li>
	</ul>

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
	<script src ="${APP_Path}/static/js/jquery-1.8.3.min.js"></script>
	<script src="${APP_Path}/static/layer/layer.js"></script>
	<script type="text/javascript">
        //购物车搜索框
        $(function() {
            $(".input_btn").click(function() {
                var keyword = $(".input_text").val();
                window.location = "${APP_Path}/list?keywork=" + keyword + "&pageNum=1";
            });
        });

        //查询购物车商品
        $(function() {
            $.ajax({
				type  :  "get",
				url   :  "doAJAXGetShoppingListByUId",
				dataType  :  "json",
                beforeSend:function () {
                    layerIndex = layer.msg('处理中',{icon:16});
                },
				success : function (result) {
				    layer.close(layerIndex)
				    var list = result.list;
				    if(list == null){
                        layer.msg("购物车没有商品，快去添加商品吧！",{time:1500,icon:5,shift:6},function () {
							location.href = "${APP_Path}/index"
                        })
						return
					}
                    $(".total_count em").html(list.length);
                    var cart_list_th = [];
                    for (var i = 0; i < list.length; i++) {
                        var cart_list_td = '<ul class="cart_list_td clearfix" id="sId'+list[i]['sId']+'">';
                        var col01 = '<li class="col01"><input type = "hidden" name="sId" value="'+list[i]['sId']+'"><input type="checkbox" name="pId" onclick="selected()" value="'+list[i]['product']['pId']+'='+list[i]['pCount']+'&"></li>';
                        var col02 = '<li class="col02"><img src="'+list[i]['product']['pImage']+'"></li>';
                        var col03 = '<li class="col03">'+list[i]['product']['pName']+'<br><em>'+list[i]['product']['pUnitPrice'].toFixed(2)+'元/'+list[i]['product']['pUnit']+'g</em></li>'
                        var col04 = '<li class="col04">'+list[i]['product']['pUnit']+'g</li>';
                        var col05 = '<li class="col05"><em>'+list[i]['product']['pUnitPrice'].toFixed(2)+'</em>元</li>';
                        var col06 = '<li class="col06"><div class="num_add" id ="1"><a href="javascript:;" class="add fl" onclick="add('+list[i]['sId']+')">+</a><input type="text" class="num_show fl" value="'+list[i]['pCount']+'"><a href="javascript:;" class="minus fl" onclick="minus('+list[i]['sId']+')">-</a></div></li>';
                        var col07 = '<li class="col07"><em class="price">'+((list[i]['product']['pUnitPrice'].toFixed(2))*(list[i]['pCount'].toFixed(2))).toFixed(2)+'</em>元</li>';
                        var col08 = '<li class="col08"><a href="javascript:;" onclick = del_shopping('+list[i]["sId"]+')>删除</a></li>';
                        var citiao = cart_list_td+col01+col02+col03+col04+col05+col06+col07+col08;
                        cart_list_th.push(citiao);
                    }
                    $(".cart_list_th").after(cart_list_th);
                },
				error : function () {
                    layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                    })
                }
			})
        });
		//创建订单集
        $(function() {
            $("#closeAnAccount").click(function () {
                var price = $(".settlements .col03 em").html();
                var values = "";
                $("input[name='pId']:checkbox:checked").each(function () {
                    values += $(this).val();
                });
                var sIds = ""
                $("input[name='pId']:checkbox:checked").prev().each(function () {
                    sIds += $(this).val()+",";
                });
                if(values == ""){
                    layer.msg("请选择你要结算的商品！",{time:1500,icon:5,shift:6},function () {

                    })
                    return
				}
                var data = {
                    "sIds":sIds,
                    "values": values,
                    "price": price
                }
                $.ajax({
                    type: "post",
                    url: "doAJAXAddOrderItem",
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
						//		?oiId=' + data
                        } else {
                            layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                            })
                        }
                    },
					error : function () {
                        layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                        })
                    }
                })
            });
        });

        //删除购物车商品
        function del_shopping(sId) {

            var data = {
                "sId":sId
            }
            $.ajax({
				type  : "post",
				url   : "doAJAXDelShopping",
				data  : data,
				dataType  :  "json",
                beforeSend:function () {
                    layerIndex = layer.msg('处理中',{icon:16});
                },
				success   : function (result) {
				    layer.close(layerIndex)
				    var success = result.success
					if(success == true){
                        location.href = "${APP_Path}/cart";
					}else{
                        layer.msg("删除商品失败，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                        })
                    }
                },
				error : function () {
                    layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                    })
                }
			})
        }

        //计算总价
        function jisuan() {
            var count = 0;
            var sum=0.0;
            $(".price").each(function(){
                var ding=this.parentNode.parentNode.firstElementChild.firstElementChild;
                if(ding.checked){
                    sum+=parseFloat($(this).html());
                    count++;
                }
            });
            $(".settlements .col03 b").html(count);
            $(".settlements .col03 em").html(parseFloat(sum).toFixed(2));
        }

        //选中单个
        function selected() {
            jisuan();
        }

        //全选
        function zong(element) {
            if(element.checked){
                $(".cart_list_td input").attr('checked','true');
            }else{
                $(".cart_list_td input").removeAttr("checked");
            }
            jisuan();
        }

        //减少数量
        function minus(sId) {
            var num_show = $("#sId"+sId+" .num_show").val();
            var num = parseInt(num_show)-1;
            if(num>0){
                var data = {
                    "sId":sId,
                    "pCount":num
                }
                $.ajax({
					type : "post",
					url  : "doAJAXUpdPCountBySId",
					data : data,
					dataType : "json",
                    beforeSend:function () {
                        layerIndex = layer.msg('处理中',{icon:16});
                    },
					success  : function (result) {
					    layer.close(layerIndex)
						var success = result.success
						if (success == false){
                            layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                            })
						}
                    },
					error : function () {
                        layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                        })
                    }
				})
                $("#sId"+sId+" .num_show").val(num);
                var price = (num * parseFloat($("#sId"+sId+" .col05 em").html())).toFixed(2);
                $("#sId"+sId+" .price").html(price);
                jisuan();
            }else{
                layer.msg("商品数量不能小于1",{time:1500,icon:5,shift:6},function () {

                })
			}
        }

        //增加数量
        function add(sId) {
            var num_show = $("#sId"+sId+" .num_show").val();//单个商品的数量
            var num = parseInt(num_show)+1;
            var data = {
                "sId":sId,
                "pCount":num
            }
            $.ajax({
                type : "post",
                url  : "doAJAXUpdPCountBySId",
                data : data,
                dataType : "json",
                beforeSend:function () {
                    layerIndex = layer.msg('处理中',{icon:16});
                },
				success  : function (result) {
                    layer.close(layerIndex)
                    var success = result.success
                    if (success == false){
                        layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                        })
                    }
                },
				error : function () {
                    layer.msg("操作出现异常，请联系管理员！",{time:1500,icon:5,shift:6},function () {

                    })
                }


                
            })
            $("#sId"+sId+" .num_show").val(num);
            var price = (num * parseFloat($("#sId"+sId+" .col05 em").html())).toFixed(2);
            $("#sId"+sId+" .price").html(price);
            jisuan();
        }

	</script>
</body>
</html>