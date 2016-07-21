<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>跳轉中</title>
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

h2 {
	font-size: 23pt;
}
</style>	
</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>
<!-- General purpose message page. Displays a message (from many sources) 
	 for 3 seconds before redirecting to index.jsp -->
<br>
<div style="color:red;text-align: center;"><h2>${message}</h2></div>
<jsp:include page="/General/footer.jsp"></jsp:include>
<script>
  setTimeout(function() {
      document.location = "${pageContext.request.contextPath}/index.jsp";
  }, 3000); // delay in milliseconds
</script>
</body>
</html>