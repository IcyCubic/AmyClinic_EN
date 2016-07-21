<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="group3.beef.employee.*"%>

<!DOCTYPE html >

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- jQuery -->
<%-- <script type="text/javascript" charset="utf8"src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script> --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/datatables.css"/>


<%-- <link href="<%=request.getContextPath()%>/schedule/ext/bootstrap.css" rel="stylesheet"> --%>
<%-- <link href="<%=request.getContextPath()%>/schedule/ext/font-awesome.min.css"	rel="stylesheet"> --%>
<%-- <script src="<%=request.getContextPath()%>/schedule/ext/bootstrap.min.js"></script> --%>


<style type="text/css">

/* .modal-body { */
/* 	padding:35px; */
/* 	margin-right:10%; */

/* } */

.errors {
float: right;
}

</style>



<title>醫生門診班表</title>
</head>



<body>
<div id="wrapper"><!-- all -->  <jsp:include page="/Backstage/jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->   
     
     <script type="text/javascript"	src="<%=request.getContextPath()%>/js/datatables.js"></script>
       <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
    

 
<div id="page-wrapper" style=background-color:#000000  >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="red" style="text-align: center;">醫師排班</font>
                 
                 </li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over -->     
<!--         開始 -->
<!-- =======================新增排班============================== -->



<!-- Modal -->
<div class="modal fade" id="myModalNorm" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" 
                   data-dismiss="modal">
                       <span aria-hidden="true">&times;</span>
                       <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    新增排班
                </h4>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                
                <form action="AddScheduleServlet" id="schform" role="form" method="post">
                  
                  <div class="form-group">
                    <label for="doctor">值班醫師</label>
                    <jsp:useBean id="empSvc" scope="page" class="group3.beef.employee.model.EmployeeService" />
                      <select  id="doctor" name="eid" class="form-control" > 
                      <c:forEach var="empVO" items="${empSvc.all}">
						<option  id="eidopt" value="${empVO.eid}">${empVO.name}</option>
                      </c:forEach>
                      </select>
                      </div>
                      
                      <div class="form-group">
                    <label for="datepicker">值班日期</label>
                      <input type="text"  name="c_date" class="form-control "
                          id="datepicker" placeholder="date"  required/>
                  </div>
                      
                      <div class="form-group">
                        <label for="exampleInputEmail1">值班時段</label>
                        <select name="c_hours" id="c_hours" class="form-control"  > 
						<option value="早診">早診</option>
					  <option value="午診">午診</option>
  					<option value="晚診">晚診</option>
                      </select>
                      </div>
                      
                      <div class="form-group">
                    <label for="memo">memo</label> 
                      <input type="text" id="memo" name="memo" class="form-control"
                          id="datepicker" placeholder="" required/>
                  </div>
                      
                  
                  <div class="row">
                  <div class="checkbox col-md-offset-10">
                    <label>  <input type="checkbox" name="vac" id="vac" />休假 </label>
                  </div>
                  </div>
                  <button type="submit" class="btn btn-default"> 送出 </button>
                  <button type="button" class="btn btn-default" id="one"> 一鍵輸入 </button>
                  <input type="hidden" name="action" id="action" value="addsch">
                  <input type="hidden" name="sch_id" value="">
                  </form>
                
                  
                
            </div>
            
            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal"> 取消  </button>
            </div>
        </div>
    </div>
</div>

<!-- =========================================================================== -->
 



	<table id="table_id" class="display" width="90%" align="center" >
		<thead>
			<tr>
				<th>排班編號</th>
				<th>醫師姓名</th>
				<th>門診日期</th>
				<th>預約時段</th>
				<th>預約人數</th>
				<th>門診狀態</th>
				<th>備註</th>
				<th>修改</th>
			</tr>
		</thead>
		<c:set var="now" value="<%= new java.util.Date() %>" />
		<jsp:useBean id="schSvc" scope="page"	class="group3.carrie.schedule.model.ScheduleService" />
		<c:forEach var="schVO" items="${schSvc.all}">
			<tr>
				<td>${schVO.sch_id}</td>
				<td>${schVO.employeeVO.name}</td>
				<td>${schVO.c_date}</td>
				<td>${schVO.c_hours}</td>
				<td>${schVO.appt_num}</td>
				<c:choose>
					<c:when test="${schVO.appt_status=='0' && schVO.appt_num == '3'}">
						<td style="color: blue">額滿</td>
					</c:when>
					<c:when test="${schVO.appt_status=='0' && schVO.appt_num == '0'}">
						<td style="color: red">休診</td>
					</c:when>
					<c:otherwise>
						<td>正常</td>
					</c:otherwise>

				</c:choose>
				<td>${schVO.memo}</td>
				<c:choose>
				<c:when test="${schVO.appt_num ne 0}">
				<td><button class="btn btn-info " data-toggle="modal" name="sch_id" disabled="disabled" data-target="#myModalNorm" value="${schVO.sch_id}" >修改</button></td>
				
				</c:when>
				<c:otherwise>
				
				<c:choose>
				<c:when test="${schVO.c_date < now}">
				<td><button class="btn btn-info " data-toggle="modal" name="sch_id" disabled="disabled" data-target="#myModalNorm" value="${schVO.sch_id}" >修改</button></td>
				</c:when>
				<c:otherwise>
				
				<td><button class="btn btn-info " data-toggle="modal" name="sch_id" data-target="#myModalNorm" value="${schVO.sch_id}" >修改</button></td>
				
				</c:otherwise>
				</c:choose>
				</c:otherwise>
				</c:choose>
				
			</tr>


		</c:forEach>
	</table>


