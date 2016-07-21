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
			<img style="display:block; margin:auto;" width="750px" src="${pageContext.request.contextPath}/other/services/img/14-1.png"/><br>
			<br>
			<h1>${proc.name}</h1>
			<p class="intro">面對頑固腹部脂肪，不動刀的新選擇－Coolsculpting低溫減脂，安全無痛感，自然回復平坦小腹、纖細腰線！</p>
			<br>
			<p class="intro">美國哈佛名校及皮膚科專家Dr. Rox Anderson(飛梭雷射之父)觀察，有些孩子在吃冰淇淋時，臉上會短暫浮現酒窩，深入追蹤發現脂肪具有不耐冷的特質，以此為基礎研發出創新技術。譯名稱為「酷爾塑平」。為美國FDA唯一認證可以減少脂肪的醫療儀器。</p>
			<br>
			<h2>治療原理</h2>
			<br>
			<p class="intro">低溫減脂技術是利用真空壓力吸引住治療部位，並以低溫能量針對凸起的脂肪作用，使脂肪凍結結晶，促使脂肪提早老化、凋零，再經由人體的淋巴系統代謝排出壞死的脂肪細胞；儀器中內建的智慧型冷卻噴頭可精準控制溫度，而不損害身體其他組織。療程結束後1〜3個月，脂肪層的厚度將逐漸減少的，達到瘦身效果。</p>
			<br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/14-2.jpg"/><br>
			<br>
			<h2>體外減脂大躍進，從真空吸引進化到平板</h2>
 			<br>
			<p class="intro">低溫減脂針對體外減脂的技術不斷的精進不斷的演進，將從原有的針對腹部頑固脂肪的大型探頭，進化至能治療局部脂肪例如：後腰肉、蝴蝶袖、大腿內側等部位的小型雕塑探頭。現在，減脂技術再進化，克服原有使用真空吸引技術在治療上的障礙，經美國FDA核可，低溫平板減脂治療可使大腿外側等部位，得到有效減脂治療！輕鬆告別西洋梨臀！</p>
			<br>
			<h2>療程特色</h2>
 			<br>
 			<ol>
			<li>非侵入性療程，不需動刀</li>
			<li>不需麻醉，安全度相對高</li>
			<li>無疼痛感，舒適度佳</li>
			<li>無需恢復期，不影響作息</li>
			<li>療程時間短，輕鬆快速</li>
			<li>不需穿著塑身衣，更便利</li>
			<li>一次治療可減少平均22.4%脂肪層</li>
 			</ol>
 			<br>
 			<h2>適合對象</h2>
 			<br>
 			<ol>
			<li>未滿一年的產後婦女最適合，因為脂肪層比較柔軟，冷凍減脂效果明顯。</li>
			<li>嗜吃冰飲者，多為脾濕型水腫肥胖，可促進身體循環，減重更快達標。</li>
			<li>久坐及缺乏運動的肉鬆女。</li>
			<li>運動及節食無法消除的局部肥胖者，如：啤酒肉、蝴蝶袖、大腿內側等皆可治療。</li>
			</ol>
			<br>
 			<h2>適用部位</h2>
 			<br>
 			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/14-3.jpg"/><br>
 			<br>
 			<h2>非侵入式體雕療程比較</h2>
 			<br>
 			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/14-4.jpg"/><br>
			</article>
			

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>