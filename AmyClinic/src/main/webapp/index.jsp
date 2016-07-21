<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% response.setHeader("Cache-Control", "no-store"); response.setHeader("Pragma", "no-cache"); response.setDateHeader("Expires", 0); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/login/css/login.css" rel="stylesheet">
<%-- <script src="https://apis.google.com/js/platform.js" async defer></script> --%>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<style type="text/css">     
.page-header{margin:0px auto;}
#page {
	width: 100%;
	margin: 0 auto;
	padding-top: 0px;
}
body {
        background-image: url("/AmyClinic/images/01.jpg");
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-position: center;
        background-size: cover;
        }   
span{color: #FF0080;} 
/* font{font-family: myfont;} */
#header{
/* width:100%;height:60%; */
}


 #headerbox{height:4.7%;} 
 .container{height:55%;}
 .table{height:33%;}
 #footer-bgcontent { 
 	  height: 75px; 
 	  background-color:none; 
 	  position: absolute; 
 	  right: 0; 
	  left: 0; 
	  padding: 1rem; 
	  text-align: center;	 
 } 
.container-fluid {
/*     margin: 40px auto 10px; */
/*     padding: 20px 0px; */
    max-width: 400px;
    max-height:250px;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
}
.autoimg{
width: 400px;
height: 250px;
}

