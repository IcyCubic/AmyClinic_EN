<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Amy | Blog </title>
</head>
<body>
	<!-- header -->
	<jsp:include page="fragment/header.jsp" />
	<!-- //header -->
		<!-- blog-section -->
		<section class="error">
			<div class="inner-banner demo-2 text-center">
				<jsp:include page="fragment/slogan.jsp" />
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>Blog-page</h2>
						<h6>add a short description here</h6>
					</div>
				</div>
			</div>
			<!--- blog ---->
			<div class="blog">
				<div class="container">
					<div class="bolg-posts">
							<div class="col-md-12 blog-top">
								<div class="blog-in">
									<a href="${pageContext.request.contextPath}/web/single.jsp" class="blog-post"><img src="images/b1.jpg" alt=" "></a>
									<div class="blog-grid">
										<div class="date">
											<span class="date-in"><i class="fa fa-calendar"></i>29.3.2016</span>
											<a href="${pageContext.request.contextPath}/web/single.jsp" class="comments"><i class="fa fa-comment"></i>48</a>
											<div class="clearfix"> </div>
										</div>
										<h3><a href="${pageContext.request.contextPath}/web/single.jsp">Distribution of clinical laboratories in health</a></h3>
										<p>Photography Daniel Jackson,  styling by Alastair McKimm, hair by Shon  and Esther Langham, make-up by Yadim,  Francelle and Hannah Murray, <span>
										casting by AM casting. Production  by Nikki Stromberg and Matthew Youmans at M.A.P New York.</span></p>
										<a href="${pageContext.request.contextPath}/web/single.jsp" class="smore">READ MORE</a>										
									</div>
									<div class="clearfix"></div>					
								</div>
								<i class="black"> </i>
							</div>
							<div class="col-md-12 blog-top">
								<div class="blog-in blog-in1">
									<a href="${pageContext.request.contextPath}/web/single.jsp" class="blog-post1"><img src="images/b2.jpg" alt=" "></a>
									<div class="blog-grid">
										<div class="date">
											<span class="date-in"><i class="fa fa-calendar"></i>25.03.2016</span>
											<a href="${pageContext.request.contextPath}/web/single.jsp" class="comments"><i class="fa fa-comment"></i>42</a>
											<div class="clearfix"> </div>
										</div>
										<h3><a href="${pageContext.request.contextPath}/web/single.jsp">Cytopathology examines smears of cells from all over the body</a></h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque molestie, dapibus magna, eget aliquam diam erat at velit. Suspendisse in diam sit amet erat blandit efficitur at eget lorem. Aenean elementum lobortis tellus, sit amet mollis tortor rhoncus id.</span></p>
										<a href="${pageContext.request.contextPath}/web/single.jsp" class="smore">READ MORE</a>										
									</div>
									<div class="clearfix"></div>					
								</div>
								<i class="black"> </i>
							</div>
							<div class="col-md-12 blog-top">
								<div class="blog-in">
									<a href="${pageContext.request.contextPath}/web/single.jsp" class="blog-post"><img src="images/b3.jpg" alt=" "></a>
									<div class="blog-grid">
										<div class="date">
											<span class="date-in"><i class="fa fa-calendar"></i>19.3.2016</span>
											<a href="${pageContext.request.contextPath}/web/single.jsp" class="comments"><i class="fa fa-comment"></i>34</a>
											<div class="clearfix"> </div>
										</div>
										<h3><a href="${pageContext.request.contextPath}/web/single.jsp">Electron microscopy prepares specimens and takes micrographs</a></h3>
										<p>Photography Daniel Jackson,  styling by Alastair McKimm, hair by Shon  and Esther Langham, make-up by Yadim,  Francelle and Hannah Murray, <span>
										casting by AM casting. Production  by Nikki Stromberg and Matthew Youmans at M.A.P New York.</span></p>
										<a href="${pageContext.request.contextPath}/web/single.jsp" class="smore">READ MORE</a>										
									</div>
									<div class="clearfix"></div>					
								</div>
								<i class="black"> </i>
							</div>
							<div class="col-md-12 blog-top">
								<div class="blog-in blog-in1">
									<a href="${pageContext.request.contextPath}/web/single.jsp" class="blog-post1"><img src="images/b4.jpg" alt=" "></a>
									<div class="blog-grid">
										<div class="date">
											<span class="date-in"><i class="fa fa-calendar"></i>25.03.2016</span>
											<a href="${pageContext.request.contextPath}/web/single.jsp" class="comments"><i class="fa fa-comment"></i>42</a>
											<div class="clearfix"> </div>
										</div>
										<h3><a href="${pageContext.request.contextPath}/web/single.jsp">Cytopathology examines smears of cells from all over the body</a></h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque molestie, eget aliquam diam erat at velit. Suspendisse in diam sit amet erat blandit efficitur at eget lorem. Aenean elementum lobortis tellus, sit amet mollis tortor rhoncus id.</span></p>
										<a href="${pageContext.request.contextPath}/web/single.jsp" class="smore">READ MORE</a>										
									</div>
									<div class="clearfix"></div>					
								</div>
								<i class="black"> </i>
							</div>
							<div class="clearfix"> </div>
							<ul class="start">
									<li><a href="#"><span class="prev">Prev</span></a></li>
									<li><span>1</span></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">6</a></li>
									<li><a href="#">7</a></li>
									<li><a href="#">8</a></li>
									<li><span>.....</span></li>
									<li><a href="#">12</a></li>
									<li><a href="#" class="next">Next</a></li>
								</ul>
					</div>
				</div>
			</div>
			<!--- /blog ---->
		</section>
		<!-- //blog-section -->
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