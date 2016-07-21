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
			<img style="display:block; margin:auto;" width="750px" src="${pageContext.request.contextPath}/other/services/img/18-1.jpg"/><br>
			<br>
			<h1>${proc.name}</h1>
			<p class="intro">愛美無須承擔風險，風靡歐、美、韓的Z波黃金脂雕，就是新一代的超音波減脂技術，利用高頻率的音波震盪，將脂肪細胞加以破壞後，引流並代謝出體外，低風險、低疼痛、復原期短、效果佳，同時還能緊緻肌膚，讓您輕鬆享瘦秀曲線！</p>
			<br>
			<h2>打造完美身形，韓國型男美女的祕密武器！</h2>
			<br>
			<p class="intro">愛美是每個人的天性，追求完美無須承擔風險，不用忍受長時間的疼痛，更不用擔心結果不如預期。風靡歐、美、韓的Z波黃金脂雕，就是新一代的超音波減脂技術，利用高頻率的音波震盪，讓周圍的脂肪細胞產生”乳化作用”，將脂肪細胞加以破壞後，引流並代謝出體外，由於此法不會有雷射高溫造成的熱傷害，因此可以作用於較淺層的脂防，減少皮下脂肪凹凸不平的情形產生。超音波振盪時會產生攝氏四十至四十五度的熱能，不只能立即發揮止血作用，手術的出血量控制到更低，抽出物中幾乎都是脂肪，只有極少量的血水，因此術後不但恢復期縮短了、並降低表面凹凸不平和局部鬆弛的情況，運用在大範圍的脂肪移除上，能明顯的達到尺寸縮小的效果。</p>
 			<br>
			<p class="intro">Z波黃金脂雕，不但能有效的瓦解深層脂肪，精雕變形的身材，更能用於狐臭、男性女乳症的根除及女性巨乳症的矯正。將高效率的超音波導入患部，精確的破壞造成狐臭的頂漿腺，和男性女乳症及女性巨乳症過度發達的乳腺及多餘的脂肪組織，之後再將這些被液化的組織吸出體外，輕鬆達到根除的目的。利用超音波治療狐臭的手術時間只要短短的45分鐘，又因不會過度傷害週邊組織，低疼痛感，幾乎沒有血腫的困擾，恢復期只要2-3天，輕鬆擺脫惱人異味。</p>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/18-2.jpg"/><br>
			<br>
			<h2>適應症</h2>
			<br>
			<ul>
			<li>全身一般部位精緻雕塑</li>
    		--可雕塑全身各部位，例如：手臂、副乳、背、腹部、馬鞍、臀部、大腿、小腿...。
 			<li>全身特殊部位精緻雕塑及特殊適應症</li>
     		--可雕塑全身各部位，包括高難度部位，例如：雙下巴、水牛肩、火雞脖...。<br>
     		--可治療特殊適應症，例如：狐臭、男性女乳症、男性腹肌雕塑、女性腹直肌雕塑...。 
    		</ul>
			<br>
			<h2>流程</h2>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/18-3.jpg"/><br>
			<br>
			<ol>
			<li>Consulting：與醫師溝通，確認您希望的雕塑效果</li>
			<li>Design：選擇&確認適當的抽脂區域 </li>
			<li>Infiltration：注入麻醉劑</li>
			<li>Lipolysis：治療部位的脂肪乳化 </li>
			<li>Aspiration：引流抽出乳化的脂肪 </li>
			<li>Postoperative Care：按摩</li>
			</ol>
			<br>
			<h2>優點</h2>
			<br>
			<ul>
			<li>安全性高：針對脂肪細胞乳化，不傷害重要神經及血管</li>
			<li>低疼痛感、 低出血及其他傷害</li>
			<li>術後復原期短</li>
			<li>手術同時緊緻肌膚</li>
			<li>局部雕塑效果佳</li>
			</ul>
			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>