<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>display.jsp</title>
<s:head theme="xhtml" />
</head>
<body>
<br>
I am success.jsp <hr>

You are logged in, ${memberVO.name}! Your E-Mail is: ${memberVO.email}

Redirecting in 3 seconds...

<!-- <ul> -->
<%-- 	<li>Name = ${requestScope.name}  --Obtained via EL </li> --%>
<%-- 	<li>Name = <s:property value="name"/>  --Obtained via OGNL </li> --%>
<!-- </ul> -->
<script>
  setTimeout(function() {
      document.location = "${pageContext.request.contextPath}/index.jsp";
  }, 3000); // delay in milliseconds
</script>
</body>
</html>