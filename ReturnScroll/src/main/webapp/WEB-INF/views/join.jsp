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

</head>

<body id="page-top">

	<!-- Navigation -->
	
	<jsp:include page="side.jsp"></jsp:include>
	<!-- Header -->
	<header class="masthead d-flex">
		<div class="container text-align:left my-auto">
			<div style="border: 1px solid; padding: 10px;">
				<form method="POST">
					<div class="form-group">
						<label for="user_id">아이디</label> <input type="text"
							class="form-control" id="user_id" name="uid" placeholder="ID"
							required>
						<div class="check_font" id="id_check"></div>
						<button id="idcheck">중복확인</button>
					</div>
					<div class="form-group">
						<label for="user_pw">비밀번호</label> <input type="password"
							class="form-control" id="user_pw" name="upw"
							placeholder="PASSWORD" required>
						<div class="check_font" id="pw_check"></div>
					</div>
					<div class="form-group">
						<label for="user_pw2">비밀번호 확인</label> <input type="password"
							class="form-control" id="user_pw2" name="upw2"
							placeholder="Confirm Password" required>
						<p id='msg1' style="color: red"></p>
						<div class="check_font" id="pw2_check"></div>

					</div>
					<div class="form-group">
						<label for="user_name">이름</label> <input type="text"
							class="form-control" id="user_name" name="uname"
							placeholder="Name" required>
						<div class="check_font" id="name_check"></div>
					</div>
					<div class="form-group">
						<label for="user_name">별명</label> <input type="text"
							class="form-control" id="user_nickname" name="nick"
							placeholder="NickName" required>
						<div class="check_font" id="name_check"></div>
					</div>
					<div class="form-group required">
						<label for="user_birth">생년월일</label>
						<select name="year">
							<%for(int i=2000; i>1939; i--){ %>
							<option value="<%=i%>"><%=i %>년</option>
							<%} %>
						</select> 
						<select name="month">
							<%for(int i=1; i<13; i++){ %>
							<option value="<%=i%>"><%=i %>월</option>
							<%} %>
						</select>							 
						<select name="day">
							<%for(int i=1; i<32; i++){ %>
							<option value="<%=i%>"><%=i %>일</option>
							<%} %>
						</select>
<!-- 						<input type="text" class="form-control" id="user_birth" name="birth"placeholder="ex) 19990415" required> -->
						<div class="check_font" id="birth_check"></div>
					</div>
					<div class="form-group">
						<label for="user_phone">휴대전화 ('-' 없이 번호만 입력해주세요)</label> 
						<select>
							<option>010</option>
							<option>011</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select>
						<input type="text" class="form-control" id="user_phone" name="phone"
							placeholder="Phone Number" required>
						<div class="check_font" id="phone_check"></div>
					</div>
					<div class="form-group">
						<label for="user_email">이메일</label> <input type="text"
							class="form-control" name="email" id="user_email"
							placeholder="E-mail" required>
						<p id='msg2' style="color: red"></p>
						<div class="check_font" id="email_check"></div>
					</div>
					<div class="reg_button container text-align:center my-auto">
						<button class="btn btn-primary px-3" id="reg_submit" type="submit">
							<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
						</button>
						<a class="btn btn-danger px-3"
							href="${pageContext.request.contextPath}"> <i
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
		var isId = 0															
		var isEmail = 0								
																
				$("#user_email").focusout(()=>{							
					// 이메일 검증 스크립트 작성					
					var emailVal = $("#user_email").val();					
					var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;					
					// 검증에 사용할 정규식 변수 regExp에 저장					
					if (emailVal.match(regExp) != null) {					
						$("#msg2").text("사용가능합니다.")				
						$("#msg2").css("color","blue")				
						isEmail = 1				
					}					
					else {					
						$("#msg2").text("유효한 이메일 형식이 아닙니다.")				
						$("#msg2").css("color","red")				
						isEmail = 0				
					}					
				})							
				$("#idcheck").click(function(event){						
					$.ajax({					
						url:"idDup",						
						data : {id : $("#user_id").val()},						
						success: function(res){						
							console.log(res);						
							if(res=='0'&& $("[name=id]").val() !="" ){											
							 	alert("사용가능한 아이디 입니다.")
								isId = 1					
							}else {						
								alert("이미 존재하는 아이디입니다.")			
								isId = 0					
							}				
						}						
					});						
				})						
										
			   $(document).ready(function() {
			      $('[name=upw2]').keyup(function() {
			         var psw = $('#user_pw').val();
			         var repeatPw = $(this).val();
			         if(psw != repeatPw) {
			            $('#msg1').text('비밀번호가 다릅니다.');
			         } else {
			            $('#msg1').text('');
			         }
			      })
			   });
		
		      $('#reg_submit').click(function() {
		         var action = $('#reg_submit').attr("action");
		         var form_data = $('form').serialize();
		         $.ajax({
		            type : "POST",
		            url : action,
		            data : form_data,
		            success : function(res) {
		               if (res == "success") {
		                  alert("회원가입 성공!");
		                  location = "index";
		               } else {
		                  alert("회원가입 실패!");
		               }
		            },
		            error : function() {
		               alert("Error");
		            }
		         });
		         return false;
		      });
 	</script>
</body>
</html>
