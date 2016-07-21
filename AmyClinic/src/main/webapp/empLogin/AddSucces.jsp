<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<s:head theme="xhtml" />
<body>
 		<h3>員工：${requestScope.EmployeeVO.name}新增成功</h3>
 		<UL>
 			<li>員工姓名：${request.EmployeeVO.name}</li>
 			<li>e-mail：${request.EmployeeVO.email}</li>
 			<li>教育程度：${request.EmployeeVO.education}</li>
 			<li>經歷：${request.EmployeeVO.experience}</li>
 			<li>專長：${request.EmployeeVO.specialty}</li>
 		
 		</UL>
 		
</body>
</html>