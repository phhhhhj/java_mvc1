<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>서울의 자존심 LG트윈스!</title>
	<link rel="stylesheet" type="text/css" href="../css/join.css">
</head>
<body>
	<div class="joinFinContain">
		<a class="homeLogo" href="../mainPage/main.jsp"></a>
		<div class="joinHeader">
			<h1>회원 가입 완료</h1>
			<hr color="#a50034">
		</div>
		<div class="joinFinBody">
			<ul>
				<li class="joinName"><span><%= session.getAttribute("name") %></span>님 환영합니다</li>
				<li class="joinFinMsg"><strong>회원가입</strong>이 완료되었습니다.</li>
			</ul>
			<div class="btnArea">
				<button class="joinFinBtn" onclick="location.href='../mainPage/main.jsp'">메인화면</button>
				<button class="joinFinBtn" onclick="location.href='login.jsp'">로그인</button>
			</div>
		</div>
	</div>
	<% session.invalidate(); // 세션 끊어주기, 로그인 되지 않은 상태이므로 전체 세션 끊어줘도 상관없음 %>
</body>
</html>