<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/General/img/logo.ico" />

<style>
span {
font-family: myfont;
}
</style>
<script> 
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1733704493575453',
      xfbml      : true,
      version    : 'v2.6'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
<jsp:include page="/General/mySpace.jsp" />
<div id="headercontainer"><c:import url="/General/LoginBox.jsp"></c:import></div>
<div id="headerbox">
	<div id="banner">
	<a href="${pageContext.request.contextPath}/index.jsp">	
	<img src="${pageContext.request.contextPath}/General/img/img04.jpg" alt="">
	</a>
	</div>
	<hr />
	<div id="header">
	
	<div id="menu">
		<ul>
			<li class='has-sub'><a href="${pageContext.request.contextPath}/index.jsp"><span>愛美首頁</span></a></li>
			<li><a href="${pageContext.request.contextPath}/about/aboutUs.jsp"><span>關於愛美</span></a>
<!-- 				<ul> -->
<%-- 					<li class='last'><a href='${pageContext.request.contextPath}/Faker/aboutUs.jsp'><span>關於愛美</span></a></li> --%>
<%-- 					<li><a href='${pageContext.request.contextPath}/doctor/alldoctor.jsp'><span>醫師介紹</span></a></li> --%>
<%-- 					<li><a href='${pageContext.request.contextPath}/free/showophr'><span>門診時間表</span></a></li> --%>
					
<!-- 				</ul> -->
			</li>
<!-- 			<li class='has-sub'><a href="#"><span>美麗見證</span></a>  -->
<!-- 			<ul> -->
<%-- 			<li class='last'><a href='${pageContext.request.contextPath}/Faker/a1.jsp'><span>超音波拉提</span></a></li> --%>
<%-- 			<li class='last'><a href='${pageContext.request.contextPath}/Faker/a2.jsp'><span>電波拉皮</span></a></li> --%>
<%-- 			<li class='last'><a href='${pageContext.request.contextPath}/Faker/a3.jsp'><span>飛梭雷射</span></a></li> --%>
<!-- 			</ul> -->
			
<!-- 			</li> -->
			<li ><a href="${pageContext.request.contextPath}/QueryProc?id=1"><span>美麗療程</span></a>
<!-- 				<ul> -->
<!-- 					<li class='has-sub'><a href='#'><span>整形手術</span></a> -->
<!-- 						<ul> -->
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=1'><span>豐胸術</span></a></li> --%>
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=2'><span>隆鼻術</span></a></li> --%>
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=3'><span>脂肪移植</span></a></li> --%>
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=4'><span>拉皮術</span></a></li> --%>
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=5'><span>蘿蔔腿縮小術</span></a></li> --%>
<%-- 							<li class='last'><a href='${pageContext.request.contextPath}/QueryProc?id=6'><span>雙眼皮</span></a></li> --%>
<!-- 						</ul></li> -->
<!-- 					<li class='has-sub'><a href='#'><span>雷射光療</span></a> -->
<!-- 						<ul> -->
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=7'><span>雷射除毛</span></a></li> --%>
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=8'><span>雷射淨膚</span></a></li> --%>
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=9'><span>雷射除痣</span></a></li> --%>
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=10'><span>粉餅雷射</span></a></li> --%>
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=11'><span>變頻飛梭</span></a></li> --%>
<%-- 							<li class='last'><a href='${pageContext.request.contextPath}/QueryProc?id=12'><span>脈衝光</span></a></li> --%>
<!-- 						</ul></li> -->
<!-- 					<li><a href='#' class='has-sub'><span>瘦身雕塑</span></a> -->
<!-- 						<ul> -->
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=13'><span>震波減脂</span></a></li> --%>
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=14'><span>冷凍減脂</span></a></li> --%>
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=15'><span>威塑減脂</span></a></li> --%>
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=16'><span>水刀抽脂</span></a></li> --%>
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=17'><span>爆脂衝擊波</span></a></li> --%>
<%-- 							<li class='last'><a href='${pageContext.request.contextPath}/QueryProc?id=18'><span>黃金脂雕</span></a></li> --%>
<!-- 						</ul></li> -->
<!-- 					<li class='has-sub'><a href='#'><span>微整形</span></a> -->
<!-- 						<ul> -->
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=19'><span>波尿酸</span></a></li> --%>
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=20'><span>晶亮瓷</span></a></li> --%>
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=21'><span>水微晶</span></a></li> --%>
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=22'><span>膠原蛋白</span></a></li> --%>
<%-- 							<li><a href='${pageContext.request.contextPath}/QueryProc?id=23'><span>微針療程</span></a></li> --%>
<%-- 							<li class='last'><a href='${pageContext.request.contextPath}/QueryProc?id=24'><span>無痕植髮</span></a></li> --%>
<!-- 						</ul></li> -->
<!-- 				</ul> -->
				</li>
			<li><a href="${pageContext.request.contextPath}/shopping/prod_list.jsp"><span>美麗購物</span></a></li>
			<li><a href="${pageContext.request.contextPath}/app/add_app.jsp"><span>變美預約</span></a></li>
<%-- 			<li class='has-sub'><a href="${pageContext.request.contextPath}/member/member.jsp">會員專區</a></li> --%>

			
			
				<li><a href="${pageContext.request.contextPath}/member/member.jsp"><span>美麗會員</span></a>
<!-- 				<ul> -->
<%-- 					<li class='last'><a href="${pageContext.request.contextPath}/app/query_app.jsp" ><span>查詢預約</span></a></li> --%>
<%-- 					<li><a href="${pageContext.request.contextPath}/shoppings/showorder" ><span>查詢訂單</span></a></li> --%>
<%-- 					<li><a href="${pageContext.request.contextPath}/member/member.jsp"><span>查詢會員資料</span></a></li> --%>
<!-- 				</ul> -->
			</li>
			
<%-- 			<li><a href="${pageContext.request.contextPath}/ChatClient.jsp">美麗諮詢</a></li> --%>
		</ul>
	</div>
<!-- 	<div id="search"> -->
<!-- 		<form method="get" action=""> -->
<!-- 			<fieldset> -->
<!-- 				<input type="text" name="s" id="search-text" size="15" /> <input -->
<!-- 					type="submit" id="search-submit" value="GO" /> -->
<!-- 			</fieldset> -->
<!-- 		</form> -->
<!-- 	</div> -->
</div>
</div>

