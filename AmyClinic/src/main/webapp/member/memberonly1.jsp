<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>memberonly1.jsp</title>
<s:head theme="xhtml" />
</head>
<body>

I am memberonly1.jsp<hr>
<h1>I require a login to be viewed!</h1>

${account} <br>
Your private, personal account information is as follows:<hr>
ID: ${memberVO.mid}<br>
Name: ${memberVO.name}<br>
pwd: ${memberVO.pwd}<br>
email: ${memberVO.email}<br>
birthday: ${memberVO.birthday}<br>
country: ${memberVO.country} <br>
gender: ${memberVO.gender} <br>

<s:property value="name"/>
</body>
</html>