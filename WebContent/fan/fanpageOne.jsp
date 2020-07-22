<%@page import="bean.ReplyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.ReplyDAO"%>
<%@page import="bean.FanpageDTO"%>
<%@page import="bean.FanpageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>서울의 자존심 LG트윈스!</title>
	<link rel="stylesheet" type="text/css" href="../css/fan.css">
	<%
		int selectNo = Integer.parseInt(request.getParameter("no"));
		FanpageDAO dao = new FanpageDAO();
		// 넘겨받은 no에 해당하는 팬페이지 게시글 정보 가져오기
		FanpageDTO dto = dao.select(selectNo);
	%>
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
			$("#delFanpage").click(function() { // 게시글 삭제 버튼 클릭
				move = confirm("게시글을 삭제하시겠습니까?")
				if(move == 1){ // 확인 클릭시 삭제 진행
					$.ajax({
						url: "fanpageDelete.jsp",
						data: {
							no: <%= selectNo %>
						},
						success: function(result) {
							if(result == 1){
								alert("삭제가 완료되었습니다.")
								location.href = "fanpage.jsp";
							}
						} // success
					}) // ajax
				} // confirm yes
			}) // 삭제 클릭
			
			$("#write").click(function() { // 댓글 입력 후 확인 버튼 클릭
				// no, bbsno, content, writer, date
				bbsno = "<%= dto.getNo() %>"; // 댓글 달린 팬 페이지 게시글의 번호
				content = $("#replyInput").val();
				content = content.replace(/(?:\r\n|\r|\n)/g,'<br/>'); // 줄바꿈을 <br>로 바꿔서 db에 저장하기 위해
				writer = "<%= session.getAttribute("id") %>"; // 작성자 = 로그인되어있는 id
				date = getToday(); // 오늘 날짜
				
				// 내용 입력하지 않은 경우
				if(content == ""){
					alert("댓글을 입력해 주세요.")
				} else { // db에 저장 진행
					$.ajax({
						url: "replyInsert.jsp",
						data: {
							bbsno: bbsno,
							content: content,
							writer: writer,
							date: date
						},
						success: function() {
							alert("댓글이 등록되었습니다.");
							location.href = "fanpageOne.jsp?no=<%= dto.getNo() %>"; // 댓글 쓴 게시글 페이지로 이동
						} // success
					}) // ajax
				}
			}) // 댓글 입력 클릭
			
			$("button").click(function() {
				// 댓글 수정버튼/삭제버튼 id 속성으로 구분
				idValue = $(this).attr("id");
				noValue = $(this).attr("value");
				if(idValue == "replyDelete") { // 댓글 삭제버튼 클릭
					$.ajax({
						url: "replyDelete.jsp",
						data: {
							no: noValue
						},
						success: function(result) {
							alert("댓글이 삭제되었습니다.");
							location.href = "fanpageOne.jsp?no=<%= dto.getNo() %>"; // 댓글 쓴 게시글 페이지로 이동
						} // success
					}) // ajax
				} // 댓글 삭제
				
				if(idValue == "replyUpdate"){ // 댓글 수정버튼 클릭
					// textarea, 확인버튼 활성화
					$("#afterUpdate"+noValue).show();
					$("#originUpdate"+noValue).attr("readonly", false);
				} // 댓글 수정
				
				if(idValue == "updateFin"){ // 댓글 수정 후 확인버튼 클릭
					// no, content
					content2 = $("#originUpdate"+noValue).val();
					content2 = content2.replace(/(?:\r\n|\r|\n)/g,'<br/>'); // 줄바꿈을 <br>로 바꿔서 db에 저장하기 위해
					
					// 내용 입력하지 않은 경우
					if(content2 == ""){
						alert("댓글을 입력해 주세요.")
					} else { // db에 저장 진행
						$.ajax({
							url: "replyUpdate.jsp",
							data: {
								content: content2,
								no: noValue
							},
							success: function(result) {
								alert("댓글이 수정되었습니다.");
								location.href = "fanpageOne.jsp?no=<%= dto.getNo() %>"; // 댓글 쓴 게시글 페이지로 이동
							} // success
						}) // ajax
					}
				} // 수정 후 확인
			})
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
				<div id="oneTitle"><h2><%= dto.getTitle() %></h2></div>
				<div id="date"><%= dto.getWriter() %> | <%= dto.getDate() %></div>
				<hr color="#a50034" width="100%">
				<div id="contentDiv">
					<%= dto.getContent() %>
					<div id="btnDiv">
						<%
							if(dto.getWriter().equals((String)session.getAttribute("id"))){
							// 로그인한 id와 게시글 작성자가 같은 경우 "수정, 삭제, 목록으로" 버튼 보임
						%>
						<button class="backBtn" onclick="location.href='fanpageUpdate.jsp?no=<%= dto.getNo() %>'">수정</button>
						<button class="backBtn" id="delFanpage">삭제</button>
						<%		
							} // 다를 경우 "목록으로" 버튼만 보임
						%>
						<button class="backBtn" onclick="location.href='fanpage.jsp'">목록으로</button>
					</div>
					<div id="replyDiv">
						<hr color="#a50034" width="100%">
						<div class="replyContent" style="padding: 20px 0px;">
							<table class="writeForm" style="border: none;">
								<tr>
									<td style="padding-bottom: 20px; width: 85%;">
										<textarea rows="5" id="replyInput" placeholder="댓글 입력"
										style="font-size: 20px; width: 95%; padding: 10px; margin-top: 20px;"></textarea>
									</td>
									<td>
										<button id="write" style="font-size: 15px; margin: 0 10px;">확인</button>
									</td>
								</tr>
							</table>
							<table class="writeForm" style="border: none;">
							<%
								ReplyDAO dao2 = new ReplyDAO();
								ArrayList<ReplyDTO> list = dao2.selectAll(dto.getNo()); // 해당 게시글의 댓글 전체 불러오기
								for(ReplyDTO dto2 : list) {
								String origin = dto2.getContent().replace("<br/>","\r\n"); // <br>을 줄바꿈으로 바꿔서 화면 출력
								if(dto2.getWriter().equals((String)session.getAttribute("id"))){
									// 댓글 작성자와 로그인한 id 같으면 댓글 수정/삭제 버튼 보임
							%>
								<tr>
									<td style="text-align: left; padding-left: 20px; font-size: 20px;">
										<%= dto2.getWriter() %>
										<button id="replyUpdate" class="replyBtn" value="<%= dto2.getNo() %>" style="font-size: 15px; padding: 5px 10px;">수정</button>
										<button id="replyDelete" class="replyBtn" value="<%= dto2.getNo() %>" style="font-size: 15px; padding: 5px 10px;">삭제</button>
									</td>
							<%		
								} // if 댓글작성자 == 세션id
								else { // 다르면 아무 버튼도 뜨지 않음
							%>
								<tr>
									<td style="text-align: left; padding-left: 20px; font-size: 20px;"><%= dto2.getWriter() %></td>
							<%
								} // else 댓글작성자 != 세션id
							%>
									<td style="text-align: right; padding-right: 20px; font-size: 20px;"><%= dto2.getDate() %></td>
								</tr>
								<tr>
									<td colspan="2" style="padding-bottom: 20px;">
										<!-- 댓글 내용 뜨는 textarea는 readonly, 수정 버튼 클릭시에 활성화(readonly false) -->
										<textarea rows="5" readonly="readonly" id="originUpdate<%= dto2.getNo() %>"
										style="width: 95%; font-size: 20px; padding: 10px;"><%= origin %></textarea>
									</td>
								</tr>
								<tr>
									<!-- 댓글 수정 후 저장할 확인 버튼 -> 댓글 수정 버튼 눌러야 활성화 -->
									<td colspan="2" id="afterUpdate<%= dto2.getNo() %>" style="text-align: right; display: none;">
										<button class="replyBtn" id="updateFin" value="<%= dto2.getNo() %>"
										style="margin: 20px 20px; margin-top: 0px; padding: 10px 50px; font-size: 15px;">확인</button>
									</td>
								</tr>
							<%
								} // for문 닫기
							%>
							</table>
						</div>
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