li a{color: #6D2222;}
</style>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<title>愛美首頁</title>
</head>
<body>
	<!-- facebook script -->
	<div id="fb-root"></div>
	<script src="${pageContext.request.contextPath}/js/facebook.login.js"></script>
	<!-- end facebook script -->
	<s:include value="/General/header.jsp"></s:include>
	<div class="container">	<br><br><br>
	<table  >
	<tr >
		<td class="col-md-7"><h1 style="padding-left: 100px;"><font color=#EF8181 class='fa fa-smile-o'  style="font-size: 25px; ">開啟您的美麗人生<br></font><font color=#FF8000 class='fa fa-smile-o'  style="color: #FF0080;">麗質不必天生，美麗可以創造，專業的醫美團隊AMY</font></h1></td>
		<td ></td>
		<td></td>
	</tr>
	<tr>
		<td>
		<div style="padding-left: 100px;">
		<a href="${pageContext.request.contextPath}/ChatClient.jsp"><img src="${pageContext.request.contextPath}/images/04.gif" alt="線上諮詢"  ></a>
		<a href="${pageContext.request.contextPath}/app/add_app.jsp"><img src="${pageContext.request.contextPath}/images/03.gif" alt="線上預約"  style="padding-left: 25px;"></a>
		<a href='${pageContext.request.contextPath}/QueryProc?id=1'><img src="${pageContext.request.contextPath}/images/02.gif" alt="療程說明"  style="padding-left: 25px;"></a></div>
<%-- 				<div style="padding-left: 100px; float: left;"><img src="${pageContext.request.contextPath}/images/k1.gif" alt="" ><font>美麗見證...............................................................</font></div> --%>
<%-- <%-- 				 <img src="${pageContext.request.contextPath}/images/k3.jpg" alt=""> --%> 
<%-- 				 <div style="padding-left: 250px;"><img src="${pageContext.request.contextPath}/images/k2.gif" alt="" ><font>美麗見證</font></div> --%>
<!-- 				 <div style="padding-top: 200px;"></div> -->
		</td>
		<td></td>
		<td></td>
	</tr>
</table>
<br><br><br>
</div>
 <div class="">
<table class='table' >	
<tr>
<td class='col-md-4' style="background-color: white;padding-left: 10px;margin-left: 10px;"> 	
<img src="${pageContext.request.contextPath}/images/05.gif" alt="" ><span>美麗快報</span>		
			<ul style="max-height: 250px; overflow-y:scroll; ">		
			<li><a href="${pageContext.request.contextPath}/about/a1.jsp">【極線超音波拉提】找回消失的輪廓線_小草莓</a></li>
			<li><a href="${pageContext.request.contextPath}/about/a2.jsp">【電波拉皮/肉毒瘦臉】★電波拉皮X肉毒瘦還原不敗的娃娃小臉_Cherry</a></li>
			<li><a href="${pageContext.request.contextPath}/about/a3.jsp">【飛梭雷射】飛梭雷射心得♥凹洞快滾(上)_大饅大力</a></li>
			<li><a href="${pageContext.request.contextPath}/about/a1.jsp">【極限音波拉提】惱人的垂垂鬆弛臉，交給Ultherapy極線音波拉提_米雪</a></li> 
			<li><a href="${pageContext.request.contextPath}/about/a2.jsp">【歐萃學超音波系統（標靶震波）】媽咪變少女♥產後瘦身超EASY‬(≧∇≦)/_愛愛</a></li> 
			<li><a href="${pageContext.request.contextPath}/about/a3.jsp">【淨膚雷射】和擾人斑點說掰掰。星和醫美淨膚雷射 & 彩衝光讓妹妹變美了_洋娃娃的夢幻城堡</a></li> 
			</ul>
</td>
<td class='col-md-3' style="background-color: white;padding-left: 10px;margin-left: 10px;">
<img src="${pageContext.request.contextPath}/images/06.gif" alt=""  class="img-rounded"><span>美麗見證</span><br>
<img src="${pageContext.request.contextPath}/images/a1.jpg" alt="" class='img-rounded autoimg' ></td>	
<td class='col-md-3' style="background-color: white;padding-left: 10px;margin-left: 10px;">
<img src="${pageContext.request.contextPath}/images/08.gif" alt=""  class="img-rounded"><span>美麗推廣</span><br>
<!-- <iframe width="400" height="250" src="https://www.youtube.com/watch?v=4V5qqL7b5FM?autoplay=1" frameborder="0" allowfullscreen></iframe> -->
<iframe width="400" height="250" src="https://www.youtube.com/embed/4V5qqL7b5FM?autoplay=1" frameborder="0" allowfullscreen></iframe>
</td>
<td class="col-md-3" style="background-color: white;padding-left: 10px;margin-left: 10px;">
<img src="${pageContext.request.contextPath}/images/07.gif" alt=""  style="height: 38px;" class="img-rounded"><span>環境介紹</span>
	<div class="container-fluid">						
		<div class="row-fluid">
    		<div class="carousel slide" id="myCarousel">
        		<div class="carousel-inner">
        		
 					<div class="item active">            
                		<div class="bannerImage">
                    		<a href="#"><img src="${pageContext.request.contextPath}/images/home01.jpg" alt="" class='autoimg'></a>
                		</div>                                                    
            		</div><!-- /Slide1 --> 

            	<div class="item">
                	<div class="bannerImage">
                    	<a href="#"><img src="${pageContext.request.contextPath}/images/home02.jpg" alt="" class='autoimg'></a>
                </div>                                                     
               </div><!-- /Slide2 -->             

            	<div class="item">        
                	<div class="bannerImage">
                    <a href="#"><img src="${pageContext.request.contextPath}/images/home03.jpg" alt="" class='autoimg'></a>
                </div>                                    
            </div><!-- /Slide3 -->                      
 
        	</div>
        
        <div class="control-box">                            
            <a data-slide="prev" href="#myCarousel" class="carousel-control left">‹</a>
            <a data-slide="next" href="#myCarousel" class="carousel-control right">›</a>
        </div><!-- /.control-box -->   
                              
    </div><!-- /#myCarousel -->       
	</div><!-- /.row --> 
	</div><!-- /.container -->
		
</td>

</tr>
</table>	
</div>                  
<script type="text/javascript">// Carousel Auto-Cycle
  $(document).ready(function() {
    $("#banner").remove();
  });
  $(document).ready(function() {
	    $('.carousel').carousel({
	      interval: 5000
	    })
	  });
</script>


<!-- 1 -->
	
	<!-- Google script -->
	<script src="${pageContext.request.contextPath}/js/google.login.js"></script>
	<!-- Henry's Custom logout -->
	<script>
		function logout() {
			GoogleSignOut();
			FacebookSignOut();

			function getContextPath() { //obtains context path. EL doesn't work with separated .js
				return window.location.pathname.substring(0,
						window.location.pathname.indexOf("/", 2));
			}
			$.ajax({
				type : "POST",
				url : (getContextPath() + '/member/logout'),
				data : 'email=' + "${memberVO.email}",
				success : function(data) {
					if (data[0].redirect) {
						window.location.href = data[0].redirectURL;
					}
				}
			})

		}
	</script>
<%-- 	<s:include value="/General/mySpace.jsp"></s:include> --%>
	<s:include value="/General/footer.jsp"></s:include>

</body>
</html>
