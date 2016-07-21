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

<title>美麗見證</title>
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
</style>

</head>
<body>
	<s:include value="/General/header.jsp"></s:include>



	<div id="content">

		<article>
			<h2 class="title">美麗見證</h2>
			
			<ul>
				<!-- 				<li><a href=""></a></li> -->
				<!--   <li><a href=""></a></li> -->
				<li><a href="b1.jsp">[肉毒桿菌] 狂戳~醫美小常識篇—肉毒桿菌美容注射安全嗎?</a></li>
				<li><a href="b2.jsp">◆醫美小常識:童顏針是什麼?竟能讓阿湯哥也瘋狂!◆</a></li>
				<li><a href="b3.jsp">【美容小常識面部皺紋暗示健康問題</a></li>
				<li><a href="">關於皮膚你一定要知道的八件事</a></li> 
				<li><a href="">寒流來襲，保養小撇步！</a></li> 
				<li><a href="">我敷TT過敏了！怎麼辦？</a></li> 

			</ul>
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