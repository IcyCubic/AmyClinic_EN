<%@page import="group3.beef.employee.model.*"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
 table { 
 background-color: transparent; 
 table-layout: fixed; 
 } 

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<div id="wrapper"><!-- all -->  
<jsp:include page="/Backstage/jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->   
     
 
<div id="page-wrapper" style=background-color:#000000  >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="red" style="text-align: center;">員工維護</font>
                 
                 </li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --> 
<!--         開始 -->


	<%
		EmployeeService eSvc = new EmployeeService();
		List<EmployeeVO> list = null;
		list = eSvc.getAll();
		pageContext.setAttribute("list", list);
	%>
	<div class="container-fluid">
	<table border="1"   class="table table-hover table-responsive" >
	<tr align="center" valign="middle">
<!-- 		<th width="100px;">員工編號</th> -->
<!-- 		<th width="120px;">員工照片</th> -->
<!-- 		<th width="100px;">員工姓名</th> -->
<!-- 		<th width="250px;">email</th> -->
<!-- 		<th width="180px;">教育程度</th> -->
<!-- 		<th width="350px;">經歷</th> -->
<!-- 		<th width="180px;">專長</th> -->
<!-- 		<th>修改</th> -->
		<th width="70px;">員工編號</th>
		<th width="120px;">員工照片</th>
		<th width="100px;">員工姓名</th>
		<th>email</th>
		<th>教育程度</th>
		<th>經歷</th>
		<th>專長</th>
		<th width="70px;">修改</th>
<!-- 		<th>刪除</th> -->
	</tr>
	<c:forEach var="employeeVO" items="${list}">
		<tr align="left">
			<td>${employeeVO.eid}</td>
			<td><img width='100' src='${pageContext.request.contextPath}/ShowEmpPic.servlet?num=${employeeVO.eid}' /></td>
			<td>${employeeVO.name}</td>
			<td>${employeeVO.email}</td>
			<td>${employeeVO.education}</td>
			<td>${employeeVO.experience}</td>
			<td>${employeeVO.specialty}</td>
			<td>
			<form action="emp.do" method="get">
			<input type="submit" value="修改" class="btn btn-success"/>
			<input type="hidden" name="eid" value="${employeeVO.eid}">
			<input type="hidden" name="action" value="getOne_For_Display" >
			 </form>
			</td>
			
<!-- 			<td> -->
<!-- 			<form action="emp.do" method="get"> -->
<!-- 			<input type="submit" value="刪除" class="btn btn-danger"/> -->
<%-- 			<input type="hidden" name="eid" value="${employeeVO.eid}"> --%>
<!-- 			<input type="hidden" name="action" value="delete"> -->
<!-- 			 </form> -->
<!-- 			</td> -->
		</tr>
	</c:forEach>
	</table>
</div>
</div>
</body>
</html>
