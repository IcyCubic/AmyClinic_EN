<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>

<!-- bootstrap -->
<!-- 最新編譯和最佳化的 CSS -->
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/bootstrap.css">
<!-- 選擇性佈景主題 -->
<link rel="stylesheet" 	href="${pageContext.request.contextPath}/css/bootstrap-theme.css">
<!-- 最新編譯和最佳化的 JavaScript -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<!-- file input -->
<script src="${pageContext.request.contextPath}/js/fileinput.js"></script>
<link rel="stylesheet" 	href="${pageContext.request.contextPath}/css/fileinput.css">


<style type="text/css">
.container{
	width: 1000px;
};
</style>


<head>


<title>新增員工</title>

  
</head>

<body>
	 
	
	
<form ACTION="emp.do" class="form-horizontal"  method=post   enctype="multipart/form-data"> 
<fieldset> 


<!-- Form Name -->
<legend align="center">愛美員工-> 新增員工 </legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-xs-4 control-label" for="textinput">員工姓名</label>  
  <div class="col-xs-4">
  <input id="textinput" name="name" type="text" value="${request.empVO.name}" class="form-control input-md">
  </div> <span style="color:red">${errorMsg.ename}</span>
</div> 

<!-- Text input-->
<div class="form-group">
  <label class="col-xs-4 control-label" for="textinput">密碼</label> 
  <div class="col-xs-4">
  <input id="textinput" name="pwd" type="password" placeholder="英文字母、數字 , 且長度必需在4到10之間" class="form-control input-md">
  </div><span style="color:red">${errorMsg.npwd}</span><span style="color:red">${errorMsg.pwdReg}</span>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-xs-4 control-label" for="textinput">重新輸入密碼</label>  
  <div class="col-xs-4">
  <input id="textinput" name="pwd2" type="password" placeholder="英文字母、數字 , 且長度必需在4到10之間" class="form-control input-md">
  </div><span style="color:red">${errorMsg.npwd2}</span>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-xs-4 control-label" for="textinput">e-mail</label>  
  <div class="col-xs-4">
  <input id="textinput" name="email" type="text" value="${request.empVO.email}" placeholder="abc@amy.com" class="form-control input-md">
  </div><span style="color:red">${errorMsg.email}</span>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-xs-4 control-label" for="textinput">教育程度</label>  
  <div class="col-xs-4">
  <input id="textinput" name="edu" type="text" value="${request.empVO.education}" placeholder="" class="form-control input-md">
      </div><span style="color:red">${errorMsg.edu}</span>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-xs-4 control-label" for="textinput">經歷</label>  
  <div class="col-xs-4">
  <textarea name="exp" rows="3"  placeholder="" class="form-control input-md">${request.empVO.experience}</textarea>
  </div><span style="color:red">${errorMsg.exp}</span>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-xs-4 control-label" for="textinput">專長</label>  
  <div class="col-xs-4">
  <textarea name="spec" rows="3"  placeholder="" class="form-control input-md">${empVO.specialty}</textarea>
  </div><span style="color:red">${errorMsg.spec}</span>
</div>


<!-- File Button --> 
<div class="form-group">
  <label class="col-xs-4 control-label" for="filebutton">照片</label>
  <div class="col-xs-4">
    <input id="input-1" name="photo" type="file" class="file" data-show-preview="false">
  </div>
</div>


	
<!-- Button -->
<div class="form-group">
  <label class="col-xs-4 control-label" for="singlebutton"></label>
  <div class="col-xs-4">
  	<input type="hidden" name="action" value="insert">
    <input type="submit" id="singlebutton" name="singlebutton" class="btn btn-info btn-block login" value="送出新增">
  </div>
</div>


<div class="form-group">
 <label class="col-xs-4 control-label" for="singlebutton"></label>
<div class="col-xs-4">
<a href="${pageContext.request.contextPath}\empLogin\login.jsp"  class="btn btn-default">取消</a>
</div>
</div>
 
</fieldset>
 
</form>


</body>


<script>
// $(function (){
 
//     function format_float(num, pos)
//     {
//         var size = Math.pow(10, pos);
//         return Math.round(num * size) / size;
//     }
 
//     function preview(input) {
 
//         if (input.files && input.files[0]) {
//             var reader = new FileReader();
            
//             reader.onload = function (e) {
//                 $('.preview').attr('src', e.target.result);
//                 var KB = format_float(e.total / 1024, 2);
//                 $('.size').text("檔案大小：" + KB + " KB");
//             }
 
//             reader.readAsDataURL(input.files[0]);
//         }
//     }
 
//     $("body").on("change", ".upl", function (){
//         preview(this);
//     })
    
// })
</script>
</html>