<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% response.setHeader("Cache-Control", "no-store"); response.setHeader("Pragma", "no-cache"); response.setDateHeader("Expires", 0); %>
<!DOCTYPE html>
<html>
<head>
<title>Amy | 會員登入 </title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="187388699466-pqf6of44on8fl4fvfdhe5rqu8or4r3ba.apps.googleusercontent.com">

<style>

#googleButtonPlaceholder {
	cursor: pointer;
	display: inline-block;
	overflow: hidden;
	position: relative;
/* 	margin-left: 55%; */
	vertical-align:top;
}

#googleButtonPlaceholder div {
	cursor: pointer;
	font-size: 100px;
	height: 100%;
	filter: alpha(opacity = 1);
	-moz-opacity: 0.01;
	opacity: 0.01;
	position: absolute;
	right: 0;
	top: 0;
	z-index: 9;
}


.loginbtn {
  font-size: 1.2em;
  font-weight: normal;
  position: relative;
  display: block;
  margin:15px;
  padding: 10px;
  width: 200px;
  border-radius: 6px;
  background: #f26964;
  color: #f4f4f4;
  box-shadow: 0px 3px 0px #ab4b47;
  cursor: pointer;
 }

#googleButtonPlaceholder:active .loginbtn,
.loginbtn:active{
  top: 3px;
  box-shadow: none;
}

.fb {
	background: #4D6AB6;
	box-shadow: 0px 3px 0px #3D5998;
/*  	margin-left: 61%;  */
	display: inline-block;
	vertical-align:top;
}
#customlogin{
	text-align:center;
}

</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="fragment/header.jsp" />
	<script src="${pageContext.request.contextPath}/web/js/facebook.login.js"></script>	
	<!-- //header -->
		<!-- login-section -->
		<section class="login-page">
			<div class="inner-banner demo-2 text-center">
				<jsp:include page="fragment/slogan.jsp" />
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>登 入 愛 美</h2>
						<h6>Log into Amy</h6>
					</div>
				</div>
			</div>
			<!--- login ---->
			<!-- login -->
			<div class="login">
				<div class="container">
					<h3>登 入</h3>
					<p class="est">Welcome back!</p>
				<div class="login-form-grids">
					<div style="color: red;">${message}</div>
					<form
						action="${pageContext.request.contextPath}/logreg/login.action"
						method="post">
						<label class="test-info">會員帳號 <span>*</span></label> <input
							type="text" name="memberVO.name" placeholder="電子信箱 / Email"
							required=" ">
						<div class="clearfix"></div>
						<label class="test-info">會員密碼 <span>*</span></label> <input
							type="password" name="memberVO.pwd" placeholder="密碼 / Password"
							required=" ">
						<div class="clearfix"></div>
						<div class="forgot">
							<div>
								<a href="#" class="btn btn-default btn-default_2 pull-left"
									data-toggle="modal" data-target="#applyModal_1">忘記密碼?</a>
							</div>
						</div>
						<input type="submit" value="登 入">
					</form>
					<div id="customlogin">
						<div class="loginbtn fb" onclick="fb_login();">使用 FaceBook
							登入</div>
						<div id="googleButtonPlaceholder">
							<div class="g-signin2" data-onsuccess="onSignIn" data-width="300"
								data-height="60"></div>
							<span class="loginbtn">使用 Google Gmail 登入</span>
						</div>
					</div>
					<div class="modal fade" id="applyModal_1" tabindex="-1"
						role="dialog" aria-labelledby="applyModalLabel" aria-hidden="true">
						<div class="modal-dialog dialog_3">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">
										<div class="head_4">
											<h3>重設您的密碼</h3>
											<p>請輸入您的電子郵件信箱</p>
										</div>
									</h4>
								</div>
								<div class="modal-body">
									<form action="${pageContext.request.contextPath}/free/recoverini.action" method="post" class="register">
										<input type="text" name="memberVO.email" id="recover-email" placeholder="電子信箱 / Email" required> 
										<input type="submit" value="送出">
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<h4>For New People</h4>
							<p><a href="register.jsp">Register Here</a> (or) go to <a href="index.jsp">Home Page<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></p>
						</div>
					</div>
				<!-- //login -->
			<!--- /login ---->					
		</section>

		<!-- //login-section -->
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
				/*
				var defaults = {
		  			containerID: 'toTop', // fading element id
					containerHoverID: 'toTopHover', // fading element hover id
					scrollSpeed: 1200,
					easingType: 'linear' 
		 		};
				*/				
				$().UItoTop({ easingType: 'easeOutQuart' });				
			});
		</script>
	<!-- Google script -->
	<script src="${pageContext.request.contextPath}/js/google.login.js"></script>
	<!-- FB script -->
	<script>
	function fb_login() {
	    FB.login( function() {checkLoginState();}, { scope: 'email,public_profile' } );
	    
	}
	</script>
	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>