<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/login/css/recover.css"
	rel="stylesheet">
<title>找回密碼</title>
</head>
<body>
<p>或者使用電子郵件聯絡我們</p><hr>

	<ul>
		<li><font color="blue"><b>請輸入您的電子郵件，藉由該信箱幫助您取回密碼</b></font> 		
			<s:form namespace="/free" action="recoverini">
				<s:textfield name="memberVO.email" label="E-mail" placeholder="abc@xyz.com" id="recover-email"/>				
				<s:submit value="送出" method="recover" id="recover-btn"/>
			</s:form>
		</li>
<%-- 		<li><div style="color:red;">${message}</div></li> --%>
	</ul>	
	 
</body>
</html>
