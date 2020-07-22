<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>서울의 자존심 LG트윈스!</title>
	<link rel="stylesheet" type="text/css" href="../css/login.css">
	<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#loginBtn").click(function() { // 로그인 버튼 클릭
				// id나 pw가 빈칸일 경우
				if ($("#id").val()=="" || $("#pw").val()=="") {
						$('#idInputErr').show(); // display: none이었던 #idInputErr를 show();
						$('#idFindErr').hide();
				}else { // id, pw가 입력된 경우
					// db통신 -> 반환값이 0이면 로그인 실패, 1이면 로그인 성공
					$.ajax({
						url: "loginCheck.jsp",
						data: {
							id: $("#id").val(),
							pw: $("#pw").val()
						},
						success: function(result) {
							console.log(result)
							if (result == "0") { // 로그인 실패
								$('#idFindErr').show(); // display: none이었던 #idFindErr를 show();
								$('#idInputErr').hide();
							} else { // 로그인 성공
								location.href = "../mainPage/main.jsp"; // 메인페이지로 이동
							}
						} // success
					}) // ajax
				}
			}) // loginBtn click
		}) // main
	</script>
</head>
<body>
	<div class="memberContain">
		<a class="homeLogo" href="../mainPage/main.jsp"></a>
		<div class="memberHeader">
			<h1>LG TWINS<br>로그인</h1>
		</div>
		<div class="memberBody">
			<input type="text" name="userId" placeholder="ID" class="inputBox" id="id">
			<input type="password" name="userPw" placeholder="비밀번호" class="inputBox" id="pw">
			<div id="idFindErr"> <!-- display: none 상태 -->
				<span class="msgErr">ID 또는 비밀번호가 일치하지 않습니다</span>
			</div>
			<div id="idInputErr"> <!-- display: none 상태 -->
				<span class="msgErr">ID 또는 비밀번호를 입력해주세요</span>
			</div>
			<button id="loginBtn">로그인</button>
			<br>
			<a href="join.jsp" id="join">회원 가입</a>
		</div>
	</div>
</body>
</html>