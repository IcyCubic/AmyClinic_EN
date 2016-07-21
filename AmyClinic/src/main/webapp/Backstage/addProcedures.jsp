<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="group3.carrie.proc.model.*"%>
<%@page import="group3.carrie.proctype.model.*"%>
<%@page import="group3.k.proc.controller.*"%>

<!DOCTYPE html >
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="">
    <meta name="author" content="">
</head>

<body>
    <div id="wrapper"><!-- all -->
<jsp:include page="jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->
<div id="page-wrapper" style=background-color:#000000;  >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
<!--                 <div class="page-header" > -->
<!--  <marquee  onMouseOver="this.stop()" onMouseOut="this.start()" bgcolor="#ADADAD" direction="right" height="20" scrollamount="8" behavior="alternate">本月目標<font color="red">30億</font></marquee>                                            -->
<!--                 </div> -->
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="#BFB2AB" style="text-align: center;" id="add">新增療程</font></li></ol>
                    <script>
                 $( '#add' ).click(function( event ) {
                	 $("#pType_id").val('3');
                	 $("#name").val('展示-竹竿瘦療程-畢業特賣');
                	 $("#fee").val('9999');    	  	 
                 });
                 </script>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over -->     
<!--         開始 -->
<%
 
ProcVO procVO = (ProcVO) request.getAttribute("procVO");
ProcService proc = new ProcService();
List<ProcVO> list = proc.getAll();
pageContext.setAttribute("list",list);

ProcTypeService procTServ  = new ProcTypeService();
List<ProcTypeVO> proctype = procTServ.getAll();
pageContext.setAttribute("proctype", proctype);
%>

 <div class="container"><br>
  <form class="form-horizontal" role="form" ACTION="ProcServlet"   method="post">
  
      <div class="form-group">
      <label class="control-label col-sm-2" for="pType_id">療程類別</label>
      <div class="col-sm-10">          

      <select size="1"  id='pType_id'name="pType_id" class="form-control form-control-sm"  style="width: 150px">
      <c:forEach var="proctype" items="${proctype}">
				<option  value="${proctype.pType_id}" ${(procVO.pType_id==proctype.pType_id)?'selected':'' } >${proctype.name}
	  </c:forEach>
      </select>
      </div>
    </div>
      
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">療程名稱</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="name"  placeholder="療程中英文學名" size="45" name="name"  >
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="fee">療程價格</label>
      <div class="col-sm-10">          
        <input type="number" class="form-control" id="fee" placeholder="新台幣值" size="45" name="fee"		style="width:120px;">
      </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
			     <input type="hidden" name="action"	value="addProc">
			     <input type="submit" value="新增療程" class="btn btn-success">
<!--         <button type="submit" class="btn btn-default">新增療程</button> -->
      </div>
    </div>
<!-- </form> -->
   

  </form>
  <c:if test="${not empty errorMsg}">
	<ul>
		<c:forEach var="message" items="${errorMsg}">
			<li><font color='red'>${message}</font></li>
		</c:forEach>
	</ul>
</c:if>
<%-- <c:if test="${empty errorMsg}"> --%>
<!-- 	<script >$(function () { alert("新增療程成功");});</script> -->
<%-- </c:if> --%>
</div>
<!--         結束 -->
</div><!-- /#page-wrapper --><!-- ALL over	/#wrapper -->   
</body>
</html>