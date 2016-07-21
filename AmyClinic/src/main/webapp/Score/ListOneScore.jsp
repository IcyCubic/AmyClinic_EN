<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${employeeVO.name }的評分紀錄</title>
<link href="${pageContext.request.contextPath}/General/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Score/css/ListOneScore.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/General/js/jquery.min.js"></script>
</head>
<body>
<jsp:include page="/General/header.jsp"></jsp:include>
<div class="clr"></div>
<div class="body">
<div class="scoreh1"><h1>${employeeVO.name}醫師的評分紀錄  平均：${avgScore }</h1></div>
<br>
<br>
<br>
<table>
	<tr class="cmt-tag">
	    <td><div class="tag-orange">我的評論紀錄</div></td>
	    <td></td>
	</tr>
	<c:forEach var="ScoreVO" items="${scoreVO}">
		<c:if test="${ScoreVO.mb.mid == memberVO.mid }">
			<c:choose>
			<c:when test="${ScoreVO.st==1 }">
			<tr class="comment member">
			<td>
				<div class="user-profile">
				<div class="star-rating">
                    <div class="current-rating current-rating--${ScoreVO.scores}"><i class="star-rating__star">AAA</i></div>
                </div>
					<img src='${pageContext.request.contextPath}/user_photo/${ScoreVO.mb.photo}' class="user-photo">
				<div class="mbname">${ScoreVO.mb.name}</div>
				</div>
			</td>
			<td>
<%-- 			    <div style="width: 200px; height: 40px;background-color: lightblue; box-sizing: border-box;">診療日期：${appVO.apt_date}</div> --%>
				<c:out value="${ScoreVO.comment}" />
				<br>
				<p class="timestamp">${ScoreVO.scoreDate}</p>
			</td>
			</tr>
				</c:when>
				<c:otherwise>
				<tr class="comment member">
                    <td>
                        <div class="user-profile">
                            <div class="star-rating">
                                <div class="current-rating current-rating--0"><i class="star-rating__star">AAA</i></div>
                            </div>
                            <div class="notif notif-alert">
                                <h6 class="notif-title"></h6>
                            </div>
                            <div class="mbname">---</div>
                        </div>
                    </td>
                    <td>
                        <h1 style="color:red;">該則評論因不雅 被管理者屏蔽</h1>
                        <p class="timestamp">${ScoreVO.scoreDate}</p>
                    </td>
                </tr>
				</c:otherwise>	
			</c:choose>
		</c:if>
	</c:forEach>
    <tr class="cmt-tag">
        <td><div class="tag-blue">其他會員的留言</div></td>
        <td></td>
    </tr>
	<c:forEach var="ScoreVO" items="${scoreVO}">
	<c:if test="${ScoreVO.mb.mid != memberVO.mid }">
		<c:choose>
			<c:when test="${ScoreVO.st==1 }">
			<tr class="comment">
				<td>
					<div class="user-profile">
						<div class="star-rating">
	                        <div class="current-rating current-rating--${ScoreVO.scores}"><i class="star-rating__star">AAA</i></div>
	                    </div>
						<img src='${pageContext.request.contextPath}/user_photo/${ScoreVO.mb.photo}' class="user-photo">
						<div class="mbname">${ScoreVO.mb.name}</div>
					</div>
				</td>
				<td valign="top">
<%--                     <div style="width: 200px; height: 40px;background-color: lightblue; box-sizing: border-box;">診療日期：${appVO.apt_date}</div> --%>
					<c:out value="${ScoreVO.comment}" />
					<br>
					<p class="timestamp">${ScoreVO.scoreDate}</p>
				</td>
			</tr>
			</c:when>
			<c:otherwise>
			<tr class="comment">
                    <td>
                        <div class="user-profile">
                            <div class="star-rating">
                                <div class="current-rating current-rating--0"><i class="star-rating__star">AAA</i></div>
                            </div>
                            <div class="notif notif-alert">
                                <h6 class="notif-title"></h6>
                            </div>
                            <div class="mbname">---</div>
                        </div>
                    </td>
                    <td>
                        <h1 style="color:red;">該則評論因不雅 被管理者屏蔽</h1>
                        <p class="timestamp">${ScoreVO.scoreDate}</p>
                    </td>
                </tr>
			</c:otherwise>	
		</c:choose>
	</c:if>
	</c:forEach>
</table>
</div>
<jsp:include page="/General/footer.jsp"></jsp:include>
</body>
</html>