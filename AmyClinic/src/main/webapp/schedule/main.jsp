<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
	<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/u/dt/jszip-2.5.0,pdfmake-0.1.18,dt-1.10.12,b-1.2.1,b-colvis-1.2.1,b-flash-1.2.1,b-html5-1.2.1,b-print-1.2.1,se-1.2.0/datatables.min.css"/>
 
<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/u/dt/jszip-2.5.0,pdfmake-0.1.18,dt-1.10.12,b-1.2.1,b-colvis-1.2.1,b-flash-1.2.1,b-html5-1.2.1,b-print-1.2.1,se-1.2.0/datatables.min.js"></script>
<!-- jQuery UI -->
 <script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/jqueryui/dataTables.jqueryui.js"></script>
 
<!-- DataTables -->
<!-- <script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.7/js/jquery.dataTables.js"></script> -->
<script type="text/javascript" src="https://cdn.datatables.net/u/dt/dt-1.10.12,af-2.1.2,b-1.2.1,b-colvis-1.2.1,b-print-1.2.1,cr-1.3.2,fc-3.2.2,fh-3.1.2,kt-2.1.2,r-2.1.0,rr-1.1.2,sc-1.4.2,se-1.2.0/datatables.js"></script>
	
	

<title>Insert title here</title>
</head>
<body>

<p>Date: <input type="text" id="datepicker"></p>
<p>預約編號: <input type="text" id="sch_id"></p>

<input type="button" value="修改">


 <input type="button" id="b1" value="date">
	<input type="button" value="load" id="buttonLoad">
	
	
	<table id="productTable" class="">
		<thead>
			<tr>
				<th>編號</th> 	<!--getSch_id -->
				<th>日期</th>	<!--C_date -->
				<th>醫生</th>	<!--Name -->
				<th>時段</th>	<!--C_hours -->
				<th>預約人數</th> <!--Appt_num -->
				<th>醫師狀態</th> <!--Appt_status -->
				<th>備註</th>	<!--Memo -->
				<th>修改</th>	<!--Memo -->
			</tr>
		</thead>
		<tbody></tbody>
	</table>



</body>
<script>
//讀出全部的預約
$(function() {
	$('#buttonLoad').click(function() {
		$('#productTable > tbody').empty(); //選擇後先清除欄位
			$.ajax({
				'type':'get',
				'url':'Scheduleservlet',
				'dataType' :'json',
				"data":{"action" : "getall"},
				'success':function(data){
					
					
					
					var r= $('<input type="button" value="new button"/>');
			 		$.each(data,function(i,item){
			 			var status = item.Appt_status;
			 			var appt_num = item.Appt_num;
			 			var memo = item.Memo;
			 			if(status==0 && appt_num==3){
			 				status = "<font color='blue'>額滿</font>"}
			 			else if(status==0 && memo=="休假"){
			 				status = "<font color='red'>休診</font>"}
			 			else{
		 					status = "<font color='black'>正常</font>"
		 				}
			 		
			 		
					var cell1 = $('<td></td>').text(item.getSch_id);
					var cell2 = $('<td></td>').text(item.C_date);
					var cell3 = $('<td></td>').text(item.Name);
					var cell4 = $('<td></td>').text(item.C_hours); 
					var cell5 = $('<td></td>').text(appt_num); 
					var cell6 = $('<td></td>').html(status); 
					var cell7 = $('<td></td>').text(item.Memo); 
					var cell8 = $('<td></td>').append($('<input type="button">').val('修改'));
					var row = $('<tr></tr>').append(cell1).append(cell2).append(cell3).append(cell4)
					.append(cell5).append(cell6).append(cell7).append(cell8);
					
					$('#productTable > tbody').append(row);
				} ) 
					
					
					
					
				}
				
				
				
			});
	})})









//照日期搜尋
$(function(){
	$('#b1').click(function(){
		var  date = $("#datepicker").val();
		$('#productTable > tbody').empty(); //選擇後先清除欄位
		$.ajax({
			'type':'get',
			'url':'Scheduleservlet',
			'dataType' :'json',
			"data":{"action" : "bydate","date" : date },
			'success':function(data){
			$.each(data,function(i,item){
				var cell1 = $('<td></td>').text(item.getSch_id);
				var cell2 = $('<td></td>').text(item.C_date);
				var cell3 = $('<td></td>').text(item.Name);
				var cell4 = $('<td></td>').text(item.C_hours); 
				var cell5 = $('<td></td>').text(item.Appt_num); 
				var cell6 = $('<td></td>').text(item.Appt_status); 
				var cell7 = $('<td></td>').text(item.Memo); 
				
				var row = $('<tr></tr>').append(cell1).append(cell2).append(cell3).append(cell4)
				.append(cell5).append(cell6).append(cell7);
				$('#productTable > tbody').append(row);
			});
		},
			"error" : function (datas) {
			alert('查無資料');
		}
		
		})
	})
})
		
//搜尋
		
 
</script>


</html>