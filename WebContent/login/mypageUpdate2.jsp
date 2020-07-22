<%@page import="bean.MemberDTO"%>
<%@page import="bean.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>서울의 자존심 LG트윈스!</title>
	<link rel="stylesheet" type="text/css" href="../css/mypage.css">
</head>
<body>
	<div id="total">
		<div id="top">
			<jsp:include page="../base/top.jsp"></jsp:include>
		</div>
		<div id="mypageContain">
			<div id="mypageMenu">
				<dl>
					<dt>마이페이지</dt>
					<!-- <dd><a href="mypageBuy.jsp">- 구매/예매 내역</a></dd> -->
					<dd><a href="mypageUpdate.jsp"><span id="now">- 회원 정보 수정</span></a></dd>
					<dd><a href="mypageLeave.jsp">- 회원 탈퇴</a></dd>
				</dl>
			</div>
			<div id="mypageContent">
				<h1>회원 정보 수정</h1>
				<hr color="#a50034" width="95%">
				<div class="updateBody">
				<%
					MemberDAO dao = new MemberDAO();
					MemberDTO dto2 = dao.select((String) session.getAttribute("id"));
					// 로그인된 id에 해당하는 회원정보 출력
				%>
					<table class="inputTable">
						<colgroup>
							<col width="170px" />
						</colgroup>
						<tbody>
							<tr>
								<th>ID</th>
								<td><%= session.getAttribute("id")%></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><%= dto2.getName()%></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><%= dto2.getTel() %></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><%= dto2.getAddress() %></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><%=dto2.getBirth()%></td>
							</tr>
							<tr>
								<th>성별<span class="choice">(선택)</span></th>
								<td>
								<%
									if(dto2.getGender() != null){ // 성별을 필수 입력 사항아니므로 null일 수 있음
									// 입력 되어있으면 입력된 값 보여주고 
								%>
								<%= dto2.getGender() %>
								<%
									}else{ // 입력 안되어있으면 "미입력" 출력
								%>
								미입력
								<%
									}
								%>
								</td>
							</tr>
						</tbody>
					</table>
					<!-- 버튼 클릭시 정보 수정할 수 있는 화면으로 이동 -->
					<button class="mypageBtn" id="nextBtn2" onclick="location.href='mypageUpdate3.jsp'">수정하기</button>
				</div>
			</div>
		</div>
		<div id="bottom">
			<jsp:include page="../base/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>