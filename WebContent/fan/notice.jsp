<%@page import="java.util.Collections"%>
<%@page import="bean.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>서울의 자존심 LG트윈스!</title>
	<link rel="stylesheet" type="text/css" href="../css/fan.css">
</head>
<body>
	<div id="total">
		<div id="top">
			<jsp:include page="../base/top.jsp"></jsp:include>
		</div>
		<div id="fanpageContain">
			<div class="noticeList">
				<h1>공지사항</h1>
				<hr color="#a50034">
				<table style="width: 90%">
					<tr>
						<th width="10%">번호</th>
						<th width="70%">제목</th>
						<th width="20%">작성일</th>
					</tr>
					<%
						NoticeDAO dao = new NoticeDAO();
						ArrayList<NoticeDTO> list = dao.selectAll(); // 공지사항 전체 가져오기
						Collections.reverse(list); // 최근 것이 위로 올라와야 하니까 뒤집기
						for(NoticeDTO dto : list){
					%>
					<tr>
						<td><%= dto.getNo() %></td>
						<td class="titleList"><a href="noticeOne.jsp?no=<%= dto.getNo() %>"><%= dto.getTitle() %></a></td>
						<td><%= dto.getDate() %></td>
					</tr>
					<%
						} // for문 닫기
					%>
				</table>
			</div>
		</div>
		<div id="bottom">
			<jsp:include page="../base/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>