<!-- Button trigger modal -->
<button class="btn btn-primary btn-lg" data-toggle="modal" id="addschbtn" data-target="#myModalNorm" style="margin-left: 50px; margin-top: 20px;">
    新增排班
</button>
<!-- Button trigger modal -->



</div>



</body>
<script type="text/javascript">
$(function(){
	$('#one').click(function() {
		$("#datepicker").val('2016-06-23');
		$("#memo").val('事假');
		$("#vac").prop('checked',true);
	})
})



// // $(document).ready(function(){
// 	$(function(){
// 		$('button[name=sch_id]').click(function(){
// 		var s_date = $(this).closest('td').siblings('.c_date').text();
// 		var today = new Date();
// 		var sd = Date.parse(s_date).valueOf();
// 		var td = Date.parse(today).valueOf();
// 		if(sd<td){
// 			alert('修改日期不能晚於今天')
// 			$('button[name=sch_id]').attr('disabled','disabled');
// 		}
// 		})
// 	})
// // })


$(function(){
	$('#addschbtn').click(function(){
		$("#action").val("addsch");
		
	})
	
})

$(function(){
$('button[name=sch_id]').click(function(){
	var schId = $(this).val();
	//alert(schId);
	$.ajax({
		'type':'get',
		'url':'Scheduleservlet',
		'dataType' :'json',
		"data":{"action" : "get_one_sch" , "schId" : schId},
		'success':function(data){
// console.log(data);
$("#action").val("updatesch")
	$("#doctor").val(data.eid);
	$("#datepicker").val(data.c_date);
	$("#c_hours").val(data.c_hour);
	$("#memo").val(data.memo);
	if(data.appt_status==0){
		$("#vac").prop("checked",true);
	}else{
 		$("#vac").prop("checked",false);
	}
	
	$("input[name=sch_id]").val(data.sch_id);
		}
	
})});
})

 
 
 
 $('#datepicker').change(function(){
	var date = $(this).val()
		// alert(date);
	var today = new Date();
var  ts = Date.parse(today).valueOf();	
 var cs = Date.parse(date).valueOf();
 
 	if(date.match(/^(\d{4})(\/|-)(\d{1,2})(\/|-)(\d{1,2})$/)){
 		$('#dErr').remove();	
 		console.log('match')
 		$('button[type=submit]').removeAttr('disabled')
 		if(cs<ts){
 			$('#dErr').remove();
 			$('#datepicker').before('<span id="dErr" style="float: right;color: red">日期不能小於今天!!</span>');
 			$('button[type=submit]').attr('disabled', 'disabled');
 			//alert('日期小於今天!!')
 		}
 	
 	}else{
 		$('#dErr').remove();
 			$('#datepicker').before('<span id="dErr" style="float: right;color: red">日期格式錯誤</span>');
 			$('button[type=submit]').attr('disabled', 'disabled');
 			console.log('notmatch')}
 	
 	
 
 })
 
 
$(function() {
    $( "#datepicker" ).datepicker({
    	dateFormat: "yy-mm-dd"
    });
  });



	$(document).ready(function() {
		var table = $('#table_id').DataTable({
			"order": [[ 0, "desc" ]], //預設編號排序
			"columnDefs": [
			{"className": "dt-center", "targets": "_all"}
			
							             ],
 		"lengthMenu": [[10, 15, 30, 50, -1], [10, 15, 30, 50, "All"]],
 		"iDisplayLength": 15,
 		"displayStart": 105,
//  		dom: 'Bfrtip',
//  		buttons: [
// 		            {
// 		                text: '新增排班',
// 		                action: function ( e, dt, node, config ) {
// 		                    alert( 'Button activated' );
// 		                }
// 		            }
// 		        ],
			
			
			
		})
	})
	
	
 
</script>

</html>
