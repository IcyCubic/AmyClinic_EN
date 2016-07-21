<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>

<!-- bootstrap -->
<!-- 最新編譯和最佳化的 CSS -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/bootstrap.css">
<!-- 選擇性佈景主題 -->
<link rel="stylesheet" 	href="${pageContext.request.contextPath}/css/bootstrap-theme.css">
<!-- 最新編譯和最佳化的 JavaScript -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>新增成功</title>
</head>
<body>

<div class="container">
  <div class="jumbotron">
    <h1>註冊成功 ${empVO.name} </h1>      
    <p>Bootstrap is the most popular HTML, CSS, and JS framework for developing responsive, mobile-first projects on the web.</p>
<div class="col-xs-4">
<a href="${pageContext.request.contextPath}\empLogin/login.jsp" name="backbtn" class="btn btn-default">返回登入頁</a>
</div>
  </div>
<!--   <p>This is some text.</p>       -->
<!--   <p>This is another text.</p>       -->
<!--   <label class="control-label" for="backbtn"></label> -->
</div>

</body>
</html>