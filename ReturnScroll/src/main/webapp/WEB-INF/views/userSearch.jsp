<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비번 찾기</title>
<style>
#modal {
  display: none;
  position:absolute;
  width:100%;
  height:100%;
  z-index:1;
}

#modal h2 {
  margin:0;   
}

#modal button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal .modal_contents {
  width:300px;
  margin:100px auto;
  padding:20px 10px;
  background:#fff;
  border:2px solid #666;
}

#modal .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
} 
</style>
</head>
<body>
	<div id="modal" class="background_modal">
		<div class="modal_contents">
			<h4>
				<b>회원 아이디는?</b><span class="close"></span>
			</h4><br>
				<h2 id="id_value"></h2>
			<br>
			<button type="button" id="pwSearch_btn" class="btn peach-gradient btn-rounded waves-effect">
			<i class="fa fa-envelope"></i>비밀번호 찾기</button>
			<button type="button" id="pwSearch_btn2" class="btn peach-gradient btn-rounded waves-effect">
			<i class="fa fa-envelope"></i>확인</button>
		</div>
		<div class="modal_layer"></div>
	</div>
	<div class="full">
		<div class="container">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-white">
					<h3>아이디/비밀번호 찾기</h3>
					<p>인증된 이메일만 정보 찾기가 가능합니다.</p>
				</div>
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-white"	for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label class="custom-control-label font-weight-bold text-white" for="search_2">비밀번호 찾기</label>
				</div>
				<div id="searchI">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputName_1">이름</label>
						<div>
							<input type="text" class="form-control" id="inputName_1" name="uname" placeholder="ex) 홍길동">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputPhone_1">휴대폰번호</label>
						<div>
							<input type="text" class="form-control" id="inputPhone_1" name="phone" placeholder="ex) 01077779999">
						</div>
					</div>
					<div class="form-group">
						<button id="idsearchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block">확인</button>
						<button id="idsearchBtn2" type="button" onclick="location='${pageContext.request.contextPath}'" class="btn btn-primary btn-block">취소</button>
					</div>
				</div>
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="inputId" name="uid" placeholder="ex) honggildong">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="inputEmail_2"	name="email" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					<div class="form-group">
						<button id="pwsearchBtn" type="button" class="btn btn-primary btn-block" onclick="pwSearch_click()">확인</button>
						<button id="pwsearchBtn2" type="button" onclick="location='${pageContext.request.contextPath}'" class="btn btn-primary btn-block">취소</button>
				</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script>
	//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
	function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";	
		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
		}
	}
	
	$(document).ready(function() {
		/////////모///달///기///능///////////
		// 1. 모달창 히든 불러오기
		$('#searchBtn').click(function() {
			$('#background_modal').show();
		});
		// 2. 모달창 닫기 버튼
		$('.close').on('click', function() {
			$('#background_modal').hide();
		});
		// 3. 모달창 위도우 클릭 시 닫기
		$(window).on('click', function() {
			if (event.target == $('#background_modal').get(0)) {
	            $('#background_modal').hide();
	         }
		});
	});
	
	// 아이디 & 스토어 값 저장하기 위한 변수
	var idV = "";
	// 아이디 값 받고 출력하는 ajax
	var idSearch_click = function(){
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/userSearch?uname="
					+$('#inputName_1').val()+"&phone="+$('#inputPhone_1').val(),
			success:function(data){
				if(data == 0){
					$('#id_value').text("회원 정보를 확인해주세요!");
					$('#pwSearch_btn').hide();
					$('#pwSearch_btn2').show();
				} else {
					$('#id_value').text(data);
					// 아이디값 별도로 저장
					idV = data;
					$('#inputId').val(data);
					$('#pwSearch_btn2').hide();
					$('#pwSearch_btn').show();
				}
			}, error:function(request, status, errorThrown){
				alert("시발");
			}
		});
	}
	var pwSearch_click = function(){
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/searchPassword?uid="
					+$('#inputId').val()+"&email="+$('#inputEmail_2').val(),
			success:function(data){
				if(data == 0){
					$('#id_value').text("회원 정보를 확인해주세요!");	
				} else {
					$('#id_value').text(data);
					alert("이메일을 보냈습니다. 확인해주세요.")
					idV = data;
				}
			}, error:function(request, status, errorThrown){
				alert("시발");
			}
		});
	}
	 $("#idsearchBtn").click(function(){
	        $("#modal").fadeIn();
	    });
	 
	 $("#pwSearch_btn").click(function(){
	        $("#modal").fadeOut();
	        $("#search_1").prop("checked", false);
	        $("#search_2").prop("checked", true);
	        search_check(2);
	    });
	 $("#pwSearch_btn2").click(function(){
	        $("#modal").fadeOut();
	    });
</script>
</body>
</html>