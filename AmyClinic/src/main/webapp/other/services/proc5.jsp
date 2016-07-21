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
			<img style="display:block; margin:auto;" width="750px" src="${pageContext.request.contextPath}/other/services/img/5-1.jpg"/><br>
			<br>
			<h1>${proc.name}</h1>
			<p class="intro">你是否曾經看過街上漂亮的女性穿著一雙高跟鞋，但是小腿後方卻出現下垂的蘿蔔腿？或是天氣熱時，因為自卑自己的小腿有肌肉型贅肉，而不敢穿著短裙見人？擁有蘿蔔腿還可能被別人嘲笑：「有小白兔跟在後面跳」，事實上，女人除了豐滿的胸部最為吸睛之外，另一個焦點目標就是小腿了，如果有一雙蘿蔔腿確實非常惱人，愛美診所推出電波縮小肌肉型蘿蔔腿術療程，術後也不必擔心會留下疤痕或影響重要功能。</p>
			<br>
			<p class="intro">一般造成小腿粗的原因</p>
			<ul>
			<li>小腿皮下脂肪多：繃緊小腿肌肉時，可以捏起很厚的皮膚和皮下脂肪。</li>
			<li>小腿肌肉發達：皮下脂肪不多，繃緊小腿肌肉時，只能捏起很薄的皮膚和皮下脂肪。</li>
			</ul>
			<p class="intro">(其中如果是前者，只要運動和抽脂就可以瘦小腿，讓小腿變細；若是後者，就困難許多了，利用電波阻斷是可以改善小腿線條，瘦小腿的。)</p>
			<br>
			<h2>電波縮小肌肉型蘿蔔腿術原理</h2>
			<br>
			<p class="intro">以微創神經阻斷瘦小腿術，針對看起來突出的小腿的肌肉施行的手術。小腿後部的肌肉大體可分為小腿內側肌肉和小腿外側肌肉，有選擇性地阻斷支配這些肌肉的神經。進行窈窕美腿手術時，在膝蓋後面的下方皮膚扎針約0.3公分左右，選擇性地阻斷支配小腿內側肌肉的神經，使小腿肌肉萎縮。由於手術損傷很小，過程安全，局部麻醉亦可使整個手術過程較舒適。</p>
			<br>
			<h2>電波縮小肌肉型蘿蔔腿術效果</h2>
			<br>
			<p class="intro">術後的效果因人而異，但大多數都是約1個月後開始，慢慢顯出效果，約3-6個月後顯出相對瘦小腿效果，且維持良好的話，並不須要重複治療。尤其並不需要住院治療，復原期短，亦沒有複雜的傷口照顧及留下疤痕等問題。
			<br>
			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>