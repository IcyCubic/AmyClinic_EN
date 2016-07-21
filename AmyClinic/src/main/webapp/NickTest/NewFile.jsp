<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.colorbox.js"></script>
	<script>
            $(document).ready(function () {
                $('a.gallery').colorbox({ opacity:0.5, rel:'group1' });
            });
	</script>
<title>Insert title here</title>
</head>
<body>
	 <a class='gallery' href='../images/1.jpg'>Photo_1</a>
     <a class='gallery' href='../images/2.jpg'>Photo_2</a>
     <a class='gallery' href='../images/3.jpg'>Photo_3</a>
     


</body>
</html>