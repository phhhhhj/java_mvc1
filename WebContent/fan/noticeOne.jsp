<%@page import="bean.NoticeDTO"%>
<%@page import="bean.NoticeDAO"%>
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
		NoticeDAO dao = new NoticeDAO();
		// 넘겨받은 no에 해당하는 공지사항 게시글 정보 가져오기
		NoticeDTO dto = dao.select(selectNo);
	%>
</head>
<body>
	<div id="total">
		<div id="top">
			<jsp:include page="../base/top.jsp"></jsp:include>
		</div>
		<div id="fanpageContain">
			<div class="noticeList">
				<div id="oneTitle"><h2><%= dto.getTitle() %></h2></div>
				<div id="date">작성일: <%= dto.getDate() %></div>
				<hr color="#a50034" width="100%">
				<div id="contentDiv">
					<%= dto.getContent() %>
					<div id="btnDiv">
						<button class="backBtn" onclick="location.href='notice.jsp'">목록으로</button>
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