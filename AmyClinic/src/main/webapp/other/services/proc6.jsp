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
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/6-1.jpg"/><br>
			<br>
			<h1>${proc.name}</h1>
			<p class="intro">眼睛是靈魂之窗，是最容易第一眼關注的美麗焦點，雙眼皮手術一直是追求美麗男女的首選，直接讓眼睛比例放大、眼神顯的朝氣有精神，五官比例也更加精緻，雙眼皮手術雖然普遍，不只是在眼皮上劃一條線那麼簡單，對於眼部黃金比例聖宜有專業整形外科團隊見解，考量到整體比例，施行精緻細膩的雙眼皮外科手術，才能做出對稱、和諧、令人滿意的手術結果。</p>
			<br>
			<h2>適應症</h2>
			<br>
			<p class="intro">單眼皮、雙眼皮褶不平均、泡泡眼、眼皮鬆弛下垂、眼皮脂肪較多者。</p>
			<br>
			<h2>雙眼皮結構美學知識</h2>
			<br>
			<p class="intro">從臨床上看，雙眼皮的提眼肌在眼皮下，因此提眼肌拉起時，會帶動眼皮形成雙眼皮的皺折；而單眼皮的提眼肌則附著在眼部脂肪前的中隔，沒有延伸到眼皮的皮膚，所以沒辦法造成皺褶，外觀看上去就不如雙眼皮有神，眼睛比例也明顯比雙眼皮的要小。利用手術製造出雙眼皮摺痕，不管是利用割、縫，看起來自然、對稱就是手術成功的基本標準。</p>
			<br>
			<h2>該選擇割雙眼皮，還是縫雙皮？</h2>
			<br>
			<p class="intro">一般而言，割雙眼皮加強對於眼型缺陷修飾，可針對於眼皮脂肪多(泡泡眼)、眼皮厚、眼皮老化鬆弛下垂；則一般眼型、眼皮薄、眼窩脂肪少者較適合用縫雙眼皮，實際情況依醫師諮詢建議。</p>
			<br>
			<h2>治療內容</h2>
			<br>
			<p class="intro">局部麻醉後，在上眼皮處劃開約1.5~2.5公分的小切口，加上移除眼部多餘的皮膚、脂肪，或是先天性下垂眼瞼的修飾，手術時間約50分鐘~2小時，術後約5~7天可拆線。成功的雙眼皮手術，外形孤度在靜態下看來自然大方、雙眼皮寬窄很適合本人臉形、睫毛輕微上翹，整體顯得溫柔有神；在說話和笑時的動態下眼裂大小不變，向下注視和閉眼時皮膚疤痕不明顯，眼周沒有牽拉、沉重感，摺痕較深較持久。</p>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/6-2.jpg"/><br>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/6-3.jpg"/><br>

			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>