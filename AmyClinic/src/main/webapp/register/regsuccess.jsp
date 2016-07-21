<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊成功</title>
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
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
</style>
</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>
<br>
<br>
<br>
<br>
<br>
<br>
<h1>註冊成功，系統已寄出驗證信，請點選驗證信中的連結開通帳號</h1>
<jsp:include page="/General/footer.jsp"></jsp:include>
</body>
</html>