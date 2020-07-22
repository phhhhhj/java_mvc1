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
	<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#updateBtn").click(function() { // 수정하기 버튼 클릭
				// pw, tel, address, gender만 수정 가능
				// id는 PK
				id = "<%=session.getAttribute("id")%>";
				pw = $("#pw").val();
				pw2 = $("#pw2").val();
				tel = $("#tel").val();
				address = $("#city option:selected").val()+" "+$("#address").val();
				gender = $("[name=gender]:checked").val();
				
				// 1. 비밀번호 일치하는지 확인
				if(pw != pw2){
					$('#pwCheckErr').show(); // 비밀번호 불일치 메시지 show
					$('#insertErr').hide();
				} else {
				// 2. 필수사항 모두 입력했는지 확인
					if(pw == "" || tel == "" || $("#address").val() == "") {
						$('#pwCheckErr').hide();
						$('#insertErr').show(); // 필수 사항 입력 에러 메시지 show
					} else{
				// 3. 업데이트 진행
						$.ajax({
							url: "update.jsp",
							data: {
								id: id,
								pw: pw,
								tel: tel,
								address: address,
								gender: gender
							},
							success: function() {
								alert("회원 정보 수정이 완료되었습니다.")
								location.href = "mypageUpdate2.jsp" // 회원정보 출력 페이지로 이동
							} // success
						}) // ajax
					} // 2. else
				} // 1. else
			}) // button click
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
				<h1>회원 정보 수정</h1>
				<hr color="#a50034" width="95%">
				<div class="updateBody">
				<%
					MemberDAO dao = new MemberDAO();
					MemberDTO dto2 = dao.select((String) session.getAttribute("id"));
					// 로그인된 id에 해당하는 회원정보 가져오기
				%>
				<table class="inputTable">
					<colgroup>
						<col width="170px" />
					</colgroup>
					<tbody>
						<tr>
							<th>ID</th>
							<td><%=session.getAttribute("id")%><span class="updateX">(수정불가)</span></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pw" id="pw"></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" name="pw2" id="pw2"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><%=dto2.getName()%><span class="updateX">(수정불가)</span></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<input type="text" name="tel" id="tel" placeholder="숫자만 입력해 주세요">
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<select name="city" style="width: 150px;" id="city">
									<option value="서울특별시">서울특별시
									<option value="인천광역시">인천광역시
									<option value="대전광역시">대전광역시
									<option value="광주광역시">광주광역시
									<option value="대구광역시">대구광역시
									<option value="울산광역시">울산광역시
									<option value="부산광역시">부산광역시
									<option value="경기도">경기도
									<option value="강원도">강원도
									<option value="충청북도">충청북도
									<option value="충청남도">충청남도
									<option value="경상북도">경상북도
									<option value="경상남도">경상남도
									<option value="전라북도">전라북도
									<option value="전라남도">전라남도
									<option value="제주도">제주도
								</select><br>
								<input type="text" name="address" id="address">
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><%=dto2.getBirth()%><span class="updateX">(수정불가)</span></td>
						</tr>
						<tr>
							<th>성별<span class="choice">(선택)</span></th>
							<td>
								<input type="radio" name="gender" value="남자"><span class="gender">남자</span>
								<input type="radio" name="gender" value="여자"><span class="gender">여자</span>
							</td>
						</tr>
					</tbody>
				</table>
				<div id="pwCheckErr"> <!-- display: none 상태 -->
					<span class="msgErr">비밀번호가 일치하지 않습니다.</span>
				</div>
				<div id="insertErr"> <!-- display: none 상태 -->
					<span class="msgErr">필수 입력 사항을 모두 입력해주세요.</span>
				</div>
				<button class="mypageBtn" id="updateBtn">수정하기</button>
				</div>
			</div>
		</div>
		<div id="bottom">
			<jsp:include page="../base/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>