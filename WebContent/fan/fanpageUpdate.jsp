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
		FanpageDTO dto = dao.select(selectNo);
		String origin = dto.getContent().replace("<br/>","\r\n"); // <br>을 줄바꿈으로 바꿔서 화면 출력
	%>
	<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#save").click(function() {
				// 제목, 내용만 수정 가능, no는 PK
				title = $("#title").val();
				content = $("#content").val();
				content = content.replace(/(?:\r\n|\r|\n)/g,'<br/>'); // 줄바꿈을 <br>로 바꿔서 db에 저장하기 위해
				no = <%= dto.getNo() %>
				
				// 제목이나 내용을 입력하지 않은 경우
				if(title == ""){
					alert("제목을 입력해 주세요.")
				} else if (content == ""){
					alert("내용을 입력해 주세요.")
				} else { // db에 저장 진행
					// 반환값이 1이면 저장 성공, 0이면 실패
					$.ajax({
						url: "fanpageRewrite.jsp",
						data: {
							title: title,
							content: content,
							no: no
						},
						success: function(result) {
							if(result == 1){
								alert("수정이 완료되었습니다.");
								location.href = "fanpageOne.jsp?no=<%= dto.getNo() %>";
								// 수정 내용 바로 확인할 수 있게 해당 게시글의 상세창으로 이동
							}
						} // success
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
								<input type="text" name="title" id="title" value="<%= dto.getTitle() %>"
								style="font-size: 20px; float: left; width: 90%; height: 40px; margin: 10px 0px; padding-left: 10px;">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea rows="30" name="content" id="content"
								style="width: 100%; font-size: 18px; padding: 10px;"><%= origin %></textarea>
							</td>
						</tr>
					</table>
					<div id="btnDiv">
						<button class="backBtn" id="save">확인</button>
						<button class="backBtn" onclick="location.href='fanpageOne.jsp?no=<%= dto.getNo() %>'">취소</button>
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