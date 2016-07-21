<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="">
    <meta name="author" content="">
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

</head>

<body>
    <div id="wrapper"><!-- all -->
    
    						

<jsp:include page="jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->
<div id="page-wrapper" style=background-color:#BFB2AB  >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                <div class="page-header" >
 <marquee  onMouseOver="this.stop()" onMouseOut="this.start()" bgcolor="#BFB2AB" direction="right" height="20" scrollamount="5" behavior="alternate"><font >希望透過操作友善且功能完整的資訊系統，提昇顧客滿意度及診所競爭優勢</font></marquee>                                           
                </div>
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="#BFB2AB" style="text-align: center;">熱銷產品</font></li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over -->
<!--         開始 -->
<div class="container-fluid">
<div id="container" ></div>
<div class ='element'></div>
<jsp:include page="chart_proc.jsp" /><!-- top and側邊欄功能表項目	位置 -->
</div><!--         結束 -->

</div><!-- /#page-wrapper --><!-- ALL over	/#wrapper -->   
</body>
</html>