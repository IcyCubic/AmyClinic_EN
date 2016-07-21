<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
1.顯示單樣產品的資料(大張圖+名稱+價格+成分+描述)
2.加入購物車的按鈕(存到session(BuyProdAction))，如果庫存為0就顯示存貨不足
2016.05.26新增
購物系統新增直接在商品列表/商品頁面選擇數量加入購物車
庫存量在10以下時option會減少
 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/lobibox.min.css">
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/shopping/css/show_prod.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<title>${prodVO.name}</title>
<style>


/* #footer-bgcontent { */
/* 		height:65px; */
/* 		background: #e499ba; */
/* 		position: absolute; */
/* 		right: 0; */
/* 		left: 0; */
/* 		padding-bottom: 1rem; */
/* 		text-align: center;	 */
/* } */

a {
 text-decoration: none;
}

</style>
</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>
<br>
<a href="${pageContext.request.contextPath}/shopping/prod_list.jsp" style="margin-left: 30%">回商品列表</a><br>
<table align="center">
	<tr>
		<td width="50"></td>
		<td width="300">
			<img src="${pageContext.request.contextPath}/free/getprodpic?num=${prodVO.pid}"/>
		</td>
		<td width="22"></td>
		<td>
				<input type="hidden" name="pid" value="${prodVO.pid}">
				<input type="hidden" name="pname" value="${prodVO.name}">
				<input type="hidden" name="price" value="${prodVO.price}">
				<input type="hidden" name="discount" value="${prodVO.discount}">
				<table style="font-size: 15pt;" height="600px">
					<tr>
						<td colspan="2" style="font-size: 35pt;">${prodVO.name}</td>
					</tr>
					<tr height="20">
						<td colspan="2"><hr></td>
					</tr>
					<tr>
						<td>產品編號</td>
						<td>${prodVO.pid}</td>
					</tr>	
					<tr>
						<td>產品成份</td>
						<td>${prodVO.ingredients}</td>
					</tr>	
					<tr>
						<td>產品敘述</td>
						<td>${prodVO.descrip}</td>
					</tr>	
					<tr>
						<td>產品定價</td>
						<td><fmt:formatNumber value="${prodVO.price}" type="number"/>元</td>
					</tr>
					<c:if test="${prodVO.discount != 0}">	
					<tr>
						<td>打折後</td>
						<td><fmt:formatNumber value="${prodVO.price * ((1 - (prodVO.discount/100.0)) +0.0001)}" pattern=",###"/>元</td>
					</tr>
					</c:if>
					<c:if test="${prodVO.amount!=0}">	
					<tr>
						
							<td>
						
						選擇數量：
						</td>
						<td>
							<select id="qty${prodVO.pid}" style="width: 50px">
								<c:forEach begin="1" end="10" var="theqty">
								<!-- 如果庫存量減掉theqty大於等於0才顯示選項 -->
									<c:if test="${prodVO.amount - theqty >= 0}">
							    		<option value="${theqty}">${theqty}</option>
                    				</c:if>
                    			</c:forEach>
							</select>	 
							</td>
					</tr>
					<tr height="20">
						<td colspan="2"><hr></td>
					</tr>
					<tr>		
						<td>
						    <span class="cbp-vm-icon cbp-vm-add" onclick="addToCart()">加入購物車</span>
<!-- 							<input class="cbp-vm-icon cbp-vm-add" type="button" value="加入購物車" onclick="addToCart()"> -->
						</td>
					</tr>	
						</c:if>
						<c:if test="${prodVO.amount==0}">
						<tr>
							<td>
								<b>存貨不足</b>
								
							</td>
							</tr>
						</c:if> 
						
						
				
				</table>
			
		</td>
	</tr>
</table>
	<jsp:include page="/General/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath}/js/lobibox.min.js"></script>
<script>
function getContextPath() { //obtains context path. EL doesn't work with separated .js
		return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}
function addToCart(){
	var pid = $('input[name="pid"]').val();
	var pname = $('input[name="pname"]').val();
	var price = $('input[name="price"]').val();
	var discount = $('input[name="discount"]').val();
	var qty = $('#qty'+pid).val();
	$.ajax({
		"type":"post",
		"url":getContextPath()+'/free/jointocart',
		"data":{"pid" : pid, "pname" : pname, "price" : price, "discount" : discount, "qty" : qty},
		"success":function(data){
			console.log("hihi1")
			Lobibox.notify("success", {
				size: 'mini',
				title: '成功加入購物車！',
				delay: 1500,
				delayIndicator: false,
				sound: false,
				position: "center top"
				});
		},
		"error":function(data){
			console.log("hihi")
			Lobibox.notify("error", {
				size: 'mini',
				title: '加入購物車失敗！',
				delay: 1500,
				delayIndicator: false,
				sound: false,
				position: "center top"
				});
		}
	});
}
</script>
</body>
</html>