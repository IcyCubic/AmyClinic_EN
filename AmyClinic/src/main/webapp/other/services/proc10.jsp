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
			<img style="display:block; margin:auto;" width="750px" src="${pageContext.request.contextPath}/other/services/img/10-1.jpg"/><br>
			<br>
			<h1>${proc.name}</h1>
			<p class="intro">平整無痕的肌膚，一直是許多人渴望的好膚質，但是多種雷射機器需要恢復期，或治療時有一定程度的痛感，讓想治療的人望之卻步。這就是光纖粉餅雷射受歡迎的原因</p>
			<br>
 			<h2>適應症</h2>
 			<br>
			<p class="intro">嫩白、除斑、除刺青、縮小毛孔、全臉拉提、改善細紋、均勻膚色、改善黑眼圈、治療青春痘粉刺、控油。</p>
			<br>
			<h2>不需化妝也擁有上粉底的白透亮！</h2>
			<br>
			<p class="intro">多元脈衝模式的選擇，搭配藍寶冷卻系統，能夠針對皮膚及毛髮之深度及種類不同，均勻釋放能量，將對皮膚傷害減至最低，安全、有效、迅速達到除毛、縮小毛孔、光滑肌膚功效。</p>
			<br>
 			<h2>光纖粉餅雷射除毛治療</h2>
			<br>
			<p class="intro">提供兩種不同的雷射除毛方式，另一種是<font color="red">本診所的明星服務－紫翠玉光纖美白雷射</font>，利用波長808nm雷射之「選擇性光熱療法」的特性，雷射能量會穿透皮膚，被毛囊母細胞中的麥拉寧色素吸收。在不傷害周圍正常組織下，深入皮膚的雷射能量則會產生高溫破壞毛囊生長結構(ex.根部、真皮乳突、毛囊峽部)，達到除毛的功效。</p>
 			<br>
 			<h2>光纖粉餅雷射除毛臨床效果</h2>
			<br>
			<p class="intro">光纖粉餅雷射是種全新的觀念技術，利用808nm Diode Laser二極體雷射來治療青春痘同時達到粉嫩膚質、縮小毛孔的效果，也適合除毛的應用，更值得一提的是粉餅雷射的強效立即美白作用。DepiLight 粉餅雷射能傳遞一均勻的連續式脈衝能量而達到溫和有效美白的需求，是市場上新的高標準二極體雷射(Diode Laser)科技。能夠提供醫師及客戶穩定而傑出的美白臨床效果。近年來在媒體的報導下，也搖身一變成為大家熟知的美容雷射機種，但因為價格昂貴，所以擁有的診所很少，只有少數連鎖型診所才能購入。</p>
 			<br>
			<p class="intro">接受過光纖粉餅雷射治療後，受術者的第一感覺就是<font color="red">「怎麼有那麼快速的亮白方法！」</font>。這就是粉餅雷射最讓人欣喜的地方，打完幾乎立即變白，比8年前流行過的脈衝光快速許多！最重要的是，<font color="red">光纖粉餅雷射的拉提除皺效果也很顯著</font>，雖然深層刺激膠原蛋白的效果沒有2011三極電波拉皮那麼深入，但接受全臉粉餅雷射治療後，多數人可以明顯感覺到肌膚較有彈性，因此光纖粉餅雷射又被稱作新一代的午休急救美容雷射。</p>
 			<br>
			<p class="intro">若是想要快速美白拉提，又不想再經歷數天恢復期，那麼光纖粉餅雷射將是您最佳的選擇！目前愛美診所的療程設計很貼心，臉部雷射療程可從愛美診所多元性的現有雷射中彈性挑選，不加收任何費用，以不同的高階雷射機種，針對各種不同的皮膚困擾對症下藥，是您挑雷射美容診所最聰明的選擇！</p>
			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>