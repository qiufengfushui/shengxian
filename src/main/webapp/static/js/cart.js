//购物车搜索框
$(function() {
    $(".input_btn").click(function() {
        var keyword = $(".input_text").val();
        window.location = "list.jsp?keywork=" + keyword + "&pageNum=1";
    });
});

//查询购物车商品
$(function() {
    data = {
        "action":"findByuId_ProductList"
    }
    $.getJSON("Shopping_Servlet",data,callback);
    function callback(data) {
        $(".total_count em").html(data.length);
        var cart_list_th = [];
        for (var i = 0; i < data.length; i++) {
            var cart_list_td = '<ul class="cart_list_td clearfix" id="sId'+data[i]['sId']+'">';
            var col01 = '<li class="col01"><input type="checkbox" name="pId" onclick="selected()" value="'+data[i]['product']['pId']+'='+data[i]['pCount']+'&"></li>';
            var col02 = '<li class="col02"><img src="'+data[i]['product']['pImage']+'"></li>';
            var col03 = '<li class="col03">'+data[i]['product']['pName']+'<br><em>'+data[i]['product']['price'].toFixed(2)+'元/'+data[i]['product']['pUnit']+'g</em></li>'
            var col04 = '<li class="col04">'+data[i]['product']['pUnit']+'g</li>';
            var col05 = '<li class="col05"><em>'+data[i]['product']['price'].toFixed(2)+'</em>元</li>';
            var col06 = '<li class="col06"><div class="num_add" id ="1"><a href="javascript:;" class="add fl" onclick="add('+data[i]['sId']+')">+</a><input type="text" class="num_show fl" value="'+data[i]['pCount']+'"><a href="javascript:;" class="minus fl" onclick="minus('+data[i]['sId']+')">-</a></div></li>';
            var col07 = '<li class="col07"><em class="price">'+((data[i]['product']['price'].toFixed(2))*(data[i]['pCount'].toFixed(2))).toFixed(2)+'</em>元</li>';
            var col08 = '<li class="col08"><a href="javascript:;" onclick = del_shopping('+data[i]["sId"]+')>删除</a></li>';
            var list = cart_list_td+col01+col02+col03+col04+col05+col06+col07+col08;
            cart_list_th.push(list);
        }
        $(".cart_list_th").after(cart_list_th);
    }
});
$(function() {
    $("#closeAnAccount").click(function() {
        var price = $(".settlements .col03 em").html();
        var values="";
        $("input[name='pId']:checkbox:checked").each(function(){
            values+=$(this).val();
            alert(values);
        });
        var data = {
            "action":"add_OrderItem",
            "values":values,
            "price":price
        }
        $.post("OrderItem_Servlet",data,callback)
        function callback(data) {
            if(data != "0"){
                location.href = 'place_order.jsp?oiId='+data;
            }else{
                alert("系统故障！");
            }
        }
    });
});
//删除购物车商品
function del_shopping(sId) {
    var data = {
        "action":"del_shopping",
        "sId":sId
    }
    $.get("Shopping_Servlet",data,callback);
    function callback(data) {
        if(data == 1){
            location.href = "cart.jsp";
        }else{
            alert("删除购物车失败，请联系管理员！");
        }
    }
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
    var data = {
        "action":"updata_Shopping",
        "sId":sId,
        "pCount":num
    }
    $.get("Shopping_Servlet",data);
    if(num>0){
        $("#sId"+sId+" .num_show").val(num);
        var price = (num * parseFloat($("#sId"+sId+" .col05 em").html())).toFixed(2);
        $("#sId"+sId+" .price").html(price);
        jisuan();
    }
}

//增加数量
function add(sId) {
    var num_show = $("#sId"+sId+" .num_show").val();//单个商品的数量
    var num = parseInt(num_show)+1;
    var data = {
        "action":"updata_Shopping",
        "sId":sId,
        "pCount":num
    }
    $.get("Shopping_Servlet",data);


    $("#sId"+sId+" .num_show").val(num);
    var price = (num * parseFloat($("#sId"+sId+" .col05 em").html())).toFixed(2);
    $("#sId"+sId+" .price").html(price);
    jisuan();
}
