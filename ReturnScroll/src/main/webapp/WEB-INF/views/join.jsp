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

<title>Stylish Portfolio - Start Bootstrap Template</title>

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

<style>
	label {
		display: block;
	}
	label + input {
		display: inline-block !important;
		width: 30% !important;
	}
	@media (min-width: 1200px) {
		.container {
		    max-width: 800px;
		}
		
		select[name=p1] {
		    width: 100px;
		}
	}
</style>
</head>

<body id="page-top">

	<!-- Navigation -->
	
	<jsp:include page="side.jsp"></jsp:include>
	<!-- Header -->
	<header class="masthead d-flex">
		<div class="container text-align:left my-auto">
			<div style="border: 1px solid; padding: 10px; text-align:center;">
				<form method="POST" > 
					<div class="form-group">
						<label for="user_id">아이디</label>
						 <input type="text" style="width:70px; height:45px;"
							class="form-control" id="user_id" name="uid" placeholder="ID"
							required>
						<p id='msgid' style="color: red"></p>
						<div class="check_font" id="id_check"></div>
					</div>
					<div class="form-group">
						<label for="user_pw">비밀번호</label> <input type="password" 
							class="form-control" id="user_pw" name="upw"
							placeholder="Password" required>
						<p id='msgpw' style="color: red"></p>
						<div class="check_font" id="pw_check"></div>
					</div>
					<div class="form-group">
						<label for="user_pw2">비밀번호 확인</label> <input type="password"
							class="form-control" id="user_pw2" name="upw2"
							placeholder="Confirm Password" required>
						<p id='msgpw2' style="color: red"></p>
						<div class="check_font" id="pw2_check"></div>

					</div>
					<div class="form-group">
						<label for="user_name">이름</label> <input type="text"
							class="form-control" id="user_name" name="uname"
							placeholder="Name" required>
						<div class="check_font" id="name_check"></div>
					</div>
					<div class="form-group">
						<label for="user_nick">별명</label> <input type="text"
							class="form-control" id="user_nick" name="nick"
							placeholder="NickName" required>
						<p id='msgnick' style="color: red"></p>
						<div class="check_font" id="name_check"></div>
					</div>
					<div class="form-group required">
						<label for="user_birth">생년월일:</label>
						<select name="year" style="width:85px; height:40px; margin-right:-2%;">
							<%for(int i=2000; i>1939; i--){ %>
							<option value="<%=i%>"><%=i %>년</option>
							<%} %>
						</select> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select name="month" style="width:85px; height:40px; margin-right:-2%;">
							<%for(int i=1; i<13; i++){ %>
							<option value="<%=i%>"><%=i %>월</option>
							<%} %>
						</select>	
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;						 
						<select name="day" style="width:85px; height:40px;">
							<%for(int i=1; i<32; i++){ %>
							<option value="<%=i%>"><%=i %>일</option>
							<%} %>
						</select>
<!-- 						<input type="text" class="form-control" id="user_birth" name="birth"placeholder="ex) 19990415" required> -->
						<div class="check_font" id="birth_check"></div>
					</div>
					<div class="form-group">
						<label for="user_phone">핸드폰 번호:</label> 
						<select name="p1" style="width:85px; height:40px;">
							<option>010</option>
							<option>011</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select>
						-<input name="p2" required="required" style="width:85px; height:40px;" maxlength="4">
						-<input name="p3" required="required" style="width:85px; height:40px;" maxlength="4">
						<div class="check_font" id="phone_check"></div>
					</div>
					<div class="form-group">
						<label for="user_email">이메일</label> <input type="text"
							class="form-control" name="email" id="user_email"
							placeholder="E-mail" required>
						<p id='msgemail' style="color: red"></p>
						<div class="check_font" id="email_check"></div>
					</div>
					<div class="reg_button container text-align:center my-auto">
						<button class="btn btn-primary px-3" id="reg_submit" type="submit" style="width:132px; margin-left:4%; margin-top:2%;">
							<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
						</button>
						<a class="btn btn-danger px-3"
							href="${pageContext.request.contextPath}" style="width:137px; margin-top:2%;"> <i
							class="fa fa-rotate-right pr-2" aria-hidden="true"></i>취소하기
						</a>&emsp;&emsp;
					</div>
				</form>
			</div>
		</div>
		<div class="overlay"></div>
	</header>

	<div class="container"></div>

	<!-- Footer -->
	<footer class="footer text-center">
		<div class="container">
			<ul class="list-inline mb-5">
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white mr-3" href="#"> <i
						class="icon-social-facebook"></i>
				</a></li>
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white mr-3" href="#"> <i
						class="icon-social-twitter"></i>
				</a></li>
				<li class="list-inline-item"><a
					class="social-link rounded-circle text-white" href="#"> <i
						class="icon-social-github"></i>
				</a></li>
			</ul>
			<p class="text-muted small mb-0">Copyright &copy; Your Website
				2019</p>
		</div>
	</footer>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>

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
// 		var isId = 0															
// 		var isEmail = 0								
																
