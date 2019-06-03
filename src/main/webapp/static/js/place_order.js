$(function() {
    //解析url数据 返回 theRequest对象
    function theRequest(){
        var url=window.location.search;
        var theRequest = new Object();
        if(url.indexOf("?") != -1){
            var str = url.substr(1);
            var strs = str.split("&");
            for (var i = 0; i < strs.length; i++) {
                theRequest[strs[i].split("=")[0]]=decodeURI(strs[i].split("=")[1]);
            }
            return theRequest;
        }
    }
    var oiId = theRequest().oiId;
    if(oiId == null){
        location.href = 'index.jsp';
    }
    var data={
        "action":"findByoiId_OrderItem",
        "oiId":oiId
    }
    $.getJSON("OrderItem_Servlet",data,callback);
    function callback(data) {
        var title = '<ul class="goods_list_th clearfix">'
        title += '<li class="col01">商品名称</li>'
        title += '<li class="col02">商品单位</li>'
        title += '<li class="col03">商品价格</li>'
        title += '<li class="col04">数量</li>'
        title += '<li class="col05">小计</li>'
        title += '</ul>'
        var goods_list_td = [];
        var total = 0.0;
        for (var i = 0; i < data.length; i++) {
            var price = (parseInt(data[i]['oipCount'])*parseInt(data[i]['product']['price'])).toFixed(2);
            var goods = '<ul class="goods_list_td clearfix">';
            goods += '<li class="col01">'+(i+1)+'</li>';
            goods += '<li class="col02"><img src="'+data[i]['product']['pImage']+'"></li>';
            goods += '<li class="col03">'+data[i]['product']['pName']+'</li>';
            goods += '<li class="col04">'+data[i]['product']['pUnit']+'g</li>';
            goods += '<li class="col05">'+data[i]['product']['price'].toFixed(2)+'</li>';
            goods += '<li class="col06">'+data[i]['oipCount']+'</li>';
            goods += '<li class="col07">'+price+'元</li>';
            goods += '<input type="hidden" name="oiId" id="oiId" value="'+data[i]['oiId']+'">'
            goods += '</ul>';
            goods_list_td.push(goods);
            total = total+(parseInt(price));
        }
        $("#goods_list_th").html(goods_list_td);
        var transit =  total>99?0.00:10.00;
        var total_pay = total>99?total.toFixed(2):(total+10).toFixed(2);
        var settle_con = '<div class="total_goods_count">共<em>'+data.length+'</em>件商品，总金额<b>'+total.toFixed(2)+'元</b></div>';
        settle_con += '<div class="transit">运费：<b>'+transit+'元</b></div>';
        settle_con += '<div class="total_pay">实付款：<b>'+total_pay+'元</b></div>';
        $(".settle_con").html(settle_con);
    }
    $("#order_btn").click(function() {
//		alert($("#oiId").val());
//		alert($(".total_pay b").html().split("元")[0]);

        //提交成功
        localStorage.setItem('order_finish',2);
        $('.popup_con').fadeIn('fast', function() {
            setTimeout(function(){
                $('.popup_con').fadeOut('fast',function(){
                    window.location.href = 'index.jsp';
                });
            },3000)
        });
    });
});


