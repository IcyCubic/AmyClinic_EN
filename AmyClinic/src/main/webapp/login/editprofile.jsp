<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Details</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/colorbox.css">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/General/css/jquery-ui.min.css" rel="stylesheet">
<style>
	.disable{
		border:none;
	}
	
	.ui-datepicker-trigger {
		padding:0px;
		padding-left:5px;
		vertical-align:baseline;
		
		position:relative;
		top:4px;
		height:18px;
		cursor: pointer;
	}
	
	.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
      color: black; 
/*       font-family: ...; */
      font-size: 16px;
      font-weight: bold;
}

	#userphoto{
		border-radius:25px;
	}

</style>
</head>
<body>

<h3>${memberVO.name}</h3> 

<c:choose>
	<c:when test="${memberVO.photo != null}">
		<img src='${pageContext.request.contextPath}/user_photo/${memberVO.photo}' height="150" width="150">
	</c:when>
	<c:otherwise>
		<img src='${pageContext.request.contextPath}/images/logo.jpg' height="150" width="150">
	</c:otherwise>
</c:choose>	
<br>
<br>
<a class='iframe' href="${pageContext.request.contextPath}/login/editphoto.jsp">修改照片</a>

<form role="form" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/member/updateprofile.action">
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberid">會員 ID： </label>
		<div class="col-sm-5">
			<input name="memberVO.mid" id="memberid" class="form-control disable" type="text" value="${memberVO.mid}" readonly/>			
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membername">姓名： </label>
		<div class="col-sm-5">
			<input name="memberVO.name" id="membername" class="form-control" type="text" value="${memberVO.name}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberpwd">密碼： </label>
		<div class="col-sm-5">
			<input name="memberVO.pwd" id="memberpwd" class="form-control disable" type="password" value="${memberVO.pwd}" readonly/>
		</div>
		<div class="col-sm-1">
			<a class="btn btn-default" href="${pageContext.request.contextPath}/login/resetpw.jsp">修改密碼</a>		
		</div>
	</div>
	<br>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberemail">Email： </label>
		<div class="col-sm-5">
			<input name="memberVO.email" id="memberemail" class="form-control" type="text" value="${memberVO.email}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberbirthday">生日： </label>
		<div class="col-sm-5">
			<input name="memberVO.birthday" id="memberbirthday" type="text" value="${memberVO.birthday}" readonly style="width: 50%;" />
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membercountry">國家： </label>
		<div class="col-sm-5">
			<input name="memberVO.country" id="membercountry" class="form-control" type="text" value="${memberVO.country}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membergender">性別： </label>
		<div class="col-sm-5">
			<input name="memberVO.gender" id="membergender" class="form-control" type="text" value="${memberVO.gender}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberaddr">地址： </label>
		<div class="col-sm-5">
			<input name="memberVO.addr" id="memberaddr" class="form-control" type="text" value="${memberVO.addr}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberphone">電話： </label>
		<div class="col-sm-5">
			<input name="memberVO.phone" id="memberphone" class="form-control" type="text" maxlength="10" value="${memberVO.phone}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberheight">身高： </label>
		<div class="col-sm-5">
			<input name="memberVO.height" id="memberheight" class="form-control" type="text" value="${memberVO.height}"/>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membermass">體重： </label>
		<div class="col-sm-5">
			<input name="memberVO.mass" id="membermass" class="form-control" type="text" value="${memberVO.mass}"/>
		</div>
	</div>
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="memberphoto">Photo: </label> -->
<!-- 		<div class="col-sm-5"> -->
<%-- 			<input name="memberVO.photo" id="memberphoto" class="form-control" type="hidden" value="${memberVO.photo}"/> --%>
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="memberact_status">狀態： </label> -->
<!-- 		<div class="col-sm-5"> -->
<%-- 		<c:if test="${memberVO.act_status == 0}">			 --%>
			<input name="memberVO.act_status" id="memberact_status" type="hidden" value="${memberVO.act_status}" />				
