<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="${pageContext.request.contextPath}/General/js/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/General/css/style.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/login/css/login.css"
	rel="stylesheet">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="187388699466-pqf6of44on8fl4fvfdhe5rqu8or4r3ba.apps.googleusercontent.com">

<title>關於愛美</title>
<style>
#content {
	margin-top: 20pX;
	overflow: auto !important;
	overflow /**/: hidden;
	width: 100%;
	padding-bottom: 20px;
}

* {
	margin: 0;
	padding: 0;
	font-size: 100%;
}

body {
	font-size: 100%;
	font-family: Arial, Helvetica, sans-serif;
	/*line-height:1.4em;*/
	color: #333333;
}

article {
	float: right;
	margin-right: 200px;
	width: 1000px;
}

aside {
	margin-left: 200px;
	float: left;
	width: 200px;
	float: left;
}

#f1 {
	float: right;
	border: 3px solid silver;
	margin: 2pX;
	padding: 2px;
}

#d1 {
	width: 700PX;
	border: 5pX solid orange;
	margin: 0px auto;
}
</style>

</head>
<body>
	<s:include value="/General/header.jsp"></s:include>



	<div id="content">

		<article>
			<h1>
				關於愛美
				</h2>
				<figure>
					<!-- 				<img id="img1" src="../images/a1.jpg" alt=""> -->

				</figure>

				<div id="d1"
					style="width: 600px; height: 600PX; ">
					<figure id="f1">
						<img style="width:150px;height:150PX" src="../images/amy.jpg" />
						<figcaption>Amy診所</figcaption>
					</figure>
					<p>愛美是人的天性，由內而外打造幸福人生</p>
					<p>傾聽客戶的需求、量身打造獨一無二”愛美”療程是我們堅持的理念。</p>
					<p>至今已服務數十萬愛美人，每每看到客戶臉上漾起幸福滿溢的笑容，經常令我們感動</p>
					<p>Amy愛美醫美診所於大台北地區進行醫療美容專科服務已逾40年，</p>
					<p>近年更網羅國內外整形界專家組成尊爵級夢幻醫療團隊！</p>
					<p>Amy愛美鍥而不捨舉辦大大小小整型教學演講，</p>
					<p>為將最先進、最正確的醫美新資普及，使民眾不再因資訊不對等所苦，</p>
					<p>診所內教學團隊常受邀中華民國美容醫學會、台灣顏面整形重建外科醫學會、台灣自體脂肪移植醫學會等進行教學講座，</p>
					<p>期待Amy愛美將小小的幸福火炬透過傳授技術及臨床經驗燃起台灣醫美界的榮光！</p>




				</div>
		</article>
		<aside>
			<h2 class="title">最新消息</h2>
			<dl>

				<dd>&nbsp</dd>
			</dl>
			<dl>

				<dd>
					<a href="beautiful.jsp">美麗見證</a>
				</dd>
			</dl>
			<dl>

				<dd>&nbsp</dd>
			</dl>

			<dl>

				<dd>
					<a href="knowledge.jsp">醫美小常識</a>
				</dd>
			</dl>

			<dl>

				<dd>&nbsp</dd>
			</dl>
			<dl>

				<dd>
					<a href="knowledge.jsp">門診時間</a>
				</dd>
			</dl>

		</aside>

	</div>




	<s:include value="/General/footer.jsp"></s:include>


</body>
</html>