<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
p{
width:400px;
font-size:15px;
margin-left : 4em; 
}
</style>
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
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="#BFB2AB" style="text-align: center;">留言維護</font>

<select id="selectEmp" ><option>醫師名稱</option></select>
</li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over -->    
<!--         開始 -->
		<table border="1px" id="firstTable"  class="table table-hover">
		<tbody>
		<tr>
			<th width="150px" >會員名稱</th>
			<th width="200px">被評分員工</th>
			<th width="100px">分數</th>
			<th width="400px">留言</th>
			<th width="200px">最後新增修改的日期</th>
			<th width="100px">狀態欄</th>
			<th width="75px">確認修改</th>
		</tr>
		</tbody>
		</table>
	

	<script>
	$(function(){
		console.log('1');
		$.getJSON('${pageContext.request.contextPath}/Score/ScoreServlet',{'action':'ListAllScores'},function(data){
			console.log('1-1');
			$.each(data,function(i,scoreVO){
				console.log('2');
				var cell1 = $("<td width='150px' ></td>").text(scoreVO.MebName);
				var cell2 = $("<td width='200px'></td>").text(scoreVO.EmpName);
				var cell3 = $("<td width='100px'></td>").text(scoreVO.Score);
				var cell4 = $("<td width='400px'></td>").text(scoreVO.Comment);
				var cell5 = $("<td width='200px'></td>").text(scoreVO.ScoreDate);
				console.log('3');
				var cell6 = $("<td width='100px'></td>").html("<select id='st"+i+"'><option value='0'>屏蔽該留言</option><option value='1'>正常</option></select>");
				var cell7 = $("<td width='75px'></td>").html("<form name='f"+i+"' action='${pageContext.request.contextPath}/Score/ScoreServlet'><input type='hidden' id='stt"+i+"' name='st' value='"+scoreVO.St+"'><input type='submit' value='修改' class='btn btn-success'><input type='hidden'name='scoreId' value='"+scoreVO.ScoreId+"'><input type='hidden' name='action' value='adjustSt'></form>");
				console.log('4');
				var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
				$("#firstTable>tbody").append(row);
				$("#st"+i).val(scoreVO.St);
				$("#st"+i).change(function(){
					var x=$("#st"+i).val();
					$("#stt"+i).val(x);
				});												  
			})
		})						
			$.getJSON('${pageContext.request.contextPath}/Score/ScoreServlet',{'action':'getEmpScore'},
					function(data){
				console.log('sel1');
				$.each(data,function(i,emp){
					var cell1 = $("<option value='"+emp.eid+"'></option>").text(emp.name);
					$("#selectEmp").append(cell1);										
				})				
			})			
	})
	
	$("#selectEmp").change(function(){
		var eid =$("#selectEmp").val();
	
		$.getJSON('${pageContext.request.contextPath}/Score/ScoreServlet',{'action':'ListAllScores'},
				function(data){
			$("#firstTable").empty();
			
			var cell0 = $("<tr><th width='150px' >會員名稱</th><th width='200px'>被評分員工</th><th width='100px'>分數</th><th width='400px'>留言</th><th width='200px'>最後新增修改的日期</th><th width='100px'>狀態欄</th><th width='75px'>確認修改</th></tr>");
			var th=$('<table border="1px"  id="firstTable"  class="table table-hover"></table>').append(cell0);
			$("#firstTable").append(th);
			
			$.each(data,function(i,scoreVO){

				if(scoreVO.Eid==eid){
				var cell1 = $("<td width='150px' ></td>").text(scoreVO.MebName);
				var cell2 = $("<td width='200px'></td>").text(scoreVO.EmpName);
				var cell3 = $("<td width='100px'></td>").text(scoreVO.Score);
				var cell4 = $("<td width='400px'></td>").text(scoreVO.Comment);
				var cell5 = $("<td width='200px'></td>").text(scoreVO.ScoreDate);
				var cell6 = $("<td width='100px'></td>").html("<select id='st"+i+"'><option value='0'>屏蔽該留言</option><option value='1'>正常</option></select>");
				var cell7 = $("<td width='75px'></td>").html("<form name='f"+i+"' action='${pageContext.request.contextPath}/Score/ScoreServlet'><input type='hidden' id='stt"+i+"' name='st' value='"+scoreVO.St+"'><input type='submit' value='修改' class='btn btn-success'><input type='hidden'name='scoreId' value='"+scoreVO.ScoreId+"'><input type='hidden' name='action' value='adjustSt'></form>");
				var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4,cell5,cell6,cell7]);
				$("#firstTable").append(row);
				$("#st"+i).val(scoreVO.St);
				$("#st"+i).change(function(){
					var x=$("#st"+i).val();
					$("#stt"+i).val(x);
					});
				}
				}
			)
			}
		)
		});	
	</script>
	</div>
</body>
</html>