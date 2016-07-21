<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>測試圖片顯示</title>
</head>
<body>
<img width='120' height='180' src='${pageContext.request.contextPath}/GetPic.servlet?num=6' />
使用Servlet測試，web.xml內已做相關設定
</body>
</html>