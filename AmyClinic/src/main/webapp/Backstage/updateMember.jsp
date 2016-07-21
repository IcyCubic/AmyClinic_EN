<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="group3.henry.login.model.*"%>
<%@page import="java.util.List"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%-- <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"> --%>
<%-- <link href="${pageContext.request.contextPath}/General/css/jquery-ui.min.css" rel="stylesheet"> --%>
<style>
	
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
       color: black;  font-size: 16px;  font-weight: bold;
/*        font-family: ...;  */
/* 	#userphoto{	border-radius:25px;}  */
       } 
</style>

</head>
<body>
<%
  MemberVO memberVO= (MemberVO) request.getAttribute("memberVO");
  MemberServices memberSer = new MemberServices();
  List<MemberVO> list = memberSer.getAll();
  pageContext.setAttribute("list",list);
 %>
    <div id="wrapper"><!-- all -->
<jsp:include page="jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->
<div id="page-wrapper" style=background-color:#000000  >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
<!--                 <div class="page-header" > -->
<!--  <marquee  onMouseOver="this.stop()" onMouseOut="this.start()" bgcolor="#ADADAD" direction="right" height="20" scrollamount="8" behavior="alternate">本月目標<font color="red">30億</font></marquee>                                            -->
<!--                 </div> -->
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="#BFB2AB" style="text-align: center;" id="add">會員資料維護</font></li></ol>
                    <script>
                 $( '#add' ).click(function( event ) {
                	 $("#membername").val('畢業的會員');
                 });
                 </script>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over -->     
<!--         開始 -->
<!--  1 -->
<div class="container">
        <div class="row centered-form">
<!--         <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4"> -->
        	<div class="panel panel-default">
        		<div class="panel-heading">
			 			</div>
			 			<div class="panel-body">
			    		<form role="form" class="form" method="post" action="MemberServletTest">
			    		
			    			<div class="row">
			    			
			    				<div class="col-xs-2 col-sm-2 col-md-2">
			    					<div class="form-group">							<label >編號</label>
			                <input type="text" name="mid" id="mid" class="form-control form-control-sm" value="${memberVO.mid}" readonly />
			    					</div>
			    				</div>
			    				
			    				
			    				
			    				<div class="col-xs-4 col-sm-4 col-md-4">
			    					<div class="form-group">							<label >姓名</label><em>(必填)</em>
			    						<input name="name" id="membername" class="form-control form-control-sm" type="text" value="${memberVO.name}" />
			    					</div>
			    				</div>
			    				
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">							<label >密碼</label><em>(必填)</em>
			    						<input name="pwd" id="memberpwd" class="form-control form-control-sm" type="password" value="${memberVO.pwd}" readonly />
			    					</div>
			    				</div>
			    				
			    			</div><!-- <row> -->

			    			<div class="row"><!-- <row> -->
			    			
			    			<div class="col-xs-2 col-sm-2 col-md-2">	
			    					<div class="form-group">								<label >生日</label>
			    						<input name="birthday" id="memberbirthday" type="text"  class="form-control form-control-sm" value="${memberVO.birthday}" readonly />
			    					</div>
			    				</div>
			    			<div class="col-xs-2 col-sm-2 col-md-2">
			    					<div class="form-group">							<label >狀態</label>
			                				<select name='act_status' class="form-control form-control-sm"  id="memberAct_status" data-style="btn-warning"  style="width:80px;">
  												<option id='act_status' value="${memberVO.act_status}" ></option>
  												<option value="0">封鎖</option>
  												<option value="1">正常</option>
  												<option value="2">未開通</option>
											</select>
			    					</div>
			    				</div>
<script>
	  		var i=	document.getElementById('act_status').value;
	  		var sb=	document.getElementById('act_status');
			if(i=='0'){sb.text='封鎖';} 
			if(i=='1'){sb.text='正常';} 
 			if(i=='2'){sb.text='未開通';} 
