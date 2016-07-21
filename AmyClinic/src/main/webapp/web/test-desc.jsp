<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Amy | Test Description</title>
</head>
<body>
	<!-- header -->
		<jsp:include page="fragment/header.jsp" />
	<!-- //header -->
		<!-- Test-description-section -->
		<section class="test-menu">
			<div class="inner-banner demo-2 text-center">
				<jsp:include page="fragment/slogan.jsp" />
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>Test-Description</h2>
						<h6>add a short description here</h6>
					</div>
				</div>
			</div>
			<!--- Test-description ---->
			<div class="test-desc">
				<div class="container">
					<h3>Test Description</h3>
					<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. </p>
					<table>
					  <tr>
						<th>Test</th>
						<td>Hematology</td>	
					  </tr>
					  <tr>
						<th>Units</th>
						<td>VDSFG</td>			
					  </tr>
					  <tr>
						<th>Technology</th>
						<td>G.J.R.D.G</td>			
					  </tr>
					  <tr>
						<th>Internet tend</th>
						<td>1ML</td>			
					  </tr>
					  <tr>
						<th>Generate</th>
						<td>Serum</td>			
					  </tr>
					  <tr>
						<th>Standard</th>
						<td>0.5s - 1.8s</td>			
					  </tr>
					  <tr>
						<th>Reproduced</th>
						<td>Lorem</td>			
					  </tr>
					</table>
					<div class="clinic-significant">
						<h3>Clinical Significance</h3>
						<ol start="1">
							<li>Lorem Ipsum is simply dummy text of a more-or-less normal distribution of letters, as opposed  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</li>
							<li>Sed ut perspiciatis unde omnis iste inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores</li>
							<li>Lorem Ipsum is simply dummy text of the more-or-less normal distribution of letters, as opposed  Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</li>
						</ol>
						<h6>CLINICAL APPLICATION</h6>
					<p>It is a long established fact readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
						<p>Contrary to popular belief a going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. </p>
						<p> Richard McClintock, a Latin professor at Hampden classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance</p>
						<h6>Elevated</h6>
						<p>If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary</p>
						<p>first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour</p>
						<h6>Hyperthyroidism due to</h6>
						<p>Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
						<p>Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum"</p>
						<p>This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>
						<h6>Availability</h6>
						<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
						
					</div>
				</div>
			</div>
			<!--- /Test-description ---->
		</section>
		<!-- //Test-description-section -->
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