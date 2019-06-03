		window.onload = function () {
		//请求主页商品信息
			data = {
					"action":"get_product",
					"count":4
			}
		$(function() {
			$.ajax({
				 type:"get",
				 url:"product_servlet",
				 data:data,
				 async:false,  
				 dataType:"JSON",
				 success: callback
			});
			function callback(json) {
				for (var i = 0; i < json.length; i++) {
					var buffer = [];
					var h3 = "";
					for (var j = 0; j < json[i].length; j++) {
						h3 = "<h3 class='fl' id='model0"+json[i][j]['pType']+"'></h3>";;
						var info = "<li><h4><a href='#'>"+json[i][j]['pName']+"</a></h4><a href='detail.jsp?pId="+json[i][j]['pId']+"'><img src='"+json[i][j]['pImage']+"'></a><div class='prize'>¥ "+json[i][j]['price'].toFixed(2)+"</div></li>";	
						buffer.push(info);
					}
					$('.goods_list:eq('+i+')').html(buffer);
					var div_begin = "<div class='subtitle fl'>";
					var span = "<span>|</span>";
					var title = [];
					var div_finish = "</div>";
					var a = "<a href='list.jsp?pType="+json[i][0]['pType']+"&pageNum=1' class='goods_more fr' id='fruit_more'>查看更多 ></a>"
					for (var k = 0; k < 3; k++) {
						title.push("<a href='detail.jsp?pId="+json[i][k]['pId']+"'>"+json[i][k]['pName']+"</a>");
					}
					subtitle = span+title;
					subtitle = subtitle.replace(',',' ').replace(',',' ');
					subtitle = h3+div_begin+subtitle+div_finish+a;
					$('.list_title:eq('+i+')').html(subtitle);
				}
			}
		});
		
		//请求主页商品分类信息
		$(function() {
			$.ajax({
				 type:"get",
				 url:"productType_servlet",
				 data:"action=get_ProductType",
				 async:false,  
				 dataType:"JSON",
				 success: callback
			});
			function callback(json) {
				var lis = [];
				for (var i = 0; i < json.length; i++) {
					var li = "<li><a href='#model0"+json[i]['ptId']+"' class ='model0"+json[i]['ptId']+"'>"+json[i]['ptName']+"</a></li>";
					var goods_banner = "<img src='"+json[i]['ptImages']+"'>";
					var ptName = json[i]['ptName'];
					$(".goods_banner:eq("+i+")").html(goods_banner);
					$("#model0"+json[i]['ptId']+"").html(ptName);
					lis.push(li);
				}
				$(".subnav").html(lis);
			}
		});
		
}
			