<%@ page contentType='text/html; charset=utf-8' language='java' import='java.sql.*' errorPage='' %>
<%@page import='java.util.List'%>
<%@page import='group3.carrie.orders.model.*'%>
<%@page import='group3.carrie.orderitems.model.*'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt'  %>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'  %>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/lobibox.min.css'>

</head>
<body>

<div id='wrapper'><!-- all --> 
<jsp:include page='/Backstage/jsp/b_top.jsp' /><!-- top and側邊欄功能表項目	位置 --> 
<div id='page-wrapper' style=background-color:#000000  >
            <div class='container-fluid'>
                <div class='row'>
                    <div class='col-lg-12'>
                 <ol class='breadcrumb'><li class='active'><i class='fa fa-dashboard'></i><font color='red' style='text-align: center;'>訂單查詢</font>              
                 </li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --> 
<!--         開始 ------------------------------------------------------------------------------------->

<!-- method='post' -->
<%--  action='${pageContext.request.contextPath}/Backstage/updateOrder'  --%>
<table  border='1'  class='table table-hover'  id='tb'  style='text-align: center;border-collapse: collapse;'>
			<tbody>
			<tr><th>姓名</th><th>日期</th><th>總價</th><th>訂單狀態</th><th>付款狀態</th><th>配送狀態</th><th>更新狀態</th></tr>
			</tbody>
</table>

<script src='${pageContext.request.contextPath}/js/lobibox.min.js'></script>	
<script>
function getContextPath() { //obtains context path. EL doesn't work with separated .js
		return window.location.pathname.substring(0, window.location.pathname.indexOf('/',2));
	}

function showORhide(count) {
	var item = $('#item'+count);
	var bt = $('#showbt'+count);
	console.log(count);
	console.log(item.css('display'));
	if(item.css('display')=='none'){
		item.slideDown();
		console.log('1111111111');
		bt.val('-');
	} else {
		item.slideUp();
		console.log('22222222222');
		bt.val('+');
	}
}
function cancel(oid){
	console.log("aaa");
	console.log(oid);

//	function cancel(oid,odate,total,ostatus,payment,del_status){
var odate = $('.odate').val();
var total=$('.total').val();
var ostatus=$('#ostatus option:selected').val();
var payment=$('#payment option:selected').val();
var del_status=$('#del_status option:selected').val();
if(confirm('確認更新訂單？')) {
	$.ajax({
		'type':'post',
		'url': getContextPath()+'/Backstage/updateOrder',
//			'data':{'oid' : oid},
//				'data':{'oid' : oid,'ostatus':ostatus,'payment':payment,'del_status':del_status},
		'data':{'oid' : oid,'odate':odate,'total':total,'ostatus':ostatus,'payment':payment,'del_status':del_status},
		'success':function(data){
			alert('更新成功');
		console.log('123');
		location.reload();

		}
	})
}
}

