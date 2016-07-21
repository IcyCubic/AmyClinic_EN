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
			<img style="display:block; margin:auto;" width="750px" src="${pageContext.request.contextPath}/other/services/img/21-1.jpg"/><br>
			<br>
			<h1>${proc.name}</h1>
    		<br>
    		<p class="intro">水微晶為新一代皮下填補劑，透過國際專利CHAP玻尿酸交聯平台專利，創造出具有保濕力及彈力的晶體式凝膠，可修飾與改善臉龐的微笑曲線弧度，主要施打部位在蘋果肌和法令紋和下巴，創造出量身訂做的臉型。</p>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/19-2.jpg"/><br>
			<br>
			<p class="intro">水微晶CHAPTM獨家玻尿酸膠聯平台專利，創造晶格式結構，提高酵素的立體屏障並強化抗降解性，讓玻尿酸酶無發輕易破壞晶格內外分子結構，因此水微晶的抗降解性效果持久，注射後可延長患者的維效，提升療程滿意度。</p>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/19-3.jpg"/><br>
			<br>
			<p class="intro">降解時間比較，在不同產品中，加入20U/ml的玻尿酸降解酵素於37°c的環境下，隨著時間進展分別觀察反應結果，偵測不同產品之酵素降解百分比。從上圖可見，海德密絲水微晶HyaDermis水微晶格式玻尿酸較顆粒型玻尿酸更能抵抗酵素的破壞。</p>
			<br>
			<p class="intro">海德密絲水微晶HyaDermis有四種不同的分子結構劑型，在支撐度及適用部位也有所不同。</p>
			<ul>
			<li style="color: #EAC100">黃色Blink：晶亮眼眸，改善淚溝、眼部周圍及表面淺層皺紋及全臉拉提。</li>
			<li style="color: green">綠色Kiss：性感甜唇，治療淚溝、蘋果肌、豐唇、淺部皺褶。</li>
			<li style="color: #FF60AF">桃紅Smile：迷人笑顏，治療蘋果肌、法令紋、豐頰、夫妻宮。</li>
			<li style="color: purple">紫色Chic：立體輪廓，鼻型修飾及下巴塑形。</li>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/21-2.jpg"/><br>
			</ul>
			<br>
			<p class="intro">海德密絲水微晶HyaDermis通過完整生物相容性評估，進行9項生物相容性測試，證實HyaDermis生物相容性佳，臨床結果證實水微晶的副作用極低，安全無虞。檢驗單位為TUV Medical Service,Inc。</p>
			<br>
			<p class="intro">海德密絲水微晶HyaDermis四微晶格式水微晶CHAPTM獨家專利，晶格鏈結強又緻密，不易位移，黏彈性高，堆疊支撐力強，輕鬆塑造彈性及自然的臉部立體輪廓。</p>
			<br>
			<h2>作用原理</h2>
			<br>
			<p class="intro">水微晶(Hya-Dermis海德密絲)讓原本柔軟脆弱的玻尿酸鏈，先聯結成立體的三 維架構，再經由第四維的鏈結，強化其顆粒結構，緻密的鏈結，讓酵素難以將玻 尿酸鏈各個擊破，玻尿酸分子更能延長植入劑留存在體內的壽命，讓水微晶的塑 形效果持久。 水微晶(Hya-Dermis)提昇了玻尿酸的黏度與彈性，而黏度與彈性是影響塑形力強 弱的關鍵，黏度與彈性優良的玻尿酸，不僅可以施打於紋路及凹陷部位，更適合 應用於需要高度塑形力的部位，而且術後的觸感自然，柔軟有彈力宛如天生。</p>
			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>