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
			<img style="display:block; margin:auto;" width="750px" src="${pageContext.request.contextPath}/other/services/img/4-1.jpg"/><br>
			<br>
			<h1>${proc.name}</h1>
			<p class="intro">拉皮手術是利用外科手術，將臉部萎縮無力的皮膚皮下組織、囤積的脂肪、鬆弛的肌肉筋膜予以切除及調整，來恢復皮膚的緊繃、彈性及光澤。傳統的上臉部拉皮是 將整個額頭頭皮切開掀起，但因傷口太大，疤痕明顯，近年來已漸漸 由內視鏡手術所取代，內視鏡的前額拉皮手術只需要小小3-4個約3 公分的傷口 (傷口在髮際內)，就可改善額頭的皺紋，魚尾紋及下垂的眉毛。</p>
			<br>
			<p class="intro">針對不同部位操作三爪/五爪/八爪拉皮手術。無論是上述哪一種，都是用一種新的固定釘(Endotine)，把需要拉提的肌肉往上提後，再用勾爪固定在骨 膜上即可。其實這三者的使用原理都差不多，最大的差異在於施作部位的不同。像「三爪」，通常用在拉提的眉眼之間，不但可以把下垂的眉毛和眼睛向上提，甚至連下眼皮和兩眉中間的老化都能夠改善。「五爪」施術於額頭部位，「八爪」通常用在臉頰兩側或脖子之間，主要視消費者的需求和本身狀況而定。</p>
			<br>
			<p class="intro">手術後，雙眉恢復至年輕時眉骨上方的正常位置，原來因眼皮鬆弛導致內雙的雙眼皮也會重見天日，恢復年輕的模樣。除了手術後不留疤痕及美容效果更令人滿意的 優點外，內視鏡拉皮不需住院，恢復期較短，手術後約5至7天就可以化妝重新回到工作崗位，也無傳統手術後頭皮腫脹及麻痛的困擾。內視鏡的上額拉皮手術，是 一種公認持久性最好的拉皮手術，一般效果可持續5-6年甚至10年。</p>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/4-2.jpg"/><br>
			<br>
			<h2>適應症</h2>
			<br> 
			<p class="intro">除皺、改善膚質、下顎線鈍化、火雞頸、臉頰鬆弛、法令紋、嘴邊皺紋明顯者、動態紋較深較多或皮膚過度鬆弛者。</p>
			<br>
			<h2>治療內容</h2>
			<br>
			<p class="intro">拉皮的特點，在於多點固定設計，提供被提拉的組織多點接觸，可將壓力分配至廣泛的區域以獲得最大的固定強度。其特性如下：</p>
			<ul>
			<li>堅固性：提拉力量分配於五個針尖，多點技術讓固定帶更為安全。</li>
			<li>減少頭皮切割：降低為提拉額頭而切割頭皮的需要。</li>
			<li>不會秃髪：降低頭皮皮膚的拉扯力，減少因損傷毛囊而導致的秃髮。</li>
			<li>外觀自然且恢復快：過程無需傳統拉皮掀開皮膚，手術傷口小，修復期快。</li>
			<li>可吸收性：爪鉤為乳酸及果酸聚合物Polylactide，平均6~12個月可被人體吸收。</li>
			</ul>
			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>