<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Amy | 訊息 </title>
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
						<h2>你好</h2>
						<h6>${account}</h6>
					</div>
				</div>
			</div>
			<!--- **** ---->
			<div class="hd-content">
				<div class="container">
					<div class="page_404 text-center">
						<p>${message}</p>
						<p style="color:red;">在3秒後重導向首頁...</p>
					</div>
				</div>
			</div>
			<!--- /**** ---->
		</section>	
<!-- General purpose message page. Displays a message (from many sources) 
	 for 3 seconds before redirecting to index.jsp -->
		<!-- book an appointment -->
		<jsp:include page="fragment/appointment.jsp" />
		<!-- //book an appointment -->
		
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
	<script>
	  setTimeout(function() {
	      document.location = "${pageContext.request.contextPath}/web/index.jsp";
	  }, 5000); // delay in milliseconds
	</script>
	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>