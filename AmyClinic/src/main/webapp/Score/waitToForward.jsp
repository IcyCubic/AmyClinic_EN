<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>評點成功</title>
<link href="${pageContext.request.contextPath}/General/css/style.css"
	rel="stylesheet">
<style>
#footer-bgcontent {
		height:65px;
		background: #e499ba;
		position: absolute;
		right: 0;
		left: 0;
		padding: 1rem;
		text-align: center;	
}

h1 {
	text-align: center;
}
</style>
</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>
	<br>
	<br>
	<br>
	<h1>評點成功，頁面轉交中</h1>
<jsp:include page="/General/footer.jsp"></jsp:include>	
<script>
  setTimeout(function() { document.location = "${pageContext.request.contextPath}/Score/ScoreServlet?action=getOne_Score&eid=${ScoreEid}"}, 3000);
 

	
</script>

</body>
</html>