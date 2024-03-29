$(document).ready(function(){

  window.APP_KEY = $('body').attr('app_key')
  window.fbAsyncInit = function() {
    FB.init({
      
      appId      : window.APP_KEY, // App ID
      channelUrl : '/channel', // Channel File
      status     : true, // check login status
      cookie     : true, // enable cookies to allow the server to access the session
      xfbml      : true  // parse XFBML
    });

    // Additional initialization code here
  };

  // Load the SDK Asynchronously
  (function(d){
     var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement('script'); js.id = id; js.async = true;
     js.src = "//connect.facebook.net/en_US/all.js";
     ref.parentNode.insertBefore(js, ref);
   }(document));
  
  // loging into facebook

  $('#fb_login').click(function(){

    FB.login(function(response) {
      origin = '/'
      if (response.authResponse) {
        window.location.href = '/auth/facebook?display=popup&origin=' + origin
      }
    }, {scope: 'email,offline_access,user_location'});

    return false
  })

})  

