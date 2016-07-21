<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<!-- favicon -->
<%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/web/images/favicon.ico" type="image/x-icon"> --%>
<%-- <link rel="icon" href="${pageContext.request.contextPath}/web/images/favicon.ico" type="image/x-icon"> --%>
<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/web/js/jquery.min.js"></script>
<!-- js -->
<script src="${pageContext.request.contextPath}/web/js/jquery-ui.js"></script>
<link href="${pageContext.request.contextPath}/web/css/jquery-ui.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/web/css/pignose.layerslider.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/web/css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<link href="${pageContext.request.contextPath}/web/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/web/css/gallery.css" rel="stylesheet" type="text/css" media="all" /> <!-- gallery css -->
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Prevention Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<!--fonts-->
<link href='//fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!--//fonts-->	

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.request.contextPath}/web/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/web/js/modernizr.custom.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/custom.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/web/js/modernizr.custom.79639.js"></script>		
		<!-- js for news -->
		<script src="${pageContext.request.contextPath}/web/js/jquery.easing.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/web/js/pignose.layerslider.js"></script>
		<script type="text/javascript">
			//<![CDATA[
				$(window).load(function() {
					$('#visual').pignoseLayerSlider({
						play    : '.btn-play',
						pause   : '.btn-pause',
						next    : '.btn-next',
						prev    : '.btn-prev'
					});
				});
			//]]>
			</script>
		<!-- /js for news -->
		
		<!-- for smooth scrolling -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/web/js/move-top.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/web/js/easing.js"></script>
		<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
		</script>
		<!-- //for smooth scrolling -->
		  <!-- for easy-responsive-tabs -->	  
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/web/css/easy-responsive-tabs.css " />
		<script src="${pageContext.request.contextPath}/web/js/easyResponsiveTabs.js"></script>
		<script type="text/javascript">
    $(document).ready(function() {
        //Horizontal Tab
        $('#parentHorizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function(event) { // Callback function if tab is switched 
                var $tab = $(this);
                var $info = $('#nested-tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });

        // Child Tab
        $('#ChildVerticalTab_1').easyResponsiveTabs({
            type: 'vertical',
            width: 'auto',
            fit: true,
            tabidentify: 'ver_1', // The tab groups identifier
            activetab_bg: '#fff', // background color for active tabs in this group
            inactive_bg: '#F5F5F5', // background color for inactive tabs in this group
            active_border_color: '#c1c1c1', // border color for active tabs heads in this group
            active_content_border_color: '#5AB1D0' // border color for active tabs contect in this group so that it matches the tab head border
        });

        //Vertical Tab
        $('#parentVerticalTab').easyResponsiveTabs({
            type: 'vertical', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            closed: 'accordion', // Start closed if in accordion view
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function(event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo2');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
    });
</script>
	<!-- //for easy-responsive-tabs -->
</head>

	<!-- header -->
	<div class="top-strip">
		<div class="container-fluid">
			<div class="social-icons"></div> <!-- Left spacer -->
			<div class="contact-info">
				<a class="current_page" href="${pageContext.request.contextPath}/web/index.jsp">
					<img src="${pageContext.request.contextPath}/web/images/icon.png" alt="icon">
				</a>
			</div>					
			<div class="selectpackage">
				<jsp:include page="loginbox.jsp" />
			</div>
			<div class="clearfix"></div>	
		</div>
	</div>
	
	<nav class="navbar nav_bottom" role="navigation">
	 <div class="container">
	 <!-- Brand and toggle get grouped for better mobile display -->
	   <div class="navbar-header nav_2">
		  <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">Menu
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		  <a class="navbar-brand" href="#"></a>
	   </div> 
	   <!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
			<ul class="nav navbar-nav nav_1">
				<li><a class="current_page" href="${pageContext.request.contextPath}/web/index.jsp">愛美首頁</a></li>				
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">美麗見證<span class="caret"></span></a>
				  <ul class="dropdown-menu drop_menu" role="menu">
					<li><a href="${pageContext.request.contextPath}/web/laboratory.jsp">About Lab</a></li>
					<li><a href="${pageContext.request.contextPath}/web/quality.jsp">Quality</a></li>
					<li><a href="${pageContext.request.contextPath}/web/technologies.jsp">Technologies</a></li>
					<li><a href="${pageContext.request.contextPath}/web/instruments.jsp">Instruments</a></li>
				  </ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">醫美新知<span class="caret"></span></a>
				  <ul class="dropdown-menu drop_menu" role="menu">
					<li><a href="${pageContext.request.contextPath}/web/book-a-test.jsp">Book a Test</a></li>
					<li><a href="${pageContext.request.contextPath}/web/test-list.jsp">Test Menu</a></li>
				  </ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">服務療程<span class="caret"></span></a>
				  <ul class="dropdown-menu drop_menu" role="menu">
					<li><a href="${pageContext.request.contextPath}/web/news.jsp">News</a></li>
					<li><a href="${pageContext.request.contextPath}/web/faq.jsp">Faq</a></li>
					<li><a href="${pageContext.request.contextPath}/web/mobile-app.jsp">App</a></li>
					<li><a href="${pageContext.request.contextPath}/web/login.jsp">Login</a></li>
					<li><a href="${pageContext.request.contextPath}/web/terms.jsp">Terms of Use</a></li>
					<li><a href="${pageContext.request.contextPath}/web/shortcodes.jsp">Shortcodes</a></li>
					<li><a href="${pageContext.request.contextPath}/web/privacy_policy.jsp">Privacy Policy</a></li>
				  </ul>
				</li>				
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">線上購物<span class="caret"></span></a>
				  <ul class="dropdown-menu drop_menu" role="menu">
					<li><a href="${pageContext.request.contextPath}/web/career.jsp">Careers</a></li>
					<li><a href="${pageContext.request.contextPath}/web/404.jsp">Franchisee</a></li>
				  </ul>
				</li>
				<li><a href="${pageContext.request.contextPath}/web/about.jsp">關於愛美</a></li>
				<li><a href="${pageContext.request.contextPath}/web/blog.jsp">會員專區</a></li>
				<li><a href="${pageContext.request.contextPath}/web/contact.jsp">聯絡愛美</a></li>
			</ul>
		 </div><!-- /.navbar-collapse -->
	   </div>
	</nav>
	<!-- //header -->
	<jsp:include page="mySpace.jsp" />