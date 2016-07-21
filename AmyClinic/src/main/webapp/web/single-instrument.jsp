<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Amy | Single Instrument</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="fragment/header.jsp" />
	<!-- //header -->
		<!-- instrument-section -->
		<section class="instrument-section">
			<div class="inner-banner demo-2 text-center">
				<jsp:include page="fragment/slogan.jsp" />
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>Instrument</h2>
						<h6>add a short description here</h6>
					</div>
				</div>
			</div>
			<!--- instrument ---->
			<div class="instrument">
				<div class="container">
					<h3 class="last-updated">Instrument</h3>	
					<div class="instrument-view">
						<div class="col-md-6 ins-image">
							<img src="images/instrument.jpg" title="instrument" alt="" />
						</div>
						<div class="col-md-6 ins-details">
							<div class="ins-name">
								<h3>LOREM IPSUM AIS</h3>
								<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo</p>
								<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever</p>
							</div>
							<div class="span span1">
								<p class="left">BRAND</p>
								<p class="right">: Sed Perst</p>
								<div class="clearfix"></div>
							</div>
							<div class="span span2">
								<p class="left">MADE IN</p>
								<p class="right">: USA</p>
								<div class="clearfix"></div>
							</div>
							<div class="span span1">
								<p class="left">INSTALLATIONS</p>
								<p class="right">: 1</p>
								<div class="clearfix"></div>
							</div>
							<div class="span span4">
								<p class="left">TECHNOLOGY</p>
								<p class="right">: AISO</p>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="clerfix"></div>
				</div>
			</div>
			</div>
			<!--- /instrument ---->
		</section>
		<!-- //instrument-section -->
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