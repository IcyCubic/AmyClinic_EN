<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Amy | About </title>
</head>
<body>
	<!-- header -->
	<jsp:include page="fragment/header.jsp" />
	<!-- //header -->
		<!-- about-section -->
		<section class="about">
			<div class="inner-banner demo-2 text-center">
				<jsp:include page="fragment/slogan.jsp" />
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>About Us</h2>
						<h6>add a short description here</h6>
					</div>
				</div>
			</div>
			<div class="about-grids">
				<div class="container">
					<div class="col-md-4 abt-grid">
						<h3>Tests</h3>
						<i class="fa fa-stethoscope"></i>
						<div class="clearfix"></div>
						<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words</p>
						<a href="${pageContext.request.contextPath}/web/laboratory.jsp">Read More</a>
					</div>
					<div class="col-md-4 abt-grid">
						<h3>Technologies</h3>
						<i class="fa fa-plus-square"></i>
						<div class="clearfix"></div>
						<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words</p>
						<a href="${pageContext.request.contextPath}/web/laboratory.jsp">Read More</a>
					</div>
					<div class="col-md-4 abt-grid">
						<h3>Automation</h3>
						<i class="glyphicon glyphicon-globe"></i>
						<div class="clearfix"></div>
						<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words</p>
						<a href="${pageContext.request.contextPath}/web/laboratory.jsp">Read More</a>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</section>
		<section class="happy-patients">
			<div class="container">
				<div class="happy-patients-head text-center">
					<h3>Kind words from</h3>
					<h4>happy patients</h4>
				</div>
				<div class="happy-patients-grids">
					<div class="col-md-6 happy-patients-grid">
						<div class="happy-patients-grid-left text-right hvr-bounce-to-right dir-arrr">
							<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.</p>
							<h4>Lorem Ipsum</h4>
						</div>
						<div class="happy-patients-grid-right">
							<img src="images/p1.jpg" alt="happy patient" title="happy patient" />
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-6 happy-patients-grid">
						<div class="happy-patients-grid-right another1 dir-arrl">
							<img src="images/p2.jpg" alt="happy patient" title="happy patient" />
						</div>
						<div class="happy-patients-grid-left another2 hvr-bounce-to-left">
							<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.</p>
							<h4>Lorem Ipsum</h4>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-6 happy-patients-grid">
						<div class="happy-patients-grid-left text-right hvr-bounce-to-right dir-arrr">
							<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.</p>
							<h4>Lorem Ipsum</h4>
						</div>
						<div class="happy-patients-grid-right">
							<img src="images/p3.jpg" alt="happy patient" title="happy patient" />
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="col-md-6 happy-patients-grid">
						<div class="happy-patients-grid-right another1 dir-arrl">
							<img src="images/p4.jpg" alt="happy patient" title="happy patient" />
						</div>
						<div class="happy-patients-grid-left another2 hvr-bounce-to-left">
							<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.</p>
							<h4>Lorem Ipsum</h4>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</section>
			<!--team-->
			<section class="team text-center">
				<div class="container">
					<h3 class="title">Meet Our Specialists </h3>
					<p class="w-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit Mauris ex nulla aliquam ornare facilisis nec Sit accusamus, vel blanditiis iure minima ipsa molestias minus laborum velit, nulla nisi hic quasi enim </p>
					<div class="team-row">
						<div class="col-md-3 team-grids">
							<h5>Mark Smithy</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipi est eligendi scing elit consectetur</p>
							<div class="abt-social-icons">
								<a href="#"><i class="fa fa-facebook"></i></a>
								<a href="#"><i class="fa fa-twitter"></i></a>
								<a href="#"><i class="fa fa-pinterest-p"></i></a>
							</div>
							<div class="team-img">
								<img src="images/d1.jpg" alt="">
							</div>
						</div>
						<div class="col-md-3 team-grids team-mdl">
							<h5>Aliquam amet</h5>
							<p>Consectetur adipi lorem ipsum dolor sit amet, est eligendi scing elit consectetur.</p>
							<div class="abt-social-icons">
								<a href="#"><i class="fa fa-facebook"></i></a>
								<a href="#"><i class="fa fa-twitter"></i></a>
								<a href="#"><i class="fa fa-pinterest-p"></i></a>
							</div>
							<div class="team-img">
								<img src="images/d2.jpg" alt="">
							</div>
						</div>
						<div class="col-md-3 team-grids team-mdl1">
							<h5>Daniel Nyari</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipi est eligendi scing elit consectetur.</p>
							<div class="abt-social-icons">
								<a href="#"><i class="fa fa-facebook"></i></a>
								<a href="#"><i class="fa fa-twitter"></i></a>
								<a href="#"><i class="fa fa-pinterest-p"></i></a>
							</div>
							<div class="team-img">
								<img src="images/d3.jpg" alt="">
							</div>
						</div>
						<div class="col-md-3 team-grids">
							<h5>Alan ipsum</h5>
							<p>Eligendi scing elit lorem ipsum dolor sit amet, consectetur dolore magnam aliquam</p>
							<div class="abt-social-icons">
								<a href="#"><i class="fa fa-facebook"></i></a>
								<a href="#"><i class="fa fa-twitter"></i></a>
								<a href="#"><i class="fa fa-pinterest-p"></i></a>
							</div>
							<div class="team-img">
								<img src="images/d4.jpg" alt="">
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
			<!--//team-->
		</section>
		<!--who-we-are-->
		<div class="who-are-we">
			<div class="container">
				<h3>We are no. 1...<span>WHY?</span></h3>
				<div class="col-md-6 who-grids">
					<ul class="whogrid_info">
						<li class="tick">Lorem Ipsum is simply dummy text.</li>
						<li class="tick">Contrary to popular belief, simply random text.</li>
						<li class="tick">There are many passages of Lorem Ipsum available.</li>
					</ul>
				</div>
				<div class="col-md-6 who-grids">
					<ul class="whogrid_info">
						<li class="tick">Lorem Ipsum is simply dummy text.</li>
						<li class="tick">Contrary to popular belief, simply random text.</li>
						<li class="tick">There are many passages of Lorem Ipsum available.</li>
					</ul>
				</div>
			</div>
		</div>
		<!--/who-we-are-->
		<!-- //about-section -->
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