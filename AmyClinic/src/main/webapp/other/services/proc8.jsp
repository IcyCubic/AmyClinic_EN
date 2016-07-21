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
			<img style="display:block; margin:auto;" width="750px" src="${pageContext.request.contextPath}/other/services/img/8-1.jpg"/><br>
			<br>
			<h1>${proc.name}</h1>
			<p class="intro">你也是斑點小花貓嗎？臉上的雀斑、黑斑、曬斑、淺痣…還有更多的細紋、青春痘，馬上就有重要的場合要參加，怎麼辦？不要擔心，本診所引進全球唯一的低溫飛梭探頭「Helios II 8倍淨膚〈柔膚〉雷射」，一網打盡肌膚問題，是你隱形美膚最好的幫手。</p>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/8-2.jpg"/><br>
			<br>
			<h2>淨膚雷射治療對象</h2>
			<br>
			<ol>
			<li>膚色暗沉、色素不均、發炎後色素沉澱、刺青</li>
			<li>各種色素斑、老斑、曬斑、肝斑、顴骨班、太田母斑</li>
			<li>青春痘、白頭粉刺、黑頭粉刺、毛孔粗大</li>
			<li>臉上細紋、肌膚鬆弛</li>
			</ol>
			<br>
			<h2>治療方法</h2>
			<br>
			<ol>
			<li>治療次數：表淺斑點/色素沉澱：2~3次，深層斑點/紋眉刺青：4~6次，除面積較大的痣4~6次</li>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/8-3.jpg"/><br>
			<li>治療間隔：2~4週</li>
			<li>治療步驟：清潔臉部、開始治療〈一般人不需上麻藥，特別緊張怕痛的人可以上麻藥〉、冷敷〈或加上自體活細胞生長因子PRP效果更好〉</li>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/8-6.jpg"/><br>
			</ol>
			<br>
			<h2>療效分析</h2>
			<br>
			<ul>
			<li>世界首創分段光熱療法（飛梭功能）的1064nm/532nm Ｑ開關釹雅鉻雷射系統。能量比起一般的淨膚〈柔膚〉雷射高出8至10倍，不會損害任何周邊正常的細胞。</li>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/8-4.jpg"/><br>
			<li>全球唯一低溫飛梭淨膚〈柔膚〉探頭，再加上光點尺寸小於200㎛，治療完全沒有不適感，因此，治療前不需要上麻藥，更能有效縮短治療時間。</li>
			<li>美國FDA認證，世界專利低溫飛梭探頭，大幅降低熱能累積傷害，能量與穿透深度高出傳統淨膚〈柔膚〉雷射8至10倍，療程縮短效率倍增。</li>
			<li>不易返黑，治療過程不疼痛，不需恢復期，效果更優越，擁有淨白肌膚，就是這麼簡單。</li>
			<img width="750px" src="${pageContext.request.contextPath}/other/services/img/8-5.jpg"/><br>
			</ul>
			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>

	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>