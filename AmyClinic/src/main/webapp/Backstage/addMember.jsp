<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
	.disable{ 
		border:none; 
 	}	 
 	.ui-datepicker-trigger { 
 		padding:0px; 
 		padding-left:5px; 
 		vertical-align:baseline;	 
 		position:relative; 
 		top:4px; 
		height:18px; 
 		cursor: pointer; 
 	} 
 	.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year { 
       color: black;  font-size: 16px;  font-weight: bold;
/*        font-family: ...;  */
       } 
    
/* 	#userphoto{	border-radius:25px;}  */
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
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="#BFB2AB" style="text-align: center;" id="add">新增會員</font></li></ol>
                    <script>
                 $( '#add' ).click(function( event ) {
                	 $("#membername").val('畢業的會員');
                	 $("#memberpwd").val('1234');
                	 $("#memberemail").val('k3345678@yahoo.com');
                	 $("#memberbirthday").val('1996-12-12');
                	 $("#country").val('台灣');
                	 $("#membergender").val('男人');
                	 $("#memberaddr").val('台北市大安區復興南路一段390號');
                	 $("#memberphone").val('0983345678');
                	 $("#memberheight").val('180');
                	 $("#membermass").val('50');
                 });
                 </script>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over -->   
<!--         開始 -->
<form role="form" class="form-horizontal" method="post" action="MemberServletTest">
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="memberid">Member ID: </label> -->
<!-- 		<div class="col-sm-5"> -->
<%-- 			<input name="memberVO.mid" id="memberid" class="form-control disable" type="text" value="${memberVO.mid}" readonly/>			 --%>
<!-- 		</div> -->
<!-- 	</div> --><br>
	<div class="form-group">
		<label class="control-label col-sm-2" for="membername">姓名: </label>
		<div class="col-sm-5">
			<input name="name" id="membername" class="form-control required"  type="text" placeholder="真實姓名" 		style="width:120px;"/><em>(必填)</em>
			
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberpwd">密碼: </label>
		<div class="col-sm-5">
			<input name="pwd" id="memberpwd" class="form-control disable" type="password" placeholder="4碼以上" 	style="width:120px;"/><em>(必填)</em>
		</div>
		
<%-- 		<div class="col-sm-1"><a class="btn btn-default" href="${pageContext.request.contextPath}/member/changepw.action">Change Password</a>		</div> --%>
	
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberemail">信箱: </label>
		<div class="col-sm-5">
			<input name="email" id="memberemail" class="form-control" type="email" placeholder="信箱不得重複"	style="width:180px;"	/><em>(必填)</em>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberbirthday">生日: </label>
		<div class="col-sm-5">
<!-- 		<input name="birthday" id="memberbirthday" type="date"   style="width:180px;"	/> -->
			<input name="birthday" id="memberbirthday"  type="text"  readonly style="width:100px;"	placeholder="日期選擇器"  />
		</div>
	</div>
	<script >
	/*
	function ShowStr(x){
	var Str=document.getElementById(memberbirthday).value;	alert(Str);}
	*/
	</script>

	<div class="form-group">
		<label class="control-label col-sm-2" for="membercountry">國家: </label>
		<div class="col-sm-5">
<!-- 			<input name="memberVO.country" id="membercountry" class="form-control" type="text" 	placeholder="庫存量"		style="width:80px;"/> -->
		<select name='country'  data-style="btn-success" class="form-control form-control-sm"  style="width: 150px" id="country">
  			<option value="台灣">台灣</option>
  			<option value="美國">美國</option>
  			<option value="日本">日本</option>
  			<option value="其他">其他</option>
		</select>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="membergender">性別: </label>
		<div class="col-sm-5">
<!-- 			<input name="memberVO.gender" id="membergender" class="form-control" type="text" placeholder="庫存量"	style="width:80px;"/> -->
		<select name='gender'  id="membergender" data-style="btn-warning" class="form-control form-control-sm"  style="width: 150px">
  			<option value="M">男人</option>
  			<option value="F">女人</option>
  			<option value="A">其他</option>
		</select>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberaddr">地址: </label>
		<div class="col-sm-5">
			<input name="addr" id="memberaddr" class="form-control" type="text" placeholder="居住地"		/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberphone">電話: </label>
		<div class="col-sm-5">
			<input name="phone" id="memberphone" class="form-control" type="text" placeholder="0988123456"	style="width:180px;"/><em>(必填)</em>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="memberheight">身高: </label>
		<div class="col-sm-5">
			<input name="height" id="memberheight" class="form-control" type="number" placeholder="公分"	style="width:80px;"/>
		</div>
	</div>
	
	<div class="form-group">
		<label class="control-label col-sm-2" for="membermass">體重: </label>
		<div class="col-sm-5">
			<input name="mass" id="membermass" class="form-control" type="number" placeholder="公斤"	style="width:80px;"/>
		</div>
		
