<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 以備不時之需的錯誤顯示網頁 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/colorbox.css">
</head>
<body>
<a id="b3" href="#">系統忙線中</a>
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