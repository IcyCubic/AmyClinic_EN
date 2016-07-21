<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 錯誤表列 --%>
   <c:if test="${not empty errorMsg}">
	<font color='red'>請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsg}">
			<li><font color='red'>請修正以下錯誤:${message}</font></li>
		</c:forEach>
	</ul>
	
</c:if>
<%-- 錯誤表列 --%>

<FORM METHOD="post" ACTION="EmpLoginServlet.do" name="form1" enctype="multipart/form-data">
		<table border="0">
			<tr>
				<td>密碼</td>
				<td><input type="password" name="pwd"  size="20" ></td>
			</tr>
			<tr>
				<td>重新輸入密碼</td>
				<td><input type="password" name="pwd2" size="20" ></td>
			</tr>
		</table>
		<input type="hidden" name="action" value="change_pw"><br>
		<input type="submit" value="送出修改">
	</FORM>
</body>
</html>