<!-- 		<label class="control-label col-sm-2"></label> -->
<%--  	<input type="hidden" name="memberVO.verify" value="${memberVO.verify}"> <!-- 	</div> --> --%>
<%--  	<input type="hidden" name="memberVO.photo" value="${memberVO.photo}"> <!-- 	</div> --> --%>
<%--  	<input type="hidden" name="memberVO.total_spent" value="${memberVO.total_spent}"> <!-- 	</div> --> --%>
<%--  	<input type="hidden" name="memberVO.memo" value="${memberVO.memo}"> <!-- 	</div> --> --%>
 	<input type="hidden" name="act_status" value="2"> <!-- 	狀態 -->
 	<input type="hidden" name="action" value="add"> <!-- 	</div> -->
	<button type="submit" class="btn btn-success" >新增會員</button>	
		
	</div>
<!-- 	<div class="form-group"> -->
<!-- 		<label class="control-label col-sm-2" for="memberphoto">照片: </label> -->
<!-- 		<div class="col-sm-5"> -->
<%-- 			<input name="memberVO.photo" id="memberphoto" class="form-control" type="text" value="${memberVO.photo}"/> --%>
<!-- 		</div> -->


<%-- <h3>${memberVO.name}</h3> <img id="userphoto" src='${pageContext.request.contextPath}/user_photo/${memberVO.photo}' height="150" width="150"> --%>
<!-- <div class="form-group"> -->
<!-- <label class="control-label col-sm-2" for="memberVO.photo">照片</label> -->
<!-- <div class="col-sm-10"> -->
<!--     <input type='file' class="upl"  name="memberVO.photo"> -->
<!-- </div> -->
<!--     <div> -->
<!--         <img class="preview" style="max-width: 150px; max-height: 150px;"> -->
<!--         <div class="size"></div> -->
<!--     </div> -->
<!--     </div> -->

							
	<hr>
</form>
<script type="text/javascript">
/*$(function (){ 
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
    function preview(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();           
            reader.onload = function (e) {
                $('.preview').attr('src', e.target.result);
                var KB = format_float(e.total / 1024, 2);
                $('.size').text("檔案大小：" + KB + " KB");
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("body").on("change", ".upl", function (){
        preview(this);
    }) 
})
$("body").on("change", ".upl", function (){
    preview(this);
})
/**
 * 預覽圖
 * @param   input 輸入 input[type=file] 的 this
 *//*
function preview(input) {
 
    // 若有選取檔案
    if (input.files && input.files[0]) {
 
        // 建立一個物件，使用 Web APIs 的檔案讀取器(FileReader 物件) 來讀取使用者選取電腦中的檔案
        var reader = new FileReader();
 
        // 事先定義好，當讀取成功後會觸發的事情
        reader.onload = function (e) {
            
            console.log(e);
 
            // 這裡看到的 e.target.result 物件，是使用者的檔案被 FileReader 轉換成 base64 的字串格式，
            // 在這裡我們選取圖檔，所以轉換出來的，會是如 『data:image/jpeg;base64,.....』這樣的字串樣式。
            // 我們用它當作圖片路徑就對了。
            $('.preview').attr('src', e.target.result);
 
            // 檔案大小，把 Bytes 轉換為 KB
            var KB = format_float(e.total / 1024, 2);
            $('.size').text("檔案大小：" + KB + " KB");
        }
 
        // 因為上面定義好讀取成功的事情，所以這裡可以放心讀取檔案
        reader.readAsDataURL(input.files[0]);
    }
}
/**
 * 格式化
 * @param   num 要轉換的數字
 * @param   pos 指定小數第幾位做四捨五入
 *//*
function format_float(num, pos)
{
    var size = Math.pow(10, pos);
    return Math.round(num * size) / size;
}*/
</script>



<c:if test="${not empty errorMsg}">
	
	<ul>
		<c:forEach var="message" items="${errorMsg}">
			<li><font color='red'>${message}</font></li>
		</c:forEach>
	</ul>
	
</c:if>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- required for .datepicker() -->
<script src="${pageContext.request.contextPath}/General/js/jquery-ui.min.js"></script>  
</div>

<script type="text/javascript">
/**/	
	$(document).ready(function() {
		$("#memberbirthday").datepicker({ showOn: 'button', buttonImageOnly: true, buttonImage: "${pageContext.request.contextPath}/register/img/Calendar.png" });
	});

</script>

<script>
/*	*/
 var gender = $(".membergender").val()=="M" ?"Male":"Female";
 $(".membergender").text(gender);
	
</script>

</body>
</html>