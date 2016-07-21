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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/colorbox.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/lobibox.min.css">
<body bgcolor="#FFD9EC">
<br>

<!-- <ul> -->
<%-- 	<li>Name = ${requestScope.name}  --Obtained via EL </li> --%>
<%-- 	<li>Name = <s:property value="name"/>  --Obtained via OGNL </li> --%>
<!-- </ul> -->
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.colorbox.js"></script>
<script src="${pageContext.request.contextPath}/js/lobibox.min.js"></script>

<script>
function getContextPath() { //obtains context path. EL doesn't work with separated .js
	return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}
$(function(){
	Lobibox.notify("success", {
		size: 'mini',
		title: '照片修改成功',
		delay: 1500,
		delayIndicator: false,
		sound: false,
		position: "center top"
		});
	window.setTimeout(function(){
		window.parent.location.reload();
		 }, 1500);	
	
})
  setTimeout(function() {
	  top.$.fn.colorbox.close();
  }, 2000); // delay in milliseconds
</script>
</body>
</html>