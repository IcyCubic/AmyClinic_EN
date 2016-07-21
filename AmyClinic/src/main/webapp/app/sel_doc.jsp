<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
可能用colorbox帶出來
帶出所選時段的醫生名、時段、日期
用QueryScheduleAction查出預約狀態、備註
如為可預約狀態則在左邊顯示"掛號"超連結
點選後將值傳回add_app.jsp
 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/colorbox.css">
<title>Insert title here</title>
<style>
	a:link {
		text-decoration: none;
		color:blue
	}
	a:visited {
		color:blue
	}
</style>
</head>
<body style="background-color: #F1E1FF">
<c:if test="${day == 2}">
	<b>您選擇的時段：星期一　${c_hours}</b><br><br>
	<input type="hidden" id="wday" value="星期一">
	<input type="hidden" id="hour" value="${c_hours}">
</c:if>
<c:if test="${day == 3}">
	<b>您選擇的時段：星期二　${c_hours}</b><br><br>
	<input type="hidden" id="wday" value="星期二">
	<input type="hidden" id="hour" value="${c_hours}">
</c:if>
<c:if test="${day == 4}">
	<b>您選擇的時段：星期三　${c_hours}</b><br><br>
	<input type="hidden" id="wday" value="星期三">
	<input type="hidden" id="hour" value="${c_hours}">
</c:if>
<c:if test="${day == 5}">
	<b>您選擇的時段：星期四　${c_hours}</b><br><br>
	<input type="hidden" id="wday" value="星期四">
	<input type="hidden" id="hour" value="${c_hours}">
</c:if>
<c:if test="${day == 6}">
	<b>您選擇的時段：星期五　${c_hours}</b><br><br>
	<input type="hidden" id="wday" value="星期五">
	<input type="hidden" id="hour" value="${c_hours}">
</c:if>
<c:if test="${day == 7}">
	<b>您選擇的時段：星期六　${c_hours}</b><br><br>
	<input type="hidden" id="wday" value="星期六">
	<input type="hidden" id="hour" value="${c_hours}">
</c:if>

<span id="emp">${empVO.name}</span>　醫師　<a target="_new" href="${pageContext.request.contextPath}/free/showdoctor?id=${empVO.eid}">查看醫師資料</a><br><br>

<table border="1" width="900px" height="200px" align="center" style="border-collapse: collapse;text-align: center;">
	<tr>
		<th>預約</th>
		<th>日期</th>
		<th>預約狀態</th>
		<th>備註</th>
	</tr>
	<c:forEach var="sche" items="${list}" varStatus="status">
		<tr>
		<c:if test="${sche.appt_status==1}">
			<td><input id="b1" type="button" value="預約" onclick="add(${status.index})"></td>
			<input type="hidden" id="index" value="${status.index}">
			<input type="hidden" id="id${status.index}" value="${sche.sch_id}">
			<input type="hidden" id="date${status.index}" value="${sche.c_date}">
<%-- 			<td><a id="b1" href="#" onclick="addapp(${sche.c_date})">預約</a></td> --%>
		</c:if>	
		<c:if test="${sche.appt_status==0}">
			<td></td>
		</c:if>	
			<td>${sche.c_date}</td>
			
		<c:if test="${sche.appt_status==1}">	
			<td style="color: green;">可預約</td>
		</c:if>	
		<c:if test="${sche.appt_status==0 && sche.memo!='休假'}">	
			<td style="color: red;">額滿</td>
		</c:if>	
		<c:if test="${sche.appt_status==0 && sche.memo=='休假'}">	
			<td>休診</td>
		</c:if>		
			<td></td>
		</tr>
	
	</c:forEach>

</table>
<br>
<table align="center">
	<tr>
<!-- 		<td><a id="b1" href="#">測試</a></td> -->
		<td><a id="b2" href="${pageContext.request.contextPath}/apps/showtime">重新選擇</a></td>
		<td width="30"></td>
		<td><a id="b3" href="#">取消</a></td>
	</tr>

</table>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.colorbox.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/jquery.colorbox-zh-TW.js"></script> --%>
<script>
function add(index) {
		var wday = $('#wday').val();
		var hour = $('#hour').val();
		var date = $('#date'+index).val();
		var emp = $('#emp').text();
		var id = $('#id'+index).val();
	
		$('#sel_app_time',top.document).text(date+"　"+wday+"　"+hour);
		$('input[name="s_app_time"]',top.document).val(date+"　"+wday+"　"+hour);
		$('input[name="ename"]',top.document).val(emp);
		$('input[name="id"]',top.document).val(id);
		$('#errortime',top.document).empty();
		top.$.fn.colorbox.close()
}
$(function(){
// 	var index = $('#index').val();
// 	$("#b1"+index).click(function(){
// 		var wday = $('#wday').val();
// 		var hour = $('#hour').val();
// 		var date = $('#date').val();
		
// 		$('#sel_app_time',top.document).val(date+"　"+wday+"　"+hour);
// 		top.$.fn.colorbox.close();
// 	});
	$("#b3").click(function(){
		top.$.fn.colorbox.close();
	})
});
</script>
</body>
</html>