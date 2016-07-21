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
			<img style="display:block; margin:auto;" width="750px" src="${pageContext.request.contextPath}/other/services/img/7-1.jpg"/><br>
			<br>
			<h1>${proc.name}</h1>
			<p class="intro">厭倦每天刮腳毛、除腋毛了嗎？刮完毛髮後的黑頭讓你覺得尷尬嗎？紫翠玉光纖雷射除毛體貼您，只要利用短暫午休時間，就可快速去除困擾的毛髮，讓您盡情展現自己。</p>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/7-2.jpg"/><br>
			<h2>雷射除毛原理</h2>
			<br>
			<p class="intro">紫翠玉雷射會穿透皮膚，被毛囊母細胞中的麥拉寧色素吸收，藉此淡化皮膚色素斑點，達到淡斑美白的作用，並可到達毛髮根部，在不傷害周圍正常組織下，進而破壞毛囊結構達到除毛的目的。</p>
			<br>
			<p class="intro">雷射產生的光熱效應也可有效改善出油、青春痘粉刺、並促進真皮層膠原蛋白與彈力纖維的再生，達到回春、緊緻肌膚等目的。並設有專利動態皮表冷卻系統DCD，擊發前噴灑冷媒於皮膚表面，先降低皮膚表面溫度，再接受雷射治療，可有效減少痛感並保護表皮，施作過程安全舒適。</p>
			<br>
			<h2>毛髮的生長週期</h2>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/7-3.jpg"/><br>
			<br>
			<h2>療程特色</h2>
			<br>
			<ol>
			<li>具有吸收黑色素的專一性，可有效破壞毛囊，對細毛去除效果佳</li>
			<li>疼痛感低，不需高能量即可達到良好效果</li>
			<li>維持長時間除毛效果，不需反覆進行毛髮整理</li>
			<li>可大範圍治療，且疼痛感低，治療時間快速</li>
			<li>非侵入性治療，安全有效</li>
			<li>不會有毛囊發炎或傷口感染的副作用</li>
 			</ol>
 			<br>
 			<h2>適用對象</h2>
			<br>
			<ol>
			<li>體毛茂盛者</li>
			<li>想去除手毛、腳毛或腋毛者</li>
			<li>想修整鬍子或胸毛形狀者</li>
			<li>想去除臉部汗毛者</li>
			<li>想修整或去除私密處毛髮者</li>
			</ol>
			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>