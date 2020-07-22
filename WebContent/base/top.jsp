<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>서울의 자존심 LG트윈스!</title>
	<link rel="stylesheet" type="text/css" href="../css/mainPage.css">
	<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".memberUse").click(function() {
				// 회원전용 리스트 클릭
				if(<%= session.getAttribute("id") %> == null) { // 로그인 안된 상태
					alert("로그인이 필요한 서비스입니다.")
					// 로그인 페이지로 이동
					$(".memberUse").prop("href", "../login/login.jsp")
				}
			}) // 회원전용 리스트 클릭
		}) // main
	</script>
</head>
<body>
	<table id="topMenuTable">
		<tr id="gnbHeader" height="40">
			<td colspan="2"></td>
			<!-- 로고 누르면 메인페이지 이동 -->
			<td rowspan="3"><a href="../mainPage/main.jsp"><img src="../img/mainPage/logo.png"></a></td>
			<td colspan="2">
				<!-- 우측 상단 로그인/회원가입, 마이페이지/장바구니/로그아웃 메뉴 -->
				<div id="memberHeader">
					<%
					// 세션이 설정되어 있지 않으면, 로그인/회원가입 메뉴 보여주고
					if(session.getAttribute("id") == null) {
					%>
					<div id="nonmemberMenu">
						<a class="smallMenu" href="../login/login.jsp">로그인</a>
						<a class="smallMenu" href="../login/join.jsp">회원가입</a>
					</div>
					<%
						} // if문 닫기 
						else{
						// 세션이 설정되어 있으면, 마이페이지/장바구니/로그아웃 메뉴 보여주기
					%>
					<div id="memberMenu">
						<a class="smallMenu" href="../login/mypageUpdate.jsp">마이페이지</a>
						<a class="smallMenu" href="../goodsPage/basket.jsp">장바구니</a>
						<a class="smallMenu" href="../login/logout.jsp">로그아웃</a>
					</div>
					<%
						} // else문 닫기
					%>
				</div>
			</td>
		</tr>
		<!-- 메인 메뉴 -->
		<tr id="lnbHeader" height="40">
			<td width="240"><a href="../gameInfo/gameList.jsp">경기 정보</a></td>	
			<td width="240"><a href="../players/pitcher.jsp">선수 정보</a></td>	
			<td width="240"><a href="../fan/notice.jsp">팬</a></td>
			<td width="240"><a href="../goodsPage/goodsMain.jsp" class="memberUse">굿즈몰</a></td>	
		</tr>
		<!-- 서브 메뉴 -->
		<tr id="subHeader" height="100">
			<td>
				<div class="subMenu">
					<ul>
						<li class="subsub"><a href="../gameInfo/gameList.jsp">- 리스트</a></li>
					</ul>
				</div>
			</td>	
			<td>	
				<div class="subMenu">
					<ul>
						<li class="subsub"><a href="../players/pitcher.jsp">- 투수</a></li>
						<li class="subsub"><a href="../players/catcher.jsp">- 포수</a></li>
						<li class="subsub"><a href="../players/infielder.jsp">- 내야수</a></li>
						<li class="subsub"><a href="../players/outfielder.jsp">- 외야수</a></li>
					</ul>
				</div>
			</td>
			<td>
				<div class="subMenu">
					<ul>
						<li class="subsub"><a href="../fan/notice.jsp">- 공지사항</a></li>
						<!-- 팬페이지는 회원 전용 메뉴. 로그인 안되어있으면 로그인 페이지로 이동 -->
						<li class="subsub"><a href="../fan/fanpage.jsp" class="memberUse">- 팬 페이지</a></li>
					</ul>
				</div>
			</td>	
			<td></td>	
		</tr>
	</table>
	<hr color="#a50034">
</body>
</html>