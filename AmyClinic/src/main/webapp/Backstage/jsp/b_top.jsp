<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"  pageEncoding="UTF-8"  errorPage="" %>
<!DOCTYPE html >
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>☆AMY診所管理系統☆</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.css" rel="stylesheet">

<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<!-- Bootstrap Core CSS -->
<link href="<%=request.getContextPath()%>/css/sb-admin.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/css/plugins/morris.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link href="<%=request.getContextPath()%>/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- Custom Fonts -->
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script>
$(function(){
	var msg = $("#msg").val();
	if(msg !='') {
		alert($("#msg").val());
	}
})
</script>      
<!-- fileinput CSS -->
<link href="<%=request.getContextPath()%>/css/fileinput.css" rel="stylesheet" >
<!-- jQuery -->
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=request.getContextPath()%>/js/plugins/morris/raphael.min.js"></script>
<script>
$(window).load(function() {
	var s1 ={'color':'#000000','background-color':'#fff',};
	var s2 ={'color':'#4F4F4F','background-color':'#F2EBE4',};
	$('tr').css(s1).mouseover(function(){$(this).css(s2)}).mouseout(function(){$(this).css(s1)});	
        });
</script>

  
<!-- Morris Charts JavaScript -->
<%-- <script src="<%=request.getContextPath()%>/Backstage/js/plugins/morris/morris.min.js"></script> --%>
<%-- <script src="<%=request.getContextPath()%>/Backstage/js/plugins/morris/morris-data.js"></script> --%>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.15.0/jquery.validate.min.js" type="text/javascript"></script> -->

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/notosanstc.css);
@font-face { font-family: 'Noto Sans TC', sans-serif;}
.bg {
	position: fixed;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	z-index: -999;
	background-color: #fff;
}
.bg img {
	min-height: 100%;
	width: 100%;
}
table {align: center;}
th{background-color:#BFB2AB;}
/* 側邊 */
.side-nav{
/* background-color:#006030; */
}
/* 上面 */
.navbar-fixed-top{
background-color:#FF8000;
}
/* 導航 */
.navbar-ex1-collapse{
/* background-color:#006030; */
}
em{  color:red; }
#wrapper{
font-family: 'Noto Sans TC'; 
font-size:18px;
}
#loading {
    position:absolute;
    width:300px;
    top:250px;
    left:50%;
    margin-left:-150px;
    text-align:center;
    padding: 10px;
    font:bold 30px Arial, Helvetica, sans-serif;
}
</style>

</head>
<body>
	<!--top Navigation 導航-->				<input type="hidden"  id="msg"  value="${msg.msg}">
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"	data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp" ><font color="#fff">☆-Amy醫美診所-☆</font></a>
	</div>
	<!-- Top Menu Items -->
	<ul class="nav navbar-right top-nav">
	<li><a href="<%=request.getContextPath()%>/Backstage/Chatback.jsp" ><i class="fa fa-fw fa-phone-square"></i><font color="#fff">客服系統</font></a></li>
<!-- 		<li class="dropdown"> -->
<!-- 		<a href="#" class="dropdown-toggle"	data-toggle="dropdown"> -->
<!-- 		<i class="fa fa-envelope"></i> -->
<!-- 		 <b	class="caret"></b> -->
<!-- 		 </a> -->
<!-- 			<ul class="dropdown-menu message-dropdown"> -->
<!-- 				<li class="message-preview"><a href="#"> -->
<!-- 						<div class="media"> -->
<!-- 							<span class="pull-left"> <img class="media-object" -->
<!-- 								width="50px" -->
<!-- 								src="http://2.blog.xuite.net/2/5/0/b/22959614/blog_1733140/txt/35316357/0.jpg" -->
<!-- 								alt="">                                         訊息圖 -->
<!-- 							</span> -->
<!-- 							<div class="media-body"> -->
<!-- 								<h5 class="media-heading"> -->
<!-- 									<strong>涼麵趁熱吃</strong> -->
<!-- 								</h5> -->
<!-- 								                                        簡訊名 -->
<!-- 								<p class="small text-muted"> -->
<!-- 									<i class="fa fa-clock-o"></i> 昨天 at 4:32 PM -->
<!-- 								</p> -->
<!-- 								<p>你跨年有空嗎？......有..........那我跟你換班</p> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 				</a></li> -->
<!-- 				<li class="message-preview"><a href="#"> -->
<!-- 						<div class="media"> -->
<!-- 							<span class="pull-left"> <img class="media-object" -->
<!-- 								width="50px" -->
<!-- 								src="http://ext.pimg.tw/yysky/1396003820-231168804.jpg" alt=""> -->
<!-- 							</span> -->
<!-- 							<div class="media-body"> -->
<!-- 								<h5 class="media-heading"> -->
<!-- 									<strong>鈴兒兔</strong> -->
<!-- 								</h5> -->
<!-- 								<p class="small text-muted"> -->
<!-- 									<i class="fa fa-clock-o"></i> 昨天 at 14:25 PM -->
<!-- 								</p> -->
<!-- 								<p>你跨年有空嗎？......有..........那我跟你換班</p> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 				</a></li> -->
<!-- 				<li class="message-footer"><a href="#">訊息管理</a></li> -->
<!-- 			</ul></li> -->
<!-- 		<!--                                         訊息區over --> 
<!-- 		<!--                                         通知區--> 
<!-- 		<li class="dropdown"><a href="#" class="dropdown-toggle"	data-toggle="dropdown"><i class="fa fa-bell"></i>  -->
<!-- 		<b	class="caret"></b></a> -->
<!-- 			<ul class="dropdown-menu alert-dropdown"> -->
<!-- 				<li><a href="#">您的帳號已鎖定<span class="label label-default">0</span></a></li> -->
<!-- 				<li><a href="#">您的帳號已開通<span class="label label-primary">1</span></a></li> -->
<!-- 				<li><a href="#">您的帳號已鎖定<span class="label label-success">0</span></a></li> -->
<!-- 				<li><a href="#">您的帳號已開通<span class="label label-info">1</span></a></li> -->
<!-- 				<li><a href="#">您的帳號已鎖定<span class="label label-warning">0</span></a></li> -->
<!-- 				<li><a href="#">您的帳號已開通<span class="label label-danger">1</span></a></li> -->
<!-- 				<li class="divider"></li> -->
<!-- 				<li><a href="#">查看所有通知</a></li> -->

		<!--                                         通知區over-->
		
		<li class="dropdown">
		<a href="#" class="dropdown-toggle"	data-toggle="dropdown"><i class="fa fa-user">

		</i><font color="#fff" id="empname">  ${empVO.name}</font><b class="caret"></b></a>

			<ul class="dropdown-menu">
				<li><a href="#"><i class="fa fa-fw fa-user"></i>我的帳戶</a></li>
