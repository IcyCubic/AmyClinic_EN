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
			<img style="display:block; margin:auto;" width="750px" src="${pageContext.request.contextPath}/other/services/img/2-1.jpg"/><br>
			<br>
			<h1>${proc.name}</h1>
			<p class="intro">鼻子是臉部五官最突出的部份，許多人選擇隆鼻美容手術不只是為了讓自己外貌更加吸引人，根據研究指出鼻子與性能力有很大的關係，隆鼻在整型手術項目中男性佔了相當高的比例。女性則希望讓臉部整體感更加立體，鼻型則是影響審美角度的重要關鍵。鼻子在面相學上是所謂聚財之地、鼻孔外漏或鼻毛露出在中國人的觀念上有漏財的可能，東方人隆鼻亦包含有改運的概念！但不論隆鼻動機為何，適度的調整鼻型與高度為自信加分何樂不可呢！最重要的是選擇合格的整型外科醫師，與醫師充分討論適合自己的鼻型與比例，才是首要的前置步驟唷！</p>
			<br>
			<p class="intro">東方人因為臉部較寬，顴骨不夠明顯，如果鼻樑不夠挺、鼻孔太大就會顯得整體臉型不具立體感及現代感！一般的審美觀喜歡較深的鮮明輪廓，所以鼻子佔了決定性的因素。</p>
			<br>
			<h2>適應症</h2> 
			<br>
			<p class="intro">扁鼻、塌鼻、鼻頭低陷、太短或太窄者。</p>
			<br>
			<h2>常見鼻型問題大致上包括以下幾種</h2>
			<br>
			<ol>
			<li>鼻根低鼻樑向下凹陷的「馬鞍鼻」，有時鼻尖向上翹而形成「朝天鼻」。</li>
			<li>鼻頭圓鈍、過於寬廣則是所謂的「蒜頭鼻」或「蓮霧鼻」。</li>
			<li>鼻樑部側看有類似「駱駝峰」般的突起，甚至有時鼻尖過長下垂造成「鷹勾鼻」。</li>
			<li>鼻翼過度外擴，造成鼻孔過大或鼻翼肥厚等鼻翼問題。</li>
			<li>先天性或後天外傷引起的鼻子歪斜。</li>
			</ol>
			<br>
			<h2>治療內容</h2>
			<br>
			<p class="intro">韓式隆鼻手術在麻醉無痛狀態下進行，通常會先取下耳軟骨及鼻中膈軟骨，接著是鼻樑骨膜下剝離，然後將鼻中膈軟骨縫在未取下的鼻中膈上，根據鼻頭的形狀及高度，修剪並堆疊適當高度的Gore-Tex在鼻樑上，最後利用耳軟骨修飾鼻頭形狀，達到自然翹挺的美型鼻。韓式隆鼻的切口一般從鼻孔切口，傷口極難發現。</p>
			<img width="750px" src="${pageContext.request.contextPath}/other/services/img/2-2.jpg"/><br>
			<br>
			<h2>常見問答</h2>
			<br>
			<p class="intro" style="color: #FF0080">Q：隆鼻後會不會長青春痘或粉剌？可以擠嗎？</p>
			<p class="intro">A：青春痘和粉剌是屬於皮膚狀況或內分泌系統，與隆鼻無關；初期最好不要擠壓青春痘或粉剌，即使是手術過後的好幾個月或幾年，也不建議去擠青春痘或粉剌，因為不當的擠壓，反而容易造成痘疤、凹洞或感染，衍生其他肌膚問題。</p>
			<br>
			<p class="intro" style="color: #FF0080">Q：可以做出像韓星宋慧喬一樣的鼻子嗎？</p>
			<p class="intro">A：本診所在韓式隆鼻的技術上當然沒問題，但不見得宋慧喬的鼻子可以套用在每個人身上，建議應與專業醫師討論後，依個人整體臉形和美感來做選擇。</p>
			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>