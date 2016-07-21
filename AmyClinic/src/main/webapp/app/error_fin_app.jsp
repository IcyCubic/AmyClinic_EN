<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
顯示本次預約的相關訊息
(姓名、電話、email、預約資訊)
 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<title>預約完成</title>
<style>
	h1 {
		text-align: center;
	}
 	#footer-bgcontent { 
 		height: 99px; 
 		background: #e499ba; 
 		position: absolute; 
 		right: 0; 
 		left: 0; 
 		padding: 1rem; 
 		text-align: center;	 
 } 
 
#final-adjust {
/* 	border: 1px solid black; */
/* 	text-align: center; */
	padding-left: 34%;
	text-align: center;
	font-size: 18px;
	line-height: 1.428571429;
}
</style>
</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>
<div class="clr"></div>
	<div>
	<br>
		<h1>預約完成</h1>
		<br>
		<br>
		<div id="final-adjust">
		姓名：${memberVO.name}<br>
		電話：${memberVO.phone}<br>
		E-mail：${memberVO.email}<br>
		<c:if test="${appVO.purpose == 0}">
			預約目的：開始新療程<br>
			你所選擇的療程：
			<c:forEach var="proc" varStatus="status" items="${appVO.appDetails}">
				<c:if test="${!status.last}">
					${proc.procVO.name}、
				</c:if>
				<c:if test="${status.last}">
					${proc.procVO.name}
				</c:if>
			</c:forEach>
			<br>
		</c:if>
		<c:if test="${appVO.purpose == 1}">
			預約目的：回診<br>

		</c:if>
		<c:if test="${not empty appVO.descrip}">
			需求描述：${appVO.descrip}<br>
		</c:if>
		預約時間：${s_app_time}<br>
		醫師：${empVO.name}<br>
	</div>
	</div>
	
	<jsp:include page="/General/footer.jsp"></jsp:include>
</body>
</html>
