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
			$("#leaveBtn").click(function() { // 탈퇴하기 버튼 클릭
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
				// 3. 회원탈퇴
								$.ajax({
									url: "delete.jsp",
									data: {
										id: id,
										pw: pw
									},
									success: function(result2) {
										if(result2 == "1"){
											alert("회원 탈퇴가 완료되었습니다.")
											location.href = "../mainPage/main.jsp" // 메인페이지로 이동
										}
									}
								}) // ajax
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
					<dd><a href="mypageUpdate.jsp">- 회원 정보 수정</a></dd>
					<dd><a href="mypageLeave.jsp"><span id="now">- 회원 탈퇴</span></a></dd>
				</dl>
			</div>
			<div id="mypageContent">
				<div class="leaveBody">
					<h2>회원탈퇴 전 아래 사항을 반드시 확인해 주세요.</h2>
					<ul>
						<li>LG트윈스 홈페이지에서 탈퇴하시면 LG트윈스에 등록된 모든 회원 개인정보가 즉시 삭제되며, 로그인이 필요한 서비스는 이용이 불가합니다.</li>
						<li>작성하신 게시물은 삭제되지 않습니다. 삭제를 원하시는 경우 회원탈퇴 전 모두 삭제해 주시기 바랍니다.</li>
					</ul>
				</div>
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
					<button class="mypageBtn" id="leaveBtn">탈퇴하기</button>
				</div>
			</div>
		</div>
		<div id="bottom">
			<jsp:include page="../base/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>