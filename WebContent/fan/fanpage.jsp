<%@page import="java.util.Collections"%>
<%@page import="bean.FanpageDTO"%>
<%@page import="bean.FanpageDAO"%>
<%@page import="java.util.ArrayList"%>
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
				<div id="oneTitle"><h1>팬 페이지</h1></div>
				<div id="sideBtn"><button id="write" onclick="location.href='fanpageWrite.jsp'">글쓰기</button></div>
				<hr color="#a50034" width="100%">
				<table id="noticeList">
					<tr>
						<th width="10%">번호</th>
						<th width="60%">제목</th>
						<th width="15%">작성자</th>
						<th width="15%">작성일</th>
					</tr>
					<%
						FanpageDAO dao = new FanpageDAO();
						ArrayList<FanpageDTO> list = dao.selectAll(); // DB에서 팬페이지 목록 전체 가져오기
						Collections.reverse(list); // 최근 것이 위로 올라와야 하니까 뒤집기
						for(FanpageDTO dto : list){
					%>
					<tr>
						<td><%= dto.getNo() %></td>
						<td class="titleList">
							<a href="fanpageOne.jsp?no=<%= dto.getNo() %>"><%= dto.getTitle() %></a>
						</td>
						<td><%= dto.getWriter() %></td>
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