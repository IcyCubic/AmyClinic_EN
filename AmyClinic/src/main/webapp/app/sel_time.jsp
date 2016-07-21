<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
用colorbox帶出來
點醫生名字超連結帶出下一個colorbox顯示近一個月是否可預約
 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/colorbox.css">
<title>Insert title here</title>
<style>
	a:link {
		text-decoration: none;
		color:blue
	}
	a:visited {
		color:blue
	}
</style>
</head>
<body style="background-color: #F1E1FF">
			<table border="1" width="900px" align="center" style="border-collapse: collapse;text-align: center;">
				<tr>
					<th height="100px">時段/星期</th>
					<th height="100px">星期一</th>
					<th height="100px">星期二</th>
					<th height="100px">星期三</th>
					<th height="100px">星期四</th>
					<th height="100px">星期五</th>
					<th height="100px">星期六</th>
				</tr>
				<c:forEach var="emp" items="${list}" varStatus="status">
					<c:if test="${status.index%6==0}">
					<tr>
						<c:if test="${status.index==0}">
							<td height="100px">早診<br>10:00~13:00</td>
						</c:if>
						<c:if test="${status.index==6}">
							<td height="100px">午診<br>14:30~17:30</td>
						</c:if>
						<c:if test="${status.index==12}">
							<td height="100px">晚診<br>18:00~21:00</td>
						</c:if>
					</c:if>
<%-- 					<c:if test="${status.index >= 0 && status.index < 6}"> --%>
<%-- 						<td height="100px"><a href="QueryScheduleServlet?c_hours=早診">${emp.name}${status.index}</a></td> --%>
<%-- 					</c:if> --%>
<%-- 					<td height="100px"><a href="QueryScheduleServlet?c_hours=早診">${emp.name}</a></td> --%>
						<c:if test="${status.index == 0}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=2&c_hours=早診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
						<c:if test="${status.index == 1}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=3&c_hours=早診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
						<c:if test="${status.index == 2}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=4&c_hours=早診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
						<c:if test="${status.index == 3}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=5&c_hours=早診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
						<c:if test="${status.index == 4}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=6&c_hours=早診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
						<c:if test="${status.index == 5}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=7&c_hours=早診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
						<c:if test="${status.index == 6}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=2&c_hours=午診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
						<c:if test="${status.index == 7}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=3&c_hours=午診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
						<c:if test="${status.index == 8}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=4&c_hours=午診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
						<c:if test="${status.index == 9}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=5&c_hours=午診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
						<c:if test="${status.index == 10}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=6&c_hours=午診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
						<c:if test="${status.index == 11}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=7&c_hours=午診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
						<c:if test="${status.index == 12}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=2&c_hours=晚診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
						<c:if test="${status.index == 13}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=3&c_hours=晚診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
						<c:if test="${status.index == 14}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=4&c_hours=晚診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
						<c:if test="${status.index == 15}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=5&c_hours=晚診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
						<c:if test="${status.index == 16}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=6&c_hours=晚診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
						<c:if test="${status.index == 17}">
							<td height="100px"><a href="${pageContext.request.contextPath}/apps/showsche?day=7&c_hours=晚診&name=${emp.name}">${emp.name}</a></td>
						</c:if>
				
				</c:forEach>
				
</table>
<br>
<table align="center">
	<tr>
		<td><a id="b3" href="#">取消</a></td>
<%-- 		<td><a id="b" href="${pageContext.request.contextPath}/app/sel_doc.jsp">測試aaaaa</a></td> --%>
	</tr>

</table>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.colorbox.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.colorbox-zh-TW.js"></script> --%>
<script>
$(function(){
	$("#b3").click(function(){
		top.$.fn.colorbox.close();
	})
});
</script>
</body>
</html>