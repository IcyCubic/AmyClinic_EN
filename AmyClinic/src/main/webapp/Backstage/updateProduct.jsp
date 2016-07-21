<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="group3.carrie.product.model.*"%>
<%@page import="group3.carrie.catagory.model.*"%>

<!DOCTYPE html >
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="">
    <meta name="author" content="">
</head>

<body>
    <div id="wrapper"><!-- all -->
<jsp:include page="jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->
<div id="page-wrapper" style=background-color:#000000  >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
<!--                 <div class="page-header" > -->
<!--  <marquee  onMouseOver="this.stop()" onMouseOut="this.start()" bgcolor="#ADADAD" direction="right" height="20" scrollamount="8" behavior="alternate">本月目標<font color="red">30億</font></marquee>                                            -->
<!--                 </div> -->
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="#BFB2AB" style="text-align: center;">修改產品</font></li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over -->   
<!--         開始 -->
<%
ProductVO productVO = (ProductVO) request.getAttribute("productVO");
ProductService product = new ProductService();
List<ProductVO> list = product.getAll();
pageContext.setAttribute("list",list);
// CatagoryVO catagoryVO;
CatagoryService cataServ  = new CatagoryService();
List<CatagoryVO> catagorys = cataServ.getAll();
pageContext.setAttribute("catagorys", catagorys);
%>
 <div class="container">
  <br>
  <form class="form-horizontal" role="form" ACTION="ProductServlet"  ENCTYPE="multipart/form-data" method="post">
  	  
  	  <div class="form-group">
      <label class="control-label col-sm-2" for="pid">商品編號</label>
      <div class="col-sm-10">          
        <input type="text"  class="form-control" id="pid"  size="45" name="pid"  readonly value="<%=productVO.getPid()%>"   style="width:80px;"  >
      </div>
    </div>
  	  
      <div class="form-group">
      <label class="control-label col-sm-2" for="cid">商品類別</label>
      <div class="col-sm-10">          
<%--         <input type="text" class="form-control" id="cid" placeholder="10,20,30,40,50" size="45" name="cid" value="<%=productVO.getCatagoryVO()%>" /> --%>
  
      <select size="1"  name="cid">
      <c:forEach var="catagorys" items="${catagorys}">
				<option  value="${catagorys.cid}" ${(productVO.catagoryVO.cid==catagorys.cid)?'selected':'' } >${catagorys.name}
	  </c:forEach>
      </select>
      </div>
    </div>
      
  
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">商品名稱</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="name"  placeholder="中英文學名" size="45" name="name" value="<%=productVO.getName()%>" />
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="price">商品價格(元)</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="price" placeholder="整數數字" size="45" name="price"  value="<%=productVO.getPrice()%> 元"   style="width:120px;"/>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="discount">商品折扣(%)</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="discount" placeholder="0～99％" size="45" name="discount" value="<%=productVO.getDiscount()%> " style="width:80px;"/>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="descrip">商品描述</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="descrip" placeholder="用途介紹" size="45" name="descrip" value="<%=productVO.getDescrip()%>" />
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="ingredients">商品規格</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="ingredients" placeholder="依食品衛生法標示" size="45" name="ingredients" value="<%=productVO.getIngredients()%>" />
      </div>
    </div>
   <div class="form-group">
      <label class="control-label col-sm-2" for="amount">庫存量</label>
      <div class="col-sm-10">          
        <input type="number" class="form-control" id="amount" placeholder="庫存量" size="45" name="amount" value="<%=productVO.getAmount()%>" style="width:80px;"/>
      </div>
    </div>

<div class="form-group">
<label class="control-label col-sm-2" for="photo">商品圖片</label>
<div class="col-sm-10">
    <input type='file' class="upl"  name="photo" />
</div>
    <div>
        <img src="<%=request.getContextPath()%>/shopping/GetPic?num=<%=productVO.getPid()%>" class="preview" style="max-width: 150px; max-height: 150px;">
        <div class="size"></div>
    </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
      						<input type="hidden" name="action" value="update">
        <button type="submit" class="btn btn-success">修改產品</button>
      </div>
    </div>
<script type="text/javascript">
$(function (){
	 
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
 
    function preview(input) {
 
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('.preview').attr('src', e.target.result);
                var KB = format_float(e.total / 1024, 2);
                $('.size').text("檔案大小：" + KB + " KB");
            }
 
            reader.readAsDataURL(input.files[0]);
        }
    }
 
    $("body").on("change", ".upl", function (){
        preview(this);
    })
    
})

$("body").on("change", ".upl", function (){
    preview(this);
})
/**
 * 預覽圖
 * @param   input 輸入 input[type=file] 的 this
 */
function preview(input) {
 
    // 若有選取檔案
    if (input.files && input.files[0]) {
 
        // 建立一個物件，使用 Web APIs 的檔案讀取器(FileReader 物件) 來讀取使用者選取電腦中的檔案
        var reader = new FileReader();
 
        // 事先定義好，當讀取成功後會觸發的事情
        reader.onload = function (e) {
            
            console.log(e);
 
            // 這裡看到的 e.target.result 物件，是使用者的檔案被 FileReader 轉換成 base64 的字串格式，
            // 在這裡我們選取圖檔，所以轉換出來的，會是如 『data:image/jpeg;base64,.....』這樣的字串樣式。
            // 我們用它當作圖片路徑就對了。
            $('.preview').attr('src', e.target.result);
 
            // 檔案大小，把 Bytes 轉換為 KB
            var KB = format_float(e.total / 1024, 2);
            $('.size').text("檔案大小：" + KB + " KB");
        }
 
        // 因為上面定義好讀取成功的事情，所以這裡可以放心讀取檔案
        reader.readAsDataURL(input.files[0]);
    }
}
/**
 * 格式化
 * @param   num 要轉換的數字
 * @param   pos 指定小數第幾位做四捨五入
 */
function format_float(num, pos)
{
    var size = Math.pow(10, pos);
    return Math.round(num * size) / size;
}
</script>

<%-- 錯誤表列 --%>
   <c:if test="${not empty errorMsg}">
	<font color='red'>請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsg}">
			<li><font color='red'>請修正以下錯誤:${message}</font></li>
		</c:forEach>
	</ul>
	
</c:if>
<%-- 錯誤表列 --%>
    
  </form>
</div>
<!--         結束 -->
        </div><!-- /#page-wrapper --><!-- ALL over	/#wrapper -->   
</body>
</html>