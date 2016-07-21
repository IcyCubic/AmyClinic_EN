<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Amy | Book-a-Test</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="fragment/header.jsp" />
	<!-- //header -->
		<!-- Book-a-test-section -->
		<section class="book-a-test">
			<div class="inner-banner demo-2 text-center">
				<jsp:include page="fragment/slogan.jsp" />
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>Book Your Test</h2>
						<h6>add a short description here</h6>
					</div>
				</div>
			</div>
			<!--- Book-a-test ---->
			<div class="test-booking">
				<div class="container">
					<h3 class="last-updated">Book Your Test</h3>
					<div class="text-booking-form">
						<div class="col-md-6 text-booking-form-left">
							<form>
								<label>Name <span>*</span></label>
									<input type="text" class="phone" placeholder="">
									<div class="clearfix"></div>
								<label>Mobile Number<span>*</span></label>
									<input type="text" class="phone" placeholder="">
									<div class="clearfix"></div>
								<label>Gender <span>*</span></label>
									<select class="">
									  <option>Gender</option>
									  <option>Male</option>
									  <option>Female</option>
									</select>
									<div class="clearfix"></div>
								<label>Age<span>*</span></label>
									<input type="text" class="phone" placeholder="">
									<div class="clearfix"></div>
								<label>Address <span>*</span></label>
									<textarea class="mess" placeholder="Address"></textarea>
									<div class="clearfix"></div>
								<label>Pin<span>*</span></label>
									<input type="text" class="phone" placeholder="">
									<div class="clearfix"></div>								
								<label>Email<span>*</span></label>
									<input type="text" class="phone" placeholder="">
									<div class="clearfix"></div>
								<label>Select Package <span>*</span></label>
									<select class="">
									  <option>Select Package</option>
									  <option>MASTER HEALTH CHECK</option>
									  <option>WHOLE BODY CHECKUP</option>
									  <option>HEALTH CHECK 1 AND 2</option>
									</select>
									<div class="clearfix"></div>
									<div class="c-lang">
									<p class="update"><input type="checkbox" id="c1" name="cc">Keep me updated on the latest offers and much more	</p>							</div>
									<div class="book-submit">
										<input type="submit" value="Book Now">
									</div>
							</form>
						</div>
						<div class="col-md-6 text-booking-form-right">
							<img src="images/bookshow.jpg" alt="" />
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="preventive-desc">
						<h4>Why do we need Preventive Health Checkup?</h4>
						<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
						<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
					</div>
					<div class="health-packages">
							<h4 class="package-title">PREVENTIVE HEALTH CHECK UP PACKAGES</h4>
								<div class="modal-body packages">
									<div class="col-md-4 text-center modal-align">
										<div class="package">
											<p>A set of basic tests that can give a broad overview of your health status.</p>
											<i class="fa fa-heartbeat"></i>
											<h4>MASTER HEALTH CHECK</h4>
											<a href="book-a-test.jsp">Book Now</a>
										</div>
									</div>
									<div class="col-md-4 text-center modal-align">
										<div class="package">
											<p>Are you looking for a comprehensive health check that includes even Eye, Dental and ENT checks?</p>
											<i class="fa fa-medkit"></i>
											<h4>WHOLE BODY CHECKUP</h4>
											<a href="book-a-test.jsp">Book Now</a>
										</div>
									</div>
									<div class="col-md-4 text-center modal-align">
										<div class="package">
											<p>Do you wish to check your body out for an entire spectrum of diseases in a luxurious ambience?</p>
											<i class="fa fa-user-md"></i>
											<h4>HEALTH CHECK 1 AND 2</h4>
											<a href="book-a-test.jsp">Book Now</a>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
				</div>
			</div>
			<!--- /Book-a-test ---->
		</section>
		<!-- //Book-a-test-section -->
				
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