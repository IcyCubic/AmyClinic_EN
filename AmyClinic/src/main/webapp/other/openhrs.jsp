<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<title>門診時間表及醫師介紹</title>
<style>
	a:link {
		text-decoration: none;
		color:blue
	}
	a:visited {
		color:blue
	}
/* 	#footer-bgcontent { */
/* 		height: 99px; */
/* 		background: #e499ba; */
/* 		position: absolute; */
/* 		right: 0; */
/* 		left: 0; */
/* 		padding: 1rem; */
/* 		text-align: center;	 */
/* } */
</style>
</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>
<br>
<div>
			<a href="${pageContext.request.contextPath}/app/add_app.jsp" style="margin-left: 70%">線上預約</a><br>
</div>
<br>
<div>	
			<table border="1" width="900px" align="center" style="border-collapse: collapse;text-align: center;">
				<tr>
					<th height="125px">時段/星期</th>
					<th height="125px">星期一</th>
					<th height="125px">星期二</th>
					<th height="125px">星期三</th>
					<th height="125px">星期四</th>
					<th height="125px">星期五</th>
					<th height="125px">星期六</th>
				</tr>
				<c:forEach var="emp" items="${list}" varStatus="status">
					<c:if test="${status.index%6==0}">
					<tr>
						<c:if test="${status.index==0}">
							<td height="125px">早診<br>10:00~13:00</td>
						</c:if>
						<c:if test="${status.index==6}">
							<td height="125px">午診<br>14:30~17:30</td>
						</c:if>
						<c:if test="${status.index==12}">
							<td height="125px">晚診<br>18:00~21:00</td>
						</c:if>
					</c:if>
							<td height="125px"><a target="_new" href="${pageContext.request.contextPath}/free/showdoctor?id=${emp.eid}">${emp.name}</a></td>
						
				
				</c:forEach>
				
</table>
</div>		
<jsp:include page="/General/footer.jsp"></jsp:include>
</body>
</html>