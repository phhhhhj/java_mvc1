<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>서울의 자존심 LG트윈스!</title>
	<link rel="stylesheet" type="text/css" href="../css/players.css">
	<link rel="stylesheet" type="text/css" href="../css/mainPage.css">
	<style type="text/css">
		.fixTable {
			table-layout: fixed;
			border: 1px solid black;
			border-collapse: collapse;
		}
	</style>
	<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		function playersTB() {
			$("#addHere").empty() // 선수 정보 테이블 초기화
			$.ajax({ // 선수 정보 저장되어 있는 json file 연결
				url: "../data/player.json",
				dataType: "json",
				success: function(doc) {
					list = doc.infielder // json 중 key가 infielder인 jsonArray
					if(list.length > 0) { // 해당 데이터 있으면 출력용 테이블 만들기 시작
						// 3*n 형태의 테이블로 출력하기 위해 이중for문
						// 한줄 만들기
						for (var i = 0; i < list.length; i+=3) { // 3*n 형태의 테이블이기 때문에 인덱스 3씩 증가
							total = '<tr class="rowPlayers">';
							
							if((list.length - i) < 3){ // 마지막행, 출력할 선수가 3명 미만 남은 경우 남은 선수의 수만큼 for문 실행
								for (var j = 0; j < (list.length - i); j++) {
									// number, img, name, EngName, position
									number = list[i+j].number
									img = list[i+j].img
									name = list[i+j].name
									engName = list[i+j].EngName
									position = list[i+j].position
									
									// 테이블 만들어서 total에 누적
									total += '<td class="onePlayer"><table class="fixTable"><tr height="40"><td width="160"><p class="number">'
									+ number + '</p></td><td class="picPlayer" rowspan="4"><div class="picPlayer"><img src=' + img
									+ ' style="height: 260px; position: relative; left: -50px;"></div></td></tr><tr height="50"><td><h1 class="name">' + name
									+ '</h1></td></tr><tr height="130"><td class="engName"><p>' + engName
									+ '</p></td></tr><tr height="40"><td><p class="position">' + position
									+ '</p></td></tr></table></td>';
								} // for
							} else { // 출력할 선수가 3명 이상 남은 경우 for문 3번 실행
								for (var j = 0; j < 3; j++) {
									number = list[i+j].number
									img = list[i+j].img
									name = list[i+j].name
									engName = list[i+j].EngName
									position = list[i+j].position
									
									// 테이블 만들어서 total에 누적
									total += '<td class="onePlayer"><table class="fixTable"><tr height="40"><td width="160"><p class="number">'
									+ number + '</p></td><td class="picPlayer" rowspan="4"><div class="picPlayer"><img src=' + img
									+ ' style="height: 260px; position: relative; left: -50px;"></div></td></tr><tr height="50"><td><h1 class="name">' + name
									+ '</h1></td></tr><tr height="130"><td class="engName"><p>' + engName
									+ '</p></td></tr><tr height="40"><td><p class="position">' + position
									+ '</p></td></tr></table></td>';
								} // for
							} // else
								
							total += '</tr>'
							$("#addHere").append(total) // 테이블 출력
						} // 한줄 만들기 for문
					} // if
				} // success
			}) // ajax
		} // playersTB()
		
		playersTB() // 페이지 로드되자마자 실행
	</script>
</head>
<body>
	<div id="total">
		<div id="top">
			<jsp:include page="../base/top.jsp"></jsp:include>
		</div>
		<div id="tabTitle">
			선수정보 > <span id="now">내야수</span>
		</div>
		<div id="playersList"> <!-- 선수 정보 전체, 3명씩 n개의 행 -->
			<table border="1" id="addHere" class="fixTable">
			</table>
		</div>
		
		<div id="bottom">
			<jsp:include page="../base/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>