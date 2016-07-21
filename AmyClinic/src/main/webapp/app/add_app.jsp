<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/colorbox.css">
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/css/add_app.css">
<script src="${pageContext.request.contextPath}/General/js/jquery.min.js"></script>
<title>線上預約</title>

</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>
<div class="clr"></div>

<div class="pencil">
  <div class="eraser"></div>
  <div class="ferrule"></div>
  <div class="shaft"></div>
  <div class="lead"></div>
</div>
<h1>線上預約</h1>
<div class="landing-page">

<div style="background-color: lightyellow; border: 5px solid green; padding: 10px; text-align: center; ">
<div class="red-cross" style="float: left;"></div>
<div style="display: inline-block; margin-bottom: 0;">
    <input id="toggle-01" type="radio" name="purpose" value="0" checked="checked"/>
    <label for="toggle-01"></label>
    <p style="text-align: center; margin-bottom: 0;">開始新療程</p>
</div>
<div style="display: inline-block; margin-bottom: 0;">
    <input id="toggle-02" type="radio" name="purpose" value="1" />
    <label for="toggle-02"></label>
    <p style="text-align: center; margin-bottom: 0;">回診</p>
</div>
<div class="red-cross" style="float: right;"></div>
</div>
        <div class="form-appointment">
            <form action="${pageContext.request.contextPath}/apps/addapp" name="form1" method="post" class="wpcf7-form">
            <div class="group">
                <div style="width: 48%; float: left;">
                    <span class="wpcf7-form-control-wrap text-680">
                        <label>帳號：</label>
                        <input type="text" name="text-680" value="" size="45" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required" aria-required="true" placeholder="${memberVO.name}" readonly>
                    </span>
                    <br>
                    <span class="wpcf7-form-control-wrap email-680">
                        <label>電子郵件：</label>
                        <input type="email" name="email-680" value="" size="45" class="wpcf7-form-control wpcf7-text wpcf7-email wpcf7-validates-as-required wpcf7-validates-as-email" aria-required="true" placeholder="${memberVO.email}" readonly>
                    </span>
                    <br>
                    <span class="wpcf7-form-control-wrap tel-630">
                        <label>連絡電話:</label>
                        <input type="tel" name="tel-630" value="" size="45" class="wpcf7-form-control wpcf7-text wpcf7-tel wpcf7-validates-as-required wpcf7-validates-as-tel" aria-required="true" placeholder="${memberVO.phone}" readonly>
                    </span>
                    <br>
                    <span class="wpcf7-form-control-wrap textarea-398">
                        <label>需求描述：</label>
                        <textarea id="descr" name="descrip" placeholder="${param.descrip}" class="wpcf7-form-control wpcf7-textarea"></textarea>
                    </span>
                    <span class="wpcf7-form-control-wrap select-date">
                        <a class='iframe' href="${pageContext.request.contextPath}/apps/showtime">選擇日期</a>
                        <label id="sel_app_time">${param.s_app_time}</label>
                       <br><br> <span id="errortime"><font color="red">${message_time}</font></span>
                        <input type="hidden" name="s_app_time" value="${param.s_app_time}">
                        <input type="hidden" name="ename" value="${param.ename}">
                        <input type="hidden" name="id" value="${param.id}">
                        <input type="hidden" name="purpose" id="purpose" value="">
                    </span>

                </div>
                <div style="width: 48%; float: right;">
                 <font color="red">${message_proc}</font>
                    <jsp:useBean id="procTypeSvc" scope="page" class="group3.carrie.proctype.model.ProcTypeService" />
                    <div id="proc1">
                       <c:forEach var="procTypeVO" items="${procTypeSvc.all}">
                            <h4>${procTypeVO.name}</h4>
                            <c:forEach var="procTypeVO1" varStatus="i" items="${procTypeVO.procs}">
				                <div style="float: left;">
				                    <p>
				                        <span class="wpcf7-list-item">
				                            <label>
				                                <input type="checkbox" name="proc" value="${procTypeVO1.procedure_id}">
				                                <span class="wpcf7-list-item-label">${procTypeVO1.name}</span>
				                                &nbsp;&nbsp;&nbsp;
				                            </label>
				                        </span>
				                     </p>
				                </div>                                        
                            </c:forEach>
                       </c:forEach>
                    </div>
                </div>
            </div>
            <div style="text-align: center; padding-top: 2em; border-top: 1px solid rgb(153, 202, 129); margin-top: 1em;">
            <input type="submit" value="確定送出預約">
                </div>
            </form>
                    <input type="button" id="onekey" value="一鍵選擇時間" style="margin-left: 30pt"></input>
                    <input type="button" id="onefordes" value="一鍵輸入敘述" style="margin-left: 30pt"></input>
    </div>
</div>

	<jsp:include page="/General/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.colorbox.js"></script>
<script>
	$('#proc1').show();
    $(function(){
	$("input[name='purpose']").click(function(){
		var item = $('input[name=purpose]:checked').val();
		if(item == 0){
			$('#proc1').show();
		} else if(item == 1){
			$('#proc1').hide();
		}
	});
	$(".iframe").colorbox({
		iframe:true,
		width:"80%",
		height:"80%",
		overlayClose:false,
		escKey:false
	});
	$("#onekey").click(function(){
		$('#sel_app_time').text('2016-07-11　星期一　早診');
		$('input[name="s_app_time"]').val('2016-07-11　星期一　早診');
		$('input[name="ename"]').val('張君雅');
		$('input[name="id"]').val('1123');
		$('#errortime').empty();
	})

	$("#onefordes").click(function(){
		$('#descr').text('覺得自己太胖了，想要抽個脂，鼻子好像也不夠挺...');
	})

    $( 'input[type="submit"]' ).click(function( event ) {
    	if($("#toggle-01").prop("checked"))
    	  $("#purpose").val('0');
    	else
    	  $("#purpose").val('1');
    });
    });
</script>
</body>
</html>