// 	Lobibox.confirm({
// 		title: '請確認',
// 		msg: '確認更新訂單？',
// 		callback: function ($this, type, ev) {
// 		    if(type == 'yes') {
// 		    	$.ajax({
// 					'type':'post',
// 					'url': getContextPath()+'/Backstage/updateOrder',
// //						'data':{'oid' : oid},
// //							'data':{'oid' : oid,'ostatus':ostatus,'payment':payment,'del_status':del_status},
// 					'data':{'oid' : oid,'odate':odate,'total':total,'ostatus':ostatus,'payment':payment,'del_status':del_status},
// 					'success':function(data){
// 						alert('更新成功');
// 					console.log('123');
// 					location.reload();
// //							Lobibox.notify( {
// //								size: 'mini',
// //								title: '更新完成',
// //								delay: 1000,
// //								delayIndicator: false,
// //								sound: false,
// //								position: 'center top'
// //								});
// //							 window.setTimeout(function(){
// //								 window.location.reload();
// //								 }, 1500);
// 					}
// 				});
// 		    } else {}
// 		}
// 		});

	$(function(){
		console.log('1');
		$.getJSON('${pageContext.request.contextPath}/Backstage/updateOrder',{'action':'getAll'},function(data){
			console.log('1-1');
			$.each(data,function(i,ordersVO){
				console.log('2');
var cell1 = $("<td class='"+i+"'></td>").text(ordersVO.name);		
var cell2 = $("<td></td>").text(ordersVO.odate);	
var cell3 = $("<td></td>").text('$'+ordersVO.total);	
var cell4 = $("<td></td>").html("<select id='ostatus"+i+"'><option value='0'>訂單成立</option><option value='1'>訂單處理中</option><option value='2'>交易完成</option><option value='3'>訂單取消</option></select>");
// var cell4 = $("<td><select size='1'  id='ostatus' ></select></td>").val(ordersVO.ostatus).$('#ostatus').$function(){
// 	$('#ostatus').options.length = 0;
// 	if(ordersVO.ostatus ==0){$('#ostatus').options.val('0').text('訂單成立');}
// 	if(ordersVO.ostatus ==1){$('#ostatus').options.val('1').text('訂單處理中');}
// 	if(ordersVO.ostatus ==2){$('#ostatus').options.val('2').text('交易完成');}
// 	if(ordersVO.ostatus ==3){$('#ostatus').options.val('3').text('訂單取消');}
// }
var cell5 = $("<td></td>").html("<select id='payment"+i+"'><option value='0'>未付款</option><option value='1'>已付款</option></select>");
var cell6 = $("<td></td>").html("<select id='del_status"+i+"'><option value='0'>處理中</option><option value='1'>已出貨</option><option value='2'>已送達</option></select>");
var cell7 = $("<td></td>").html("<form name='f"+i+"' action='${pageContext.request.contextPath}/Backstage/updateOrder'><input type='hidden' name='oid' value='"+ordersVO.oid+"'><input type='hidden' id='ostatus_"+i+"' name='ostatus' value='"+ordersVO.ostatus+"'><input type='hidden' id='payment_"+i+"' name='payment' value='"+ordersVO.payment+"'><input type='hidden' id='del_status_"+i+"' name='del_status' value='"+ordersVO.del_status+"'><input type='hidden' name='action' value='upDate'><input type='submit' value='修改' class='btn btn-success' onClick='cancel("+ordersVO.oid+")'></form>");
// var cell7 = $("<td></td>").html("<input type='button'  class='btn btn-success'  value='更新' onclick='cancel("+ordersVO.oid+")'>")	
// var cell8 = $("<input type='hidden' class='odate'value=''>").val(ordersVO.odate);
// var cell81 = $("<input type='hidden' class='total' value=''>").val(ordersVO.total);
var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
$("#tb>tbody").append(row);
$("#ostatus"+i).val(ordersVO.ostatus);
$("#ostatus"+i).change(function(){
	var x=$("#ostatus"+i).val();
	$("#ostatus_"+i).val(x);
	});
$("#payment"+i).val(ordersVO.payment);
$("#payment"+i).change(function(){
	var x=$("#payment"+i).val();
	$("#payment_"+i).val(x);
	});
$("#del_status"+i).val(ordersVO.del_status);
$("#del_status"+i).change(function(){
	var x=$("#del_status"+i).val();
	$("#del_status_"+i).val(x);
	});

// var cell9 = $("<tr><td colspan='7'>")	
// var cell10 = $("<div id='item${status.count}' style='display:none;'>")	

// var cell11 = $("<table border='1' style='text-align: center;border-collapse: collapse;'>")	
// var cell12 = $("<c:forEach varStatus='varSta' var='orderItems' items='${ordersVO.orderItems}'>")	
// var cell13 = $("<tr><td colspan='2'>${orderItems.productVO.name}</td>")	
// var cell14 = $("<td>${orderItems.quantity}件</td>")	
// var cell15 = $("<td>$<fmt:formatNumber value='${orderItems.price_per * orderItems.quantity}' type='number'/></td>")	
// var cell16 = $("</tr></c:forEach>")	
// var cell17 = $("<tr><td colspan='2'>會員紅利點數</td>")	
// var cell18 = $("<td>- $<fmt:formatNumber value='${ordersVO.points_spent}' type='number'/></td>")	
// var cell19 = $("</tr></table></div></td></tr></table>")	
// var row2 = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
// $("."+i).append(row2);
// var cell20 = $("")	
// var cell21 = $("")	
// var cell22 = $("")	
// var cell23 = $("")			
// 				var cell1 = $('<td width='150px' ></td>').text(ordersVO.MebName);
			})
		})
	})
	
// 		$(function(){
// 			$('#query').click(function(){
// 				var name = $('#for_name').val();
// 				window.location.href = getContextPath()+'/shoppings/showorderbyname?name='+name;
				
// 			})
			
			
// 		})
		
	
		</script>
	 </div><!-- 		all -->
</body>
</html>