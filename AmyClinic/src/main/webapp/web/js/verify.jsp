<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Verify Email</title>
</head>
<body>

<!-- General purpose message page. Displays a message (from many sources) 
	 for 3 seconds before redirecting to index.jsp -->

I am verify.jsp <hr>

Hello ${memberVO.name}!
<div style="color:red;">${message}</div>

<script>
  setTimeout(function() {
      document.location = "${pageContext.request.contextPath}/index.jsp";
  }, 3000); // delay in milliseconds
</script>
</body>
</html>