</script>	 
			    			
			    				<div class="col-xs-2 col-sm-2 col-md-2">
			    					<div class="form-group">							<label >性別</label>
			    						<select name='gender' class="form-control form-control-sm"  id="membergender" data-style="btn-warning"  style="width:80px;">
  											<option  id='gender'  value="${memberVO.gender}"  ></option>
  											<option value="M" >男人</option>
  											<option value="F">女人</option>
  											<option value="A">其他</option>
										</select>
			    					</div>
			    				</div>
<script>
	  		var i=	document.getElementById('gender').value;
	  		var sb=	document.getElementById('gender');
			if(i=='M'){sb.text='男人';} 
			if(i=='F'){sb.text='女人';} 
 			if(i=='A'){sb.text='其他';} 
</script>	
		    			
			    				<div class="col-xs-2 col-sm-2 col-md-2">
			    					<div class="form-group">								<label >身高</label>
			    						<input name="height" id="memberheight" class="form-control form-control-sm" type="text" value="${memberVO.height}"  />
			    					</div>
			    				</div>
			    				
			    				<div class="col-xs-2 col-sm-2 col-md-2">
			    					<div class="form-group">								<label >體重</label>
			    						<input name="mass" id="membermass" class="form-control form-control-sm"  type="text" value="${memberVO.mass}" />
			    					</div>
			    				</div>

			    			</div><!-- <row> -->
			    			<div class="row"><!-- <row> -->
			    			<div class="col-xs-2 col-sm-2 col-md-2">
			    					<div class="form-group">								<label >國家</label>
			    								<select name='country' class="form-control form-control-sm" data-style="btn-success"  	style="width:120px;">
  													<option value="${memberVO.country}"  >${memberVO.country} </option>
  													<option value="台灣">台灣</option>
  													<option value="美國">美國</option>
  													<option value="日本">日本</option>
  													<option value="其他">其他</option>
												</select>
			    					</div>
			    				</div>
			    				
			    			<div class="col-xs-10 col-sm-10 col-md-10">
			    					<div class="form-group">								<label >地址</label>
			    						<input name="addr" id="memberaddr" class="form-control form-control-sm" type="text" value="${memberVO.addr}" />
			    					</div>
			    				</div>
			    			</div><!-- <row> -->
<div class="row"><!-- <row> -->
			<div class="col-xs-4 col-sm-4 col-md-4">
			    	<div class="form-group">								<label >信箱</label><em>(必填)</em>
				<input name="email" id="memberemail" class="form-control form-control-sm" type="text" value="${memberVO.email}"  />
			    	</div>
			</div>
			
			<div class="col-xs-4 col-sm-4 col-md-4">
			    	<div class="form-group">								<label >電話</label><em>(必填)</em>
				<input name="phone" id="memberphone" class="form-control form-control-sm"  type="text" value="${memberVO.phone}" />
			    	</div>
			</div>

			<div class="col-xs-4 col-sm-4 col-md-4">
			    	<div class="form-group">								<label >累積點數</label>
<input name="total_spent" id="membernum_total_spent" class="form-control form-control-sm"  type="text" value="${memberVO.total_spent}" readonly/>點	
			    	</div>
			</div>

</div><!-- <row> -->			    			
<div class="row"><!-- <row> -->
			<div class="col-xs-2 col-sm-2 col-md-2">
			    	<div class="form-group">								<label >交易</label>
			<input name="num_trans" id="membernum_trans" class="form-control form-control-sm"  type="text" value="${memberVO.num_trans}" readonly/>次
			    	</div>
			</div>
			
			<div class="col-xs-2 col-sm-2 col-md-2">
			    	<div class="form-group">								<label >診療</label>
<input name="num_treatment" id="membernum_treatment" class="form-control form-control-sm" type="text" value="${memberVO.num_treatment}" readonly />次
			    	</div>
			</div>
<div class="col-xs-2 col-sm-2 col-md-2">
			    	<div class="form-group">								<label >來訪</label>
<input name="num_visits" id="membernum_visits" class="form-control form-control-sm" type="text" value="${memberVO.num_visits}" readonly />次
			    	</div>
			</div>
