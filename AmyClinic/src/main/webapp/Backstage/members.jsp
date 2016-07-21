<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@page import="group3.henry.login.model.*"%>

<!DOCTYPE html >
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="">
    <meta name="author" content="">
<style>
table {
	border-color: green;
	align: center;
}
th{
background-color:#D6D6AD;
}
</style>
</head>

<body>
<%
 	MemberVO memberVO= (MemberVO) request.getAttribute("memberVO");
  MemberServices memberSer = new MemberServices();
  List<MemberVO> list = memberSer.getAll();
  pageContext.setAttribute("list",list);
 %>
    <div id="wrapper"><!-- all -->
<jsp:include page="jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->
<div id="page-wrapper" style=background-color:#000000  >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
<!--                 <div class="page-header" > -->
<!--  <marquee  onMouseOver="this.stop()" onMouseOut="this.start()" bgcolor="#ADADAD" direction="right" height="20" scrollamount="8" behavior="alternate">本月目標<font color="red">30億</font></marquee>                                            -->
<!--                 </div> -->
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="#BFB2AB" style="text-align: center;">會員資料維護</font>
<!-- <form class="navbar-search pull-right"  ACTION="MemberServletTest" method="post"> -->
<!-- <input type="text" class="search-query" placeholder="請輸入姓名" value="getName_For_Update" /> -->

<!-- <input type="submit" value="會員資料維護" /> -->
<!-- </form> -->
<FORM METHOD="post" ACTION="MemberServletTest" >
       <select size="1" name="mid">
         <c:forEach var="MemberVO" items="${list}" > 
          <option value="${MemberVO.mid}">${MemberVO.name}
         </c:forEach>   
       </select>
       <input type="submit" value="查詢">
       <input type="hidden" name="action" value="getOne_For_Update">
     </FORM>
</li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over -->
<!--         開始 -->
 

 <table border='1'  class="table table-hover"  >
	<tr>
<!-- 		<th>照片</th>	 -->
		<th>詳細(點擊藍色姓名)</th>
<!-- 		<th>性別</th> -->
		<th>信箱</th>
		<th>生日</th>
		<th>國家/地址</th>
		<th>電話</th>
<!-- 		<th>身高/體重</th>	 -->
<!-- 		<th>交易/診療</th>	 -->
<!-- 		<th>來訪</th> -->
<!-- 		<th>獎勵/消費</th>	 -->
<!-- 		<th>最後消費日</th> -->
<!-- 		<th>加入日</th> -->
<!-- 		<th>狀態</th> -->
		<th><a href="addMember.jsp"><input type="submit" value="新增會員" class="btn btn-primary"></a>  </th>
	</tr>
	<%@ include file="jsp/page1_10.file" %>
	<c:forEach var="MemberVO"  items="${list}"  varStatus='i' begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr>
<%-- 			<td><img src="${pageContext.request.contextPath}/user_photo/${MemberVO.photo}"	class="preview" style="max-width: 100px; max-height: 100px;"></td> --%>
<!-- 			詳細資料 -->
			<td>
			<script><!-- 			性別 -->
			var i ='${MemberVO.gender}';
			if(i=='M'){document.write("男");}
			if(i=='F'){document.write("女");}
			if(i=='A'){document.write("中");}
			</script>
			<img src="${pageContext.request.contextPath}/user_photo/${MemberVO.photo}"	class="preview" style="max-width: 100px; max-height: 100px;">
			<button type="button" class="btn btn-link" data-toggle="collapse" data-target=" .${MemberVO.mid}">
  			${MemberVO.name}
			</button>
			</td>

<!-- 			<td> -->
			
<!-- 			</td> -->
<!-- 			信箱 -->
			<td>${MemberVO.email}</td>
			<td>${MemberVO.birthday}</td>
			<td>${MemberVO.country}-${MemberVO.addr}</td>
			<td>${MemberVO.phone}</td>
			
			<td>
			<FORM METHOD="post" ACTION="MemberServletTest">
			   <input type="hidden" name="mid" value="${MemberVO.mid}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
			     <input type="submit" value="修改" class="btn btn-success">
			    </FORM>
			</td>
		</tr>
		
<!-- 			下拉的-->
<tr>
<%-- <td class="${MemberVO.mid} collapse" ><img src="${pageContext.request.contextPath}/user_photo/${MemberVO.photo}"	class="preview" style="max-width: 100px; max-height: 100px;"></td> --%>
<td  colspan="6" class="${MemberVO.mid} collapse" >
<table><tr><td  >					
					身高:${MemberVO.height}公分<br>	
					體重:${MemberVO.mass}公斤<br>	
					交易:${MemberVO.num_trans}次	<br>	
					診療:${MemberVO.num_treatment}次<br>	
					來訪:${MemberVO.num_visits}次<br>
<%-- 					積點:${MemberVO.total_spent}點<br> --%>
					獎勵:${MemberVO.reward_pts}點<br>		
					消費:${MemberVO.spent_pts}點<br>	
					最後消費日:<br>${MemberVO.last_visit}<br>			
					加入日:<br><script>var d ='${MemberVO.join_date}';	document.write(d.substring(0,10));</script><br>		
					狀態:<c:if test="${MemberVO.act_status == 0}"><font>封鎖</font></c:if>			 
							  <c:if test="${MemberVO.act_status == 1}"><font>正常</font></c:if>	 
							  <c:if test="${MemberVO.act_status == 2}"><font>未開通</font></c:if>
</td></tr></table>
</td>				
</tr>
	</c:forEach>
	</table>  
	<%@ include file="jsp/page2.file" %>
<!--         結束 -->
        </div><!-- /#page-wrapper --><!-- ALL over	/#wrapper -->   
        <script>
        $('.btn-danger').collapse();
        </script>
        

        
</body>
</html>