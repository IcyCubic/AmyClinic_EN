<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head> 
<title>Amy | 首頁</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="fragment/header.jsp" />	
	<!-- //header -->
	<div class="demo-2">	
		<jsp:include page="fragment/slogan.jsp" />
            <div id="slider" class="sl-slider-wrapper">
				<div class="sl-slider">				
					<div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="-25" data-slice2-rotation="-25" data-slice1-scale="2" data-slice2-scale="2">
						<div class="sl-slide-inner">
							<div class="bg-img bg-img-1"></div>
							<h3>A bene placito.</h3>
							<blockquote><p>You have just dined, and however scrupulously the slaughterhouse is concealed in the graceful distance of miles, there is complicity.</p><cite>Ralph Waldo Emerson</cite></blockquote>
						</div>
					</div>
					
					<div class="sl-slide" data-orientation="vertical" data-slice1-rotation="10" data-slice2-rotation="-15" data-slice1-scale="1.5" data-slice2-scale="1.5">
						<div class="sl-slide-inner">
							<div class="bg-img bg-img-2"></div>
							<h3>Regula aurea.</h3>
							<blockquote><p>Until he extends the circle of his compassion to all living things, man will not himself find peace.</p><cite>Albert Schweitzer</cite></blockquote>
						</div>
					</div>
					
					<div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="3" data-slice2-rotation="3" data-slice1-scale="2" data-slice2-scale="1">
						<div class="sl-slide-inner">
							<div class="bg-img bg-img-3"></div>
							<h3>Dum spiro, spero.</h3>
							<blockquote><p>Thousands of people who say they 'love' animals sit down once or twice a day to enjoy the suffering and the terror of the abattoirs.</p><cite>Dame Jane Morris Goodall</cite></blockquote>
						</div>
					</div>
					
					<div class="sl-slide" data-orientation="vertical" data-slice1-rotation="-5" data-slice2-rotation="25" data-slice1-scale="2" data-slice2-scale="1">
						<div class="sl-slide-inner">
							<div class="bg-img bg-img-4"></div>
							<h3>Donna nobis pacem.</h3>
							<blockquote><p>The human body has no more need for cows' milk than it does for dogs' milk, horses' milk, or giraffes' milk.</p><cite>Michael Klaper M.D.</cite></blockquote>
						</div>
					</div>
					
					<div class="sl-slide" data-orientation="horizontal" data-slice1-rotation="-5" data-slice2-rotation="10" data-slice1-scale="2" data-slice2-scale="1">
						<div class="sl-slide-inner">
							<div class="bg-img bg-img-5"></div>
							<h3>Acta Non Verba.</h3>
							<blockquote><p>I think if you want to eat more meat you should kill it yourself and eat it raw so that you are not blinded by the hypocrisy of having it processed for you.</p><cite>Margi Clarke</cite></blockquote>
						</div>
					</div>
				</div><!-- /sl-slider -->

				<nav id="nav-dots" class="nav-dots">
					<span class="nav-dot-current"></span>
					<span></span>
					<span></span>
					<span></span>
					<span></span>
				</nav>

			</div><!-- /slider-wrapper -->

        </div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/web/js/jquery.ba-cond.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/web/js/jquery.slitslider.js"></script>
		<script type="text/javascript">	
			$(function() {			
				var Page = (function() {
					var $nav = $( '#nav-dots > span' ),
						slitslider = $( '#slider' ).slitslider( {
							onBeforeChange : function( slide, pos ) {
								$nav.removeClass( 'nav-dot-current' );
								$nav.eq( pos ).addClass( 'nav-dot-current' );
							}
						} ),
						init = function() {
							initEvents();							
						},
						initEvents = function() {
							$nav.each( function( i ) {							
								$( this ).on( 'click', function( event ) {									
									var $dot = $( this );									
									if( !slitslider.isActive() ) {
										$nav.removeClass( 'nav-dot-current' );
										$dot.addClass( 'nav-dot-current' );									
									}									
									slitslider.jump( i + 1 );
									return false;								
								} );								
							} );
						};
						return { init : init };
				})();
				Page.init();

				/**
				 * Notes: 
				 * 
				 * example how to add items:
				 */

				/*
				
				var $items  = $('<div class="sl-slide sl-slide-color-2" data-orientation="horizontal" data-slice1-rotation="-5" data-slice2-rotation="10" data-slice1-scale="2" data-slice2-scale="1"><div class="sl-slide-inner bg-1"><div class="sl-deco" data-icon="t"></div><h2>some text</h2><blockquote><p>bla bla</p><cite>Margi Clarke</cite></blockquote></div></div>');
				
				// call the plugin's add method
				ss.add($items);

				*/			
			});
		</script>

		<!-- tabs -->	
		<div class="vertical-tabs">
			<div class="container">
				<h3 class="title text-center">美麗見證</h3>
				<p class="text-center">Our results speaks for themselves.</p>
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-8 col-xs-9 bhoechie-tab-container">
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 bhoechie-tab-menu">
						  <div class="list-group">
							<a href="#" class="list-group-item active text-center">
							    雙眼皮
							</a>
							<a href="#" class="list-group-item text-center">
							    隆鼻術
							</a>
							<a href="#" class="list-group-item text-center">
							    波尿酸
							</a>
							<a href="#" class="list-group-item text-center">
							    微針療程
							</a>
							<a href="#" class="list-group-item text-center">
							    雷射淨膚
							</a>
						  </div>
						</div>
						<div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 bhoechie-tab">
							<!-- flight section -->
							<div class="bhoechie-tab-content active">
								<div class="services">
									<div class="ser-img">
										<img src="${pageContext.request.contextPath}/web/images/ser1.jpg" title="service" alt="" />
									</div>
									<div class="ser-info">
										<h3>Contrary to popular belief, Lorem Ipsum is not simply random text</h3>
										<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 
											1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their 
											by English versions from the 1914 translation by H. Rackham.
										</p>
										<p>Sed ut perspiciatis unde omnis iste natus error sit, totam rem aperiam, eaque
										    ipsa quae ab illo inventore dicta sunt explicabo
										</p>
										<a href="${pageContext.request.contextPath}/web/single.jsp">繼續閱讀</a>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<!-- train section -->
							<div class="bhoechie-tab-content">
								<div class="services">
									<div class="ser-img">
										<img src="${pageContext.request.contextPath}/web/images/ser2.jpg" title="service" alt="" />
									</div>
									<div class="ser-info">
										<h3>At vero eos et accusamus et iusto dignissimos ducimus qui blanditiis</h3>
										<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 
											1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their 
											by English versions from the 1914 translation by H. Rackham.
										</p>
										<p>Sed ut perspiciatis unde omnis iste natus error sit, totam rem aperiam, eaque
										    ipsa quae ab illo inventore dicta sunt explicabo
										</p>
										<a href="${pageContext.request.contextPath}/web/single.jsp">繼續閱讀</a>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
				
							<!-- hotel search -->
							<div class="bhoechie-tab-content">
								<div class="services">
									<div class="ser-img">
										<img src="${pageContext.request.contextPath}/web/images/ser3.jpg" title="service" alt="" />
									</div>
									<div class="ser-info">
										<h3>On the other hand, we denounce with righteous indignation</h3>
										<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 
											1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their 
											by English versions from the 1914 translation by H. Rackham.
										</p>
										<p>Sed ut perspiciatis unde omnis iste natus error sit, totam rem aperiam, eaque
										    ipsa quae ab illo inventore dicta sunt explicabo
										</p>
										<a href="${pageContext.request.contextPath}/web/single.jsp">繼續閱讀</a>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="bhoechie-tab-content">
								<div class="services">
									<div class="ser-img">
										<img src="${pageContext.request.contextPath}/web/images/ser4.jpg" title="service" alt="" />
									</div>
									<div class="ser-info">
										<h3>Laboris nisi ut aliquip ex ea commodo consequat</h3>
										<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 
											1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their 
											by English versions from the 1914 translation by H. Rackham.
										</p>
										<p>Sed ut perspiciatis unde omnis iste natus error sit, totam rem aperiam, eaque
										    ipsa quae ab illo inventore dicta sunt explicabo
										</p>
										<a href="${pageContext.request.contextPath}/web/single.jsp">繼續閱讀</a>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="bhoechie-tab-content">
								<div class="services">
									<div class="ser-img">
										<img src="${pageContext.request.contextPath}/web/images/ser5.jpg" title="service" alt="" />
									</div>
									<div class="ser-info">
										<h3>Temporibus autem quibusdam et aut officiis debitis</h3>
										<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 
											1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their 
											by English versions from the 1914 translation by H. Rackham.
										</p>
										<p>Sed ut perspiciatis unde omnis iste natus error sit, totam rem aperiam, eaque
										    ipsa quae ab illo inventore dicta sunt explicabo
										</p>
										<a href="${pageContext.request.contextPath}/web/single.jsp">繼續閱讀</a>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>
			  </div>
			</div>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/web/js/tabs.js"></script>		
		<!-- //tabs -->

		
		<!-- quick links -->
		<div class="news-section" id="news">
			<div class="container">
				<div class="news-section-head text-center">
					<h3 class="title">最新消息</h3>
					<p>Here, there and everywhere... what we've been doing</p>
				</div>
				<div class="news-section-grids">
					<div class="col-md-4 news-section-grid">
						<img src="${pageContext.request.contextPath}/web/images/n1.jpg" alt="" />
						<div class="info">
							<a class="news-title" href="${pageContext.request.contextPath}/web/single.jsp">There are sit amet</a>
							<label>March 18</label>
							<p>The Duchess took her choice, and was gone in a moment. 'Let's go on with the game,' the Queen said to Alice; and Alice was too much frightened to say a word, but slowly followed her back to the croquet-ground.</p>
							<a class="more" href="${pageContext.request.contextPath}/web/single.jsp">繼續閱讀</a>
						</div>
					</div>
					<div class="col-md-4 news-section-grid">
						<img src="${pageContext.request.contextPath}/web/images/n2.jpg" alt="" />
						<div class="info">
							<a class="news-title" href="${pageContext.request.contextPath}/web/single.jsp">Lorem ipsum dolor</a>
							<label>August 28</label>
							<p>The Duchess took her choice, and was gone in a moment. 'Let's go on with the game,' the Queen said to Alice; and Alice was too much frightened to say a word, but slowly followed her back to the croquet-ground.</p>
							<a class="more" href="${pageContext.request.contextPath}/web/single.jsp">繼續閱讀</a>
						</div>
					</div>
					<div class="col-md-4 news-section-grid">
						<img src="${pageContext.request.contextPath}/web/images/n3.jpg" alt="" />
						<div class="info">
						    <a class="news-title" href="${pageContext.request.contextPath}/web/single.jsp">The standard chunk</a>
							<label>September 12</label>
							<p>The Duchess took her choice, and was gone in a moment. 'Let's go on with the game,' the Queen said to Alice; and Alice was too much frightened to say a word, but slowly followed her back to the croquet-ground.</p>
							<a class="more" href="${pageContext.request.contextPath}/web/single.jsp">繼續閱讀</a>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>

		<!-- //quick links -->

		
		
		<!-- Stats -->
		<div class="stats">
			<div class="container">
				<p class="slideanim">Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance.</p>
				<div class="stats-info">
					<div class="col-md-3 col-sm-3 stats-grid slideanim">
						<i class="fa fa-smile-o"></i>
						<div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='18000' data-delay='.5' data-increment="50">18000</div>
						<p class="stats-info">Happy Smiles</p>
					</div>
					<div class="col-md-3 col-sm-3 stats-grid slideanim">
						<i class="fa fa-facebook"></i>
						<div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='1700' data-delay='.5' data-increment="5">1700</div>
						<p class="stats-info">Facebook Likes</p>
					</div>
					<div class="col-md-3 col-sm-3 stats-grid slideanim">
						<i class="fa fa-twitter"></i>
						<div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='21500' data-delay='.5' data-increment="20">21500</div>
						<p class="stats-info">Twitter Followers</p>
					</div>
					<div class="col-md-3 col-sm-3 stats-grid slideanim">
						<i class="fa fa-flask"></i>
						<div class='numscroller numscroller-big-bottom' data-slno='1' data-min='0' data-max='285' data-delay='.5' data-increment="1">285</div>
						<p class="stats-info">Lorem Ipsum</p>
					</div>
					<div class="clearfix"></div>
				</div>

			</div>
		</div>
		<!-- //Stats -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/web/js/numscroller-1.0.js"></script>
		
	
		<!-- environment -->
		<div class="our-news">
		<h3 class="title text-center">診所環境</h3>
		<p class="text-center">Our state of the art facilities combine the best of modern science and art.</p>
			<div id="visual">
				<div class="slide-visual slideanim">
					<!-- Slide Image Area (1000 x 424) -->
					<ul class="slide-group">
						<li><img src="${pageContext.request.contextPath}/web/images/news1.jpg" alt="Dummy Image" class="img-responsive"/></li>
						<li><img src="${pageContext.request.contextPath}/web/images/news2.jpg" alt="Dummy Image" class="img-responsive"/></li>
						<li><img src="${pageContext.request.contextPath}/web/images/news3.jpg" alt="Dummy Image" class="img-responsive"/></li>
						<li><img src="${pageContext.request.contextPath}/web/images/news4.jpg" alt="Dummy Image" class="img-responsive"/></li>
						<li><img src="${pageContext.request.contextPath}/web/images/news5.jpg" alt="Dummy Image" class="img-responsive"/></li>
					</ul>
					<!-- Slide Description Image Area (316 x 328) -->
					<div class="script-wrap">
						<ul class="script-group">
							<li><div class="inner-script"><img src="${pageContext.request.contextPath}/web/images/news1-1.jpg" alt="Dummy Image" class="img-responsive"/></div></li>
							<li><div class="inner-script"><img src="${pageContext.request.contextPath}/web/images/news2-2.jpg" alt="Dummy Image" class="img-responsive"/></div></li>
							<li><div class="inner-script"><img src="${pageContext.request.contextPath}/web/images/news3-3.jpg" alt="Dummy Image" class="img-responsive"/></div></li>
							<li><div class="inner-script"><img src="${pageContext.request.contextPath}/web/images/news4-4.jpg" alt="Dummy Image" class="img-responsive"/></div></li>
							<li><div class="inner-script"><img src="${pageContext.request.contextPath}/web/images/news5-5.jpg" alt="Dummy Image" class="img-responsive"/></div></li>
						</ul>
						<div class="slide-controller">
							<a href="#" class="btn-prev"><img src="${pageContext.request.contextPath}/web/images/btn_prev.png" alt="Prev Slide" /></a>
							<a href="#" class="btn-play"><img src="${pageContext.request.contextPath}/web/images/btn_play.png" alt="Start Slide" /></a>
							<a href="#" class="btn-pause"><img src="${pageContext.request.contextPath}/web/images/btn_pause.png" alt="Pause Slide" /></a>
							<a href="#" class="btn-next"><img src="${pageContext.request.contextPath}/web/images/btn_next.png" alt="Next Slide" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /environment -->

		<!-- doctor 醫療團隊-->
		<div class="banner-bottom">
			<h3 class="title text-center">醫療團隊</h3>
			<p class="text-center">We offer the services of world renowned plastic surgeons.</p>
			<div class="container">
				<div class="col-md-4 timing">
					<div class="opening-hours">
						<h3><i class="fa fa-clock-o"></i>門診時間</h3>
						<ul>
							<li>星期一到星期五</li>
							<li>9:00 AM - 7:00 PM</li>
							<div class="clearfix"></div>
						</ul>
						<ul>
							<li>星期六</li>
							<li>9:00 AM - 7:00 PM</li>
							<div class="clearfix"></div>
						</ul>
						<ul>
							<li>星期日</li>
							<li>公休</li>
							<div class="clearfix"></div>
						</ul>
					</div>
					<div class="help">
						<h3><i class="fa fa-pencil-square-o"></i>需要幫忙？</h3>
						<p>於我們的專家預約，讓我們來回答您的問題!</p>
						<a href="#" class="btn btn-default btn-default_2 pull-left" data-toggle="modal" data-target="#applyModal_1">即刻預約</a>
					</div>
				</div>
				<div class="col-md-4 abt-img">
					<img src="${pageContext.request.contextPath}/web/images/abt1.png" alt="doctor" title="doctor" />
				</div>
				<div class="col-md-4 abt-dec">
					<h2>Ken Jeong</h2>
					<p class="diff">Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>
					<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia</p>
					<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.</p>
					
				</div>
				<div class="clearfix"></div>
			</div>
		</div>		
		<!-- //doctor -->
			
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