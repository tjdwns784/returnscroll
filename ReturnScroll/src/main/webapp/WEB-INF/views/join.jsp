<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>귀환주문서 회원가입</title>

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
				<!-- 소셜 로그인 -->
				<input type="hidden" name="kakao" value="${param.kakao}">
				<input type="hidden" name="facebook" value="${param.facebook}">
				<input type="hidden" name="google" value="${param.google}">
				<input type="hidden" name="naver" value="${param.naver}">
					<c:if test="${param.kakao == null && param.facebook == null && param.google == null && param.naver == null}">
						<div class="form-group">
							<label for="user_id">아이디</label>
							 <input type="text" style="width:70px; height:45px;"
								class="form-control" id="user_id" name="uid" placeholder="ID"
								required="required">
							<p id='msgid' style="color: red"></p>
							<div class="check_font" id="id_check"></div>
						</div>
						<div class="form-group">
							<label for="user_pw">비밀번호</label> <input type="password" 
								class="form-control" id="user_pw" name="upw"
								placeholder="Password" required="required">
							<p id='msgpw' style="color: red"></p>
							<div class="check_font" id="pw_check"></div>
						</div>
						<div class="form-group">
							<label for="user_pw2">비밀번호 확인</label> <input type="password"
								class="form-control" id="user_pw2" name="upw2"
								placeholder="Confirm Password" required="required">
							<p id='msgpw2' style="color: red"></p>
							<div class="check_font" id="pw2_check"></div>
						</div>
						
					</c:if>
					<c:if test="${param.kakao != null}">
					<h3>카카오 회원가입 화면</h3>
					<p></p>
					<p>카카오 회원은 아이디와 비밀번호를 입력하실필요없습니다.</p>
					</c:if>

					<c:if test="${param.facebook != null}">
					<h3>페이스북 회원가입 화면</h3>
					<p></p>
					<p>페이스북 회원은 아이디와 비밀번호를 입력하실필요없습니다.</p>
					</c:if>
					
					<c:if test="${param.google != null}">
					<h3>구글 회원가입 화면</h3>
					<p></p>
					<p>구글 회원은 아이디와 비밀번호를 입력하실필요없습니다.</p>
					</c:if>
					
					<c:if test="${param.naver != null}">
					<h3>네이버 회원가입 화면</h3>
					<p></p>
					<p>네이버 회원은 아이디와 비밀번호를 입력하실필요없습니다.</p>
					</c:if>
					
					<div class="form-group">
						<label for="user_name">이름</label> <input type="text"
							class="form-control" id="user_name" name="uname"
							placeholder="Name" required="required">
							<p id='msgname' style="color: red"></p>
						<div class="check_font" id="name_check"></div>
					</div>
					<div class="form-group">
						<label for="user_nick">별명</label> <input type="text"
							class="form-control" id="user_nick" name="nick"
							placeholder="NickName" required="required">
						<p id='msgnick' style="color: red"></p>
						<div class="check_font" id="name_check"></div>
					</div>
					<div class="form-group required">
						<label for="user_birth">생년월일:</label>
						<select name="year" style="width:85px; height:40px; margin-right:-2%;">
							<%for(int i=2019; i>1939; i--){ %>
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
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						-<input name="p2" required="required" style="width:85px; height:40px;" maxlength="4">
						-<input name="p3" required="required" style="width:85px; height:40px;" maxlength="4">
						<div class="check_font" id="phone_check"></div>
					</div>
					<div class="form-group">
						<label for="user_email">이메일</label> <input type="text"
							class="form-control" name="email" id="user_email"
							placeholder="E-mail" required="required">
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
		var isId = 0							
		var isPw = 0
		var isEmail = 0							
		var isNick = 0							
									
									
		$("#reg_submit").click(function(event){
			if(('${param.kakao}' == null && '${param.kakao}' == '') || ('${param.facebook}' == null && '${param.facebook}' == '') || ('${param.google}' == null && '${param.google}' == '') || ('${param.naver}' == null && '${param.naver}' == '')) {
				if(isId==0){						
					event.preventDefault();					
					alert("아이디를 확인해 주세요.")					
				}						
				if(isPw==0){						
					event.preventDefault();					
					alert("패스워드를 확인해 주세요.")					
				}						
			}
			
			if(isNick==0){						
				event.preventDefault();					
				alert("별명을 확인해 주세요.")					
			}						
			if(isEmail==0){						
				event.preventDefault();					
				alert("이메일을 확인해 주세요.")					
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
							$("#msgemail").text("사용가능한 이메일 입니다.")				
							$("#msgemail").css("color","blue")				
							isEmail = 1		
						}else if(res==0 && $("#user_email").val() =="" ){
							$("#msgemail").text("공백은 불가합니다.")	
							$("#msgemail").css("color","red")	
							isEmail = 0	
						}else {					
							$("#msgemail").text("중복된 이메일 입니다.")				
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
				                        $("#msgid").text("사용가능한 아이디 입니다.")   
				                        $("#msgid").css("color","blue")   
				                        isId = 1
				                     }else if(res==0 && $("#user_id").val() =="" ){
				                        $("#msgid").text("공백은 불가합니다.")   
				                        $("#msgid").css("color","red")   
				                        isId = 0   
				                     }else {      
				                        $("#msgid").text("이미 존재하는 아이디 입니다.")   
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
							$("#msgnick").text("사용가능한 닉네임 입니다.")				
							$("#msgnick").css("color","blue")				
							isNick = 1	
						}else if(res==0 && $("#user_nick").val() =="" ){
							$("#msgnick").text("공백은 불가합니다.")	
							$("#msgnick").css("color","red")	
							isNick = 0		
						}else {					
							$("#msgnick").text("이미 존재하는 닉네임 입니다.")				
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
						$("#msgpw").text("비밀번호는 8~15자로 영어,숫자,특수문자를 포함해야 합니다.")			
						$("#msgpw").css("color","red")			
						isPw = 0			
					}				
			})						
 	</script>
</body>
</html>
