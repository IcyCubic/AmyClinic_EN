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
			<img style="display:block; margin:auto;" width="750px" src="${pageContext.request.contextPath}/other/services/img/12-1.png"/><br>
			<br>
			<h1>${proc.name}</h1>
			<p class="intro">脈衝光以逐漸升溫的方式作用在色素病灶，溫熱效果可以讓色素消退、皮膚緊縮，有快速美白嫩膚的效果。治療後在表層色素斑或皮膚暗沉部位，會出現黑色點狀的細微顆粒，這是脈衝光熱凝作用對色素生成的“微痂皮”。在3-5天左右，微痂皮會隨著皮膚代謝脫落，達到美白淡斑效果。脈衝光美顏術的特點，是在治療的過程溫和漸進，每次治療時間短，對皮膚沒有明顯損傷，術後可以馬上洗臉化妝，不影響正常工作。由於治療後可以立即上班、逛街，因此在歐美被稱為「午餐美容」、「貴夫人雷射」。也是一種愈來愈簡便的光美顏技術。</p>
			<br>
			<h2>治療原理</h2>
			<br>
			<p class="intro">脈衝光療法(IPL)是近幾年被廣泛運用在醫學美容上的雷射科技，此種雷射是介於自然光與雷射光之間的一種綜合光波，也可說是溫和的綜合型雷射，它混合了多種雷射的光束，是一種多波長、高能量的脈衝式閃光，具有完整地光譜，波長560～1200nm脈衝強光，可解決多種肌膚問題，刺激膠原蛋白及彈力纖維再生，使皮膚緊緻、淨白、透亮。</p>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/12-2.jpg"/><br>
			<br>
			<h2>適應族群</h2>
			<br>
			<ul>
			<li>肌膚老化</li>
			<li>肌膚鬆弛無彈性</li>
			<li>膚色不均、膚色黯沉</li>
			<li>色素沉澱</li>
			<li>青春痘、痘疤</li>
			<li>黑斑、曬斑、雀斑、老人斑</li>
			<li>血管擴張</li>
			<li>黑眼圈等</li>
			</ul>
			<br>
			<h2>優勢</h2>
			<br>
			<ul>
			<li>所有膚色皆適用</li>
			<li>粗黑細淺毛髮皆適用</li>
			<li>較不易燙傷</li>
			<li>適合常做日曬與人工日曬者</li>
			<li>肌膚較敏感者適用</li>
			<li>治療發數最多</li>
			<li>治療面積大速度快</li>
			</ul>
			<br>
			<h2>傳統除毛方式的缺點</h2>
			<br>
       		<p class="intro">一般傳統除毛方法如蜜蠟、電解、拔毛、脫毛膏、刮刀、除毛藥劑等，通常都無法延緩毛髮的生長，時間一到還是需要再要重覆除毛的動作，效果短暫且而耗時，還有可能產生感染、疤痕、色素沉澱等副作用。反覆刮毛也會造成毛髮愈來愈粗，髮質愈來愈硬，讓你困擾的毛手毛腳問題更加頭痛。</p>
			<br>
			<h2>治療部位</h2>
			<br>
　　		<p class="intro">腋下、大腿、小腿、手臂、膝蓋、 臉部、人中、鬍鬚、鬢角、背部、比基尼線、手指、腳趾等。</p>
			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>