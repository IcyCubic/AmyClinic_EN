<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script	src="${pageContext.request.contextPath}/General/js/jquery.min.js"></script>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>預約查詢</title>
</head>
<body>
 
                 
                 
 會員編號：<input type="text" id="mid" value="">
	<input type="button" value="load" id="buttonLoad">
	
<!-- 	<table id="MemTable" class="" width="500px"> -->
<!-- 	<thead> -->
<!-- 		<tr> -->
<!-- 		<th>aid</th>  -->
<!-- 				<th>name</th> -->
<!-- 				<th>bday</th> -->
<!-- 				<th>email</th> -->
<!-- 				<th>phone </th> -->
<!-- 				<th>cuntry </th> -->
<!-- 				<th>addr </th> -->
<!-- 				<th>join_date  </th> -->
<!-- 				<th>last_visit  </th> -->
<!-- 				<th>num_trans  </th> -->
<!-- 				<th>num_visits  </th> -->
<!-- 				<th>num_treatment</th> -->
<!-- 				<th>total_spent</th> -->
<!-- 				<th>act_satus</th> -->
<!-- 				<th>mass</th> -->
<!-- 				<th>height</th> -->
<!-- 		</tr> -->
<!-- 	</thead> -->
<!-- 	<tbody></tbody> -->
	
<!-- 	</table> -->
	<ul id="MemUl">
	
	</ul>
	
	
 <table id="AppTable" border="1" class="">
		<thead>
			<tr>
				<th>aid</th> 
				<th>apt_date</th> 
				<th>apt_time</th>
				<th>descrip</th>
				<th>purpose</th>
				<th>apt_status</th>
				<th>ename</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	
	 
	 
</body>
<script>

 
$(function() {
	$('#buttonLoad').click(function() {
		$('#AppTable > tbody').empty();//選擇後先清除欄位
		$('#MemUl').empty();
		var mid=$('#mid').val();
			$.ajax({
					'type':'get',
					'url':'app_check',
					'dataType' :'JSON',
					"data":{"action" : "fmid" , "mid" : mid},
					'success':function(data){
		//		var json = JSON.parse(data);
			 console.log(data);
					
					var cell1 = $('<li></li>').text('name：'+data.mem[0]["name"]);
	 				var cell2 = $('<li></li>').text('bday：'+data.mem[0]["bday"]);
	 				var cell3 = $('<li></li>').text('email：'+data.mem[0]["email"]);
	 				var cell4 = $('<li></li>').text('phone：'+data.mem[0]["phone"]);
	 				var cell5 = $('<li></li>').text('cuntry：'+data.mem[0]["cuntry"]);
	 				var cell6 = $('<li></li>').text('addr：'+data.mem[0]["addr"]);
	 				var cell7 = $('<li></li>').text('join_date：'+data.mem[0]["join_date"]);
	 				var cell8 = $('<li></li>').text('last_visit：'+data.mem[0]["last_visit"]);
	 				var cell9 = $('<li></li>').text('num_trans：'+data.mem[0]["num_trans"]);
	 				var cell10 = $('<li></li>').text('num_visits：'+data.mem[0]["num_visits"]);
	 				var cell11 = $('<li></li>').text('num_treatment：'+data.mem[0]["num_treatment"]);
	 				var cell12 = $('<li></li>').text('total_spent：'+data.mem[0]["total_spent"]);
	 				var cell13 = $('<li></li>').text('act_satus：'+data.mem[0]["act_satus"]);
	 				var cell14 = $('<li></li>').text('mass：'+data.mem[0]["mass"]);
	 				var cell15 = $('<li></li>').text('height：'+data.mem[0]["height"]);
	 				$('#MemUl').append(cell1).append(cell2).append(cell3).append(cell4)
						.append(cell5).append(cell6).append(cell7).append(cell8).append(cell9).append(cell10)
						.append(cell11).append(cell12).append(cell13).append(cell14).append(cell15);
					
				
				
			var applen= data.app.length;
			//console.log( data.app[0]["descrip"]);
			for (var i = 0; i < applen; i++) {
				 var purpose = data.app[i]["purpose"];   
				 var descrip = data.app[i]["descrip"];    
				 var apt_date = data.app[i]["apt_date"];
				 var apt_time = data.app[i]["apt_time"];
				 var ename = data.app[i]["ename"]; 
				 var aid = data.app[i]["aid"];  
				 var apt_status = data.app[i]["apt_status"];  
				 
					var cell1 = $('<td></td>').text(aid);
	 				var cell2 = $('<td></td>').text(apt_date);
	 				var cell3 = $('<td></td>').text(apt_time);
	 				var cell4 = $('<td></td>').text(descrip);
	 				var cell5 = $('<td></td>').text(purpose);
	 				var cell6 = $('<td></td>').text(apt_status);
	 				var cell7 = $('<td></td>').text(ename);
	 				var row = $('<tr></tr>').append(cell1).append(cell2).append(cell3).append(cell4)
	 						.append(cell5).append(cell6).append(cell7)
	 				$('#AppTable > tbody').append(row);
				}},
				"error" : function (data) {
					alert('查無資料');
				}
				
		})
	})})
</script>

</html>