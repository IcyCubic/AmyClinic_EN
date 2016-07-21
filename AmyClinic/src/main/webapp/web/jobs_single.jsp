<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Amy | Careers</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="fragment/header.jsp" />
	<!-- //header -->
		<!-- Careers-section -->
		<section class="career-page">
			<div class="inner-banner demo-2 text-center">
				<jsp:include page="fragment/slogan.jsp" />
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>Career</h2>
						<h6>add a short description here</h6>
					</div>
				</div>
			</div>
			<!--- Careers ---->
			<div class="careers">
				<div class="container">
					<h3 class="last-updated">Current Opening</h3>	
					<div class="job-lists">  
					   <div class="col-md-9 single_right">
							<div class="job-detailed">
									<div class="jobs-item with-thumb">
										<div class="jobs_right">
											<div class="date_desc"><h6 class="job-title">HR RECRUITER</h6>
												<span class="meta">Sydney, AU, Vacancies: 5, Views: 130</span>
											</div>
											<div class="clearfix"> </div>
											<p class="job-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit, maxime, excepturi, mollitia, voluptatibus similique aliquid a dolores autem laudantium sapiente ad enim ipsa modi laborum accusantium deleniti neque architecto vitae</p>
										    <div class="job-summary">
												<h6>Job Summary</h6>
												<ol start="1">
													<li>Lorem Ipsum is simply dummy as opposed  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</li>
													<li>voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores</li>
													<li>Lorem Ipsum is simply dummy text of the printing and typesetting industry.it has a more-or-less normal distribution of letters, as opposed  Lorem Ipsum has been the industry's.</li>
													<li>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium standard dummy text ever since the 1500s.</li>
													<li>Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam.</li>
													<li>Lorem Ipsum is simply dummy as opposed  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</li>
													<li>voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores</li>
													<li>Lorem Ipsum is simply dummy text of the printing and typesetting industry.it has a more-or-less normal distribution of letters, as opposed  Lorem Ipsum has been the industry's.</li>
													<li>Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam.</li>
												</ol>
											</div>
											<div class="skill-req">
												<h6>Skills Required</h6>
												<ul>
													<li><i class="fa fa-long-arrow-right"></i>Lorem Ipsum is simply dummy as opposed  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</li>
													<li><i class="fa fa-long-arrow-right"></i>voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores</li>
													<li><i class="fa fa-long-arrow-right"></i>Lorem Ipsum is simply dummy text of the printing and typesetting industry.it has Lorem Ipsum has been the industry's.</li>
													<li><i class="fa fa-long-arrow-right"></i>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium standard dummy text.</li>
													<li><i class="fa fa-long-arrow-right"></i>Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</li>
													<li><i class="fa fa-long-arrow-right"></i>Lorem Ipsum is simply dummy as opposed  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</li>
													<li><i class="fa fa-long-arrow-right"></i>voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores</li>
													<li><i class="fa fa-long-arrow-right"></i>Lorem Ipsum is simply dummy text of the printing and typesetting industry as opposed  Lorem Ipsum has been the industry's.</li>
													<li><i class="fa fa-long-arrow-right"></i>Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta Nemo enim ipsam.</li>
												</ul>
											</div>
											<div class="qualification">
												<h6>Qualification</h6>
												<p>Graduate : Any</p>
											</div>
										</div>
										<div class="clearfix"> </div>
									</div>
							</div>
						</div>
						<div class="col-md-3">
						  <div class="job-contact">
							<h5 class="widget-title">Contact</h5>
							<p>Email: <a href="mailto:example@mail.com">example@mail.com</a></p>
							<p>Ph: 080-565982</p>
						  </div>
					   </div>
				  <div class="clearfix"> </div>
				 </div>
			</div>
			</div>
			<!--Horizontal Tab-->
			<!--- /Careers ---->
		</section>
		<!-- //Careers-section -->
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