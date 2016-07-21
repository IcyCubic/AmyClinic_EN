<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="mySpace" style="text-align: center;">

<%-- 	<a href="${pageContext.request.contextPath}/login/login.jsp"> --%>
	<a href="${pageContext.request.contextPath}/ChatClient.jsp">
	<img src="${pageContext.request.contextPath}/General/img/logo.jpg" alt="愛美小天使"   id="logo">
	</a>
	
	<h3><font color=#FF8000 class='fa fa-smile-o' >美麗諮詢</font></h3>
</div>

<script>
	$float_speed = 750;
	$my_Space = $("#mySpace");

	$(window).load(function() {
		thePosition = $('#mySpace').position().top;
		floats();
	});

	$(window).scroll(function() {
		floats();
	});

	function floats() {
		var scrollAmount = $(document).scrollTop();
		var newPosition = thePosition + scrollAmount;
		if ($(window).height() < $my_Space.height()) {
			$my_Space.css("top", thePosition);
		} else {
			$my_Space.stop().animate({
				top : newPosition
			}, $float_speed, function(x, t, b, c, d) {
				return c * ((t = t / d - 1) * t * t * t * t + 1) + b;
			});
		}
	}
</script>