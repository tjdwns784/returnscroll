<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
   language="java"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
    
    
<title>귀환주문서</title>

<!-- Bootstrap Core CSS -->
<link
   href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">

<!-- Custom Fonts -->
<link
   href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
   rel="stylesheet" type="text/css">
<link
   href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.css"
   rel="stylesheet">

<!-- Custom CSS -->
<link
   href="${pageContext.request.contextPath}/resources/css/stylish-portfolio.min.css"
   rel="stylesheet">

<link rel="stylesheet" href="resources/style.css">
<style>
   nav#sidebar-wrapper {
      top: 0px !important;
   }
</style>

</head>
<body>
<body id="page-top" > 

   <!-- Navigation -->
   <jsp:include page="side.jsp"></jsp:include>
   
   <div id="body">
   <div>
    <form id="loginForm" name="loginForm">
        <svg id="ryan" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg" style="margin-bottom:3%">
            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="ears">
                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(-10,38,24)" />
                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(10,82,24)" />
            </g>
            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="eyes">
                <!-- left eye and eyebrow-->
                <line x1="37" x2="50" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="44" cy="55" r="3" fill="#000" />
                <!-- right eye and eyebrow -->
                <line x1="70" x2="83" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="76" cy="55" r="3" fill="#000" />
            </g>
            <g class="muzzle">
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" />
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65" fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
            </g>
            <path d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105" fill="#fff" />
        </svg>
        <div class="container text-center my-auto">
         <h1 class="mb-1">Login</h1>
         <h3 class="mb-5"></h3>
         <form class="form-inline-block" action="login" method="post">
            <div class="form-group" style="margin-top: -10%">
               <label for="uid"></label> <input type="text"
                  class="form-control" name="uid" id="uid" placeholder="아이디 입력" style="margin-top: -10%; margin-bottom: -10%">
            </div>
            <div class="form-group">
               <label for="upw"></label> <input type="password"
                  class="form-control" name="upw" id="upw" placeholder="암호 입력" style="margin-top: -1%; margin-bottom: -13%;" onkeyup="enterkey();" type="text"  value="">
            </div>
            <br>
            <div class="checkbox">
               <label><input name="idsave" type="checkbox"> 아이디 저장</label>
            </div>
               <div class="interval_height a_none">
                  <a href="/returnscroll/userSearch" id="btnSearch">아이디 / 비밀번호 찾기</a>
               </div>
            </form>
         <a class="btn btn-primary btn-xl js-scroll-trigger"
            href="/returnscroll/login" id="btnLogin" style="width:115px; height: 35px; margin-top: 3%; margin-bottom: 5%;  line-height:0.1;">Login</a> 
         <a class="btn btn-primary btn-xl js-scroll-trigger"
            href="/returnscroll/join" style="width:115px; height: 35px; margin-top: 3%; margin-bottom: 5%;  line-height:0.1;">Join</a>
            
         <!-- 카카오 로그인 -->
         <a id="custom-login-btn" href="javascript:loginWithKakao()">
      <img id="kakao-login-btn" src="/returnscroll/resources/img/kakaotalk.jpg" style="margin-right:2.7%; margin-" border="0" alt=""/></a>
      
         <!-- 페이스북 로그인 -->
         <a href="#" onclick="fb_login()"><img src="/returnscroll/resources/img/facebook.jpg" style="margin-right:2.7%;" border="0" alt=""></a>
                    
         <!-- 구글 로그인 -->
         <div id="gSignInWrapper" style="display: inline-block; margin-right:2.7%;">
             <div id="customBtn" >
              <span class="icon"></span>
              <span id="a" class="customGPlusSignIn" onclick="if(this.innerHTML ==='Logout') {signOut();} return false;"> 
                 <img src="/returnscroll/resources/img/googleplus.jpg" border="0" alt="">
              </span>
          </div>
        </div>
        
         <!-- 네이버 로그인 -->
        <div id="naverIdLogin" style="display: inline-block; margin-right:2.7%;">
           <a id="naverIdLogin_loginButton" role="button" href='#'>
              <img src="/returnscroll/resources/img/naver.jpg" border="0" alt="">
           </a>
        </div>
           
      <div class="overlay"></div>
    </form>
   </div>
   <jsp:include page="footer.jsp"></jsp:include>
</div>
   
    <script src="resources/script.js"></script>

   <!-- Bootstrap core JavaScript -->
   <script
      src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

   <!-- Plugin JavaScript -->
   <script
      src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

   <!-- Custom scripts for this template -->
   <script
      src="${pageContext.request.contextPath}/resources/js/stylish-portfolio.min.js"></script>

