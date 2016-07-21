<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>購物專區</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script src="${pageContext.request.contextPath}/js/lobibox.min.js"></script>
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/lobibox.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/shopping/css/prod_list.css" />
</head>
<body onload="queryProdByName('')">
<jsp:include page="/General/header.jsp"></jsp:include>
<div class="main">
<a href="${pageContext.request.contextPath}/shopping/shopping_list.jsp">我的購物車</a> 
	<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-list">
	<h1 style="display:inline;">愛美診所美妝商城</h1>
	
	<span id="query-wrapper">
		<jsp:useBean id="cataSvc" scope="page" class="group3.carrie.catagory.model.CatagoryService" />
		<c:forEach var="cataVO" varStatus="status" items="${cataSvc.all}">
			<span class="pid" onclick="queryProdById('${cataVO.cid}')">${cataVO.name}</span>
		</c:forEach>
		<input type="text" id="query" placeholder="商品搜尋" size="10" maxlength="30">
 		<input type="button" value="送出" onclick="queryProdByName()">
	</span>
	
	<div class="cbp-vm-options">
		<span id="description"></span>
		<a href="#" class="cbp-vm-icon cbp-vm-list cbp-vm-selected" data-view="cbp-vm-view-list">List View</a>
		<a href="#" class="cbp-vm-icon cbp-vm-grid" data-view="cbp-vm-view-grid">Grid View</a>
	</div>

	<ul id="body"></ul>
	<div id="Pagination"></div>

	</div>
</div>

<jsp:include page="/General/footer.jsp"></jsp:include>

<script src="${pageContext.request.contextPath}/shopping/js/classie.js"></script>
<script src="${pageContext.request.contextPath}/shopping/js/cbpViewModeSwitch.js"></script>
<script src="${pageContext.request.contextPath}/shopping/js/prod_list.js"></script>
<script>
$(function() {
	$(":text").attr("autocomplete", "off");
});
</script>
</body>
</html>
