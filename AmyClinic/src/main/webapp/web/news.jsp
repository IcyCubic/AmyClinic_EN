<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Amy | News</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="fragment/header.jsp" />
	<!-- //header -->
		<!-- news-section -->
		<section class="news-page">
			<div class="inner-banner demo-2 text-center">
				<jsp:include page="fragment/slogan.jsp" />
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>News</h2>
						<h6>add a short description here</h6>
					</div>
				</div>
			</div>
			<!--- news ---->
			<div class="news">
				<div class="container">
					<h3 class="last-updated">news</h3>	
				<div class="public-relations">
					<img src="images/public.jpg" class="img-responsive" alt="" />
					<h3 class="p-c-text text-center">Press Contact</h3>
					<div class="news-grids">
								<div class="col-md-6 news-left">
									<h3>Statistics</h3>
									<ol>
										<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit</li>
										<li>Sed euismod faucibus malesuada dui vitae egestas malesuada ante malesuada Morbi luctus accumsan risus</li>
										<li>Malesuada Sed euismod faucibus dui, vitae egestas ante. Morbi luctus accumsan Sed euismod faucibus dui, vitae egestas ante malesuada Morbi luctus accumsan</li>
										<li>Proin rutrum, turpis at accumsan vestibulum, sem justo aliquam mi, sed bibendum metus risus et odio. Etiam vulputate mauris eget vestibulum lacinia.</li>
										<li>Pellentesque posuere dui a erat pellentesque, eget ultricies tellus rutrum. Mauris et molestie dolor. Phasellus condimentum feugiat</li>
										<li>Integer placerat, eros a ullamcorper venenatis, diam erat vestibulum elit, quis fringilla velit ipsum at dolor.</li>
										<li>Sed euismod faucibus malesuada dui vitae egestas malesuada ante malesuada Morbi luctus accumsan risus</li>
										<li>Malesuada Sed euismod faucibus dui, vitae egestas ante. Morbi luctus accumsan Sed euismod faucibus dui, vitae egestas ante malesuada Morbi luctus accumsan</li>
										<li>Proin rutrum, turpis at accumsan vestibulum, sem justo aliquam mi, sed bibendum metus risus et odio. Etiam vulputate mauris eget vestibulum lacinia.</li>
									</ol>
								</div>
								<div class="col-md-6 news-left news-right">
									<h3>Blogs and Social Media</h3>
									<ol>
										<li><a href="#">Lorem ipsum dolor sit amet</a></li>
										<li><a href="#">Sed euismod faucibus malesuada</a></li>
										<li><a href="#">Malesuada Sed euismod faucibus</a></li>
										<li><a href="#">Proin rutrum, turpis at accumsan</a></li>
										<li><a href="#">Pellentesque posuere dui a erat</a></li>
										<li><a href="#">Integer placerat eros a ullamcorper</a></li>
										<li><a href="#">Sed euismod faucibus malesuada</a></li>
										<li><a href="#">Malesuada Sed euismod faucibus</a></li>
										<li><a href="#">Proin rutrum, turpis at accumsan</a></li>
									</ol>
								</div>
								<div class="clearfix"> </div>
							</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<!--- /news ---->
		</section>
		<!-- //news-section -->
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