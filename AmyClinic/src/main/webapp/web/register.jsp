<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Amy | 會員註冊</title>
<style>
.ui-datepicker-month,
.ui-datepicker-year {
   color: #3f3731 !important;
 }
.login-form-grids form select {
	font-size: 14px;
    display: block;
    padding: 10px 15px 10px 15px;
    margin-bottom: 20px !important;
    border: 1px solid #BFB3AA;
    font-weight: 600;
    outline: none;
    letter-spacing: 2px;
    color: #000;
    transition: 0.5s all;
    -webkit-transition: 0.5s all;
    -moz-transition: 0.5s all;
    -o-transition: 0.5s all;
    -ms-transition: 0.5s all;
	width:100%;	
}

#uploadbtn {
    color: #fff;
    font-size: 14px;
    background: #BFB3AA;
    padding: 8px 16px;
    text-decoration: none;
    font-weight: 600;
    letter-spacing: 1px;
    border: 2px solid #BFB3AA;
}
#uploadbtn:hover {
    color: #263D48;
    border: 2px solid #BFB3AA;
    background: #fff;
}
#imgPreview{
	width:150px; 
	height:150px;
	overflow:hidden; 
	border:1px solid black;"
	display:inline;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="fragment/header.jsp" />
	<!-- //header -->
		<!-- login-section -->
		<section class="login-page">
			<div class="inner-banner demo-2 text-center">
				<jsp:include page="fragment/slogan.jsp" />
				<div id="breadcrumb_wrapper">
					<div class="container">		
						<h2>註冊會員</h2>
						<h6>Registeration is required to make appointments and purchases!</h6>
					</div>
				</div>
			</div>
			<!--- login ---->
			<!-- login -->
			<div class="login">
				<div class="container">
					<h3>註冊表格</h3>
						<p class="est">Thank you for taking the time to register your information with Amy! We promise to never sell or share your personal information with anyone else!</p>
							<div class="login-form-grids">
									<h5>必要知訊 / required information</h5>
								<form action="${pageContext.request.contextPath}/logreg/register.action" method="post" enctype="multipart/form-data">
									<input type="text" name="memberVO.name" placeholder="姓名" required id="username" >								
									<input type="password" name="memberVO.pwd" placeholder="密碼" required id="password" >																	
<!-- 									<input type="password" name="" placeholder="確認密碼" required >								 -->
									<input type="email" name="memberVO.email" placeholder="電子信箱" required id="email" >								

									<h6>可選知訊 / optional information</h6>																	
									
									<input type="text" name="memberVO.birthday" placeholder="出生日期" id="birthday" readonly>								
									<select name="memberVO.country" id="country">
									  <option value="Unspecified">選擇國籍</option>
									  <option value="台灣">台灣</option>
									  <option value="美國">美國</option>
									  <option value="日本">日本</option>
									  <option value="韓國">韓國</option>
									</select>								
									<select name="memberVO.gender" id="country" id="gender">
									  <option value="?">選擇性別</option>
									  <option value="M">男</option>
									  <option value="F">女</option>
									</select>								
									<input type="text" name="memberVO.addr" placeholder="用戶地址" id="address" >								
									<input type="text" name="memberVO.phone" placeholder="電話號碼" id="phone" >								
									<input type="text" name="memberVO.height" placeholder="身高 (公分)" id="height" >								
									<input type="text" name="memberVO.mass" placeholder="體重 (公斤)" id="weigt" >								
<!-- working code -->
									<div>
										<label id="uploadbtn" for="uploader"><span>上傳我的照片</span></label>										
										<s:file	name="fileUpload" size="40" id="uploader" onchange="PreviewImage(this)" style="visibility:hidden;"  />
									</div>
									<s:div id="imgPreview">
										<img src='${pageContext.request.contextPath}/web/images/imgplaceholder.jpg'  width='150' height='150'/>
									</s:div>
<!-- /working code -->

<!-- 									<div class="register-check-box"> -->
<!-- 										<div class="check"> -->
<!-- 											<label class="checkbox"><input type="checkbox" name="checkbox"><i> </i>I accept the terms and conditions</label> -->
<!-- 										</div> -->
<!-- 									</div> -->
									<input type="submit" value="建立帳號">
								</form>
							</div>
						</div>
					</div>
				<!-- //login -->
			<!--- /login ---->
		</section>
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
<script> /* Image upload preview JS*/
function PreviewImage(imgFile) {

	var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;
	if (!pattern.test(imgFile.value)) {
		alert("Invalid Format");
		imgFile.focus();
	} else {
		var path;
		if (document.all) { 
			imgFile.select();
			imgFile.blur();
			path = document.selection.createRange().text;
			document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='crop',src=\""+ path + "\")";// �o��
		} else { 
			path = URL.createObjectURL(imgFile.files[0]);
			document.getElementById("imgPreview").innerHTML = "<img src='"+ path +"'  width='150' height='150'/>";
		}
	}
}
</script>		
<script> /* Datepicker settings*/

jQuery(function($) {
	  $('input.datetimepicker').datepicker({
	    duration: '',
	    changeMonth: true,
	    changeYear: true,
	    yearRange: '1950:2016',
	    showTime: false,
	    time24h: false
	  });

	$.datepicker.regional[ "zh-TW" ] = {
		closeText: "關閉",
		prevText: "&#x3C;上月",
		nextText: "下月&#x3E;",
		currentText: "今天",
		monthNames: [ "一月","二月","三月","四月","五月","六月",
		"七月","八月","九月","十月","十一月","十二月" ],
		monthNamesShort: [ "一月","二月","三月","四月","五月","六月",
		"七月","八月","九月","十月","十一月","十二月" ],
		dayNames: [ "星期日","星期一","星期二","星期三","星期四","星期五","星期六" ],
		dayNamesShort: [ "周日","周一","周二","周三","周四","周五","周六" ],
		dayNamesMin: [ "日","一","二","三","四","五","六" ],
		weekHeader: "周",
		dateFormat: "yy-mm-dd",
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: true,
		yearSuffix: "年" };
	$.datepicker.setDefaults( $.datepicker.regional[ "zh-TW" ] );
	});

/* ----------------------------------- */
	$(document).ready(function() {    
		var d = new Date();		
		var dynamicDate = new Date(d.setFullYear(d.getFullYear() - 22));	
		$("#birthday").datepicker("setDate", dynamicDate);
		$('#birthday').datepicker({
		    changeMonth: true,
		    changeYear: true,
	      });
	}); 
</script>
<script>
	$(function() {
		$("input").attr("autocomplete", "off");
	});
</script>
		
<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>