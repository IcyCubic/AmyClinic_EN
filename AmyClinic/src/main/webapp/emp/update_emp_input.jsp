<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<!-- file input -->
<title>修改員工</title>
</head>

<body>
 <div id="wrapper"><!-- all -->  
<jsp:include page="/Backstage/jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->   
<script src="${pageContext.request.contextPath}/js/fileinput.js"></script>
     
 
<div id="page-wrapper" style=background-color:#000000  >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="red" style="text-align: center;">產品資料維護</font>
                 
                 </li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --> 
<!-- 開始 -->

	<c:if test="${not empty errorMsg}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsg}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
	 <div class="container">
	 <br>

 <form class="form-horizontal" role="form" ACTION="emp.do"  ENCTYPE="multipart/form-data" method="post">
		
		<div class="form-group">
      <label class="control-label col-sm-2" for="eid">員工編號</label>
      <div class="col-xs-4">          
        <input type="text"  class="form-control" id="eid"  size="45" name="eid"  readonly value="${request.empVO.eid}" >
      </div>
    </div>
		
		
			<div class="form-group">
      <label class="control-label col-sm-2" for="name">員工姓名</label>
      <div class="col-xs-4">          
        <input type="text"  class="form-control" id="name"  size="45" name="name"   value="${request.empVO.name}" >
      </div>
    </div>
    
<!--     		<div class="form-group"> -->
<!--       <label class="control-label col-sm-2" for="pwd">密碼</label> -->
<!--      <div class="col-xs-4">           -->
        <input type="hidden"  class="form-control" id="pwd"  size="45" name="pwd"  value="${request.empVO.pwd}" >
<!--       </div> -->
<!--     </div> -->
    
    
<!--     <div class="form-group"> -->
<!--       <label class="control-label col-sm-2" for="pwd2">重新輸入密碼</label> -->
<!--       <div class="col-xs-4">            -->
        <input type="hidden"  class="form-control" id="pwd2"  size="45" name="pwd2"  value="${request.empVO.pwd}" >
<!--       </div> -->
<!--     </div> -->
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">e-mail</label>
      <div class="col-xs-4">       
        <input type="text"  class="form-control" id="email"  size="45" name="email"  value="${request.empVO.email}" >
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="edu">教育程度</label>
      <div class="col-xs-4">         
        <input type="text"  class="form-control" id="edu"  size="45" name="edu"  value="${request.empVO.education}" >
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="exp">經歷</label>
      <div class="col-xs-4">          
        <textarea  class="form-control" rows="3" id="exp"   name="exp" >${request.empVO.experience}</textarea>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="spec">專長</label>
      <div class="col-xs-4">          
        <textarea  class="form-control" rows="3" id="spec"  size="45" name="spec" >${request.empVO.specialty}</textarea>
      </div>
    </div>
    
     <div class="form-group">
      <label class="control-label col-sm-2" for="spec">照片</label>
      <div class="col-xs-5">          
      <input type="file" name="photo" size="20" class="file" data-show-preview="false" >
<%--         <input type="text"  class="form-control" id="spec"  size="45" name="spec"  value="${request.empVO.specialty}" > --%>
      </div>
    </div>
    <div class="form-group">
    <div class="col-xs-2 col-xs-offset-2" >
	<img width='180' src='${pageContext.request.contextPath}/ShowEmpPic.servlet?num=${request.empVO.eid}' />
    </div>
    </div>

			<div class="form-group">
			<div class="col-xs-2 col-xs-offset-2" >
		<input type="hidden" name="action" value="update"><br>
		<input type="submit" value="送出修改" class="btn btn-info btn-block login">
		<br>
		<input type="button" value="一鍵修改"  id ="one" class="btn btn-default btn-sm">
		</div>
		</div>
		 
<!--   	<input type="button" name="returngo" value="上一頁"    -->
<%--     onclick="location.href='<%=request.getContextPath()%>/emp/GetAllEMP.jsp'" >  --%>
	</FORM>
</div>
</div>

</body>
<script type="text/javascript">
$(function(){
	$('#one').click(function() {
		$("#spec").text('雷射去斑/痣、雷射磨皮、脈衝光除痘、脈衝光回春、電波拉皮、美白針、玻尿酸、肉毒桿菌');
	})
})


</script>


</html>