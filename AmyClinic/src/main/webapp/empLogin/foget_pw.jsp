<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${not empty errorMsg}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsg}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<form action="EmpLoginServlet.do" method="post">
	<table>
	<tr>
	<td>帳號：</td>
	<td><input type="text" name="restmail" size="20" value="${request.mail}"/></td>
	</tr>
	<tr>
			<td>
				<input type="submit" value="送出"/>
			</td>
		</tr>
	</table>
	<input type="hidden" name="action" value="forgetpw">
	</form>
</body>
</html>