<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
<!-- Bootstrap Core CSS -->
<title>醫生資料</title>
<style>
#font{
font-size: 50px;
color: orange;



}

/* #footer-bgcontent { */
/* 		height: 99px; */
/* 		background: #e499ba; */
/* 		position: absolute; */
/* 		right: 0; */
/* 		left: 0; */
/* 		padding: 1rem; */
/* 		text-align: center;	 */
/* } */

#footer-bgcontent { 
 		height: 99px; 
 		background: #e499ba; 
 		position: absolute; 
 		right: 0; 
 		left: 0; 
 		padding: 1rem; 
 		text-align: center;	 
 } 
</style>

</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>
<br>
<br>
<br>

<table align="center">
	<tr>
		<td width="50"></td>
		<td width="300">
			<img class="img-circle" width="300px" src="${pageContext.request.contextPath}/ShowEmpPic.servlet?num=${empVO.eid}" style="border: 3px solid lightgray;"/>
		</td>
		<td width="22"></td>
		<td>
	
				<table style="font-size: 15pt;">
					<tr >
						<td colspan="2" style="font-size: 35pt;"><b>${empVO.name}　醫師</b></td>
					</tr>
					<tr height="20">
						<td colspan="2"><hr></td>
					</tr>	
					<tr>
						<td width="100" height="60">學歷</td>
						<td>${empVO.education}</td>
					</tr>	
					<tr>
						<td height="60">經歷</td>
						<td id="exp"></td>
					</tr>	
					<tr>
						<td height="60">專長</td>
						<td>${empVO.specialty}</td>
					</tr>
					<tr id='xxx'>
						<td height="60">評分</td>

					</tr>	
				</table>
			<input type="hidden" id="expstr" value="${empVO.experience}" />
		</td>
	</tr>
</table>
<br>
<jsp:include page="/General/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<!-- Bootstrap Core JavaScript -->
<script>
function getContextPath() { //obtains context path. EL doesn't work with separated .js
	return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}
$(function() {
	var expstr = $('#expstr').val();
	var expArray = expstr.split(')');
	for(var i = 0; i < expArray.length - 1; i++) {
		$('#exp').append(expArray[i] + ')<br>');
	}
	
	$.getJSON( getContextPath()+'/Score/ScoreServlet',{'action':'getOne_ScoreJSON','eid':'${empVO.eid}'},function(data){
		$.each(data,function(i,emp){
		var cell1 = $("<td></td>").html("<a href='http://localhost:8081/AmyClinic/Score/ScoreServlet?action=getOne_Score&eid="+emp.eid+"'><img width='300px' height='auto'src='${pageContext.request.contextPath}/images/"+emp.avgPicture+"'></a>"+"<span id='font'>&nbsp&nbsp&nbsp&nbsp"+emp.avgScore+"</span>");
		$("#xxx").append(cell1);
		})
	})
})

</script>	
</body>
</html>