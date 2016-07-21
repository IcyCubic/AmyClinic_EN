
function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
      // The ID token you need to pass to your backend:
      var id_token = googleUser.getAuthResponse().id_token;
//       console.log("ID Token: " + id_token);     
// 	  var user = {'name': profile.getName()};
	  	  
// 	  sessionStorage.setItem('user', JSON.stringify(user)); //session->JSON test	  
// 	  var obj = JSON.parse(sessionStorage.user);
// 	  console.log(obj.name);


// 	  var xhr = new XMLHttpRequest(); //AJAX, sends token to backend for verification
// 	  xhr.open('POST', '${pageContext.request.contextPath}/GoogleLoginServlet'); // token verification servlet
// 	  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
// 	  xhr.onload = function() {
// 	    console.log('Signed in as: ' + xhr.responseText);
// 	  };
// 	  xhr.send('idtoken=' + id_token);

      function getContextPath() { //obtains context path. EL doesn't work with separated .js
    	   return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
    	}
    	
	$.ajax({
		type: "POST",
		url: (getContextPath()+'/GoogleLoginServlet'),
		data: 'idtoken=' + id_token,
		dataType:'json',
		success: function(data) {
			if(data[0].redirect) {
				console.log("redirecting");
				window.location.href = data[0].redirectURL;
			}
		}
	})
}

function GoogleSignOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('Google: User signed out.');
    });
}