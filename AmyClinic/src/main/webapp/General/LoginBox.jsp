<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<!-- Google API -->
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<meta name="google-signin-scope" content="profile email">
	<meta name="google-signin-client_id" content="187388699466-pqf6of44on8fl4fvfdhe5rqu8or4r3ba.apps.googleusercontent.com">
</head>
<style>
#userphoto {
	border-radius: 50%;
	width: 50px;
	height: 50px;
	display: inline-block;
	vertical-align: top;
}

#LoginBox {
/* 	border:3px double green; */
	padding-top:5px;
	padding-right:10px;
	padding-bottom:0 !important;
/* 	background-color: grey; */
	height: auto;
/*	width: 200px; */

	color: black;
/* 	dispaly: inline-block; */
 	text-align: right; 	
/* 	float:right; */
/* 	clear:both; */
}
#LoginBox p {
height: 19px;
font-size: 13pt;
font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}
#LoginBox a:visited {
    color: #0C95C9;
}
#LoginBox a:hover {
    color: #0C95C9;
}
#LoginBoxText{
	width:auto;
	display: inline-block;
	padding-top:0;
}
p {
	margin:0;
	padding:0;
	text-align: center;
}

a {
	text-decoration: none;
}
</style>
<div id="fb-root"></div>
<div id="LoginBox">
	<input type="hidden" class="g-signin2" /> 
	<c:choose>
		<c:when test="${memberVO != null}">
			<c:choose>
				<c:when test="${memberVO.photo != null && memberVO.photo != \"\"}">
					<img id="userphoto" src='${pageContext.request.contextPath}/user_photo/${memberVO.photo}' >
				</c:when>
				<c:otherwise>
					<img id="userphoto" src='${pageContext.request.contextPath}/web/images/anon.jpg' >
				</c:otherwise>
			</c:choose>
			<div id="LoginBoxText">
			<c:if test="${not empty memberVO.name}" > 
	        	<p>${memberVO.name}，您好！</p>
	        	<p>
					<a href="#" onclick="logout();" id="logoutbutton">登出</a> |
						<a style="text-decoration: none" href="${pageContext.request.contextPath}/member/member.jsp">會員專區</a>
				</p> 
	        </c:if>
	        <c:if test="${empty memberVO.name}" >
	        	<p>訪客，您好！</p>
	        	<p>
					<a href="${pageContext.request.contextPath}/login/login.jsp">登入</a> |
					<a href="${pageContext.request.contextPath}/register/register.jsp">註冊</a>
				</p>	
	        </c:if>	
			</div>				 
		</c:when>
		<c:otherwise>
			<img id="userphoto" src='${pageContext.request.contextPath}/web/images/anon.jpg' >
			<div id="LoginBoxText">
	        	<p>訪客，您好！</p>
				<p>
					<a href="${pageContext.request.contextPath}/login/login.jsp">登入</a> |
					<a href="${pageContext.request.contextPath}/register/register.jsp">註冊</a>
				</p>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<!-- Combined Facebook / Google script -->
<%-- <script src="${pageContext.request.contextPath}/js/logout.js"></script> --%>
<script>
	//Google

	function init() {
		gapi.load('auth2', function() {
			gapi.auth2.init();
		});
	}

	function GoogleSignOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function() {
			console.log('Google: User signed out.');
		});
	}

	//-------------------------------------------
	// Facebook

	function statusChangeCallback(response) {
		console.log('statusChangeCallback');
		console.log(response);
		console.log(response.authResponse);
		var accessToken = response.authResponse.accessToken;

		if (response.status === 'connected') {
			// Logged into your app and Facebook.
// 			console.log("Facebook logged in! (via LoginBox)");
			testAPI();
		} else if (response.status === 'not_authorized') {
			// The person is logged into Facebook, but not your app.

		} else {
			// The person is not logged into Facebook, so we're not sure if
			// they are logged into this app or not.
		}
	}

	function checkLoginState() {
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}

	window.fbAsyncInit = function() {
		FB.init({
			appId : '1733704493575453',
			cookie : true,
			xfbml : true,
			//status	   : true,
			version : 'v2.5'
		});
		console.log("FB init");
// 		FB.getLoginStatus(function(response) {
// 			statusChangeCallback(response);
// 		});

	};

	//Load the SDK asynchronously
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	//(function(d, s, id) {
	//  var js, fjs = d.getElementsByTagName(s)[0];
	//  if (d.getElementById(id)) return;
	//  js = d.createElement(s); js.id = id;
	//  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6&appId=1733704493575453";
	//  fjs.parentNode.insertBefore(js, fjs);
	//}(document, 'script', 'facebook-jssdk')); 

	//https://developers.facebook.com/docs/facebook-login/permissions
	function testAPI() {
		FB.api('/me', 'get', {fields : 'id,name,gender,email,first_name,locale,picture,timezone'}, function(response) {
			var id = response.id;
			var name = response.name;
			var email = response.email
			var first_name = response.first_name
			var gender = response.gender;
			var locale = response.locale;
			var picture = response.picture.data.url;
			var timezone = response.timezone;
			var data = {
				"id" : id,
				"name" : name,
				"email" : email,
				"first_name" : first_name,
				"gender" : gender,
				"locale" : locale,
				"picture" : picture,
				"timezone" : timezone
			};
			function getContextPath() { //obtains context path. EL doesn't work with separated .js
				return window.location.pathname.substring(0,
						window.location.pathname.indexOf("/", 2));
			}
		});
	}

	function FacebookSignOut() {
		if (FB.getAccessToken() != null) {
			FB.logout(function(response) {
				console.log("Facebook: User signed out.");
			});
		}
	}
	//-------------------------------------------
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
