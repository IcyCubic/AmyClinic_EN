<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="group3.beef.employee.*"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
<style type="text/css">
.img{
width: 800px; height: 600px; 
margin-left: 25%;
}
.carousel slide{
width: 800px; height: 600px; 
}
a:hover {
  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
  /* IE 8 */
  filter: alpha(opacity=50);
  /* IE7 */
  opacity: 0.6;
  text-decoration: none;
}
.container-fluid {
/*   margin: 40px auto 10px; */
/*   padding: 20px 0px; */
  max-width: 100%;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
}

.page-header{margin:0px auto;}

</style>

</head>

<body>
<div id="wrapper"><!-- all -->
<jsp:include page="/Backstage/jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->   
<!-- 1 -->
<div class="container-fluid">
<div class="row-fluid">
<div class="span12">
<center>

    <div class="page-header">
<img class="img-circle" width="100px"src="${pageContext.request.contextPath}/ShowEmpPic.servlet?num=${session.empVO.eid}" />
<font color=#FF8000 class='fa fa-smile-o'>${session.empVO.name}您好!</font><br>
<!-- <a href='' data-toggle="modal" data-target="#myModalNorm" ><i class="fa fa-edit"></i><b>重新登入</b></a> -->
<%-- <a href="<%=request.getContextPath()%>/empLogin/EmpLoginServlet.do?action=logout"><i class="fa fa-fw fa-power-off"></i><b>登出!</b></a><br> --%>
<!-- <a href="" class="text-primary" data-toggle="modal" data-target="#resetpw"><i class="fa fa-question-circle"></i><b>忘記密碼</b></a><br> -->
<%-- <a href='<%=request.getContextPath()%>/empLogin/AddEMP.jsp'><i class="	fa fa-child"></i><b>加入新員工</b></a><br> --%>
    </div>
  
</center>       
    <div class="carousel slide" id="myCarousel">
        <div class="carousel-inner">
 
            <div class="item active">            
                <div class="bannerImage">
                    <a href="#"><img src="${pageContext.request.contextPath}/images/home01.jpg" title=""  class='img'></a>
                </div>                            
                <div class="caption row-fluid">
                    <div class="span4"><center><font color=#FF8000 >台灣醫學美容高級品牌</font></center></div>                	               	
                </div>                                                       
            </div><!-- /Slide1 --> 

            <div class="item">   
                <div class="bannerImage">
                    <a href="#"><img src="${pageContext.request.contextPath}/images/home02.jpg" title="" class='img'></a>
                </div>                        
                <div class="caption row-fluid">
                    <div class="span4"><center><font color=#FF8000>給您貴婦般的奢華體驗 </font></center></div>                	
                </div>                                                        
            </div><!-- /Slide2 -->             

            <div class="item">            
                <div class="bannerImage">
                    <a href="#"><img src="${pageContext.request.contextPath}/images/home03.jpg" title="" class='img'></a>
                </div>                            
                <div class="caption row-fluid">
                    <div class="span4"><center><font color=#FF8000>充滿設計感的櫃檯</font></center></div>                                                       
            </div>                    
        </div><!-- /Slide3 -->  
                              
    </div><!-- /#myCarousel -->
        
</div><!-- /.span12 -->          
</div><!-- /.row --> 
</div><!-- /.container -->                      
<script type="text/javascript">// Carousel Auto-Cycle
  $(document).ready(function() {
    $('.carousel').carousel({
      interval: 2000
    })
  });
</script>
<!-- 1 -->     
<!--         開始 -->
<!--Bootstrap dialog Modal -->
<div class="modal fade" id="myModalNorm" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            		<!-- Modal Header -->
            		<div class="modal-header">
                	<button type="button" class="close"  data-dismiss="modal">
                       <span aria-hidden="true">&times;</span>
                       <span class="sr-only">Close</span>
                </button>
               <font color="#BFB2AB" style="text-align: center;">員工登入</font>
            </div>
                
            <div class="modal-body"><!-- Modal Body -->             
                <div class="form-box">
                <form >
                		<label class="control-label col-sm-2" for="maillog">信箱</label>
                    <input type="text" name="maillog" id="maillog" placeholder="使用者信箱"><br>
                    	<label class="control-label col-sm-2" for="pwdlog">密碼</label>
                    <input type="password" id="pwdlog"  name="pwdlog" placeholder="密碼">
                    <button class="btn btn-info btn-block login" type="button" id="loginbtn">登入</button>
                </form>
            </div>                                    
            </div><!-- Modal Body -->
            
            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-primary"    data-dismiss="modal">關閉</button>
            </div>
        </div>
    </div>
</div>
</div><!-- all --></div>
</body>
<script type="text/javascript">
	$("#addsch").click(function(){
		window.location = '${pageContext.request.contextPath}/schedule/add_schedule.jsp';	
	});
</script>
</html>