// 				$("#user_email").focusout(()=>{							
// 					// 이메일 검증 스크립트 작성					
// 					var emailVal = $("#user_email").val();					
// 					var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;					
// 					// 검증에 사용할 정규식 변수 regExp에 저장					
// 					if (emailVal.match(regExp) != null) {					
// 						$("#msg2").text("사용가능합니다.")				
// 						$("#msg2").css("color","blue")				
// 						isEmail = 1				
// 					}					
// 					else {					
// 						$("#msg2").text("유효한 이메일 형식이 아닙니다.")				
// 						$("#msg2").css("color","red")				
// 						isEmail = 0				
// 					}					
// 				})							
// 				$("#idcheck").click(function(event){						
// 					$.ajax({					
// 						url:"idDup",						
// 						data : {id : $("#user_id").val()},						
// 						success: function(res){						
// 							console.log(res);						
// 							if(res=='0'&& $("[name=uid]").val() !="" ){											
// 							 	alert("사용가능한 아이디 입니다.")
// 								isId = 1					
// 							}else {						
// 								alert("이미 존재하는 아이디입니다. 바보 멍청이")			
// 								isId = 0					
// 							}				
// 						}						
// 					});						
// 				})						
										
// 			   $(document).ready(function() {
// 			      $('[name=upw2]').keyup(function() {
// 			         var psw = $('#user_pw').val();
// 			         var repeatPw = $(this).val();
// 			         if(psw != repeatPw) {
// 			            $('#msg1').text('비밀번호가 다릅니다.');
// 			         } else {
// 			            $('#msg1').text('');
// 			         }
// 			      })
// 			   });
		
// 		      $('#reg_submit').click(function() {
// 		    	  if($.trim($('#user_id').val()) == '') {
// 		    		  alert('아이디를 입력해주세요');
// 		    		  return false;
// 		    	  } else if($.trim($('#user_pw').val()) == '') {
// 		    		  alert('비밀번호를 입력해주세요');
// 		    		  return false;
// 		    	  }
		    	  
