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
			<img style="display:block; margin:auto;" width="750px" src="${pageContext.request.contextPath}/other/services/img/9-1.jpg"/><br>
			<br>
			<h1>${proc.name}</h1>
			<p class="intro">醫學上來說，「痣」其實就是黑色素細胞的聚集，長在身體的各個部位，根據統計，男性身上每人平均有73顆痣，女性則是27顆，而痣的多寡及平均大小，也與將來發展成黑色素瘤的機率有相關，痣越多、越大，越有可能罹患黑色素瘤，一旦發現痣的外觀出現變化，則需經由專業切片檢驗。所以「除痣」並非單純為了美觀，有時候為的是「預防」。</p>
			<br>
			<h2>汽化雷射</h2>
			<br>
			<p class="intro">「汽化性雷射」指的是鉺雅鉻雷射(Er: YAG Laser)或二氧化碳雷射，當雷射施打到皮膚中，雷射光束會被細胞中的水分所吸收，水分吸收能量後瞬間被蒸發破壞，有如燒灼的原理，將該部位的黑色素汽化，達到「除痣」目的。</p>
			<br>
			<h2>銣雅鉻雷射</h2>
			<br>
			<p class="intro">產生痣的原因多半為後天產生，尤其在青春期過後大幅出現。銣雅鉻雷射(Nd Yag)，其波長有532nm及1064nm，針對痣所在的深淺不同，也會影響療程次數跟效果，除淡化斑點外，臉上的粗糙毛孔、胎記、刺青或紋眉，也有相當的成效。</p>
			<br>
			<h2>治療流程</h2>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/9-2.jpg"/><br>
			<br>
			<h2>術前注意事項</h2>
			<br>
			<ol>
			<li>光敏感膚質、有感染性傷口及孕婦，應由醫師評估是否適合治療。</li>
			<li>治療前兩週勿使用含A酸、果酸等酸類產品及藥膏。</li>
			<li>局部麻醉藥膏過敏者，應在術前告知醫護人員。</li>
			<li>皮膚乾癢不適、曬傷、濕疹、毛囊炎或色素沈澱等部位，不適做雷射治療。</li>
			</ol>
			<br>
			<h2>術後注意事項</h2>
			<br>
			<ol>
			<li>術後當天患處可能滲出組織液，可用人工皮敷料貼附，吸收組織滲液，請在當晚、睡前定時更換一次，用棉棒沾生理食鹽水清除滲液，待患部呈現乾淨的粉紅色新生皮膚後以紗布貼附即可。</li>
			<li>患處皮膚新生期間，可能會感到微微刺痛，可於早、晚塗抹醫師開立的抗生素藥膏，直至刺痛感消失為止。</li>
			<li>傷口約在一星期間可癒合，外出應加強防曬，避免皮膚產生色素沉澱，若產生色素沉澱約在3～6個月會慢慢回復成原來顏色。</li>
			<li>約在術後3周左右，傷口完全癒合的情況下才可上妝、刮鬍。</li>
			</ol>
			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>