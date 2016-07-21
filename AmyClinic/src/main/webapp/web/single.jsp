<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Amy | Single</title>

</head>
<body>
	<!-- header -->
	<jsp:include page="fragment/header.jsp" />
	<!-- //header -->
		<!-- blog-section -->
		<section class="blog-single-post">
			<div class="inner-banner demo-2 text-center">
				<jsp:include page="fragment/slogan.jsp" />
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>Blog-post</h2>
						<h6>add a short description here</h6>
					</div>
				</div>
			</div>
			<!--- blog ---->
			<div class="blog">
				<div class="container">
					<div class="single">		
				<div class="single-top">
					<img  src="images/single-post-img.jpg" alt=""/>
				</div>
				<div class="top-single">
				<h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
					<div class="grid-single">
						<div class="single-one"><span><i class="fa fa-calendar"></i>12/03/2014 </div></li>
						<div class="single-one"><span><a href="#"><i class="fa fa-comment"></i>20l</a></span></div>
						<div class="single-one"><span><i class="fa fa-heart"></i>400</span></div>
						<div class="clearfix"> </div>
					</div>
					<p class="eget"><b>Duis dapibus aliquam mi,</b> eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur vitae velit in neque dictum blandit. <b>Proin in iaculis neque.</b> Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p> 
			<p class="eget">Duis dapibus aliquam mi, eget euismod sem scelerisque ut. <b>Vivamus at elit quis urna adipiscing iaculis.</b> Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>

			<p class="eget">Duis dapibus aliquam mi, eget euismod sem scelerisque ut. Vivamus at elit quis urna adipiscing iaculis. Curabitur <b>vitae velit in neque dictum blandit.</b> Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur vitae velit in neque dictum blandit. Proin in iaculis neque. Pellentesque habitant morbi tristique senectus et netus <b>et malesuada fames ac turpis egestas.</b> </p>
						
					<ul class="share">
						<li>share :</li>
						<li>							
							<div id="fb-root"></div>
							<script>(function(d, s, id) {
							  var js, fjs = d.getElementsByTagName(s)[0];
							  if (d.getElementById(id)) return;
							  js = d.createElement(s); js.id = id;
							  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.0";
							  fjs.parentNode.insertBefore(js, fjs);
							}(document, 'script', 'facebook-jssdk'));</script>
	   						
	   						<div class="fb-like" data-href="https://www.facebook.com/w3layouts" data-layout="button_count" data-action="like" data-show-faces="true" data-share="false"></div></li>
						<li><a href="https://twitter.com/w3layouts" class="twitter-share-button" data-dnt="true">Tweet</a>
						<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script></li>
					</ul>
						<div class="top-comments">
						<h3>10 Comments</h3>
						<div class="met">
							<div class="code-in">
								<p class="smith"><a href="#">Robert Smith</a> <span>05 march 2016, 15:20</span></p>
								<p class="reply"><a href="#"><i class="fa fa-reply"></i>REPLY</a></p>
								<div class="clearfix"> </div>
							</div>
							<div class="comments-top-top">
								<div class="men" >
									<img   src="images/men.png" alt=""> 
								</div>					
									<p class="men-it">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.The point of using Lorem Ipsum is that it has a more-or-less </p>
								<div class="clearfix"> </div>
							</div>
						</div>
						<div class="met met-in">
							<div class="code-in">
								<p class="smith"><a href="#">Robert Smith</a> <span>02 april 2016, 15:20</span></p>
								<div class="clearfix"> </div>
							</div>
							<div class="comments-top-top top-in">
								<div class="men" >
									<img   src="images/men.png" alt=""> 
								</div>					
									<p class="men-it">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.The point of using Lorem Ipsum is that it has a more-or-less </p>
								<div class="clearfix"> </div>
							</div>
						</div>
						<div class="met">
							<div class="code-in">
								<p class="smith"><a href="#">Robert Smith</a> <span>18 may 2016, 15:20</span></p>
								<p class="reply"><a href="#"><i class="fa fa-reply"></i>REPLY</a></p>
								<div class="clearfix"> </div>
							</div>
							<div class="comments-top-top">
								<div class="men" >
									<img   src="images/men.png" alt=""> 
								</div>					
									<p class="men-it">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.The point of using Lorem Ipsum is that it has a more-or-less </p>
								<div class="clearfix"> </div>
							</div>
						</div>
					</div>
					<div class="leave">
						<h3>Leave a comment</h3>
							<form>
								<div class="single-grid">
									<div class="col-md-6 single-us">
										<input type="text" placeholder="Name" onfocus="this.value='';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
									</div>
									<div class="col-md-6 single-us">
										<input type="text" placeholder="E-mail" onfocus="this.value='';" onblur="if (this.value == '') {this.value = 'E-mail';}" required="">
									</div>
									<div class="clearfix"> </div>
								</div>
								<div class="single-grid">
									<div class="col-md-6 single-us">
										<input type="text" placeholder="Web site" onfocus="this.value='';" onblur="if (this.value == '') {this.value = 'Web site';}" required="">
									</div>
									<div class="col-md-6 single-us">
										<input type="text" placeholder="Job" onfocus="this.value='';" onblur="if (this.value == '') {this.value = 'Job';}" required="">
									</div>
									<div class="clearfix"> </div>
								</div>
								<div class="text-top">
									<div class="col-md-8 text-in">
										<textarea  placeholder="Comment" onfocus="this.value='';" onblur="if (this.value == '') {this.value = 'Comment';}" required="">Comment</textarea>
									</div>
									<div class="col-md-4 text-in">
										<input type="submit" value="SEND" >
									</div>
									<div class="clearfix"> </div>
								</div>
							</form>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mattis semper nisl, vitae malesuada massa egestas a. Vestibulum vestibulum urna sapien, eu bibendum magna ornare non.</p>
							</div>
						</div>			
					</div>
					</div>
					</div>
				</div>
			</div>
			<!--- /blog ---->
		</section>
		<!-- //blog-section -->
		<!-- //login-section -->
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