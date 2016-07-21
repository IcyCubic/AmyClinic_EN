<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>     
<%@ page import="group3.carrie.orders.model.*" %>    
<%
	//避免瀏覽器對文件的快取
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>       
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>付款</title>
<link href="${pageContext.request.contextPath}/shopping/css/phase.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/shopping/css/pay.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>	
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
					</div><div class="sign current">
					   <p><span>3</span></p>
					   <p>開始付款</p>
					</div><div class="sign">
					   <p><span>4</span></p>
					   <p>結帳完成</p>
					</div>
		</div>
			<div class="pay-amount">
				<b>應付金額：NT<fmt:formatNumber value="${ordersVO.total}" type="number"/>元</b>
			</div>
			
	      <div class="card-wrapper"></div>

            <div class="form-container active">
                <form action="${pageContext.request.contextPath}/shoppings/finpay" method="post">
                
                
        <div class="info-wrapper">
            <div class="form-el">
                <label>信用卡卡號</label>
                <input placeholder="信用卡卡號" type="text" name="number" autocomplete="off" class="input">
            </div>
            <div class="form-el">
                <label>持卡人姓名</label>
                <input placeholder="持卡人姓名" type="text" name="name" autocomplete="off" class="input">
            </div>
            <div class="form-el col-2">
                <label>有效期限</label>
                <input placeholder="MM/YY" type="text" name="expiry" autocomplete="off" maxlength="7" class="input">
            </div>
            <div class="form-el col-2">
                <label>檢核碼</label>
               <input placeholder="檢核碼" type="text" name="cvc" maxlength="3" class="input">
            </div>
    	</div>
             <div id="submit-wrapper">
      	      <div class="vcode-wrapper">
			          請輸入驗證碼：<input type="text" id="code1"/>
    			<div id="vcode"></div>
    			<div><label> <input type="checkbox" name="kontact" id="kontact" required/> 我同意以下使用者條款:《 <a href="#">愛美消費者保護法</a> 》</label></div>
			  </div>
             	<input type="submit" id="paysubmit" value="付款">
             	<input type="hidden" name="oid" value="${ordersVO.oid}">
             </div>
        </form>
            </div>
            
	<jsp:include page="/General/footer.jsp"></jsp:include>


	<script src="${pageContext.request.contextPath}/js/jquery.card.js"></script>
	<script src="${pageContext.request.contextPath}/shopping/js/pay.js"></script>
	<script src="${pageContext.request.contextPath}/shopping/js/script.js"></script>
</body>
</html>