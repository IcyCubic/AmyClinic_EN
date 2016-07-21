<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>結帳完成</title>
<link href="${pageContext.request.contextPath}/shopping/css/phase.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>	
<style>
	table {
		margin: 0 auto;
	}
	
	h1 {
		text-align: center;
	}
</style>
</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>
	
		<div id="phase">
			<div class="sign">
			   <p><span>1</span></p>
			   <p>購物清單</p>
			</div>
			<div class="sign">
			   <p><span>2</span></p>
			   <p>確認資料</p>
			</div><div class="sign">
			   <p><span>3</span></p>
			   <p>開始付款</p>
			</div><div class="sign current">
			   <p><span>4</span></p>
			   <p>結帳完成</p>
			</div>
		</div>
		<br>
		<br>
		<h1>您的訂購已完成，以下是您的訂單明細：</h1>
		<br>
		<br>
		<table border="1" width="1000px" style="border-collapse:collapse">
			<tr>
				<td colspan="4">
					訂單編號：${ordersVO.oid}
				</td>
			</tr>
			<tr>
				<td colspan="4">
					訂購時間：${odate}
				</td>
			</tr>
			<tr>
				<td>
					商品名稱
				</td>
				<td>
					數量
				</td>
				<td>
					單價
				</td>
				<td>
					小計
				</td>
			</tr>
			<c:forEach var="orderItems" items="${ordersVO.orderItems}">
			<tr>
				<td>
					${orderItems.productVO.name}
				</td>
				<td>
					${orderItems.quantity}
				</td>
				<td>
					<fmt:formatNumber value="${orderItems.price_per}" type="number"/>元
				</td>
				<td>
					<fmt:formatNumber value="${orderItems.quantity * orderItems.price_per}" type="number"/>元
				</td>
			</tr>
			</c:forEach>	
			<tr>
				<td>
				</td>
				<td>
				</td>
				<td>
					合計
				</td>
				<td>
					<fmt:formatNumber value="${ordersVO.total+ordersVO.points_spent}" type="number"/>元
				</td>
			</tr>	
			<tr>
				<td>
				</td>
				<td>
				</td>
				<td>
					使用的紅利點數
				</td>
				<td>
					<fmt:formatNumber value="${ordersVO.points_spent}" type="number"/>點
				</td>
			</tr>	
			<tr>
				<td>
				</td>
				<td>
				</td>
				<td>
					本次所得的紅利點數
				</td>
				<td>
					<fmt:formatNumber value="${(ordersVO.total/100)+0.0001}" pattern=",###"/>點
				</td>
			</tr>	
			<tr>
				<td>
				</td>
				<td>
				</td>
				<td>
					剩餘的紅利點數
				</td>
				<td>
					<fmt:formatNumber value="${memberVO.reward_pts}" type="number"/>點
				</td>
			</tr>	
			<tr>
				<td>
				</td>
				<td>
				</td>
				<td>
					總金額
				</td>
				<td>
					<fmt:formatNumber value="${ordersVO.total}" type="number"/>元
				</td>
			</tr>	
		
		</table>
		<table border="1" width="1000px" style="border-collapse:collapse">
			<tr>
				<td>
					<br>
					收件人姓名：${ordersVO.recipient}<br><br>
					地址：${ordersVO.addr}<br><br>
					電話：${ordersVO.phone}<br><br>
					E-mail：${ordersVO.email}<br><br>
				</td>
			</tr>
		</table>
		<br>
		<br>
		
<jsp:include page="/General/footer.jsp"></jsp:include>
</body>
</html>