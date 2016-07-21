<%@page import="group3.carrie.app.model.AppService"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.modal.modal-wide .modal-dialog {
  width: 90%;
}
.modal-wide .modal-body {
  overflow-y: auto;
}

/* irrelevant styling */
body { text-align: center; }
body p { 
  max-width: 400px; 
  margin: 20px auto; 
}
#tallModal .modal-body p { margin-bottom: 900px }

.table th {
   text-align: center;   
}

</style>
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/datatables.css" />
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>��v�ƯZ</title>
</head>
<body>
	<div id="wrapper">
		<!-- all -->
		<jsp:include page="/Backstage/jsp/b_top.jsp" /><!-- top and������\�����	��m -->
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/datatables.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>

<div id="page-wrapper" style=background-color:#000000  >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="red" style="text-align: left: ;">�w�����@</font>
                 
                 </li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--������\�����over --><!--������\�����over --><!--������\�����over -->     
<!--         �}�l -->
		<!--������\�����over -->
		<!-- �}�l -->
<!--  <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="#BFB2AB" style="text-align: center;">xxx</font></li></ol> -->

		<table border="1" class="table table-hover" id="apptable">
			<thead>
				<tr>
					<th>�w���s��</th>
					<th>�|���W��</th>
					<th>���E��v</th>
					<th>�w�����</th>
					<th>�w���ɬq</th>
					<th style="width: 150px;" >���{</th>
					<th>��^�E</th>
					<th>�w�����A</th>
					<th>�d�ݷ|��</th>
					<th>�����w��</th>

				</tr>
			</thead>
			<c:set var="now" value="<%= new java.util.Date() %>" />
			<jsp:useBean id="AppSvc" scope="page" class="group3.carrie.app.model.AppService" />
			<c:forEach var="AppVO" items="${AppSvc.all}">
				<tr>
					<td>${AppVO.aid}</td>
					<td>${AppVO.memberVO.name}</td>
					<td>${AppVO.employeeVO.name}</td>
					<td>${AppVO.apt_date}</td>
					<td>${AppVO.apt_time}</td>
					<td>${AppVO.descrip}</td>
					<c:choose>
						<c:when test="${AppVO.purpose==1}">
							<td>��E</td>
						</c:when>
						<c:otherwise>
							<td>�^�E</td>
						</c:otherwise>

					</c:choose>
					
					
					<c:choose>
						<c:when test="${AppVO.apt_status==1}">
							<td>���`</td>
								<td>
					<button type="button" value="${AppVO.memberVO.mid}" class="btn btn-info memberid" data-toggle="modal" data-target="#tallModal">�d��</button>
					</td>
					<c:choose>
					<c:when test="${AppVO.apt_date < now }">
					
					<td>
						<form action="app_check" method="get">
							<input type="submit" value="����"  disabled="disabled" class="btn btn-success">
							<input type="hidden" name="action" value="appcancel"> <input
								type="hidden" name="aid" value="${AppVO.aid}">

						</form>

					</td>
					</c:when>
					
					<c:otherwise>
					
					<td>
						<form action="app_check" method="get">
							<input type="submit" value="����"  class="btn btn-success">
							<input type="hidden" name="action" value="appcancel"> <input
								type="hidden" name="aid" value="${AppVO.aid}">

						</form>

					</td>
					
					
					</c:otherwise>
					
					</c:choose>
						</c:when>
						<c:otherwise>
							<td style="color: red">����</td>
										<td>
					<button type="button" value="${AppVO.memberVO.mid}" class="btn btn-info memberid" data-toggle="modal" data-target="#tallModal">�d��</button>
					
					</td>
					<td>
						<form action="app_check" method="get">
							<input type="submit" value="����" class="btn btn-success" disabled="disabled">
							<input type="hidden" name="action" value="appcancel"> <input
								type="hidden" name="aid" value="${AppVO.aid}">

						</form>

					</td>
						</c:otherwise>
					</c:choose>
				
				</tr>
			</c:forEach>



		</table>
 
<!--  ================================================== -->
 <div id="tallModal" class="modal modal-wide fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h2 class="modal-title">���{�O��</h2>
      </div>
      <div class="modal-body">
<!--        ===============body start================== -->
       <div class="container">
  <table class="table" id="memTable">
  <thead>
  <tr>
        <th>�|���s��</th>
        <th>�|���m�W</th>
        <th>�X�ͤ�</th>
        <th>e-mail</th>
        <th>�q��</th>
        <th>�a�}</th>
        <th>���O����</th>
        
        
      </tr>
  </thead>
  <tbody>
   
  </tbody>
  
  </table>
  </div>
       
       
       
       
       <div class="container">
  <table class="table" id="appTable">
    <thead align="center">
      <tr>
        <th>���{�s��</th>
        <th>�D�v��v</th>
        <th>���</th>
        <th>�ɬq</th>
        <th>���e</th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
</div>
       
<!--        ===============body end================== --> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
 
 
 
 
 
 
 
</div>

	<script type="text/javascript">
	
	// when .modal-wide opened, set content-body height based on browser height; 200 is appx height of modal padding, modal title and button bar

	$(".modal-wide").on("show.bs.modal", function() {
	  var height = $(window).height() - 200;
	  $(this).find(".modal-body").css("max-height", height);
	});
	
	 
	       $('.memberid').click(function() {
	      var mid  = $(this).attr("value");
	      $('#appTable > tbody').empty();
	      $('#memTable > tbody').empty();
	      $.ajax({
				'type':'get',
				'url':'Mem_detail',
				'dataType' :'json',
				"data":{"mid" : mid},
				'success':function(data){
					 
					console.log(data[0].name);
// 				 $('#mname_lab').append(mname);
				 
				 	var mcell0 = $('<td></td>').text(data[0].mid);
				    var mcell1 = $('<td></td>').text(data[0].name);
	 				var mcell2 = $('<td></td>').text(data[0].bday);
	 				var mcell3 = $('<td></td>').text(data[0].email);
	 				var mcell4 = $('<td></td>').text(data[0].phone);
// 	 				var mcell5 = $('<td></td>').text(data[0].cuntry);
	 				var mcell6 = $('<td></td>').text(data[0].addr);
// 	 				var mcell7 = $('<td></td>').text(data[0].join_date);
// 	 				var mcell8 = $('<td></td>').text(data[0].last_visit);
// 	 				var mcell9 = $('<td></td>').text(data[0].num_trans);
// 	 				var mcell10 = $('<td></td>').text(data[0].num_visits);
// 	 				var mcell11 = $('<td></td>').text(data[0].num_treatment);
	 				var mcell12 = $('<td></td>').text(data[0].total_spent);
// 	 				var mcell13 = $('<td></td>').text(data[0].act_satus);
// 	 				var mcell14 = $('<td></td>').text(data[0].mass);
// 	 				var mcell15 = $('<td></td>').text(data[0].height);
				 var mrow = $('<tr></tr>').append(mcell0).append(mcell1).append(mcell2).append(mcell3).append(mcell4)
				 .append(mcell6).append(mcell12) 
				 $('#memTable > tbody' ).append(mrow);
				 
				 
				 
				 
				 
					$.each(data,function(i,item){
						var aid = item.aid;
						var apt_dat = item.apt_dat;
						var apt_time = item.apt_time;
						var desc = item.desc;
						var ename = item.ename
//						console.log(item.name[0]);
					var cell1 = $('<td></td>').html(aid);
					var cell2 =	$('<td></td>').html(ename);
					var cell3 =	$('<td></td>').html(apt_dat);
					var cell4 = $('<td></td>').html(apt_time);
					var cell5 = $('<td></td>').html(desc);
					var row = $('<tr></tr>').append(cell1).append(cell2).append(cell3).append(cell4).append(cell5);
					
					$('#appTable > tbody' ).append(row);
					});
				}
	      
	        });
	       })
	
	
	
	
	
		$(document).ready(
				function() {
					var table = $('#apptable').DataTable(
							{
								"order" : [ [ 0, "desc" ] ], //�w�]�s���Ƨ�
								"columnDefs" : [ {
									"className" : "dt-center",
									"targets" : "_all"
								}

								],
								"lengthMenu" : [ [ 10, 15, 30, 50, -1 ],
										[ 10, 15, 30, 50, "All" ] ],
								"iDisplayLength" : 15,
								"displayStart": 145,
							//  		dom: 'Bfrtip',
							//  		buttons: [
							// 		            {
							// 		                text: '�s�W�ƯZ',
							// 		                action: function ( e, dt, node, config ) {
							// 		                    alert( 'Button activated' );
							// 		                }
							// 		            }
							// 		        ],

							})
				})
				
	</script>
</body>
</html>