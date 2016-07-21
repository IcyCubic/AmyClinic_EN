<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/bootstrap-theme.min.css" rel="stylesheet" >
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

.my-error-class {
    color:red;
}

.my-valid-class {
    color:green;
}


body{background: #eee url(${pageContext.request.contextPath}/images/sativa.jpg);}
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



<title>Amy後台登入系統</title>
</head>
<body>


<!-- <h2 align="center">AAAAAAAAAAA</h2> -->

<div class="container">
	<div class="login-container">
            <div id="output"></div>
            <div class="avatar"></div>
            <div class="form-box">
                <form action="" method="">
                    <input type="text" name="maillog" id="maillog" placeholder="usermail">
                    <input type="password" id="pwdlog" placeholder="password">
                    <button class="btn btn-info btn-block login" type="button" id="loginbtn">Login</button>
<!--                     <a href='' onclick="javascript:OpenLink('http://localhost:8081/AmyClinic/empLogin/AddEMP.jsp'); return false;">新增員工</a> -->
 						<a href='${pageContext.request.contextPath}\empLogin/AddEMP.jsp'>新增員工</a>
<!--                        <a href="" class="text-primary" data-toggle="modal" data-target="#addemp">Addemp</a> -->
                      <a href="#" class="text-primary" data-toggle="modal" data-target="#resetpw">重設密碼</a>
                       <a href="#" class="text-primary" id="one">一鍵輸入</a>
<%--                     <a class="add_fpw" href="<%=request.getContextPath()%>/empLogin/foget_pw.jsp">忘記密碼</a> --%>
<!--                     <a style="font-size: 5px;">忘記密碼</a> -->
                </form>
            </div>
        </div>
        
</div>




<!-- =========================忘記密碼dialog============================== -->

<div class="container">

  <!-- Modal -->
  <div class="modal fade" id="resetpw" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">請輸入您的email帳號</h4>
        </div>
        <div class="modal-body">
        
<form role="form">
  <div class="form-group">
    <label for="email" id="maillab">Email</label>
    <input type="email" class="form-control" id="remail">
  </div>
   <button type="submit" class="btn btn-default" id="rebtn" >送出</button>
    <button type="button" class="btn btn-default" id="one2" >一鍵輸入</button>
</form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div> 

<script type="text/javascript">

$(function(){
	$('#one').click(function() {
		$("#maillog").val('qazwsx851827@gmail.com');
		$("#pwdlog").val('0000');
	})
})
	
$(function(){
	$('#one2').click(function() {
		$("#remail").val('qazwsx851827@gmail.com');
	})
})	
	
	
	

$("#pwdlog").keypress(function(e){
	code = (e.keyCode ? e.keyCode : e.which);
	if (code == 13)
	{
	     //targetForm是表單的ID
	 $("#loginbtn").click();
	}
	});


//====================確認帳號是否存在==================================
$(function(){
	$('#remail').keyup(function(){
		var regmail = $('#remail').val();
		$.ajax({
			'type':'post',
			'url':'emp.do',
			'dataType' :'TEXT',
			"data":{"action" : "checkmail" , "regmail" : regmail},
			'success':function(data){
				if(data == "notnull"){
					$('#mspan').remove();
					$('#maillab').append("<span class='text-success' id='mspan' style='float: right;'>&nbsp &nbsp 帳號存在!!</span>");
					$('#rebtn').removeAttr('disabled');
					return;
				}else{
					$('#mspan').remove();
					$('#maillab').append("<span class='text-danger' id='mspan' style='float: right;'>&nbsp &nbsp 帳號不存在!!</span>");
					$('#rebtn').attr('disabled','disabled');
					return;
				}
				
			}
			
		});
	});
});	




// ====================登入Ajax==================================

	
	
$(function() {
	var textfield = $("input[name=maillog]");
	//$('button[type="button"]').click(function() {
		$('#loginbtn').click(function() {
		//alert("btn click")
		var maillog = $('#maillog').val();
		var pwdlog = $('#pwdlog').val();
		$.ajax({
			'type':'post',
			'url':'EmpLoginServlet.do',
			'dataType' :'TEXT',
			"data":{"action" : "loginAjax" , "mail" : maillog , "pwd" : pwdlog},
			'success':function(data){
			//	alert(data);
				//little validation just to check username
                if (data == "success") {
                    //$("body").scrollTo("#output");
                    $('.add_fpw').removeClass();
                    $("#output").addClass("alert alert-success animated fadeInUp").html("Welcome back " + "<span style='text-transform:uppercase'>" + textfield.val() + "</span>");
                    $("#output").removeClass(' alert-danger');
                    $("input").css({
                    "height":"0",
                    "padding":"0",
                    "margin":"0",
                    "opacity":"0"
                    });
                    //change button text 
                    $('button[type="submit"]').html("continue")
                    .removeClass("btn-info")
                    .addClass("btn-default").click(function(){
                    $("input").css({
                    "height":"auto",
                    "padding":"10px",
                    "opacity":"1"
                    }).val("");
                    });
                    
                    //show avatar
                    $(".avatar").css({
                        "background-image": "url('<%=request.getContextPath()%>/ShowPicByAjax')"
                        
                    });
                    setTimeout(login, 1500 )
                    function login(){
                    	window.location = "<%=request.getContextPath()%>/Backstage/b_login.jsp";
                    }
                    
                } else {
                    //remove success mesage replaced with error message
                    $("#output").removeClass(' alert alert-success');
                    $("#output").addClass("alert alert-danger animated fadeInUp").html("帳號錯誤");
                }
                //console.log(textfield.val());
				
				
			}
		})
			
	})})
	
	//====================忘記密碼ajax==================================
$(function() {
	$('#rebtn').click(function(){
		var remail = $('#remail').val();
		$.ajax({
		'type':'get',
		'url' :'EmpLoginServlet.do',
		'datatype' : 'text',
		'data':{"action" : "forgetpwAjx" , "restmail" : remail},
		'success':function(data){
			// console.log(data);
			 console.log(data);
			 return;
		}
			
		})
		
	})
})


	
	

</script>
</body>
</html>