<script>
      function enterkey() {
         if (window.event.keyCode == 13) {
            // 엔터키가 눌렸을 때 실행할 내용
            var action = $('#btnLogin').attr("href");
            var form_data = {
               "uid" : $('#uid').val(),
               "upw" : $('#upw').val()
            };
            $.ajax({
               type : "POST",
               url : action,
               data : form_data,
               success : function(res) {

                  if (res == "success") {
                     alert("환영합니다!");
                     sendit();
                     location = "index"
                  } else {
                     alert("아이디 또는 비밀번호가 잘못되었습니다");
                  }
               },
               error : function() {
                  alert("Error");
               }
            });
            return false;

         }
      }
      //       $('#btnLogin').click(function() {
      //          $('form')[0].method = 'post';
      //          $('form')[0].submit();
      //          return false;
      //       });
      $('#btnLogin').click(function() {
         var action = $('#btnLogin').attr("href");
         var form_data = {
            "uid" : $('#uid').val(),
            "upw" : $('#upw').val()
         };
         $.ajax({
            type : "POST",
            url : action,
            data : form_data,
            success : function(res) {

               if (res == "success") {
                  alert("환영합니다!");
                  sendit();
                  location = "index"
               } else {
                  alert("아이디 또는 비밀번호가 잘못되었습니다");
               }
            },
            error : function() {
               alert("Error");
            }
         });
         return false;

      });
</script>
   <script>

      window.fbAsyncInit = function() {
         FB.init({
            appId : '1155530134645895',
            cookie : true, // enable cookies to allow the server to access the session
            xfbml : true, // parse social plugins on this page
            version : 'v4.0' // use graph api version 2.8
         });
//          FB.getLoginStatus(function(response) {
//             statusChangeCallback(response);
//          });
      };

      (function(d, s, id) {
         var js, fjs = d.getElementsByTagName(s)[0];
         if (d.getElementById(id)) {
            return;
         }
         js = d.createElement(s);
         js.id = id;
         js.src = "https://connect.facebook.net/en_US/sdk.js";
         fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));
      
      function fb_login(){
          FB.login(function(response) {

              if (response.authResponse) {
                  console.log('Welcome!  Fetching your information.... ');
                  //console.log(response); // dump complete info
                  access_token = response.authResponse.accessToken; //get access token
                  user_id = response.authResponse.userID; //get FB UID

                  FB.api('/me', function(response) {
                      user_email = response.email; //get user email
                      console.log(response)
                // you can store this data into your database  
                      var id = response.id;
                  
                  $.ajax({               
                     url : "facebookDup",            
                     data : {            
                     facebook : id         
                     },            
                     success : function(res) {            
                        console.log(res);         
                                 
                        if (res == 0) {         
                           location = 'join?facebook=' + id + ''      
                        } else if (res == 1) {         
                           location = 'loginFacebook?facebook=' + id + ''      
                        }         
                     }            
                  });         
                  document.getElementById('status').innerHTML = JSON.stringify(response);
                  });

              } else {
                  //user hit cancel button
                  console.log('User cancelled login or did not fully authorize.');

              }
          }, {
              scope: 'email'
          });
      }

      var accessToken;
      function statusChangeCallback(response) {

         console.log('statusChangeCallback');

         if (response.status === 'connected') {
            console.log(response.authResponse.accessToken);
            // Logged into your app and Facebook.
            accessToken = response.authResponse.accessToken;
            testAPI();
         } else if (response.status === 'not_authorized') {
            document.getElementById('status').innerHTML = 'Please log '
                  + 'into this app.';
         } else {
            document.getElementById('status').innerHTML = 'Please log '
                  + 'into Facebook.';
         }

      }

      function checkLoginState() {
         FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
         });
      }

      function testAPI() {
         console.log('Welcome! Fetching your information.... ');
         FB.api('/me', {
            "fields" : "id,name,email"
         }, function(response) {
            // Insert your code here
            console.log('Successful login for: ' + response.name, response.email, response.id);
            ///////////////////////////////////////////////////////////////////////////////
            var id = response.id;
            
            $.ajax({               
                     url : "facebookDup",            
                     data : {            
                     facebook : id         
                     },            
                     success : function(res) {            
                        console.log(res);         
                                 
                        if (res == 0) {         
                           location = 'join?facebook=' + id + ''      
                        } else if (res == 1) {         
                           location = 'loginFacebook?facebook=' + id + ''      
                        }         
                     }            
                  });         
            document.getElementById('status').innerHTML = JSON
                  .stringify(response);
         });
      }
</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>                                 
   //<![CDATA[                              
   // 사용할 앱의 JavaScript 키를 설정해 주세요.                              
   Kakao.init('4de13c38b225e4c65f11521d264e7212');                              
   // 카카오 로그인 버튼을 생성합니다.                              
   function loginWithKakao() {                              
      Kakao.Auth.loginForm({                           
         success : function(authObj) {                        
            console.log(JSON.stringify(authObj));                     
                                 
            Kakao.API.request({                     
               url : '/v2/user/me',                  
               success : function(res) {                  
                  var id = res.id;               
                  $.ajax({               
                     url : "kakaoDup",            
                     data : {            
                     kakao : id         
                     },            
                     success : function(res) {            
                        console.log(res);         
                                 
                        if (res == 0) {         
                           location = 'join?kakao=' + id + ''      
                        } else if (res == 1) {         
                           location = 'loginKakao?kakao=' + id + ''      
                        }         
                     }            
                  });               
                                 
               },                  
               fail : function(error) {                  
                  alert(JSON.stringify(error));
               }                  
            });                     
                                 
            //         let userCode = JSON.stringify(authObj);            
                                 
         },                        
         fail : function(err) {                        
            alert(JSON.stringify(err));                     
         }                        
      });                           
   }                              
   //]]>                                             
