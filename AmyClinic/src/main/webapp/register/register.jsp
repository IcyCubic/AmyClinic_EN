<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<link href="${pageContext.request.contextPath}/General/css/jquery-ui.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/General/js/jquery-ui.min.js"></script>
<link href="${pageContext.request.contextPath}/register/css/register.css" 	rel="stylesheet" type="text/css" media="screen" />
<title>會員註冊</title>
<s:head theme="xhtml" />
</head>
<body>
	
	<s:include value="/General/header.jsp"></s:include>

	<div id="page">

			<div class="post">
				<h1 class="ribbon">
					<strong class="ribbon-content">註冊會員</strong>
				</h1>
				<div class="clr"></div>
				<ul>
					<li id="sform"><b id="readme"><font color="red">
								星號(*)代表必要資訊</font></b> <s:form namespace="/logreg" action="register"
							enctype="multipart/form-data" method="post">
							<s:textfield name="memberVO.name" label="會員帳號"
								placeholder="User ID" required="true" id="username" />
							<s:password name="memberVO.pwd" label="會員密碼"
								placeholder="Password" required="true" id="password" />
							<s:textfield name="memberVO.email" label="電子信箱"
								placeholder="abc@xyz.com" required="true" id="email" />
							<s:textfield name="memberVO.birthday" label="出生日期"
								value="2016-05-20" id="birthday" readonly="true" />
							<s:select name="memberVO.country" headerKey="" headerValue="選擇國籍"
								label="國籍"
								list="#{'Taiwan':'Taiwan','United States':'United States', 'Japan':'Japan','Korea':'Korea'}"
								id="country" />
							<s:select name="memberVO.gender" headerKey="" headerValue="選擇性別"
								label="性別" list="#{'M':'Male','F':'Female'}" required="true"
								id="gender" />
							<s:textfield name="memberVO.addr" label="用戶地址"
								placeholder="123 Somewhere!" required="true" id="address" />
							<s:textfield name="memberVO.phone" label="電話號碼"
								placeholder="0912345678" required="true" id="phone" />
							<s:textfield name="memberVO.height" label="身高" placeholder="180"
								id="height" />
							<s:textfield name="memberVO.mass" label="體重" placeholder="60"
								id="weight" />
							<div class="box">
								<div class="tablelayout">
									<div class="box-left">
										<label id="pic">照片<!-- <font color="red">*</font> -->:
										</label> <span class="file-wrapper"> <s:file
												name="fileUpload" label="會員圖片" size="40" id="uploader"
												theme="simple" /> <span class="btn">上傳我的照片</span>
										</span>
									</div>
									<div class="box-right">
										<img id="img-uploaded"
											src="${pageContext.request.contextPath}/register/img/text.png"
											alt="你的照片" />
									</div>
								</div>
							</div>

							<s:submit value="建立帳號" method="register" id="button-0" />
						</s:form></li>
				</ul>
				<div style="color: red;">${message}</div>

			</div>


	</div>

	<s:include value="/General/footer.jsp"></s:include>


	<script>
		$(function() {
			$(":text").attr("autocomplete", "off");
		});
	</script>
	<script type="text/javascript">
		var SITE = SITE || {};

		SITE.fileInputs = function() {
			var $this = $(this), $val = $this.val(), valArray = $val
					.split('\\'), newVal = valArray[valArray.length - 1], $button = $this
					.siblings('.btn'), $fakeFile = $this
					.siblings('.file-holder');
			if (newVal !== '') {
				$button.text('換一張照片');
			}
		};

		$('.file-wrapper input[type=file]').bind('change focus click',
				SITE.fileInputs);

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				var tmppath = URL.createObjectURL(event.target.files[0]);

				reader.onload = function(e) {
					$('#img-uploaded').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$("#uploader").change(function() {
			readURL(this);
		});
	</script>
	<script>
$(document).ready(function() {    
	var d = new Date();		
	var dynamicDate = new Date(d.setFullYear(d.getFullYear() - 22));	
	$('#birthday').datepicker({buttonImage: "${pageContext.request.contextPath}/register/img/Calendar.png"});
	$("#birthday").datepicker("setDate", dynamicDate);
}); 


</script>
</body>
</html>