// 		         var action = $('#reg_submit').attr("action");
// 		         var form_data = $('form').serialize();
// 		         $.ajax({
// 		            type : "POST",
// 		            url : action,
// 		            data : form_data,
// 		            success : function(res) {
// 		               if (res == "success") {
// 		                  alert("회원가입 성공!");
// 		                  location = "index";
// 		               } else {
// 		                  alert("회원가입 실패!");
// 		               }
// 		            },
// 		            error : function() {
// 		               alert("Error");
// 		            }
// 		         });
// 		         return false;
// 		      });						
		var isId = 0							
		var isPw = 0							
		var isEmail = 0							
		var isNick = 0							
									
									
		$("#reg_submit").click(function(event){							
			if(isId==0){						
				event.preventDefault();					
				alert("아이디를 확인해 주세요")					
			}						
			if(isPw==0){						
				event.preventDefault();					
				alert("패스워드를 확인해 주세요")					
			}						
			if(isNick==0){						
				event.preventDefault();					
				alert("별명을 확인해 주세요")					
			}						
			if(isEmail==0){						
				event.preventDefault();					
				alert("이메일을 확인해 주세요")					
			}						
		})		
				
			$("#user_email").focusout(()=>{						
									
					// 이메일 검증 스크립트 작성				
					var emailVal = $("#user_email").val();				
					var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;				
					// 검증에 사용할 정규식 변수 regExp에 저장				
					if (emailVal.match(regExp) != null) {				
	//					$("#emailCheck").text("사용가능합니다.")			
	//					$("#emailCheck").css("color","blue")			
					$.ajax({				
					url:"emailDup",					
					data : {email : $("#user_email").val()},					
					success: function(res){					
						console.log(res);					
										
						if(res==0 && $("#user_email").val() !="" ){					
							$("#msgemail").text("사용가능한 이메일 입니다")				
							$("#msgemail").css("color","blue")				
							isEmail = 1				
						}else {					
							$("#msgemail").text("중복된 이메일 입니다")				
							$("#msgemail").css("color","red")				
							isEmail = 0				
								}			
					}						
						});					
					}				
					else {				
						$("#msgemail").text("유효한 이메일 형식이 아닙니다.")			
						$("#msgemail").css("color","red")			
						isEmail = 0			
					}				
			})						
									
				$("#user_id").focusout(()=>{					
									
									
						// 이메일 검증 스크립트 작성			
						var passVal = $("#user_id").val();			
						var regExp =  /^[A-Za-z0-9]{5,15}$/;			
						// 검증에 사용할 정규식 변수 regExp에 저장			
						if (passVal.match(regExp) != null) {			
							$.ajax({		
							url:"idDup",		
							data : {id : $("#user_id").val()},		
							success: function(res){		
							console.log(res);		
									
							if(res==0 && $("#user_id").val() !="" ){		
								$("#msgid").text("사용가능한 아이디 입니다")	
								$("#msgid").css("color","blue")	
								isId = 1	
							}else {		
								$("#msgid").text("이미 존재하는 아이디 입니다")	
								$("#msgid").css("color","red")	
								isId = 0	
									}
							}		
							});		
									
						}			
						else {			
							$("#msgid").text("아이디는 5~15자로 구성되야 합니다")		
							$("#msgid").css("color","red")		
							isId = 0		
									
						}			
				})					
									
				$("#user_nick").focusout(()=>{					
					$.ajax({				
						url:"nickDup",					
						data : {nick : $("#user_nick").val()},					
						success: function(res){					
						console.log(res);					
											
						if(res==0 && $("#user_nick").val() !="" ){					
							$("#msgnick").text("사용가능한 닉네임 입니다")				
							$("#msgnick").css("color","blue")				
							isNick = 1				
						}else {					
							$("#msgnick").text("이미 존재하는 닉네임 입니다")				
							$("#msgnick").css("color","red")				
							isNick = 0				
						}			
					}					
				});					
			})					
				$("#user_pw2").focusout(()=>{					
					var pw = $("#user_pw").val()				
					var pw2 = $("#user_pw2").val()	
					var passVal = $("#user_pw").val();				
					var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
					if(pw == ""){
						$("#msgpw2").text("비밀번호를 입력하세요.")			
						$("#msgpw2").css("color","red")			
						isPw = 0
					}
					else if(passVal.match(regExp) == null){				
						$("#msgpw2").text("비밀번호 형식을 맞춰주세요.")			
						$("#msgpw2").css("color","red")			
						isPw = 1		
					}else if(pw == pw2){				
						$("#msgpw2").text("비밀 번호가 일치합니다.")			
						$("#msgpw2").css("color","blue")			
						isPw = 1			
					}else {				
						$("#msgpw2").text("비밀번호가 다릅니다.")			
						$("#msgpw2").css("color","red")			
						isPw = 0			
					}				
				})					
			$("#user_pw").focusout(()=>{						
									
					// 이메일 검증 스크립트 작성				
					var passVal = $("#user_pw").val();				
					var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;				
					// 검증에 사용할 정규식 변수 regExp에 저장				
					if (passVal.match(regExp) != null) {				
						$("#msgpw").text("사용가능합니다.")			
						$("#msgpw").css("color","blue")			
						isPw = 1			
					}				
					else {				
						$("#msgpw").text("비밀번호는 8~15자로 영어,숫자,특수문자를 포함해야 합니다")			
						$("#msgpw").css("color","red")			
						isPw = 0			
					}				
			})						
 	</script>
</body>
</html>
