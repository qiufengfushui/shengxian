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
    var all = theRequest().all;
    var pageNum = theRequest().pageNum;
    var qingqiu = ""
    if (pName != null) {
        qingqiu = "pName=" + pName;
    } else if (ptId != null) {
        qingqiu = "ptId=" + ptId;
    } else if (all != null) {
        qingqiu = "all=" + all;
    }


if(ptId == null && pName == null && all != "all"){
    window.location="${APP_Path}/index";
}else if(pName != null){


}else if(ptId != null){

}
/*
*/
var breadcrumb = '<a href="list.jsp?all=all&pageNum=1">全部分类</a><span>></span><a href="list.jsp?ptId='+ptId+'&pageNum=1">'+123+'</a>'
$(".breadcrumb").html(breadcrumb);

var uId = $(".login_info em").html();

    var data = {
        "all":all,
        'ptId':ptId,
        'pName': pName,
        "pageNum":pageNum
    }
$.ajax({
    type:"post",
    url:"doAJAXLGetProductListByType",
	data:data,
    dataType:"json",
	success:function (result) {
        var list = result.list;
        var pageBean = result.pageBean
        var goods_type_list = [];
        for (var i = 0; i < list.length; i++) {
            var li_begin = "<li id = " + list[i]['pId'] + ">";
            '<a href="detail.jsp?pId=' + list[i]["pId"] + '"><img src="${APP_Path}/static/' + list[i]["pImage"] + '"></a>';

            var a = "<a href='detail.jsp?pId=" + list[i]['pId'] + "'><img src='/static/" + list[i]['pImage'] + "'></a>";
            var h4 = "<h4><a href='detail.jsp?pId=" + list[i]['pId'] + "'>" + list[i]['pName'] + "</a></h4>";
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
            previousPage = '<a href="list.jsp?'+qingqiu+'&pageNum='+previous_page+'">上一页</a>'
        }
        //显示页码
        var pagenation = '';
        for (var i = start; i <= end; i++) {
            if(i == pageNum){
                pagenation += '<a href="javascript:;" style="opacity: 0.2" class="active">'+i+'</a>';
            }else{
                pagenation += '<a href="list.jsp?'+qingqiu+'&pageNum='+i+'" class="active">'+i+'</a>';
            }
        }

        var nextPage = '<a href="javascript:;" style="opacity: 0.2">下一页></a>';
        if(end > pageNum){
            var next_Page = parseInt(pageNum) + 1;
            nextPage = '<a href="list.jsp?'+qingqiu+'&pageNum='+next_Page+'">下一页></a>'
        }
        $(".pagenation").html(previousPage+pagenation+nextPage);

        //绑定商品信息
        if(goods_type_list == ""){
            $(".goods_type_list").html("无此商品！");
        }else{
            $(".goods_type_list").html(goods_type_list);
        }
    }
})




});/*
function add_cart(pId) {
    var data = {
        "action":"add_Shopping",
        "pId":pId,
        "pCount":1
    }
    $.get("Shopping_Servlet",data,callback);
    function callback(data) {
        if(data == "1"){
            alert("购物车添加商品成功！");
        }else if(data == "404"){
            location.href = "login.html";
        }else{
            alert("购物车添加商品失败！");
        }
    }
}
$(function() {
    var data = {
        "action": "get_ProductType"
    }
    $.getJSON("productType_servlet", data, callback);
    function callback(data) {
        var buffer = [];
        for (var i = 0; i < data.length; i++) {
            var info = "<li><a href='list.jsp?pType="+data[i]['ptId']+"&pageNum=1' class='model0"+data[i]['ptId']+"'>" + data[i]['ptName'] + "</a></li>";
            buffer.push(info);
        }
        $(".subnav").html(buffer);
    }
});*/
