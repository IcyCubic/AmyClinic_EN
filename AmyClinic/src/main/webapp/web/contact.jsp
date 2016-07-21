<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Amy | Contact</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="fragment/header.jsp" />
	<!-- //header -->
		<!-- Contact-section -->
		<section class="contact">
			<div class="inner-banner demo-2 text-center">
				<jsp:include page="fragment/slogan.jsp" />
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>聯絡我們</h2>
						<h6>Contact Information</h6>
					</div>
				</div>
			</div>
			<!--contact-->
	<div class="contact">
		<div class="container">
			<div class="map">
				<h4>診所地方地圖</h4>
				<jsp:include page="fragment/map.jsp" />
			</div>
			<div class="contact-infom">
				<h4>聯絡知訊</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sheets containing Lorem Ipsum passages, 
					sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.It was popularised in the 1960s with the release of Letraset
					  and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
			</div>	
			<div class="address">
				<div class="row">
					<div class="col-md-4 location">
<!-- 						<h4>Address1 :</h4> -->
<!-- 						<p>Eiusmod Tempor inc</p> -->
<!-- 						<p>9560 St Dolore Place,</p> -->
<!-- 						<p>Telephone : +2 800 544 6035</p> -->
<!-- 						<p>FAX : +1 800 889 4444</p> -->
<!-- 						<p>Email : <a href="mailto:example@email.com">mail@example.com</a></p> -->
					</div>
					<div class="col-md-4 location">
						<h4>地址 :</h4>
						<p>台北市大安區復興南路一段390號2樓</p>
						<p>電話 : (02) 5912 3467</p>
						<p>傳真 : (02) 5912 3470</p>
						<p>電郵 : <a href="mailto:CustomerService@Amy.com">CustomerService@Amy.com</a></p>
					</div>	
					<div class="col-md-4 location">
<!-- 						<h4>Address3 :</h4> -->
<!-- 						<p>Eiusmod Tempor inc</p> -->
<!-- 						<p>9560 St Dolore Place,</p> -->
<!-- 						<p>Telephone : +2 800 544 6035</p> -->
<!-- 						<p>FAX : +1 800 889 4444</p> -->
<!-- 						<p>Email : <a href="mailto:example@email.com">mail@example.com</a></p> -->
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
			<div class="contact-form">
				<h4>留言表格</h4>
				<form>
					<input type="text" value="姓名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '姓名';}" required="">
					<input type="email" value="電郵" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '電郵';}" required="">
					<input type="text" value="電話" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '電話';}" required="">
					<textarea type="text"  onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '留言...';}" required="">留言...</textarea>
					<input type="submit" value="送出" >
				</form>
			</div>
			
		</div>
	</div>
		</section>
		<!-- //contact-section -->
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
				<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>