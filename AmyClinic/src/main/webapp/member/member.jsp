<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/General/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/member/css/member.css" />
<script src="${pageContext.request.contextPath}/General/js/jquery.min.js"></script>
<title>會員專區</title>
<!-- <script src="js/modernizr.js"></script> -->
</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>
<div class="tabs member-wrapper">
	<div id="member-bar">
	<h1 class="ribbon">Hello &nbsp;${memberVO.name}&nbsp;!</h1>
	<nav>
		<ul>
			<li><a href="#section-bar-1">歡迎頁面</a></li>
			<li><a href="#section-bar-2">編輯資料</a></li>
			<li><a href="#section-bar-3">我的預約紀錄</a></li>
			<li><a href="${pageContext.request.contextPath}/shoppings/showorder">我的訂單</a></li>
			<li><a href="${pageContext.request.contextPath}/shopping/shopping_list.jsp">我的購物車</a> </li>
		</ul>
	</nav>
	</div>
	<div class="content-wrap">
    <div class="circle top left"></div>
    <div class="circle top right"></div>
    <div class="circle bottom left"></div>
    <div class="circle bottom right"></div>   
<section id="section-bar-1">
    <div class="flag">歡迎回來愛美</div>
    <div class="corner-ribbon corner-ribbon-left-top"><span>AMY</span></div>
    <div class="corner-ribbon corner-ribbon-right-top"><span>AMY</span></div>
  <h1 class="Hello-banner">&bull; ${memberVO.name} &bull;</h1>
  <div class="icon_wrapper"></div>
  <div class="underline"></div>
  <form action="#" method="post" id="contact_form">
  	<div class="submit">
		<c:if test="${memberVO.act_status == 1}">			
			<input  type="button"  class="form_button"  value="用戶狀態：正常" readonly />				
		</c:if>
		<c:if test="${memberVO.act_status == 2}">			
			<input type="button"   class="form_button"  value="用戶狀態：未驗證Email" readonly />				
		</c:if>
      <c:choose>
	<c:when test="${memberVO.photo != null}">
		<img src='${pageContext.request.contextPath}/user_photo/${memberVO.photo}' height="150" width="150">
	</c:when>
	<c:otherwise>
		<img src='${pageContext.request.contextPath}/images/logo.jpg' height="150" width="150">
	</c:otherwise>
</c:choose>	
    </div>
    <br>
    <br>
    <div class="name">
      <label for="name"></label>
      <input type="text" value="上次訪問：${memberVO.last_visit}" name="name" id="name_input" required readonly>
    </div>
    <div class="email">
      <label for="email"></label>
      <input type="email" value="目前紅利：${memberVO.reward_pts} 點" name="email" id="email_input" required  readonly>
    </div>
    <div class="telephone">
      <label for="name"></label>
      <input type="text" value="診療次數：${memberVO.num_treatment} 次" name="telephone" id="telephone_input" required  readonly>
    </div>
    <div class="telephone">
      <label for="name"></label>
      <input type='text' value='加入日期：<fmt:formatDate pattern="yyyy-MM-dd" type="date" value="${memberVO.join_date}"/>' name='telephone' id='telephone_input' required  readonly>
    </div>
  </form><!-- // End form -->
    <div class="flag">歡迎回來愛美</div>
 </section>
<section id="section-bar-2"><p><jsp:include page="/login/editprofile.jsp"></jsp:include></p></section>
<section id="section-bar-3"><p><jsp:include page="/app/query_app.jsp"></jsp:include></p></section>
<section id="section-bar-4"><p>4</p></section>
<section id="section-bar-5"><p>5</p></section>
 </div>
 </div>
<jsp:include page="/General/footer.jsp"></jsp:include>
 <script src="js/member.js"></script>
        <script>
            (function() {

                [].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
                    new CBPFWTabs( el );
                });

            })();
        </script>
</body>
</html>