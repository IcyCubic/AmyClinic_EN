<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
		<meta charset="UTF-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>愛美服務團隊</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="author" content="Codrops" />     
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/doctor/css/style.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/doctor/js/modernizr.custom.53451.js"></script>
		<style type="text/css">
		.container{
/* 		background-image: url("/AmyClinic/images/b1.jpg"); */
/*         background-repeat: no-repeat; */
/*         background-attachment: fixed; */
/*         background-position: center; */
/*         background-size: cover; */
/*         width: 100%; */
		 }
		img{
		height: 100%;
		}
		.dg-container span{
		font-size: 30px;
 		background-color:#fff;  
		color:#EF8181 ;
		}
/* 		.dg-container span span{ */
/*  		background-color: green; */
/* 		color: black; */
/* 		} */
		#footer-bgcontent {
		height: 99px;
		background: #e499ba;
		position: absolute;
		right: 0;
		left: 0;
		padding: 1rem;
		text-align: center;	
}
.container{
top:300px;
}
.docimg{
margin-left: 150px;
}
		</style>
		
    </head>
    <body>
    <jsp:include page="/General/header.jsp"></jsp:include>

        <div class="container">	
        <br><br><br><br><br>
			<section id="dg-container" class="dg-container">
				<div class="dg-wrapper">
					<a href="#"><img src="${pageContext.request.contextPath}/doctor/images/e1.jpg" alt="image01" class="docimg">
					<span style="color:#6D2222;">張文遠 醫師</span><br>
					<span>雷射去斑/痣、雷射磨皮、脈衝光除痘、脈衝光回春、電波拉皮</span>
					</a>
					<a href="#"><img src="${pageContext.request.contextPath}/doctor/images/e2.jpg" alt="image02" class="docimg">
					<span style="color: #6D2222;">諸葛亮 醫師</span>
					<br><span>玻尿酸、肉毒桿菌、美白針、植髮</span>
					</a>
					<a href="#"><img src="${pageContext.request.contextPath}/doctor/images/e3.jpg" alt="image03" class="docimg">
					<span style="color: #6D2222;">夏侯惇 醫師</span>
					<br><span>抽脂、隆乳、雙眼皮手術、眼袋手術、拉皮手術、隆鼻</span>
					</a>
					<a href="#"><img src="${pageContext.request.contextPath}/doctor/images/e4.jpg" alt="image04" class="docimg">
					<span style="color: #6D2222;">張君雅 醫師</span>
					<br><span>微整形、醫美市場發展趨勢與醫療環境、超音波醫學、回春類醫學美容</span>
					</a>
					<a href="#"><img src="${pageContext.request.contextPath}/doctor/images/e5.jpg" alt="image05" class="docimg">
					<span style="color: #6D2222;">史奴比 醫師</span>
					<br><span>美容護膚、微整型注射治療 (玻尿酸、微晶瓷)、韓式隆鼻</span>
					</a>
					<a href="#"><img src="${pageContext.request.contextPath}/doctor/images/e6.jpg" alt="image06" class="docimg">
					<span style="color: #6D2222;">高飛 醫師</span>
					<br><span>美容醫學手術、美容醫學針劑注射、超音波醫學、基因體醫學</span>
					</a>
						
				</div>
				
			</section>
			<br><br><br><br><br><br><br><br>
        </div>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.gallery.js"></script>
		<script type="text/javascript">
			$(function() {
				$('#dg-container').gallery({
					autoplay	:	true
				});
			});
		</script>
		<jsp:include page="/General/footer.jsp"></jsp:include>
    </body>
</html>