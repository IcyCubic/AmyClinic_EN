<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Amy | 帳戶資料</title>
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
#biguserphoto{
	width:150px;
	height:150px;
	border-radius:25px;
	display:inline-block;
	margin:20px;
}
#memberpwd,
#birthday{
	cursor: pointer;
}
#biguserphotobox{
  width: 100%;
  text-align: center;
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
						<h2>會 員 資 料</h2>
						<h6>Member Profile</h6>
					</div>
				</div>
			</div>
			<!--- login ---->
			<!-- login -->
			<div class="login">
				<div class="container">
						<p class="est">${message}</p>
							<div class="login-form-grids">
	
<h3>${memberVO.name}</h3> 

<div id="biguserphotobox">
<c:choose>
	<c:when test="${memberVO.photo != null && memberVO.photo != \"\"}">
		<img id="biguserphoto" alt="user photo" src='${pageContext.request.contextPath}/user_photo/${memberVO.photo}'>
	</c:when>
	<c:otherwise>
		<img id="biguserphoto" alt="user photo" src='${pageContext.request.contextPath}/web/images/anon.jpg'>
	</c:otherwise>
</c:choose>		
</div>

<form role="form" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/member/updateprofile.action">
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberid">Member ID: </label>
		<div class="col-sm-10">
			<input name="memberVO.mid" id="memberid" class="form-control disable" type="text" value="${memberVO.mid}" readonly/>			
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membername">Name: </label>
		<div class="col-sm-10">
			<input name="memberVO.name" id="membername" class="form-control" type="text" value="${memberVO.name}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberpwd">Password: </label>
		<div class="col-sm-10">
			<a href="#" data-toggle="modal" data-target="#applyModal_1">
				<input name="memberVO.pwd" id="memberpwd" class="form-control disable" type="password" value="${memberVO.pwd}" readonly/>
			</a>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberemail">Email: </label>
		<div class="col-sm-10">
			<input name="memberVO.email" id="memberemail" class="form-control" type="text" value="${memberVO.email}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberbirthday">Birthday: </label>
		<div class="col-sm-10">
			<input type="text" name="memberVO.birthday" id="birthday" value="${memberVO.birthday}" readonly>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membercountry">Country: </label>
		<div class="col-sm-10">
			<input name="memberVO.country" id="membercountry" class="form-control" type="text" value="${memberVO.country}"/>
<%-- 			<select name="memberVO.country" id="membercountry">			 --%>
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${memberVO.country eq '台灣'}"> --%>
<!-- 					<option value="台灣" selected >台灣</option> -->
<!-- 			    	<option value="美國">美國</option> -->
<!-- 			    	<option value="日本">日本</option> -->
<!-- 			    	<option value="韓國">韓國</option>	 -->
<%-- 				</c:when> --%>
<%-- 				<c:when test="${memberVO.country eq '美國'}"> --%>
<!-- 					<option value="台灣">台灣</option> -->
<!-- 			    	<option value="美國" selected>美國</option> -->
<!-- 			    	<option value="日本">日本</option> -->
<!-- 			    	<option value="韓國">韓國</option>				 -->
<%-- 				</c:when> --%>
<%-- 				<c:when test="${memberVO.country eq '日本'}"> --%>
<!-- 					<option value="台灣">台灣</option> -->
<!-- 			    	<option value="美國">美國</option> -->
<!-- 			    	<option value="日本" selected>日本</option> -->
<!-- 			    	<option value="韓國">韓國</option>				 -->
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<!-- 					<option value="台灣">台灣</option> -->
<!-- 			    	<option value="美國">美國</option> -->
<!-- 			    	<option value="日本">日本</option> -->
<!-- 			    	<option value="韓國" selected>韓國</option>					 -->
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
<%-- 			</select>	 --%>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membergender">Gender: </label>
		<div class="col-sm-10">
			<input name="memberVO.gender" id="membergender" class="form-control" type="text" value="${memberVO.gender}"/>
