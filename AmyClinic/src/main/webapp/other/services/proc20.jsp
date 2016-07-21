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
			<img style="display:block; margin:auto;" width="750px" src="${pageContext.request.contextPath}/other/services/img/20-1.jpg"/><br>
			<br>
			<h1>${proc.name}</h1>
			<p class="intro">晶亮瓷/微晶瓷(Radiesse)是生物科技合成的化合物，原料為人體牙齒骨骼的成分Calcium Hydroxylapatite；CaHA，一般俗稱為骨粉，擁有100%生物相容性與生物可分解性。晶亮瓷/微晶瓷(Radiesse)在隆鼻應用的效果快速立即，注射後不容易會有位移與恢復期的問題，從直挺的鼻樑到秀氣的鼻尖，感覺就像是自己的鼻骨無異物感，所以晶亮瓷在歐美與台灣都有極高的滿意度。在國外原廠的臨床研究報告中，顯示晶亮瓷/微晶瓷(Radiesse)治療效果可以達12~18個月以上。 (會依照個人體質情況而有所差異，建議您與醫師預約回診時間，再視情況進行微調填補)</p>
			<br>
			<h2>適應症</h2>
			<br>
			<p class="intro">大家比較熟知的修飾鼻樑下巴以外，更有新一代的「3D晶塑」技術，可以治療全臉更多部位如:蘋果肌、法令紋木偶紋等臉部凹線紋路。</p>
			<br>
			<h2>注射原理</h2>
			<br>
			<p class="intro">微晶瓷/晶亮瓷於2006年由FDA核准上市，是皮下填充劑的一種，質地為膠狀不堅硬。微晶瓷主要成份是水膠和礦物質，這種天然礦物質原本就存在我們體內，故微晶瓷價格和人體高度相容，且會隨著時間被人體自然吸收代謝。</p>
			<br>
			<p class="intro">微晶瓷/晶亮瓷晶球是一種生物軟陶瓷，主要為鈣離子和磷酸根離子組成，具有100%生物相容性與生物可分解性，將包裹含鈣的維小晶球體注射到想填補改善的皮膚，能啟動人體自然機制，刺激膠原蛋白新生，能有效塑臉型輪廓，產生更立體明顯的效果。</p>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/20-2.jpg"/><br>
			<br>
			<h2>術後護理</h2>
			<br>
			<ol>
			<li>術後請立即冰濕敷，建議兩天內仍需間歇性的冰濕敷，直到腫脹消退。</li>
			<li>治療後幾天，治療區域可能會有點麻木的感覺是正常的現象。</li>
			<li>注射部位的泛紅可能會持續3~5天，為正常的現象。</li>
			<li>注射後48小時避免用力揉搓或按壓注射區域。</li>
			<li>一週內，應避免去高溫(三溫暖.烤箱)場所或高度曝曬於陽光下，直到腫脹及發紅消退為止。</li>
			</ol>
			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>