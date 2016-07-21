<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/General/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/Score/css/Score.css" />
<meta charset="UTF-8">
<title>修改你的評論</title>
</head>
<body>
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.raty.js"></script>
<jsp:include page="/General/header.jsp"></jsp:include>
	<div class="clr"></div>
    <br>
	<h1 style="text-align: center;">醫生評點</h1>
	<br>
	<div id="star"></div>


<br>
<br>
<br>
	<form name="f1" action="ScoreServlet" method="post" style="text-align:center;">
	<div class="paper">
        <div class="paper-content">
		    <textarea name="comment">${comment}</textarea> 
		</div>
    </div>
        <br>
		<input type="submit" value="輸入" class="cmt-btn green">
        <input type="reset" value="重置" class="cmt-btn red">
	    <input type="hidden" name="score" value="${scores}">
		<input type="hidden" name="score_id" value="${score_id}">
	    <input type="hidden" name="action" value="adjustComment">  
	</form>
	<jsp:include page="/General/footer.jsp"></jsp:include>  
	<script>
		$('#star').raty({
			score: '${scores}',
			size: 128,
			click : function(score) {
				var x = parseInt(score);
				document.f1.score.value=x;

			}
		

		});

		window.history.forward(1);

	</script>
</body>
</html>