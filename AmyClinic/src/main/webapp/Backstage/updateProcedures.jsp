<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="group3.carrie.proc.model.*"%>
<%@page import="group3.carrie.proctype.model.*"%>

<!DOCTYPE html>
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
<div id="page-wrapper" style=background-color:#000000  >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
<!--                 <div class="page-header" > -->
<!--  <marquee  onMouseOver="this.stop()" onMouseOut="this.start()" bgcolor="#ADADAD" direction="right" height="20" scrollamount="8" behavior="alternate">本月目標<font color="red">30億</font></marquee>                                            -->
<!--                 </div> -->
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="#BFB2AB" style="text-align: center;">修改療程</font></li></ol>
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
  
  <form class="form-horizontal" role="form" ACTION="ProcServlet"  method="post">
  	  
  	  <div class="form-group">
      <label class="control-label col-sm-2" for="procedure_id">療程編號</label>
      <div class="col-sm-10">          
        <input type="text"  class="form-control" id="procedure_id"  size="45" name="procedure_id"  readonly value="<%=procVO.getProcedure_id()%>"   style="width:80px;"  >
      </div>
      </div>
  	  
      <div class="form-group">
      <label class="control-label col-sm-2" for="">療程類別</label>
      <div class="col-sm-10">          
<%--         <input type="text" class="form-control" id="cid" placeholder="10,20,30,40,50" size="45" name="cid" value="<%= %>" /> --%>

      <select size="1"  name="pType_id">
      <c:forEach var="proctype" items="${proctype}">
				<option  value="${proctype.pType_id}" ${(procVO.procTypeVO.pType_id==proctype.pType_id)?'selected':'' } >${proctype.name}
	  </c:forEach>
      </select> 
      </div>
    </div>
      
  
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">療程名稱</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="name"  placeholder="中英文學名" size="45" name="name" value="<%=procVO.getName()%>" />
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="fee">療程價格</label>
      <div class="col-sm-10">          
        <input type="number" class="form-control" id="fee" placeholder="整數數字" size="45" name="fee"  value="<%=procVO.getFee()%>"  style="width:120px;"/>
      </div>
    </div>
   
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
      	<input type="hidden" name="action" value="update">
        <button type="submit" class="btn btn-success">修改療程</button>
      </div>
    </div>



<%-- 錯誤表列 --%>
   <c:if test="${not empty errorMsg}">
	<font color='red'>請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsg}">
			<li><font color='red'>請修正以下錯誤:${message}</font></li>
		</c:forEach>
	</ul>
	
</c:if>
<%-- 錯誤表列 --%>
    
  </form>
</div>
<!--         結束 -->
        </div><!-- /#page-wrapper --><!-- ALL over	/#wrapper -->   
</body>
</html>