<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>서울의 자존심 LG트윈스!</title>
	<link rel="stylesheet" type="text/css" href="../css/mypage.css">
	<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#nextBtn").click(function() { // 회원 정보 보기 버튼 클릭
				pw = $("#pw").val();
				id = "<%= session.getAttribute("id") %>"
				// 1. 비밀번호 입력 여부 확인
				if(pw == ""){
					alert("비밀번호를 입력해 주세요.")
				} else {
				// 2. 비밀번호 일치 여부 확인
					$.ajax({
						url: "pwCheck.jsp",
						data: {
							id: id,
							pw: pw
						},
						success: function(result) {
							if(result == "0"){ // 비밀번호 일치 X
								alert("비밀번호를 확인해 주세요.")
							} else {
								location.href = "mypageUpdate2.jsp" // 지금 회원 정보 출력 창으로 이동
							} // 2. else
						} // success
					}) // ajax
				} // 1. else
			}) // leaveBtn click
		}) // main
	</script>
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
				<div class="leaveBody" id="leavePwCheck">
					<h2>비밀번호 확인</h2>
					<table class="inputTable">
						<colgroup>
							<col width="170px" />
						</colgroup>
						<tbody>
							<tr>
								<th>ID</th>
								<td><%= session.getAttribute("id") %></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="pw" id="pw"></td>
							</tr>
						</tbody>
					</table>
					<button class="mypageBtn" id="nextBtn">회원 정보 보기</button>
				</div>
			</div>
		</div>
		<div id="bottom">
			<jsp:include page="../base/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>