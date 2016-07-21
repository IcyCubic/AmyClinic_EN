

	// This is called with the results from from FB.getLoginStatus().
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    console.log(response.authResponse);
    var accessToken = response.authResponse.accessToken;
    
//    var data = {"input_token":accessToken,"access_token":""};
//    $.ajax({
//        url: "graph.facebook.com/debug_token",
//        type: 'GET',
//        data: data,
//        dataType:'json',
//        success: function(data){
//          //On ajax success do this
//          alert(data);
//        }
//    });
    if (response.status === 'connected') {
      // Logged into your app and Facebook.
    	console.log("Facebook logged in!");
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
    appId      : '1733704493575453',
    cookie     : true,   
    xfbml      : true,
//    status	   : true,
    version    : 'v2.5' 
  });
  console.log("FB init");
  FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
  });

  };

//   Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
  
//  (function(d, s, id) {
//	  var js, fjs = d.getElementsByTagName(s)[0];
//	  if (d.getElementById(id)) return;
//	  js = d.createElement(s); js.id = id;
//	  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6&appId=1733704493575453";
//	  fjs.parentNode.insertBefore(js, fjs);
//	}(document, 'script', 'facebook-jssdk')); 
 
  
  
//  https://developers.facebook.com/docs/facebook-login/permissions
  function testAPI() {
    FB.api('/me', 'get', { fields: 'id,name,gender,email,first_name,locale,picture,timezone' }, function(response) {
      var id = response.id;
	  var name = response.name;
      var email = response.email
      var first_name = response.first_name
//      console.log(response.last_name);
//      console.log(response.age_range);
//      console.log(response.link);
      var gender = response.gender;
      var locale = response.locale;
      var picture = response.picture.data.url;
      var timezone = response.timezone;
//      console.log(response.updated_time);
//      console.log(response.verified);
      var data = {"id":id,"name":name,"email":email,"first_name":first_name,"gender":gender,"locale":locale,"picture":picture,"timezone":timezone};
      console.log(data);
//      console.log(data.id);
//      console.log(data.picture);
      function getContextPath() { //obtains context path. EL doesn't work with separated .js
    	  return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
      }
      $.ajax({
          url: getContextPath() + '/FacebookLoginServlet',
          type: 'POST',
//          contentType:'application/json', //sent type
          data: {"data" : JSON.stringify(data)},
          dataType:'json', //response type
          success: function(data){
            //On ajax success do this
  			if(data[0].redirect) {
				window.location.href = data[0].redirectURL;
  			}
          }
      });
    });


  }
  
  function FacebookSignOut(){
	if(FB.getAccessToken() != null) {
	    FB.logout(function(response) {
	        console.log("Facebook: User signed out.");
	    });
    }
  }

  
 

