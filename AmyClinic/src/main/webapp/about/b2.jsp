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

<title>◆醫美小常識:童顏針是什麼?竟能讓阿湯哥也瘋狂!◆</title>
<style>
#content {
	margin-top:20pX;
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
	margin-left: 200px; float : left;
	width: 200px;
	float: left;
}
</style>

</head>
<body>
	<s:include value="/General/header.jsp"></s:include>



	<div id="content">

		<article>
			<h2 class="title">◆醫美小常識:童顏針是什麼?竟能讓阿湯哥也瘋狂!◆</h2>

			<p>相信大家都看到廣告了~最近"不可能的任務"又出續作，阿湯哥已經51歲，在預告片中卻顯得手腳俐落，完全沒有年齡問題的感覺。
但說到年齡問題，其實讓小編更驚訝的是他的臉龐。</p>
			<p>不同於先前在影視新聞中看到的印象，那完全是30幾歲小夥子的臉龐!簡直像"班傑明奇幻旅程"的真實版。對照之前他2011與最近的照片時可以看出皺紋明顯變淺，臉頰也不再鬆垮垮，有年輕豐潤的感覺，不同於前ㄧ篇林志穎的凍齡，阿湯哥簡直是逆齡了!</p>
			<p>原來早在2013年時就有新聞報導他疑似打所謂的童顏針，進行微整型回春。不過就跟很多被懷疑過的明星一樣，本人不會直接承認做過微整型。所以美國知名的整型醫生Dr. Athony Youn就"代替"他回答:這應該是做了複合式療程，像阿湯哥這種體型偏瘦的男人，到了50歲臉部應該是鬆垮消瘦的，推測他的療程中應該包括了童顏針。</p>
			<p>但這個童顏針是什麼呢?
其實這個名稱是較大眾化的說法，它的正式名稱叫3D聚左旋乳酸，具有生物相容性與分解性，注入到想改善的部位後可以改善肌膚明度、皺紋，配合術後的追蹤治療及按摩，可維持大約三年的時間，比起肉毒多更多!</p>
			<p>最為人津津樂道的優點是改善的幅度為緩慢的，不會一打完就會讓別人發現有做過微整，就像阿湯哥的例子一樣，達到逆齡的效果!
一般打童顏針，醫生會在施打前跟客人討論，建議可以施打的部位與劑量，主要是要達成年輕臉龐的結果，參考的形象是:脂肪分部均勻、臉部亮面多過陰影、臉型結構呈倒三角等。</p>
			<p>童顏針的效果，阿湯哥就是最好的見證!
據說在大陸3D聚左旋乳酸未合法化，所以一瓶可開價到42萬!果然是只有土豪才打得起...還好我們是住在台灣，大約的行情價跟大陸的相比差了12倍，只能說我們住在台灣算是很幸福了啊~
</p>

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