<%-- 			<select name="memberVO.gender" id="country" id="membergender"> --%>
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${memberVO.gender ==77}"> --%>
<!-- 					<option value="M" selected>男</option> -->
<!-- 					<option value="F">女</option> -->
<%-- 				</c:when> --%>
<%-- 				<c:otherwise> --%>
<!-- 					<option value="M">男</option> -->
<!-- 					<option value="F" selected>女</option> -->
<%-- 				</c:otherwise> --%>
<%-- 			</c:choose> --%>
<%-- 			</select> --%>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberaddr">Address: </label>
		<div class="col-sm-10">
			<input name="memberVO.addr" id="memberaddr" class="form-control" type="text" value="${memberVO.addr}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberphone">Phone: </label>
		<div class="col-sm-10">
			<input name="memberVO.phone" id="memberphone" class="form-control" type="text" value="${memberVO.phone}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberheight">Height: </label>
		<div class="col-sm-10">
			<input name="memberVO.height" id="memberheight" class="form-control" type="text" value="${memberVO.height}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membermass">Weight: </label>
		<div class="col-sm-10">
			<input name="memberVO.mass" id="membermass" class="form-control" type="text" value="${memberVO.mass}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberact_status">Status: </label>
		<div class="col-sm-10">			
			<input name="memberVO.act_status" id="memberact_status" class="form-control disable" type="text" value="${memberVO.act_status}" readonly />				
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membernum_trans">Transactions: </label>
		<div class="col-sm-10">			
			<input name="memberVO.num_trans" id="membernum_trans" class="form-control disable" type="text" value="${memberVO.num_trans}" readonly />				
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membernum_treatment">Treatments: </label>
		<div class="col-sm-10">
			<input name="memberVO.num_treatment" id="membernum_treatment" class="form-control disable" type="text" value="${memberVO.num_treatment}" readonly />				
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membernum_visits">Visits: </label>
		<div class="col-sm-10">
			<input name="memberVO.num_visits" id="membernum_visits" class="form-control disable" type="text" value="${memberVO.num_visits}" readonly />						
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberreward_pts">Reward Points: </label>
		<div class="col-sm-10">
			<input name="memberVO.reward_pts" id="memberreward_pts" class="form-control disable" type="text" value="${memberVO.reward_pts}" readonly />			
		</div>
	</div>
		<div class="form-group">
		<label class="control-label col-sm-2" for="memberspent_pts">Reward Points Spent: </label>
		<div class="col-sm-10">
			<input name="memberVO.spent_pts" id="memberspent_pts" class="form-control disable" type="text" value="${memberVO.spent_pts}" readonly />			
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberlast_visit">Last Visit: </label>
		<div class="col-sm-10">
			<input name="memberVO.last_visit" id="memberlast_visit" class="form-control disable" type="text" value="${memberVO.last_visit}" readonly />			
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberjoin_date">Date Joined: </label>
		<div class="col-sm-10">
			<input name="memberVO.join_date" id="memberjoin_date" class="form-control disable" type="text" value="${memberVO.join_date}" readonly />			
		</div>
	</div>
	<label class="control-label col-sm-2"></label>
 	<input type="hidden" name="memberVO.verify" value="${memberVO.verify}"> 
 	<input type="hidden" name="memberVO.photo" value="${memberVO.photo}"> 
 	<input type="hidden" name="memberVO.total_spent" value="${memberVO.total_spent}"> 
 	<input type="hidden" name="memberVO.memo" value="${memberVO.memo}"> 
	<button type="submit" class="btn btn-default" >Submit</button>							
	<hr>
</form>
					<div class="modal fade" id="applyModal_1" tabindex="-1"
						role="dialog" aria-labelledby="applyModalLabel" aria-hidden="true">
						<div class="modal-dialog dialog_3">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">
										<div class="head_4">
											<h3>重設您的密碼</h3>
											<p>請輸入您的電子郵件信箱</p>
										</div>
									</h4>
								</div>
								<div class="modal-body">
									<form action="${pageContext.request.contextPath}/free/recoverini.action" method="post" class="register">
										<input type="text" name="memberVO.email" id="recover-email" placeholder="電子信箱 / Email" required> 
										<input type="submit" value="送出">
									</form>
								</div>
							</div>
						</div>
					</div>
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