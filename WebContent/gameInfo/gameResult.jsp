<%@page import="bean.game_infoDAO"%>
<%@page import="bean.game_detailDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="bean.game_detailDTO"></jsp:useBean>
<jsp:useBean id="dtolist" class="bean.game_infoDTO"></jsp:useBean>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>서울의 자존심 LG트윈스!</title>
	<link rel="stylesheet" type="text/css" href="../css/gameInfo.css">
	<link rel="stylesheet" type="text/css" href="../css/mainPage.css">
	<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		
	</script>
	<%
		// 이전 페이지에서 가져온 날짜 값과 경기팀 값을 이용하여 gamekey 조합
		String gamekey = request.getParameter("yyyy")+request.getParameter("mm")+request.getParameter("dd")+request.getParameter("vt")+request.getParameter("ht")+"0";
		
		// gamekey를 사용하여 dto에 저장
		dtolist.setGmkey(gamekey);
		dto.setGmkey(gamekey);
		
		// 저장된 gamekey로 경기 정보 검색
		game_infoDAO daolist = new game_infoDAO();
		dtolist = daolist.select(dtolist);
		
		// 저장된 gamekey로 경기 내용 검색
		game_detailDAO dao = new game_detailDAO();
		dto = dao.select(dto);
	%>
</head>
<body>
	<div id="total"> <!-- 브라우저의 전체 창을 가운데로 몰아주기 위해 전체를 아우르는 div 생성 -->
		<div id="top">
			<jsp:include page="../base/top.jsp"></jsp:include>
		</div><br>
		<div id="center" style="height: auto;">
			<div>
			
			<!-- 전관판 따라 만든 테이블 모양 -->
			<table id="scoreboard" border="1" style="border-collapse: collapse;">
			
				<tr>
				<!-- 경기 날짜 -->
					<td style="font-size: 30pt; font-style: oblique; font: bold;" colspan="18">
						<%=request.getParameter("yyyy") %>년 <%=request.getParameter("mm") %>월  <%=request.getParameter("dd") %>일
					</td>
				</tr>
				<tr style="height: 50px;">
					<td rowspan="3"><img alt="원정팀" src="../img/logo/<%=dtolist.getVisit_team()%>.png" style="width: 200px; height: 200px;"></td>
					<td style="width: 20px;" rowspan="4"><%=dtolist.getVisit_score() %></td>
					<td></td>
					<td style="width: 50px;">1</td>
					<td style="width: 50px;">2</td>
					<td style="width: 50px;">3</td>
					<td style="width: 50px;">4</td>
					<td style="width: 50px;">5</td>
					<td style="width: 50px;">6</td>
					<td style="width: 50px;">7</td>
					<td style="width: 50px;">8</td>
					<td style="width: 50px;">9</td>
					<td style="width: 50px;">10<br>(연장)</td>
					<td style="width: 50px;">11<br>(연장)</td>
					<td style="width: 50px;">12<br>(연장)</td>
					<td style="width: 20px;" rowspan="4"><%=dtolist.getHome_score() %></td>
					<td rowspan="3"><img alt="홈팀" src="../img/logo/<%=dtolist.getHome_team() %>.png" style="width: 200px; height: 200px;"></td>
				</tr>
				<tr style="height: 50px;">
					<td><%=dto.getVisit_team()%></td>
					<td><%=dto.getVisit_inning1() %></td>
					<td><%=dto.getVisit_inning2() %></td>
					<td><%=dto.getVisit_inning3() %></td>
					<td><%=dto.getVisit_inning4() %></td>
					<td><%=dto.getVisit_inning5() %></td>
					<td><%=dto.getVisit_inning6() %></td>
					<td><%=dto.getVisit_inning7() %></td>
					<td><%=dto.getVisit_inning8() %></td>
					<td><%=dto.getVisit_inning9() %></td>
					<td><%=dto.getVisit_inning10() %></td>
					<td><%=dto.getVisit_inning11() %></td>
					<td><%=dto.getVisit_inning12() %></td>
				</tr>
				<tr style="height: 50px;">
					<td><%=dto.getHome_team() %></td>
					<td><%=dto.getHome_inning1() %></td>
					<td><%=dto.getHome_inning2() %></td>
					<td><%=dto.getHome_inning3() %></td>
					<td><%=dto.getHome_inning4() %></td>
					<td><%=dto.getHome_inning5() %></td>
					<td><%=dto.getHome_inning6() %></td>
					<td><%=dto.getHome_inning7() %></td>
					<td><%=dto.getHome_inning8() %></td>
					<td><%=dto.getHome_inning9() %></td>
					<td><%=dto.getHome_inning10() %></td>
					<td><%=dto.getHome_inning11() %></td>
					<td><%=dto.getHome_inning12() %></td>
					
				</tr>
				<tr>
					<td style="font-size: 15pt;">
						<!-- LG 기준이므로 다른 팀이 원정팀일 경우 -->
						<%
							if(dtolist.getVisit_team().equals("LG")) {
						%>
							LG 트윈스
						<%
							} else if(dtolist.getVisit_team().equals("HH")) {
						%>	
							한화 이글스
						<%
							} else if(dtolist.getVisit_team().equals("HT")) {
						%>	
							기아 타이거즈
						<%
							} else if(dtolist.getVisit_team().equals("KT")) {
						%>	
							KT 위즈
						<%
							} else if(dtolist.getVisit_team().equals("LT")) {
						%>	
							롯데 자이언츠
						<%
							} else if(dtolist.getVisit_team().equals("NC")) {
						%>	
							NC 다이노즈
						<%
							} else if(dtolist.getVisit_team().equals("OB")) {
						%>	
							두산 베어즈
						<%
							} else if(dtolist.getVisit_team().equals("SK")) {
						%>	
							SK 와이번즈
						<%
							} else if(dtolist.getVisit_team().equals("SS")) {
						%>	
							삼성 라이온즈
						<%
							} else if(dtolist.getVisit_team().equals("WO")) {
						%>	
							키움 히어로즈
						<%
							}
						%>
					</td>
					<td style="font-size: 20pt;" colspan="5"><%=dtolist.getStadium() %></td>
					<td style="font-size: 20pt;" colspan="5"><%=dtolist.getGtime() %></td>
					<td style="font-size: 20pt;" colspan="3"><%=dtolist.getResult() %></td>
					<td style="font-size: 15pt;">
						<!-- LG 기준이므로 다른 팀이 홈팀일 경우 -->
						<%
							if(dtolist.getHome_team().equals("LG")) {
						%>
							LG 트윈스
						<%
							} else if(dtolist.getHome_team().equals("HH")) {
						%>	
							한화 이글스
						<%
							} else if(dtolist.getHome_team().equals("HT")) {
						%>	
							기아 타이거즈
						<%
							} else if(dtolist.getHome_team().equals("KT")) {
						%>	
							KT 위즈
						<%
							} else if(dtolist.getHome_team().equals("LT")) {
						%>	
							롯데 자이언츠
						<%
							} else if(dtolist.getHome_team().equals("NC")) {
						%>	
							NC 다이노즈
						<%
							} else if(dtolist.getHome_team().equals("OB")) {
						%>	
							두산 베어즈
						<%
							} else if(dtolist.getHome_team().equals("SK")) {
						%>	
							SK 와이번즈
						<%
							} else if(dtolist.getHome_team().equals("SS")) {
						%>	
							삼성 라이온즈
						<%
							} else if(dtolist.getHome_team().equals("WO")) {
						%>	
							키움 히어로즈
						<%
							}
						%>
					</td>
				</tr>
			</table>
			</div>
		</div>
		<br>
		<hr>
		<div id="bottom">
			<jsp:include page="../base/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>