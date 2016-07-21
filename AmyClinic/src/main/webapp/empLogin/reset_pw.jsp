<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap-theme.min.css" rel="stylesheet" >
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body{background: #eee url(${pageContext.request.contextPath}/images/sativa.jpg);}
form{background-color: white;
padding: 10px;
}


.my-error-class {
    color:red;
}

.my-valid-class {
    color:green;
}



html,body{
    position: relative;
    height: 100%;
}

.login-container{
    position: relative;
    width: 300px;
    margin: 80px auto;
    padding: 20px 40px 40px;
    text-align: center;
    background: #fff;
    border: 1px solid #ccc;
}

#output{
    position: absolute;
    width: 300px;
    top: -75px;
    left: 0;
    color: #fff;
}

#output.alert-success{
    background: rgb(25, 204, 25);
}

#output.alert-danger{
    background: rgb(228, 105, 105);
}


.login-container::before,.login-container::after{
    content: "";
    position: absolute;
    width: 100%;height: 100%;
    top: 3.5px;left: 0;
    background: #fff;
    z-index: -1;
    -webkit-transform: rotateZ(4deg);
    -moz-transform: rotateZ(4deg);
    -ms-transform: rotateZ(4deg);
    border: 1px solid #ccc;

}

.login-container::after{
    top: 5px;
    z-index: -2;
    -webkit-transform: rotateZ(-2deg);
     -moz-transform: rotateZ(-2deg);
      -ms-transform: rotateZ(-2deg);

}

.avatar{
    width: 100px;height: 100px;
    margin: 10px auto 30px;
    border-radius: 100%;
    border: 2px solid #aaa;
    background-size: cover;
}

.form-box input{
    width: 100%;
    padding: 10px;
    text-align: center;
    height:40px;
    border: 1px solid #ccc;;
    background: #fafafa;
    transition:0.2s ease-in-out;

}

.form-box input:focus{
    outline: 0;
    background: #eee;
}

.form-box input[type="text"]{
    border-radius: 5px 5px 0 0;
    text-transform: lowercase;
}

.form-box input[type="password"]{
    border-radius: 0 0 5px 5px;
    border-top: 0;
}

.form-box button.login{
    margin-top:15px;
    padding: 10px 20px;
}

.animated {
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInUp {
  0% {
    opacity: 0;
    -webkit-transform: translateY(20px);
    transform: translateY(20px);
  }

  100% {
    opacity: 1;
    -webkit-transform: translateY(0);
    transform: translateY(0);
  }
}

@keyframes fadeInUp {
  0% {
    opacity: 0;
    -webkit-transform: translateY(20px);
    -ms-transform: translateY(20px);
    transform: translateY(20px);
  }

  100% {
    opacity: 1;
    -webkit-transform: translateY(0);
    -ms-transform: translateY(0);
    transform: translateY(0);
  }
}

.fadeInUp {
  -webkit-animation-name: fadeInUp;
  animation-name: fadeInUp;
}

</style>


<title>重設密碼</title>
</head>
<body>
 
 <div class="container">
 
 
 <div class="row ">
 <div class="alert alert-success col-xs-6 col-xs-offset-3">
  <strong>重設密碼</strong> 
</div>
 <form  class="col-xs-6 col-xs-offset-3">
 
  <div class="form-group" >
    <label for="password" id="pwdlab">新密碼</label> <span id="pwdsp"></span>
    <input type="password"  name="pwd"  class="form-control " id="pwd" placeholder="最少4個字元" required>
  </div>
  <div class="form-group">
    <label for="password">請重複輸入密碼</label>
    <input type="password" name="pwd2" class="form-control " id="pwd2" placeholder="最少4個字元" required>
  </div>
  <button type="button" id="submit" class="btn btn-default">送出</button>
<a href="<%=request.getContextPath()%>\empLogin\login.jsp" class="btn btn-info">回登入頁</a>  
</form>
</div>
 </div>
 
<!-- <FORM METHOD="post" ACTION="EmpLoginServlet.do" name="form1" enctype="multipart/form-data"> -->
<!-- 		<table border="0"> -->
<!-- 			<tr> -->
<!-- 				<td>密碼</td> -->
<!-- 				<td><input type="password" name="pwd"  size="20" ></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>重新輸入密碼</td> -->
<!-- 				<td><input type="password" name="pwd2" size="20" ></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 		<input type="hidden" name="action" value="change_pw"><br> -->
<!-- 		<input type="submit" value="送出修改"> -->
<!-- 	</FORM> -->
</body>
<script type="text/javascript">
$(function(){
$('#pwd2').keyup(function(){
	var pwd = $('#pwd').val();
	var pwd2 = $('#pwd2').val();
	if(pwd.length < 4|| pwd2.length < 4){
		$('#mspan').remove();
		$('#pwdlab').append("<span class='text-danger errclass' id='mspan' style='float: right;'>&nbsp &nbsp 密碼太短!!</span>");
		$('#submit').attr('disabled','disabled');
		return;		
	}else{
		$('#submit').removeAttr('disabled');
	}
	
	
	 if(pwd != pwd2){
			$('#mspan').remove();
	         $('#pwdlab').append("<span class='text-danger errclass' id='mspan' style='float: right;'>&nbsp &nbsp 密碼不同!!</span>");
	         $('#submit').attr('disabled','disabled');
	         return;
		}
			else{
				$('#mspan').remove();
				$('#submit').removeAttr('disabled');
			}
			
			
			
			
 })})

$(function(){
	$('#submit').click(function(){
	 	var pwd = $('#pwd').val();
	 	var pwd2 = $('#pwd2').val();
		$.ajax({
			'type':'post',
			'url':'EmpLoginServlet.do',
			'dataType' :'TEXT',
			"data":{"action" : "change_pw" , "pwd" : pwd , "pwd2" : pwd2},
			'success':function(data){
				if(data=="success")
					alert(data);
				alert("密碼更新成功，請重新登入");
			},
			'error' : function(){
				alert("認證信已失效，請重新操作");
			}
			
			
		})
		
		
	})})

</script>
</html>


