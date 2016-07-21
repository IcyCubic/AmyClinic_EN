<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Amy | Mobile App</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="fragment/header.jsp" />
	<!-- //header -->
		<!-- mobile-app-section -->
		<section class="mobile-app">
			<div class="inner-banner demo-2 text-center">
				<jsp:include page="fragment/slogan.jsp" />
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>Prevention App</h2>
						<h6>add a short description here</h6>
					</div>
				</div>
			</div>
			<!--- mobile-app ---->
			<div class="mobilaapp main-grid-border">
				<div class="container">
					<div class="app">
						<div class="col-md-5 app-left mpl">
							<h3>Prevention mobile app on your smartphone!</h3>
							<p>Download and Avail Special Discounts on Packages and Tests.</p>
							<div class="app-devices">
								<h5>Gets the app from</h5>
								<a href="#"><img src="images/1.png" alt=""></a>
								<a href="#"><img src="images/2.png" alt=""></a>
								<div class="clearfix"> </div>
							</div>
						</div>
						<div class="col-md-7 app-image">
							<img src="images/mob.png" alt="">
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<div class="app-bottom-grids text-center">
					<div class="container">
						<div class="col-md-3 app-bottom-grid">
							<i class="glyphicon glyphicon-list-alt"></i>
							<h3>Book Tests, Profiles and Packages</h3>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry's standard industry.</p>
						</div>
						<div class="col-md-3 app-bottom-grid">
							<i class="glyphicon glyphicon-map-marker"></i>
							<h3>Tracking Become Easier</h3>
							<p>It is a long established fact that a reader will be distracted by the readable content of a page.</p>
						</div>
						<div class="col-md-3 app-bottom-grid">
							<i class="fa fa-lock"></i>
							<h3>100% Secure Payment Gateway</h3>
							<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered.</p>
						</div>
						<div class="col-md-3 app-bottom-grid">
							<i class="fa fa-users"></i>
							<h3>Book for Your Family</h3>
							<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece.</p>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>	
			</div>
			<!--- /mobile-app ---->
		</section>
		<!-- //mobile-app-section -->
		
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