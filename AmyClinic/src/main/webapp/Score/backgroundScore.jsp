<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>後台評論版管理系統</title>
<style>
p{
width:400px;
font-size:15px;
margin-left : 4em; 
}

</style>
</head>
<body>

	<select id="selectEmp">
		<option>請選擇</option>
	
	</select>
	
	
	
	<table border="1px"  >
		
		<tr>
			<th width="150px" >會員名稱</th>
			<th width="200px">被評分員工</th>
			<th width="100px">分數</th>
			<th width="400px">留言</th>
			<th width="200px">最後新增修改的日期</th>
			<th width="100px">狀態欄</th>
			<th width="75px">確認修改</th>
			 
		</tr>

	</table>
	
		<table border="1px" id="firstTable" >
		<tbody></tbody>


	</table>
	<script src="../js/jquery-1.9.1.js"></script>
	<script>
	$(function(){

		$.getJSON('ScoreServlet',{'action':'ListAllScores'},function(data){
			$.each(data,function(i,scoreVO){
				var cell1 = $("<td width='150px' ></td>").text(scoreVO.MebName);
				var cell2 = $("<td width='200px'></td>").text(scoreVO.EmpName);
				var cell3 = $("<td width='100px'></td>").text(scoreVO.Score);
				var cell4 = $("<td width='400px'></td>").text(scoreVO.Comment);
				var cell5 = $("<td width='200px'></td>").text(scoreVO.ScoreDate);
				var cell6 = $("<td width='100px'></td>").html("<select id='st"+i+"'><option value='0'>屏蔽該留言</option><option value='1'>正常</option></select>");
				var cell7 = $("<td width='75px'></td>").html("<form name='f"+i+"' action='ScoreServlet'><input type='hidden' id='stt"+i+"' name='st' value='"+scoreVO.St+"'><input type='submit' value='修改'><input type='hidden'name='scoreId' value='"+scoreVO.ScoreId+"'><input type='hidden' name='action' value='adjustSt'></form>");
				var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
				$("#firstTable>tbody").append(row);
				$("#st"+i).val(scoreVO.St);
				$("#st"+i).change(function(){
					var x=$("#st"+i).val();
					$("#stt"+i).val(x);

				});
				
				
				  
			})

		})
		
		
		
			$.getJSON('ScoreServlet',{'action':'getEmpScore'},function(data){
				$.each(data,function(i,emp){
					var cell1 = $("<option value='"+emp.eid+"'></option>").text(emp.name);
					$("#selectEmp").append(cell1);
					
					
				})
				
			})
			
	})
	
	$("#selectEmp").change(function(){
		var eid =$("#selectEmp").val();
	
		$.getJSON('ScoreServlet',{'action':'ListAllScores'},function(data){
			$("#firstTable").empty();
			$.each(data,function(i,scoreVO){

				if(scoreVO.Eid==eid){
				var cell1 = $("<td width='150px' ></td>").text(scoreVO.MebName);
				var cell2 = $("<td width='200px'></td>").text(scoreVO.EmpName);
				var cell3 = $("<td width='100px'></td>").text(scoreVO.Score);
				var cell4 = $("<td width='400px'></td>").text(scoreVO.Comment);
				var cell5 = $("<td width='200px'></td>").text(scoreVO.ScoreDate);
				var cell6 = $("<td width='100px'></td>").html("<select id='st"+i+"'><option value='0'>屏蔽該留言</option><option value='1'>正常</option></select>");
				var cell7 = $("<td width='75px'></td>").html("<form name='f"+i+"' action='ScoreServlet'><input type='hidden' id='stt"+i+"' name='st' value='"+scoreVO.St+"'><input type='submit' value='修改'><input type='hidden'name='scoreId' value='"+scoreVO.ScoreId+"'><input type='hidden' name='action' value='adjustSt'></form>");
				var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
				$("#firstTable").append(row);
				$("#st"+i).val(scoreVO.St);
				$("#st"+i).change(function(){
					var x=$("#st"+i).val();
					$("#stt"+i).val(x);

				});
				
				}
				  
			})

		})
	});
	
	
	</script>
	

</body>
</html>