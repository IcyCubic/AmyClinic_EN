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
			<img style="display:block; margin:auto;" width="750px" src="${pageContext.request.contextPath}/other/services/img/15-1.png"/><br>
			<br>
			<h1>${proc.name}</h1>
			<p class="intro">超音波抽脂運用專利鈦金屬探針釋放36kHz超音波頻率，產生數百萬個氣泡擊碎脂肪團塊，並迅速乳化大量脂肪，再利用纖細的威塑引流管吸出，輕鬆達到雕塑身材的效果。威塑手術對於周圍神經、血管和結締組織破壞甚少，術後可大幅減少瘀青、疼痛感，縮短恢復期，適用於大、小範圍雕塑，乳化後抽出的脂肪細胞，約有80%存活率可回填利用，達到深抽脂、淺精雕，打造客製化名模級的完美線條！</p>
			<br>
			<h2>VASER(威塑)是什麼？</h2>
			<br>
			<p class="intro">Vibration Amplification of Sound Energy at Resonance</p>
			<ul>
			<li>V：震動</li>
			<li>A：增幅</li>
			<li>S：聲音</li>
			<li>E：能量</li>
			<li>R：共振腔</li>
			</ul>
			<br>
			<p class="intro">威塑技術，改善了傳統超音波的缺點，傳統超音波使用空心導管，一邊乳糜化一邊吸取脂肪，能量大到要灑水降溫，因而造成的傷害較大，弊病也較多，而威塑導管是實心且能量不集中在頂端，分散為兩到三個環節，讓熱能均勻，對組織的破壞降低很多，所以能做到淺層脂肪的雕塑。</p>
			<br>
			<p class="intro">威塑可以達到雕塑效果的最主要因素是它能做到淺層脂肪，當只做深層脂肪時，只能做到平整，但做不到線條雕塑，一般男生的六塊肌、女生的馬甲線等，這種近距離就有一個彎曲的曲線，沒有做到淺層抽脂是雕塑不出來的，威塑的原理，是把要雕塑的部位，利用導管進去把原本百萬個脂肪細胞乳糜化成一千個很小的脂肪細胞塊，外觀看起來就像奶油般成為半液體後，再吸取出來。</p>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/15-2.jpg"/><br>
			<br>
			<h2>手術的三道手續</h2>
			<br>
			<ul>
			<li>第一道：打水</li>
			將含生理食鹽水、血管收縮劑、止痛劑等的液體打入，讓脂肪細胞撐開，並降低流血機率及疼痛，也是目前抽脂手術例行性的第一道手續。
			<li>第二道：乳糜化</li>
			利用極微細的超音波導管伸入要施作部位的脂肪，利用震盪脂肪細胞間隙中的空氣，使脂肪細胞震碎變成奶油狀。
			<li>第三道：吸取脂肪</li>
			乳化的脂肪已成液狀，再經由專利的引流管輕易吸出。
			</ul>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/15-3.jpg"/><br>
			<br>
			<h2>各式抽脂方式比較</h2>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/15-4.jpg"/><br>
			<br>
			<h2>適用部位</h2>
			<br>
			<ol>
			<li>腹部、大腿、膝蓋、屁股、臀部、後背、胳膊、男性女乳症、腰側等處，手術後的部位會平滑緊緻，術後效果立即呈現。</li>
			<li>更細部到傳統抽脂較不易操作的部位，如下巴、脖子區域。</li>
			</ol>
			<br>
						<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/15-5.jpg"/><br>
			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>