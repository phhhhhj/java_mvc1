<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>서울의 자존심 LG트윈스!</title>
	<link rel="stylesheet" type="text/css" href="../css/fan.css">
	<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		function getToday(){ // 오늘 날짜 구하는 함수
		    var now = new Date(); // 내장객체 사용
		    var year = now.getFullYear(); // 연도 네자리
		    var month = now.getMonth() + 1; // 월: 1월이 0으로 구해지기때문에 +1
		    var date = now.getDate(); // 일
	
		    if((month + "").length < 2){ // month 문자로 인식하게 하려고 "" 붙여서 길이 계산, 1자리면 앞에 0붙임
		        month = "0" + month;
		    }
		     // 2020-04-01 형태로 만들기
		    return today = year + "-" + month + "-" + date; 
		}
		
		$(function() {
			$("#save").click(function() {
				title = $("#title").val();
				content = $("#content").val();
				content = content.replace(/(?:\r\n|\r|\n)/g,'<br/>'); // 줄바꿈을 <br>로 바꿔서 db에 저장하기 위해
				writer = "<%= session.getAttribute("id") %>" // 작성자 = 로그인되어있는 id
				date = getToday() // 오늘 날짜
				
				// 제목이나 내용을 입력하지 않은 경우
				if(title == ""){
					alert("제목을 입력해 주세요.")
				} else if (content == ""){
					alert("내용을 입력해 주세요.")
				} else { // db에 저장 진행
					$.ajax({
						url: "fanpageInsert.jsp",
						data: {
							title: title,
							content: content,
							writer: writer,
							date: date
						},
						success: function() {
							alert("글쓰기가 완료되었습니다.");
							location.href = "fanpage.jsp"; // 전체 목록으로 이동, 가장 위에 새로 쓴 글이 뜸
						}
					}) // ajax
				} // else
			}) // save click
		}) // main
	</script>
</head>
<body>
	<div id="total">
		<div id="top">
			<jsp:include page="../base/top.jsp"></jsp:include>
		</div>
		<div id="fanpageContain">
			<div class="noticeList">
				<div id="oneTitle"><h1>팬 페이지</h1></div>
				<hr color="#a50034" width="100%">
				<div id="contentDiv">
					<table class="writeForm" style="border: none; margin-top: 0;">
						<tr>
							<td width="10%" style="font-size: 20px;">제목:</td>
							<td width="90%">
								<input type="text" name="title" id="title" placeholder="제목 입력"
								style="font-size: 20px; float: left; width: 90%; height: 40px; margin: 10px 0px; padding-left: 10px;">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea rows="30" name="content" id="content"
								placeholder="내용 입력" style="width: 100%; font-size: 18px; padding: 10px;"></textarea>
							</td>
						</tr>
					</table>
					<div id="btnDiv">
						<button class="backBtn" id="save">확인</button>
						<button class="backBtn" onclick="location.href='fanpage.jsp'">취소</button>
					</div>
				</div>
			</div>
		</div>
		<div id="bottom">
			<jsp:include page="../base/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>