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

#footer-bgcontent {
		height:65px;
		background: #e499ba;
		position: absolute;
		right: 0;
		left: 0;
		padding: 1rem;
		text-align: center;	
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
				<li><a href="a1.jsp">【極線超音波拉提】找回消失的輪廓線_小草莓</a></li>
				<li><a href="a2.jsp">【電波拉皮/肉毒瘦臉】★電波拉皮X肉毒瘦還原不敗的娃娃小臉_Cherry</a></li>
				<li><a href="a3.jsp">【飛梭雷射】飛梭雷射心得♥凹洞快滾(上)_大饅大力</a></li>
				<li><a href="">【極限音波拉提】惱人的垂垂鬆弛臉，交給Ultherapy極線音波拉提_米雪</a></li> 
				<li><a href="">【歐萃學超音波系統（標靶震波）】媽咪變少女♥產後瘦身超EASY‬(≧∇≦)/_愛愛</a></li> 
				<li><a href="">【淨膚雷射】和擾人斑點說掰掰。星和醫美淨膚雷射 & 彩衝光讓妹妹變美了_洋娃娃的夢幻城堡</a></li> 

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