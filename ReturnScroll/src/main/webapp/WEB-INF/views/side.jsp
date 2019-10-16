<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="630134026179-rgc07okoujjobuonqp55itnh2lt42vic.apps.googleusercontent.com">
<header>
<br>
<img id=img src="/returnscroll/resources/img/리턴2.jpg">
<h1 id='header' style="text-align:center; margin-right:100px;" ><span>Return Scroll</span></h1>
<hr style="width:95%; background:#FFCC33; height:2px" >
</header>
 <style>
 
 
  @import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
  @import url('https://fonts.googleapis.com/css?family=Merienda:700&display=swap');
 
  header { background : #FFCC33; }
  #header { 
       font-family:'Merienda';
       font-size:50px;
  }
  h1,body, table, div, a, li, ul{font-family:'Nanum Gothic';}

  #img {
        float: left;
        width: 65px;
        margin-left: 100px;
     }
    
  @media (max-width: 600px) {
     #img {
        width: 50px;
        margin-left: 20px;
        margin-top: -10px;
     }
  }

  @media (min-width: 601px) and (max-width: 1000px) {
     #img {
        width: 100px;
        margin-left: 20px;
     }
  }

  
  @media (max-width: 600px) {
     #header {
        
        font-size: 35px;
        margin-left:2px;
     }
  }

  @media (min-width: 601px) and (max-width: 1000px) {
     #header {
        font-size: 65px;
     }
  }

  #sidebar-wrapper { 
     background : #FF9900;
     font-weight : bold;
     top: 0;
  }
  </style>

   <a class="menu-toggle rounded" style="z-index:11000;"> <i class="fas fa-bars"></i>
   </a>
   <nav id="sidebar-wrapper" style="z-index:10000;">
      <ul class="sidebar-nav">
         <li class="sidebar-brand"><a class="js-scroll-trigger"
            href="/returnscroll/">Menu</a></li>
         <li class="sidebar-nav-item"><a class="js-scroll-trigger"
            href="/returnscroll/">Home</a></li>
         <li class="sidebar-nav-item"><a class="js-scroll-trigger"
            href="/returnscroll/tmap">Map</a></li>
         <li class="sidebar-nav-item"><a class="js-scroll-trigger"
            href="/returnscroll/chat">Chat</a></li>
         <li class="sidebar-nav-item"><a class="js-scroll-trigger"
            href="/returnscroll/qna">Q&A</a></li>
         <li class="sidebar-nav-item"><a class="js-scroll-trigger"
            href="/returnscroll/mypage">MyPage</a></li>
      </ul>
      <c:if test="${uid != null}">
         <div style="bottom: 0;position: absolute;margin-bottom: 10px; margin-left:20px;">
            ${uid} 님이 접속중입니다.<br> 
            <a id="logout" href="../returnscroll/logout" style="color:red">로그아웃</a>
         </div>
      </c:if>
      
   </nav>

   <script
      src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
   <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>      
<!--    <script src="https://apis.google.com/js/platform.js" async defer></script> -->
<script>
      function onLoad() {
          gapi.load('auth2', function() {
            gapi.auth2.init();
          });
        }
      $('#logout').click(function(e) {
   //       e.preventDefault();
         var auth2 = gapi.auth2.getAuthInstance();
         auth2.signOut().then(function () {
            console.log('user singed out');
         });
         auth2.disconnect();
      })

      $("body").on('click', '#body', function(){
         $('.menu-toggle > i.fa-times').trigger('click');
//           $('#sidebar-wrapper').close();
//           $('.menu-toggle').removeClass('active');
      });
</script>


<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<!--    <script type="text/javascript" -->
<!--       src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" -->
<!--       charset="utf-8"></script> -->
   <script type="text/javascript">
      var naverLogin;
      $(function() {
         
         naverLogin = new naver.LoginWithNaverId(
            {
               clientId: "0xG1suQ90VZU_QsoAafW",
               callbackUrl: "http://localhost:8080/returnscroll/callback",
               isPopup: true, /* 팝업을 통한 연동처리 여부 */
   //             loginButton: {color: "green", type: 1, height: 60} /* 로그인 버튼의 타입을 지정 */
            }
         );
   
         naverLogin.init();
      })
      
      window.addEventListener('load', function () {
         naverLogin.getLoginStatus(function (status) {
            if (status) {
               /* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
               setLoginStatus();
            }
         });
      })
      function setLoginStatus() {
         $("#logout").click(function () {
            naverLogin.logout();
         });
      }
//       var naver_id_login = new naver_id_login("0xG1suQ90VZU_QsoAafW",
//             "http://localhost:8080/returnscroll/callback");
//       var state = naver_id_login.getUniqState();
//       naver_id_login.setButton("white", 2, 40);
//       naver_id_login.setDomain("http://localhost:8080/returnscroll");
//       naver_id_login.setState(state);
//       naver_id_login.setPopup();
//       naver_id_login.init_naver_id_login();




//       alert(naver_id_login.oauthParams.access_token);
//       // 네이버 사용자 프로필 조회
//       naver_id_login.get_naver_userprofile("naverSignInCallback()");
//       // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
//       function naverSignInCallback() {
//          alert(naver_id_login.getProfileData('email'));
//          alert(naver_id_login.getProfileData('nickname'));
//          alert(naver_id_login.getProfileData('age'));
//       }

      function getNaverId(id) {
         
         $.ajax({               
            url : "naverDup",            
            data : {            
               naver : id         
            },            
            success : function(res) {            
               console.log(res);         
                        
               if (res == 0) {         
                  location = 'join?naver=' + id + ''      
               } else if (res == 1) {         
                  location = 'loginNaver?naver=' + id + ''      
               }         
            }            
         });         
      }
   </script>