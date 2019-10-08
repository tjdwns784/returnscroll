<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>returnscroll 회원수정</title>
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
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="side.jsp"></jsp:include>

<h1>회원정보 수정</h1>

	<form action="/returnscroll/userUpdateAction" method="post">
	<div class="form-group">

		<div id="uid">
			ID : <input name="uid" value="${uid}" readonly="readonly">
		</div>
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
						<label for="user_nick">별명</label> <input type="text"
							class="form-control" id="user_nick" name="nick"
							placeholder="NickName" required value="${info.nick}">
						<p id='msgnick' style="color: red"></p>
						<div class="check_font" id="name_check"></div>
					</div>
					<div class="form-group">
						<label for="user_phone">핸드폰 번호:</label> 
						<select name="p1" style="width:85px; height:40px;">
							<option value="010" <c:if test="${info.p1 == '010'}">selected</c:if>>010
							</option>
							<option value="011" <c:if test="${info.p1 == '011'}">selected</c:if>>011
							</option>
							<option value="016" <c:if test="${info.p1 == '016'}">selected</c:if>>016
							</option>
							<option value="017" <c:if test="${info.p1 == '017'}">selected</c:if>>017
							</option>
							<option value="018" <c:if test="${info.p1 == '018'}">selected</c:if>>018
							</option>
							<option value="019" <c:if test="${info.p1 == '019'}">selected</c:if>>019
							</option>
						</select>
						-<input name="p2" required="required" style="width:85px; height:40px;" maxlength="4" value="${info.p2}">
						-<input name="p3" required="required" style="width:85px; height:40px;" maxlength="4" value="${info.p3}">
						<div class="check_font" id="phone_check"></div>
					</div>
					<div class="form-group">
						<label for="user_email">이메일</label> <input type="text"
							class="form-control" name="email" id="user_email"
							placeholder="E-mail" required>
						<p id='msgemail' style="color: red"></p>
						<div class="check_font" id="email_check"></div>
					</div>
		<!-- submit 서버와 통신을 하게 되는 버튼 -->
		<input type="submit" id="userupdate"  value="정보수정">
		<a href="/returnscroll/userDelete"><input type="button" value="회원탈퇴"></a>

				</form>
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
		var isPw = 0							
		var isEmail = 0							
		var isNick = 0							
									
		$("#userupdate").click(function(event){							
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
					url:"mpemailDup",					
					data : {
							email : $("#user_email").val(),
							uid : '${uid}'
						},					
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
									
	
				$("#user_nick").focusout(()=>{					
					$.ajax({				
						url:"mpnickDup",					
						data : {
							nick : $("#user_nick").val(),
							uid : '${uid}'
						},					
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
						$("#msgpw2").text("비밀번호가 다릅니다")			
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