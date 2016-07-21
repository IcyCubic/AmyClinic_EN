<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/login/css/login.css" rel="stylesheet">
<style>
#loginpage form input[type="password"] {
	border-radius: 3px;
	box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
	background: #FFFFFF;
	border: 1px solid #c8c8c8;
	color: #777;
	margin: 30px 0 10px;
	padding: 15px 10px 15px 40px;
	width: 55%;
}
</style>
<title>修改密碼</title>
</head>
<body>
	<s:include value="/General/header.jsp"></s:include>
	
	<div id="loginpage">
		<font color="blue"><b>歡迎，${sessionScope.memberVO.name}！ </b></font> 		
			<s:form namespace="/logreg" action="reset" theme="simple">
			<div style="color: red;">${message}</div>
			<div>
				<span id="label">密碼：</span>
				<s:password name="memberVO.pwd" placeholder="輸入新密碼" required="true" id="password"/>				
			</div>
			<div>	
				<span id="label">確認密碼：</span>
				<s:password name="tempPW" placeholder="確認密碼" required="true" id="tempPW" />
				<s:submit value="送出" method="resetPass" />
			</div>	
			</s:form>
		
	</div>
	<s:include value="/General/footer.jsp"></s:include>
</body>
</html>