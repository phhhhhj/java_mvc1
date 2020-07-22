<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>서울의 자존심 LG트윈스!</title>
	<link rel="stylesheet" type="text/css" href="../css/join.css">
	<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#joinBtn").click(function() {
				id = $("#id").val();
				pw = $("#pw").val();
				pw2 = $("#pw2").val();
				name = $("#name").val();
				tel = $("#tel").val();
				address = $("#city option:selected").val()+" "+$("#address").val();
				birth = $("#birth").val();
				gender = $("[name=gender]:checked").val();
				
				// 1. 비밀번호 일치하는지 확인
				if(pw != pw2){
					$('#idUseErr').hide();
					$('#pwCheckErr').show(); // 비밀번호 불일치 메시지 show
					$('#insertErr').hide();
				} else{
				// 2. 필수사항 모두 입력했는지 확인
					if(id == "" || pw == "" || name == "" || tel == "" ||
							$("#address").val() == "" || birth == ""){
						$('#idUseErr').hide();
						$('#pwCheckErr').hide();
						$('#insertErr').show(); // 필수사항 입력 에러 메시지 show
					} else{
				// 3. id 중복확인
						$.ajax({
							url: "idCheck.jsp",
							data: {
								id: id
							},
							success: function(result) {
								if(result == "1"){ // db에 같은 id가 이미 존재
									$('#idUseErr').show(); // id 사용중 메시지 show
									$('#pwCheckErr').hide();
									$('#insertErr').hide();
								} else{
				// 4. 1,2,3 모두 만족한다면 회원가입 진행
									// id, pw, name, tel, address, birth, gender
									$.ajax({
										url: "joinCheck.jsp",
										data: {
											id: id,
											pw: pw,
											name: name,
											tel: tel,
											address: address,
											birth: birth,
											gender: gender
										},
										success: function(result2) {
											location.href = "joinFin.jsp"
										} // success
									}) // ajax
								} // 3. else
							} // success
						}) // ajax
					} // 2. else
				} // 1. else
			}) // joinBtn click
		}) // main
	</script>
</head>
<body>
	<div class="joinContain">
		<a class="homeLogo" href="../mainPage/main.jsp"></a>
		<div class="joinHeader">
			<h1>회원 가입</h1>
			<hr color="#a50034">
		</div>
		<div class="joinBody">
			<table class="inputTable">
				<colgroup>
					<col width="170px" />
				</colgroup>
				<tbody>
					<tr>
						<th>ID</th>
						<td>
							<input type="text" name="id" id="id">
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" name="pw" id="pw">
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" name="pw2" id="pw2">
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="name" id="name">
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<input type="text" name="tel" placeholder="숫자만 입력해 주세요" id="tel">
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
						<td>
							<input type="text" name="birth" placeholder="숫자만 입력해 주세요" id="birth">
						</td>
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
			<div id="idUseErr"> <!-- display none 상태 -->
				<span class="msgErr">이미 사용중인 ID입니다.</span>
			</div>
			<div id="pwCheckErr"> <!-- display none 상태 -->
				<span class="msgErr">비밀번호가 일치하지 않습니다.</span>
			</div>
			<div id="insertErr"> <!-- display none 상태 -->
				<span class="msgErr">필수 입력 사항을 모두 입력해주세요.</span>
			</div>
			<button id="joinBtn">회원 가입</button>
		</div>
	</div>
</body>
</html>