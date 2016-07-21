<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Amy | Sitemap</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="fragment/header.jsp" />
	<!-- //header -->
		<!-- sitemap-section -->
		<section class="sitemap-section">
			<div class="inner-banner demo-2 text-center">
				<jsp:include page="fragment/slogan.jsp" />
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>Sitemap</h2>
						<h6>add a short description here</h6>
					</div>
				</div>
			</div>
			<!--- sitemap ---->
			<div class="sitemap">
				<div class="container">
					<h3 class="last-updated">Sitemap</h3>
					<div class="col-md-4 sitemap-grid">
						<h4>Lab</h4>
						<ul>
							<li><span>&#62;</span><a href="laboratory.jsp">About Lab</a></li>
							<li><span>&#62;</span><a href="quality.jsp">Quality</a></li>
							<li><span>&#62;</span><a href="technologies.jsp">Technologies</a></li>
							<li><span>&#62;</span><a href="instruments.jsp">Instruments</a>
							 <ul class="sub-child">
								<li><a href="single-instrument.jsp">Single-instrument</a></li>
							 </ul>
							</li>
						</ul>
						<h4>Book Test</h4>
						<ul>
							<li><span>&#62;</span><a href="book-a-test.jsp">Book a Test</a></li>
							<li><span>&#62;</span><a href="test-list.jsp">Test Menu</a>
							<ul class="sub-child">
								<li><a href="test-desc.jsp">Test-desc</a></li>
							 </ul>
							</li>
						</ul>
					</div>
					<div class="col-md-4 sitemap-grid">
						<h4>Opportunity</h4>
						<ul>
							<li><span>&#62;</span><a href="career.jsp">Careers</a>
							<ul class="sub-child">
								<li><a href="jobs_single.jsp">Jobs-single</a></li>
							 </ul>
							</li>
							<li><span>&#62;</span><a href="404.jsp">Franchisee</a></li>
						</ul>
						<h4>Pages</h4>
						<ul>
							<li><span>&#62;</span><a href="news.jsp">News</a></li>
							<li><span>&#62;</span><a href="faq.jsp">Faq</a></li>
							<li><span>&#62;</span><a href="mobile-app.jsp">App</a></li>
							<li><span>&#62;</span><a href="terms.jsp">Terms of Use</a></li>
							<li><span>&#62;</span><a href="shortcodes.jsp">Shortcodes</a></li>
							<li><span>&#62;</span><a href="privacy_policy.jsp">Privacy Policy</a></li>
						</ul>
					</div>
					<div class="col-md-4 sitemap-grid">
						<h4>Blog</h4>
						<ul>
							<li><span>&#62;</span><a href="blog.jsp">Blog-post</a></li>
							<li><span>&#62;</span><a href="single.jsp">Single-post</a></li>
						</ul>
						<h4>Remaining</h4>
						<ul>
							<li><span>&#62;</span><a href="index.jsp">Home</a></li>
							<li><span>&#62;</span><a href="about.jsp">About</a></li>
							<li><span>&#62;</span><a href="contact.jsp">Contact</a></li>
						</ul>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!--- /sitemap ---->
		</section>
		<!-- //sitemap-section -->
		
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