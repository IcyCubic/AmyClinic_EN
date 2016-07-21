<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>      
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>查詢訂單</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/lobibox.min.css">
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/shopping/css/query_shopping.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>
<div class="tabs member-wrapper">
<div id="member-bar">
    <h1 class="ribbon">Hello &nbsp;${memberVO.name}&nbsp;!</h1>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/member/member.jsp">歡迎頁面</a></li>
            <li><a href="${pageContext.request.contextPath}/member/member.jsp">編輯資料</a></li>
            <li><a href="${pageContext.request.contextPath}/member/member.jsp">我的預約紀錄</a></li>
            <li><a href="${pageContext.request.contextPath}/shoppings/showorder" style="text-decoration: underline; ">我的訂單</a></li>
            <li><a href="${pageContext.request.contextPath}/shopping/shopping_list.jsp">我的購物車</a> </li>
        </ul>
    </nav>
    </div>
    <div class="content-wrap">
    <div class="circle top left"></div>
    <div class="circle top right"></div>
    <div class="circle bottom left"></div>
    <div class="circle bottom right"></div> 
    <br> 
	<label>訂單查詢：</label>
	<input type="text" id="for_name" placeholder="輸入商品名稱" maxlength="30">
	<input type="button" id="query" value="查詢"><br><br>
	<c:forEach varStatus="status" var="ordersVO" items="${list}">
	<c:if test="${ordersVO.ostatus != 3}">	
	<table>
		<tr>
			<th>訂單編號</th>
			<th>訂單日期</th>
			<th>訂單總價</th>
			<th>訂單狀態</th>
			<th>付款狀態</th>
			<th>配送狀態</th>
			<th>取消訂單</th>
			<th>檢視明細</th>
		</tr>
		<tr>
			<td>${ordersVO.oid}</td>
			<td><fmt:formatDate pattern="yyyy/MM/dd" value="${ordersVO.odate}" /></td>
			<td>$<fmt:formatNumber value="${ordersVO.total}" type="number"/></td>
			<c:if test="${ordersVO.ostatus == 0}">
				<td>訂單成立</td>
			</c:if>
			<c:if test="${ordersVO.ostatus == 1}">
				<td>訂單處理中</td>
			</c:if>
			<c:if test="${ordersVO.ostatus == 2}">
				<td>交易完成</td>
			</c:if>
			<c:if test="${ordersVO.ostatus == 3}">
				<td>訂單取消</td>
			</c:if>
			<c:if test="${ordersVO.payment == 0}">
				<td><a href="${pageContext.request.contextPath}/shoppings/checkforpay?oid=${ordersVO.oid}">未付款</a></td>
			</c:if>
			<c:if test="${ordersVO.payment == 1}">
				<td>已付款</td>
			</c:if>
			<c:if test="${ordersVO.del_status == 0}">
				<td>未出貨</td>
			</c:if>
			<c:if test="${ordersVO.del_status == 1}">
				<td>已出貨</td>
			</c:if>
			<c:if test="${ordersVO.del_status == 2}">
				<td>已送達</td>
			</c:if>
			<c:if test="${ordersVO.ostatus == 0 && ordersVO.payment == 0}">
				<td><input class="btn-cancel" type="button" value="取消訂單" onclick="cancel(${ordersVO.oid})"></td>
			</c:if>
			<c:if test="${ordersVO.ostatus != 0 || ordersVO.payment == 1}">
				<td></td>
			</c:if>
			<td>
			    <input class="btn-details" type="button" id="showbt${status.count}" value="+" onclick="showORhide(${status.count})">
			</td>
		</tr>
		</table>
		<div id="item${status.count}" style="display:none;">
			<table id="orders-table-details">
				<c:forEach varStatus="varSta" var="orderItems" items="${ordersVO.orderItems}">
					<tr>
						<td>
							${orderItems.productVO.name}
						</td>
						<td>
							${orderItems.quantity}件
						</td>
						<td>
							$<fmt:formatNumber value="${orderItems.price_per * orderItems.quantity}" type="number"/>
						</td>
					</tr>	
				</c:forEach>
				<tr>
					<td colspan="2">
							會員紅利點數
					</td>
					<td>
							- $<fmt:formatNumber value="${ordersVO.points_spent}" type="number"/>
					</td>
				</tr>
			</table>
		</div>
		<br>
	</c:if>
	</c:forEach>
	</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/js/lobibox.min.js"></script>	
	<script>
	
		$(function(){
			$('#query').click(function(){
				var name = $('#for_name').val();
				window.location.href = getContextPath()+'/shoppings/showorderbyname?name='+name;
			})
		})
		
		function getContextPath() { 
	 		return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
 		}
		
		function showORhide(count) {
			var item = $('#item'+count);
			var bt = $('#showbt'+count);
			console.log(count);
			if (item.css("display")=="none") {
			    item.slideDown();
				bt.val("-");
			} else {
				item.slideUp();
				bt.val("+");
			}
		}
		
		function cancel(oid) {
			Lobibox.confirm({
				title: "取消訂單",
				msg: "確認取消訂單？",
				callback: function ($this, type, ev) {
				    if(type == 'yes') {
				    	$.ajax({
							"type":"post",
							"url": getContextPath()+'/shoppings/cancelorder',
							"data":{"oid" : oid},
							"success":function(data){
								location.reload();
							}
						})
				    } 
				}
			});
	    }
	</script>
</body>
</html>