<!-- 				<li><a href="#"><i class="fa fa-fw fa-envelope"></i>訊息管理</a></li> -->
<!-- 				<li><a href="#"><i class="fa fa-fw fa-gear"></i>喜好設定</a></li> -->
				<li class="divider"></li>

				<li><a href="<%=request.getContextPath()%>/empLogin/EmpLoginServlet.do?action=logout"><i class="fa fa-fw fa-power-off"></i><b>登出!</b></a></li>

			</ul></li>
			
		<img class="img-circle" width="35px"src="${pageContext.request.contextPath}/ShowEmpPic.servlet?num=${empVO.eid}" />
		
	</ul>
	<!--  topover--><!--  topover--><!--  topover--><!--  topover--><!--  topover-->
	<!-- 側邊欄功能表項目-對應導航功能表 -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav side-nav">
			<li class="active"><a href="<%=request.getContextPath()%>/Backstage/b_login.jsp"><i 	class="fa fa-fw fa-refresh"></i>管理系統</a></li>
			
			<li><a href="<%=request.getContextPath()%>/emp/GetAllEMP.jsp"><i class="fa fa-fw fa-users"></i>員工管理</a></li>
			<li><a href="<%=request.getContextPath()%>/schedule/main_datatable.jsp"><i class="fa fa-fw fa-edit"></i>醫師排班</a></li>
			<li><a href="<%=request.getContextPath()%>/appBack/get_all_app.jsp"><i class="fa fa-fw fa-table"></i>預約系統</a></li>
			
<%-- 			<li><a href="<%=request.getContextPath()%>/Backstage/Chatback.jsp"><i class="fa fa-fw fa-phone-square"></i>客服系統</a></li> --%>
			<li><a href="<%=request.getContextPath()%>/Backstage/backgroundScore.jsp"><i class="fa fa-fw fa-thumbs-o-up"></i>留言管理</a></li>
			
			<li><a href="<%=request.getContextPath()%>/Backstage/product.jsp"><i class="fa fa-fw fa-shopping-cart"></i>商品管理</a></li>
			<li><a href="<%=request.getContextPath()%>/Backstage/orders.jsp"><i class="fa fa-fw fa-credit-card"></i>訂單管理</a></li>
			<li><a href="<%=request.getContextPath()%>/Backstage/procedures.jsp"><i class="fa fa-fw fa-plus-square"></i>療程管理</a></li>
			<li><a href="<%=request.getContextPath()%>/Backstage/members.jsp"><i class="fa fa-fw fa-newspaper-o"></i>會員管理</a></li>
					
			<li>
			<a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-bar-chart-o"></i>熱銷項目<i class="fa fa-fw fa-caret-down"></i></a>
				<ul id="demo" class="collapse">
					<li>
					<a href="<%=request.getContextPath()%>/Backstage/hotProduct.jsp" >熱銷商品</a>
					</li>
					<li>
					<a href="<%=request.getContextPath()%>/Backstage/hotProc.jsp">熱銷療程</a>
					</li>
				</ul>
		  </li>
	</ul><!-- 			nav navbar-nav side-nav -->
	</div>
	</nav>
<!-- 				<FORM METHOD="post" ACTION="ScoreServlet"> -->
<!-- 			     <input type="hidden" name="action"	value="hotProduct"> -->
<!-- 			    </FORM> -->
<!-- 			<li><a href="#"><i class="fa fa-fw fa-dashboard"></i> RTL	Dashboard</a></li> -->
	
	<!-- /.navbar-collapse -->
	<div class="bg">
<%-- 		<img src="<%=request.getContextPath()%>/images/b_01.jpg"> --%>
	</div>
	
	<div id="loading">
    									讀取中.........<img src="<%=request.getContextPath()%>/images/loader.gif" />
							</div>
<script type="text/javascript">
										$(window).load(function(){
										$("#loading").hide();
										})
										today = new Date(); 
// ===================say hello========================
hours = today.getHours();

if (hours<12) 
    {$('#empname').prepend("早安") }

else {
    if ((hours >= 12) && (hours <= 18))
       {$('#empname').prepend("午安")}
    else {$('#empname').prepend('晚安')} 
}
</script>
</body>
</html>
