<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#mySpace {
	position: absolute;
	top: 350px;
	right: 2px;
	z-index: 9999;
	width: 45px;
	height: 150px;
}
#logo {
	border: 1px solid black;
	border-radius: 5px;
	width:45px;
}
</style>
<!-- <div class="easingtext1-1 text1" data-1152-start="margin-left:1680px;" data-1400-start="margin-left:1230px;"> -->
<div id="mySpace" data-start="display:none" data-200-start="opacity:0;" data-350-start="opacity:1;" data-351-start="display:inline;">
	<a href="${pageContext.request.contextPath}/web/login.jsp"><img
		src="${pageContext.request.contextPath}/web/images/vertical.png" alt=""
		id="logo"></a>
</div>

<script>
	$float_speed = 0;
	$my_Space = $("#mySpace");

	$(window).load(function() {
// 		thePosition = $('#mySpace').position().top;
		thePosition = 350;
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
<script type="text/javascript" src="js/skrollr.min.js"></script>
<script type="text/javascript">
var s = skrollr.init(
    smoothScrolling = true
);
</script>