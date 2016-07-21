<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if(session.getAttribute("ShoppingCart") == null) {
	response.sendRedirect(request.getContextPath()+"/shopping/prod_list.jsp");
}
%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="${pageContext.request.contextPath}/shopping/css/phase.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/lobibox.min.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/shopping/css/data_confirm.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>確認資料</title>
</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>
<br>

				<div id="phase">
					<div class="sign">
					   <p><span>1</span></p>
					   <p>購物清單</p>
					</div>
					<div class="sign current">
					   <p><span>2</span></p>
					   <p>確認資料</p>
					</div><div class="sign">
					   <p><span>3</span></p>
					   <p>開始付款</p>
					</div><div class="sign">
					   <p><span>4</span></p>
					   <p>結帳完成</p>
					</div>
				</div>
<br><br><br>
<div class="data_container">
<div class="div1">訂單明細</div>
		<table>
			<tr>
				<th colspan="4">
					本次購買的商品
				</th>
			</tr>
			<tr>
				<td>商品名稱</td>
				<td>數量</td>
				<td>單價</td>
				<td>小計</td>
			</tr>
			<c:forEach varStatus="status" var="entry" items="${ShoppingCart.content}">
<%-- 				<input type="hidden" id="content" value="${ShoppingCart.content}"> --%>
			<tr>
				<td>
					${entry.value.productVO.name}
				</td>
				<td>
					${entry.value.quantity}
				</td>
				<td>
					<fmt:formatNumber value="${entry.value.price_per}" type="number"/>元
				</td>
				<td>
					<fmt:formatNumber value="${entry.value.price_per * entry.value.quantity}" type="number"/>元
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="4">
					合計金額：&nbsp;&nbsp;<span class="fontisred fontisbig"><fmt:formatNumber value="${ShoppingCart.subTotal}" type="number"/></span>&nbsp;元
					<input type="hidden" id="subtotal" value="${ShoppingCart.subTotal}">
				</td>
			</tr>
		</table>
		<br>
<div class="div1">紅利明細</div>
		<table>

			<tr>
				<td>
					目前紅利：<fmt:formatNumber value="${memberVO.reward_pts}" type="number"/>點　使用<input type="text" name="reward" id="reward_pts" value="0" size="1" style="text-align: center">點　
					<input type="hidden" id="member_reward_pts" value="${memberVO.reward_pts}">
				</td>
				<td>
					折扣&nbsp;<span id="reward_dis">0</span>&nbsp;元
				</td>
			</tr>
			<tr>
				<td>
					應付金額　
				</td>
				<td>
					<span id="should_pay"><fmt:formatNumber value="${ShoppingCart.subTotal}" type="number"/></span>元
				</td>
			</tr>
			<tr>
				<td>
					本次消費可得紅利點數
				</td>
				<td>
					<div class="coin gold"><p>$</p></div><span class="fontisred fontisbig"><span id="newRwd"></span>點</span>
				</td>
			</tr>
		</table>
		<br>
<div class="div1">寄送資訊</div>
		<table>
			<tr>
				<th>
					收件人資料
				</th>
			<tr>
			<tr>
				<td>
				<br>
					姓名：<input type="text" name="mname" value="${memberVO.name}"><span id="warnname"></span><br><br>
					地址：<input type="text" name="addr" value="${memberVO.addr}" size="50"><span id="warnaddr"></span><br><br>
					電話：<input type="text" name="phone" value="${memberVO.phone}"><span id="warnphone"></span><br><br>
					<input type="hidden" name="mbphone" value="${memberVO.phone}">
					E-mail：<input type="text" name="email" value="${memberVO.email}" size="30"><span id="warnemail"></span><br><br>
				</td>
			</tr>	
		</table>
		<br>
		<br>
		<div class="data-btn-wrapper">
			<c:if test="${ShoppingCart == null || empty ShoppingCart.content}">
				<input type="button" id="confirm" disabled="disabled" value="確認無誤，成立訂單">
				<input type="button" id="cancel"  value="取消訂單">
			</c:if>
			<c:if test="${!empty ShoppingCart.content}">
				<input type="button" id="confirm" value="確認無誤，成立訂單">
				<input type="button" id="cancel"  value="取消訂單">
			</c:if>	
		</div>
		<br>
		<br>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>	
	<script src="${pageContext.request.contextPath}/js/lobibox.min.js"></script>
	<script src="${pageContext.request.contextPath}/shopping/js/data_confirm.js"></script>	
		<jsp:include page="/General/footer.jsp"></jsp:include>
</body>
</html>