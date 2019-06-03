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
        window.location.href = "index.jsp";
        return;
    }
    data = {
        "action": "findBypId_Product",
        "pId": theRequest().pId
    }
    $.getJSON("product_servlet", data, callback);
    function callback(data) {
    	var img = "<img src='"+data[0]['pBigImage']+"'>";
    	$(".goods_detail_pic").html(img);	
    	var h3 = "<h3>"+data[0]['pName']+"</h3>";
    	var p = "<p>"+data[0]['title']+"</p>"
    	var prize_bar = "<div class='prize_bar'><span class='show_pirze'>¥<em>"+data[0]['price'].toFixed(2)+"</em></span><span class='show_unit'>单  位："+data[0]['pUnit']+"g</span></div>";
    	var goods_num = "<div class='goods_num clearfix'><div class='num_name fl'>数 量：</div><div class='num_add fl'><input type='text' class='num_show fl' value='1'><a href='javascript:;' class='add fr' onclick='add()'>+</a><a href='javascript:;' class='minus fr' onclick='minus()'>-</a></div></div>";
    	var total = '<div class="total">总价：<em>'+data[0]['price'].toFixed(2)+'元</em></div>'
    	var operate_btn = '<div class="operate_btn"><a href="javascript:;" class="buy_btn">立即购买</a><a href="javascript:;" class="add_cart" id="add_cart" onclick = add_cart('+data[0]['pId']+');>加入购物车</a></div>';
    	var goods_detail_list = h3 + p + prize_bar + goods_num + total + operate_btn;
    	$(".goods_detail_list").html(goods_detail_list);
    }
    $(".buy_btn").click(function() {
		
	});
});
//加入购物车事件
function add_cart(pId) {
	var data = {
			"action":"add_Shopping",
			"pId":pId,
			"pCount":$(".num_show").val()
	}
	$.get("Shopping_Servlet",data,callback);
	function callback(data) {
		if(data == "1"){
			alert("购物车添加商品成功！");
		}else{
			alert("购物车添加商品失败！");
		}
	}
}
$(function() {
	var data = {
    			"action":"get_ProductType"
    	}
    	$.getJSON("productType_servlet",data,callback);
    	function callback(json) {
    		var lis = [];
    		for (var i = 0; i < json.length; i++) {
    			var li = "<li><a href='list.jsp?ptId="+json[i]['ptId']+"&pageNum=1' class ='model0"+json[i]['ptId']+"'>"+json[i]['ptName']+"</a></li>";
    			var goods_banner = "<img src='"+json[i]['ptImages']+"'>";
    			var ptName = json[i]['ptName'];
    			$(".goods_banner:eq("+i+")").html(goods_banner);
    			$("#model0"+json[i]['ptId']+"").html(ptName);
    			lis.push(li);
    		}
    		$(".subnav").html(lis);
    	}
})
function total(num) {
	var prize = parseFloat($(".show_pirze em").html())*num;
	prize = prize.toFixed(2);
	$(".total em").html(prize+"元");
}
function minus() {
	var num_show = $(".num_show").val();
	var num = parseInt(num_show)-1;
	if(num>0){
		$(".num_show").val(num);
		total(num);
	}
}
function add() {
	var num_show = $(".num_show").val();
	var num = parseInt(num_show)+1;
	$(".num_show").val(num);
	total(num);
}