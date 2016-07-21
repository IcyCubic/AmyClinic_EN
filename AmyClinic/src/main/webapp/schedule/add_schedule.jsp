<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="group3.beef.employee.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- jQuery -->
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"> -->
<!--   <script src="//code.jquery.com/jquery-1.10.2.js"></script> -->
<!--   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->
  
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="AddScheduleServlet" method="post"> 
值班醫師:
<jsp:useBean id="empSvc" scope="page" class="group3.beef.employee.model.EmployeeService" />
<select name="eid">
<c:forEach var="empVO" items="${empSvc.all}">
<option value="${empVO.eid}">${empVO.name}</option>

</c:forEach>
  
</select><br>
值班日期: <input type="text" id="datepicker" name="c_date" value="${retunData.c_date}"><span>${errorMsg.date}</span><br>
值班時段:
<select name="c_hours">
  <option value="早上">早上</option>
  <option value="下午">下午</option>
  <option value="晚上">晚上</option>
</select><br>

休假：<input type="checkbox" name="vac" ><br>

memo：<input type="text" name="memo"><span>${errorMsg.memo}</span><br>
<input type="hidden" name="action" value="addsch">
<input type="submit">

</form>

</body>
<script type="text/javascript">
$(function() {
    $( "#datepicker" ).datepicker({
    	dateFormat: "yy-mm-dd"
    });
  });


</script>
</html>