<!-- 			<input class="form-control disable" type="text" value="封鎖" readonly />				 -->
<%-- 		</c:if> --%>
<%-- 		<c:if test="${memberVO.act_status == 1}">			 --%>
<%-- 			<input name="memberVO.act_status" id="memberact_status" type="hidden" value="${memberVO.act_status}"/>				 --%>
<!-- 			<input class="form-control disable" type="text" value="正常" readonly />				 -->
<%-- 		</c:if> --%>
<%-- 		<c:if test="${memberVO.act_status == 2}">			 --%>
<%-- 			<input name="memberVO.act_status" id="memberact_status" type="hidden" value="${memberVO.act_status}" />				 --%>
<!-- 			<input class="form-control disable" type="text" value="未驗證Email" readonly />				 -->
<%-- 		</c:if> --%>
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="membernum_trans">交易： </label> -->
<!-- 		<div class="col-sm-5">			 -->
			<input name="memberVO.num_trans" id="membernum_trans" type="hidden" value="${memberVO.num_trans}" />				
<%-- 			<input class="form-control disable" type="text" value="${memberVO.num_trans} 次" readonly />				 --%>
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="membernum_treatment">診療： </label> -->
<!-- 		<div class="col-sm-5"> -->
			<input name="memberVO.num_treatment" id="membernum_treatment" type="hidden" value="${memberVO.num_treatment}" />				
<%-- 			<input class="form-control disable" type="text" value="${memberVO.num_treatment} 次" readonly /> 				 --%>
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="membernum_visits">來訪： </label> -->
<!-- 		<div class="col-sm-5"> -->
			<input name="memberVO.num_visits" id="membernum_visits" type="hidden" value="${memberVO.num_visits}"/>			
<%-- 			<input class="form-control disable" type="text" value="${memberVO.num_visits} 次" readonly />					 --%>
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="memberreward_pts">紅利點數： </label> -->
<!-- 		<div class="col-sm-5"> -->
			<input name="memberVO.reward_pts" id="memberreward_pts" type="hidden" value="${memberVO.reward_pts}"/>	
<%-- 			<input class="form-control disable" type="text" value="${memberVO.reward_pts} 點" readonly />  --%>
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 		<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="memberspent_pts">已消費紅利點數： </label> -->
<!-- 		<div class="col-sm-5"> -->
			<input name="memberVO.spent_pts" id="memberspent_pts" type="hidden" value="${memberVO.spent_pts}" />			
<%-- 			<input class="form-control disable" type="text" value="${memberVO.spent_pts} 點" readonly /> 			 --%>
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="memberlast_visit">上次瀏覽日期： </label> -->
<!-- 		<div class="col-sm-5"> -->
<%-- 			<input name="memberVO.last_visit" id="memberlast_visit" class="form-control disable" type="text" value="${memberVO.last_visit}" readonly />			 --%>
			<input name="memberVO.last_visit" id="memberlast_visit" type="hidden" value="${memberVO.last_visit}" />			
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="memberjoin_date">加入日期： </label> -->
<!-- 		<div class="col-sm-5"> -->
<%-- 			<input name="memberVO.join_date" id="memberjoin_date" class="form-control disable" type="text" value="${memberVO.join_date}" readonly />			 --%>
			<input name="memberVO.join_date" id="memberjoin_date" type="hidden" value="${memberVO.join_date}"/>			
<!-- 		</div> -->
<!-- 	</div> -->
	<label class="control-label col-sm-2"></label>
 	<input type="hidden" name="memberVO.verify" value="${memberVO.verify}"> 
 	<input type="hidden" name="memberVO.photo" value="${memberVO.photo}"> 
<%--  	<input type="hidden" name="memberVO.photoContentType" value="${memberVO.photoContentType}">  --%>
 	<input type="hidden" name="memberVO.total_spent" value="${memberVO.total_spent}"> 
 	<input type="hidden" name="memberVO.memo" value="${memberVO.memo}"> 
	<button type="submit" class="btn btn-default" >修改</button>							
	<hr>
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.colorbox.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<!-- required for .datepicker() -->
<script src="${pageContext.request.contextPath}/General/js/jquery-ui.min.js"></script>  
<script type="text/javascript">
	$(document).ready(function() {		
		$("#memberbirthday").datepicker({ showOn: 'button', buttonImageOnly: true, buttonImage: "${pageContext.request.contextPath}/register/img/Calendar.png"});
// 		var d = new Date();		
// 		var dynamicDate = new Date(d.setFullYear(d.getFullYear() - 13));
// 		$("#memberbirthday").datepicker("setDate", dynamicDate);
	});
</script>

<script>
	var gender = $(".membergender").val()=="M" ?"Male":"Female";
	$(".membergender").text(gender);
	$(".iframe").colorbox({
		iframe:true,
		width:"30%",
		height:"45%",
		overlayClose:false,
		escKey:false
	});
</script>

</body>
</html>