<!-- <div class="col-xs-2 col-sm-2 col-md-2"> -->
<!-- 			    	<div class="form-group">								<label >累積點</label> -->
<%-- 			<input name="total_spent" id="membernum_total_spent" class="form-control disable" type="text" value="${memberVO.total_spent}點" /> --%>
<!-- 			    	</div> -->
<!-- 			</div> -->
<div class="col-xs-3 col-sm-3 col-md-3">
			    	<div class="form-group">								<label >消耗點</label>
			<input name="spent_pts" id="memberspent_pts" class="form-control form-control-sm" type="text" value="${memberVO.spent_pts}" readonly/>點
			    	</div>
			</div>
<div class="col-xs-3 col-sm-3 col-md-3">
			    	<div class="form-group">								<label >獎勵點</label>
			<input name="reward_pts" id="memberreward_pts" class="form-control form-control-sm"  type="text" value="${memberVO.reward_pts}" readonly />點
			    	</div>
			</div>
			    			</div><!-- <row> -->			    			
<div class="row"><!-- <row> -->
			<div class="col-xs-2 col-sm-2 col-md-2">
			    	<div class="form-group">								<label >最後消費日期</label>
			<input name="last_visit" id="memberlast_visit" class="form-control disable" type="text" value="${memberVO.last_visit}" readonly />	
			    	</div>
			</div>

			<div class="col-xs-2 col-sm-2 col-md-3">
			    	<div class="form-group">								<label >加入日期</label>
			<input name="join_date" id="memberjoin_date" class="form-control disable" type="text" value="${memberVO.join_date}" readonly />	
			    	</div>
			</div>

<div class="col-xs-2 col-sm-2 col-md-2">
			    	<div class="form-group">							
			<input name="verify" type="hidden" value="${memberVO.verify}" />		
			    	</div>
			</div>

<div class="col-xs-2 col-sm-2 col-md-2">
			    	<div class="form-group">							
			<input name="photo" type="hidden" value="${memberVO.photo}" />
<%-- <img src="${pageContext.request.contextPath}/user_photo/${MemberVO.photo}"	class="preview" style="max-width: 100px; max-height: 100px;"> --%>
			    	</div>
			</div>	
</div><!-- <row> -->
<div class="row"><!-- <row> -->

<div class="col-xs-6 col-sm-6 col-md-6">
			    	<div class="form-group">								<label >備註</label>
<%-- 			<input name="memo" id="memo" class="form-control disable" type="text" value="${memberVO.memo}"  />	 --%>
			    	<textarea class="form-control" rows="2" id="comment" name="memo"   >${memberVO.memo}</textarea>
			    	</div>
			</div>

<div class="col-xs-2 col-sm-2 col-md-2">
	<div class="form-group"> <!-- button -->
<!-- 	<div class="col-sm-offset-2 col-sm-10"> -->
	<input type="hidden" name="action"	value="Update">
	<button type="submit" class="btn btn-success btn-lg" >修改會員資料</button>		
<!-- 	</div>			 --></div><!-- button --></div>
</div><!-- <row-->
			    		</form>
			    	</div>
	    		</div>
    		</div>
    	</div>
<%-- 錯誤表列 --%>
   <c:if test="${not empty errorMsg}">
	
	<ul>
		<c:forEach var="message" items="${errorMsg}">
			<li><font color='red'>請修正以下錯誤:${message}</font></li>
		</c:forEach>
	</ul>
	
</c:if>
<%-- 錯誤表列 --%>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>
<!-- <!-- required for .datepicker() --> 
<%-- <script src="${pageContext.request.contextPath}/General/js/jquery-ui.min.js"></script>   --%>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$("#memberbirthday").datepicker({ showOn: 'button', buttonImageOnly: true, buttonImage: "${pageContext.request.contextPath}/register/img/Calendar.png" });
	});
</script>

<script>
	var gender = $(".membergender").val()=="M" ?"Male":"Female";
	$(".membergender").text(gender);
</script>

</body>
</html>