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
			<img style="display:block; margin:auto;" width="750px" src="${pageContext.request.contextPath}/other/services/img/24-1.jpg"/><br>
			<br>
			<h1>${proc.name}</h1>
			<p class="intro">頂上無毛可是從古至今許多男性的困擾，但傳統植髮手術造成的頭皮創傷及侵入性的方式，讓許多人望之卻步！由美國植髮名醫Dr. John Cole 根據FUE改良的 寇約翰植髮® 療程，植髮過程更精準、快速！摘取毛囊處的疤痕不明顯、手術低疼痛感、傷口恢復快，2012更在韓國造成轟動，成為消費者最信賴的植髮療程。</p>
			<br>
			<h2>2012席捲韓國，邀您一起揮別頂上地中海、電火球</h2>
			<br>
			<p class="intro">頂上無毛可是從古至今許多男性的困擾，其實造成落髮的原因有許多種，例如飲食、作息、壓力、疾病、遺傳…等。有些掉髮是暫時性的，可能過一段時間會回復，例如壓力造成的圓禿，但調查數據上有90%的落髮原因是來自基因或遺傳性的雄性禿，也就是說如有落髮問題，有相當大的可能是因為雄性禿造成的，而這是光靠調整作息、改變飲食，可能也不會改善！</p>
 			<br>
			<p class="intro">但過去植髮手術造成的頭皮創傷及侵入性的方式，讓許多人望之卻步！有別於傳統的FUT即所謂的毛囊單位植髮術，寇約翰植髮療程是採用FUE－隱形毛囊單株摘取術的微創植髮療程，使用直徑小於1公分的Punch(鑽針)將毛囊從頭皮摘取出來，植於落髮處，一小時約可擷取100株的毛囊，相較於傳統的FUT手術，摘取出的毛囊存活率高、傷口疤痕不明顯、疼痛感降低、恢復期更短。</p>
			<br>
			<p class="intro">寇約翰植髮療程 (PCID)，是由曾獲得義大利米開朗基羅獎、阿基米德獎的美國植髮名醫Dr. John Cole 根據FUE改良的植髮療程，更快速的取髮技術，每小時約可擷取2000株毛囊；專用的蓮花式鑽針，更薄的管壁與蓮花狀的尖端，減少探取毛囊時的摩擦力，增長的內徑更保持毛囊在鑽針內的完整性；唯一軟體程式控制的儀器，精確控制摘取與種植毛囊的角度與深度，除了大大提升了毛囊的完整性與存活率，更可依據患者頭皮的狀況與需求，客製化參數，植髮過程更精準、快速！承襲FUE療程手法的優點，摘取毛囊處的疤痕不明顯、手術低疼痛感、傷口恢復快，集百利於一身的寇約翰植髮療程，2012更在韓國造成轟動，成為消費者最信賴的植髮療程。</p>
			<br>
			<h2>種植面積及位置</h2>
			<br>
			<ul>
			<li>如果前額禿的形狀呈現兩塊三角形(Norwood I~III):</li>
			以算術算出大約的三角形面積即可。
			<li>如果頭頂稀疏(Norwood III VERTAX~V):</li>
			將露出頭皮較多的部分做記號，一般約呈橢圓形或圓形，
			再以橢圓形或圓形的數學公式計算面積。
			<li>如果前額髮線已經完全不見(Norwood V):</li>
			將小拇指的外緣放在眉毛上方，此時四指併攏，食指的外
			緣約就是理想的髮線位置(約眉上7公分)。
			</ul>
			<img style="display:block; margin:auto;" src="${pageContext.request.contextPath}/other/services/img/24-2.png"/><br>
			
			</article>

		</div>
	</div>
	<jsp:include page="/General/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/other/services/js/index.js"></script>

</body>
</html>