</script>

<script src="https://apis.google.com/js/api:client.js"></script>
  <script> 
  var googleUser = {};
  var startApp = function() {
    gapi.load('auth2', function(){
      // Retrieve the singleton for the GoogleAuth library and set up the client.
      auth2 = gapi.auth2.init({
        client_id: '630134026179-rgc07okoujjobuonqp55itnh2lt42vic.apps.googleusercontent.com',
        cookiepolicy: 'single_host_origin',
        // Request scopes in addition to 'profile' and 'email'
        //scope: 'additional_scope'
      });
      attachSignin(document.getElementById('customBtn'));
    });
  };
 
  function attachSignin(element) {
    console.log("id");
    auth2.attachClickHandler(element, {},
        function(googleUser) {
          console.log('click handler')
          console.log(googleUser)
          console.log(googleUser.El)
          
          
//             document.querySelector('#a').innerHTML = 'Logout';
//           document.getElementById('name').innerText = "Signed in: " +
//               googleUser.getBasicProfile().getName();
         var id = googleUser.El;
           $.ajax({               
            url : "googleDup",            
            data : {            
               google : id         
            },            
            success : function(res) {            
               console.log(res);         
                        
               if (res == 0) {         
                  location = 'join?google=' + id + ''      
               } else if (res == 1) {         
                  location = 'loginGoogle?google=' + id + ''      
               }         
            },fail : function(error) {                  
                  console.log("error");
            }
         });   
         
        }, function(error) {
          console.log(JSON.stringify(error, undefined, 2));
        });
  }
          function signOut() {
            var auth2 = gapi.auth2.getAuthInstance();
            auth2.signOut();
            auth2.disconnect();
        }
   startApp();
  </script>
<!-- 
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script>
        function onSignIn(googleUser) {
            // Useful data for your client-side scripts:
            var profile = googleUser.getBasicProfile();
            console.log("ID: " + profile.getId()); // Don't send this directly to your server!
            console.log('Full Name: ' + profile.getName());
            console.log("Email: " + profile.getEmail());
            // The ID token you need to pass to your backend:
            var id_token = googleUser.getAuthResponse().id_token;
            console.log("ID Token: " + id_token);
            ///////////////////////////////////////////////////////////////
            var id = profile.getId();               
         $.ajax({               
            url : "googleDup",            
            data : {            
            google : id         
            },            
            success : function(res) {            
               console.log(res);         
                        
               if (res == 0) {         
                  location = 'join?google=' + id + ''      
               } else if (res == 1) {         
                  location = 'loginGoogle?google=' + id + ''      
               }         
            },fail : function(error) {                  
                  console.log("error");
            }
         });      
        };
</script>
-->

<script>
       window.onload = function() {
    
           if (getCookie("id")) { // getCookie함수로 id라는 이름의 쿠키를 불러와서 있을경우
               document.loginForm.uid.value = getCookie("id"); //input 이름이 id인곳에 getCookie("id")값을 넣어줌
               document.loginForm.idsave.checked = true; // 체크는 체크됨으로
           }
    
       }
    
       function setCookie(name, value, expiredays) //쿠키 저장함수
       {
           var todayDate = new Date();
           todayDate.setDate(todayDate.getDate() + expiredays);
           document.cookie = name + "=" + escape(value) + "; path=/; expires="
                   + todayDate.toGMTString() + ";"
       }
    
       function getCookie(Name) { // 쿠키 불러오는 함수
           var search = Name + "=";
           if (document.cookie.length > 0) { // if there are any cookies
               offset = document.cookie.indexOf(search);
               if (offset != -1) { // if cookie exists
                   offset += search.length; // set index of beginning of value
                   end = document.cookie.indexOf(";", offset); // set index of end of cookie value
                   if (end == -1)
                       end = document.cookie.length;
                   return unescape(document.cookie.substring(offset, end));
               }
           }
       }
    
       function sendit() {
           if (document.loginForm.idsave.checked == true) { // 아이디 저장을 체크 하였을때
               setCookie("id", document.loginForm.uid.value, 7); //쿠키이름을 id로 아이디입력필드값을 7일동안 저장
           } else { // 아이디 저장을 체크 하지 않았을때
               setCookie("id", document.loginForm.uid.value, 0); //날짜를 0으로 저장하여 쿠키삭제
           }
    
           document.loginForm.submit(); //유효성 검사가 통과되면 서버로 전송.
    
       }
</script>


</body>

</html>