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
			<img style="display:block; margin:auto;" width="750px" src="${pageContext.request.contextPath}/other/services/img/11-1.jpg"/><br>
			<br>
			<h1>${proc.name}</h1>
			<p class="intro">變頻飛梭採分段換膚(Fractional)的方式，漸進式層層更換膚質，一次治療20%~30%，而非全面性一次破壞，變頻飛梭雷射光束能夠精準的穿透組織層及角質層，就如同光線穿透一扇窗，直達治療區深部，可減少患者疼痛感及心理壓力，大幅提升治療效果與滿意度</p>
			<br>
			<h2>適應症</h2>
			<br>
			<ul>
			<li>減少肌膚表淺細紋</li>
			<li>除去手術及創傷疤痕</li>
			<li>淡化老人斑、曬斑、雀斑等色素斑點</li>
			<li>緊緻毛孔、皮膚粗糙、膚色不均、暗沉</li>
			</ul>
			<br>
			<h2>療程原理</h2>
			<br>
			<p class="intro">青春痘凹洞常常是痘痘族一路走來揮之不去的痕跡與夢魘。傳統的雷射磨皮治療雖然效果顯著，但是磨皮後傷口恢復期約需一週以上，加上滲出液的照顧問題與東方人常見的術後反黑，讓許多人望而卻步。</p>
			<br>
			<p class="intro">目前診所使用的「3D變頻飛梭雷射」採分段換膚(Fractional Resurfacing)方式，使雷射光以細小而密集的點穿透皮膚，約破壞20%的皮膚組織，讓點與點之間擁有完好的正常組織來加速這些微小傷口的癒合，以1550nm波長的雷射光束精準的穿透表皮層到達真皮層，此治療波長是唯一可以把疤痕深度變淺的範圍，且1550nm的雷射是造成封閉性的凝結傷口，與鉺雅鉻雷射、CO2雷射所造成的開放性傷口不同。</p>
			<br>
			<p class="intro">3D變頻飛梭雷射屬於非汽化性飛梭雷射，因採用非接觸性的探頭，所以比一般的傳統飛梭雷射更能避免感染的問題，而且它的飛點輸出(Random Spray)設計能夠使治療部位的熱能較易分散，不會在同一時間於同一區重複治療，因此更能降低治療的疼痛感與術後的紅腫反應。</p>
			<br>
			<p class="intro">雷射治療過程中，細小而密集的雷射光束穿透到皮膚真皮層形成許多微小加熱區(Microthermal Zone)，藉由這些雷射能量刺激膠原蛋白增生與重組，能有效改善凹洞疤痕與緊實細緻肌膚，讓整體膚質年輕化。飛梭雷射術後約有2至3天的紅腫期，會有微紅及膚質乾燥粗糙的感覺，這段期間皮膚比較敏感，需特別注重保濕與防曬，儘量選擇溫和的清潔用品與保養品才不致於刺激新生的皮膚。由於飛梭雷射並不是一次破壞所有的治療面積，所以必須接受多次的治療，才能達到最佳效果。</p>
			<br>
			<p class="intro">※飛梭雷射治療最常運用於改善凹陷的青春痘疤、水痘疤、外傷或手術後疤痕，改善的效果主要決定於疤痕的型態。例如：弧狀的青春痘疤非常適合作飛梭雷射治療來改善，若是冰鑿型的青春痘疤只作飛梭雷射效果就不理想。</p>
			<br>
			<h2>跟其他療程有什麼不同？</h2>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/11-2.jpg"/><br>
			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>