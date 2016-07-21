<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${proc.name}</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<link href="${pageContext.request.contextPath}/General/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/other/services/css/normalize.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/other/services/css/style.css"
	rel="stylesheet">
<style type="text/css">
#allpage {
	width: 1200px;
	margin: 0 auto;
}

#content {
	overflow: auto !important;
	overflow /**/: hidden;
	width: 100%;
	padding-bottom: 20px;
}

aside {
	float: left;
}

article {
	float: right;
	width: 800px;
}

.intro {
	text-align: left;
}

h2 {
   font-size: 20pt;
}
</style>
</head>
<body>
	<jsp:include page="/General/header.jsp"></jsp:include>
	<div id="allpage">
		<div id="content">
			<aside> 
				<jsp:include page="/other/services/aside.jsp"></jsp:include>
			</aside>
			<article id="a1">
			<br>
			<br>
			<img style="display:block; margin:auto;" width="750px" src="${pageContext.request.contextPath}/other/services/img/22-1.jpg"/><br>
			<br>
			<h1>${proc.name}</h1>
			<p class="intro">愛美是女人的天性，然而隨著年齡增長、環境習慣的改變，甚至是來自紫外線造成的傷害等因素，都使得我們的肌膚狀況逐漸走下坡，甚至開始出現乾燥黯沉、衰老皺紋、鬆弛下垂等老態。而妳知道嗎？一旦肌膚開始老化，即便費盡心思塗抹保養品，也難以阻擋老化的腳步。</p>
			<br>
			<ul>
			<li>「膠原蛋白」是人體中含量最多的結構性蛋白，也是支撐肌膚彈性、緊緻飽滿的重要因素，是維持肌膚緊實及彈性的重要因素。</li>
			<li>「膠原蛋白」亦可將水份保留在真皮層裡，增加肌膚保水度，使肌膚呈現出「水、亮、透、潤」的光澤感。</li>
			</ul>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/22-2.jpg"/><br>
			<br>
			<p class="intro">所以肌膚內一定要維持足夠的的膠原蛋白，而對比外用保養或口服膠原蛋白，注射型膠原蛋白更能提供立即的填補效果，達到<font color="red">「除皺、塑型、美顏」的效果</font>，縐紋消失、回復肌膚的光采，立即讓妳逆轉時光，重現青春奇蹟。</p>
			<br>
			<h2>作用原理</h2>
			<br>
			<p class="intro">當膠原蛋白注射入肌膚後，分散的膠原蛋白會形成一個柔軟有黏性的纖維狀結構停留在注射部位，使凹陷立即回復平整。而膠原蛋白具有生物分解性，注射入肌膚的膠原蛋白經過分解，會被人體的結締組織同化，成為人體組織的一部分，而停留時間則會因未注射部位及注射方式不同而有所差異。另外膠原蛋白注射劑本身具有修復功能，可促進傷口癒合與組織修復。還可促進自體膠原蛋白增生，<font color="red">注射後雖會被人體吸收、代謝，但卻可以誘發自體膠原蛋白增生，使膠原蛋白不斷新生填補縫隙，讓扁平的肌膚變得飽滿、緊實。</font></p>
			<br>
			<img style="display:block; margin:auto;" width="700px" src="${pageContext.request.contextPath}/other/services/img/22-3.jpg"/><br>
			<br>
			<h2>適應症</h2>
			<br>
			<ul>
			<li>消除皺紋－填補 淚溝、法令紋、抬頭紋、皺眉紋、魚尾紋等。</li>
			<li>填補疤痕－痘疤、較大的疤痕、凹陷疤痕。(膠原蛋白對於凹陷疤痕有非常好的治療效果)</li>
			<li>微整雕塑－豐唇、豐額、豐頰、夫妻宮、耳垂、下巴、鼻子。</li>
			</ul>
			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>