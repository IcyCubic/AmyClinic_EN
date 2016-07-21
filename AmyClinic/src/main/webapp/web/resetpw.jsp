<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Amy | Message </title>
</head>
<body>
	<!-- header -->
	<jsp:include page="fragment/header.jsp" />
	<!-- //header -->
		<section class="error">
			<div class="inner-banner demo-2 text-center">
				<jsp:include page="fragment/slogan.jsp" />
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>密碼更新</h2>
						<h6>${account}</h6>
					</div>
				</div>
			</div>
		<div class="login-form-grids">
			<div style="color: red;">${message}</div>
			<form action="${pageContext.request.contextPath}/logreg/reset.action"
				method="post">
				<label class="test-info">密碼 <span>*</span></label> 
				<input type="password" name="memberVO.pwd" placeholder="輸入新密碼" required id="password">
				<div class="clearfix"></div>
				<label class="test-info">確認密碼 <span>*</span></label> 
				<input type="password" name="tempPW" placeholder="確認密碼" required id="tempPW">
				<div class="clearfix"></div>
				<input type="submit" value="更新密碼">
			</form>
		</div>
</section>	

		<!-- news letter -->
		<jsp:include page="fragment/newsletter.jsp" />
		<!-- //news letter -->
		
		<!-- footer -->
		<jsp:include page="fragment/footer.jsp" />
		<!-- //footer -->
	<script type="text/javascript">
		$(document).ready(function() {			
			$().UItoTop({ easingType: 'easeOutQuart' });			
		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>