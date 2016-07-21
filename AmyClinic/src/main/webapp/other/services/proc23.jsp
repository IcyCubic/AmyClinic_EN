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
			<img style="display:block; margin:auto;" width="750px" src="${pageContext.request.contextPath}/other/services/img/23-1.jpg"/><br>
			<br>
			<h1>${proc.name}</h1>
			<p class="intro">微針滾輪是藉由無數細微的細針在表皮上直接穿刺於所欲進行改善的部位之真皮層上，來回均勻的滾動，誘使皮膚組織啟動一連串重建方程式，刺激膠原蛋白增生， 在短時間內微針滾輪可製造出超過200,000個微細管道，經微針滾輪穿刺產生細小的微細傷口，並誘使皮膚內組織啟動一連串細胞重建，經由微針滾輪所滾動過的每一寸肌膚，而達到美白、縮小毛孔、淡化細紋、肥胖紋、妊娠紋及緊緻細嫩的回春效果。</p>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/23-2.jpg"/><br>
			<br>
			<p class="intro">透過表皮角質層的無痛穿刺，使受損的皮下組織啟動自體修復機制，達自我修復效果。微針滾輪可促進表皮細胞與真皮細胞增殖，促進真皮細胞新生與活化，特別是痘疤的效果，沒有反紅反黑的問題，深受有痘疤困擾者一致推薦的美膚法。微針滾輪做凹疤痘疤約至少4至6次，但因為每個人的體質與深度不同，所以需要的治療次數因人而異。療程效果可維持2年以上。</p>
			<br>
 			<h2>適用部位</h2>
			<br>
			<p class="intro">臉部細紋、痘疤、凹疤、毛孔粗大</p>
			<br>
			<h2>手術流程</h2>
			<br>
			<ul>
			<li>STEP1：患者簽屬同意治療後，開始清潔卸妝與術前照相。</li>
			<li>STEP2：選擇適當微針尺寸。</li>
			<li>STEP3：注射前醫師會依照您的需求規劃你所要注射的區塊，敷上麻藥或止痛劑。</li>
			<li>STEP4：約30分鐘後，依照醫生的指示，放輕鬆後便開始注射。</li>
			<li>STEP5：治療後可冰敷並了解相關衛教知識。</li>
			<li>STEP6：注射後拍攝比較，並記得定期追蹤。剛注射後只會有些許差異，接著會發現漸漸有變化。</li>
			</ul>
			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>