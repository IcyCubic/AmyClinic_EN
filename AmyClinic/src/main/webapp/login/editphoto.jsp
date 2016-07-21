<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/colorbox.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/lobibox.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.colorbox.js"></script>
<script src="${pageContext.request.contextPath}/js/lobibox.min.js"></script>
<script src="${pageContext.request.contextPath}/login/js/previewImg.js"></script>

<title>Insert title here</title>
<style>

</style>
</head>
<body bgcolor="#FFD9EC">
<b style="font-size: 15pt">會員照片修改</b><br>
<span style="font-size: 13pt">支援副檔名：.gif、.jpg、.jpeg、.png</span><br><br>
	<s:actionerror/>
	<s:form action="updatephotos" namespace="/member" enctype="multipart/form-data"  method="post" theme="simple">
        <s:file name="fileUpload" label="照片上傳" size="30" cssStyle="font-size:13pt" onchange="PreviewImage(this)"/> <!-- name="fileUpload" fileUpload與Action中的暫時File物件變數名稱要一致 -->
		<br>
		<td class="tdLabel" style="background-color: #FFD9EC;"></td>
		<br>
	    <td>
	       <table>
	         <tr>
	            <td><s:div id="imgPreview"  cssStyle="overflow:hidden;"></s:div></td>

	          </tr>
	        </table>
	    </td>
	    <br>

		<s:submit value="上傳" cssStyle="font-size:13pt;margin-right:5%"/>
		<input type="button" id="cancel" value="取消" style="font-size: 13pt;">
		
	</s:form>
	
<script>
$("#cancel").click(function(){
	top.$.fn.colorbox.close();
})
</script>
</body>

</html>