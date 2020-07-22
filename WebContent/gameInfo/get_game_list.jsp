<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.awt.Image"%>
<%@page import="java.io.Console"%>
<%@page import="bean.game_infoDTO"%>
<%@page import="bean.game_infoDAO"%>
<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="bean.game_infoDTO"></jsp:useBean>
<jsp:setProperty property="gyear" name="dto" />
<jsp:setProperty property="gmonth" name="dto" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"> 
		<link rel="stylesheet" type="text/css" href="../css/gameInfo.css">
		<link rel="stylesheet" type="text/css" href="../css/mainPage.css">
		<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
		<script type="text/javascript">
			
		</script>
		<%
			
			game_infoDAO dao = new game_infoDAO(); // 경기 정보 DB에 대한 DAO 
			// 여러 경기의 정보를 가져와야 하므로 DTO의 묶음을 Arraylist로 저장 
			ArrayList<game_infoDTO> list = dao.list_All(dto); 
			
			// 현재 시간 구하기 (경기 전 후를 구별하기 위해)
			SimpleDateFormat dfv = new SimpleDateFormat("yyyyMMdd");
			Calendar cal = Calendar.getInstance();
			int yyyy = cal.get(Calendar.YEAR);
			int mm = cal.get(Calendar.MONTH);
			int dd = cal.get(Calendar.DATE);
			String today = dfv.format(cal.getTime());
			// 실시간 크롤링에도 이용 가능(미구현)
		%>
	</head>
	<body>
		<div>
			<table id="schedule">
			<%
				for(int i = 0; i < list.size(); i++) { // 월별 경기 수에 따라 만들어주어야 하므로 
			%>
				<tr >
					<td id="cellday" style="width: 700px; font-size: 15pt;">
					<%=list.get(i).getGyear()+"년 "+list.get(i).getGmonth()+"월 "+list.get(i).getDate()+"일("+list.get(i).getDay()+")" %>
					</td>
					<td id="celltime" style="width: 300px;">
					<%=list.get(i).getGtime()%>
					</td>
					<td id="cellstadium" style="width: 400px;">
					<%=list.get(i).getStadium() %>
					</td>
					<td id="cellopposingteam" style="width: 300px;">
						<%
							if(list.get(i).getHome_team().equals("LG")){
						%>
							<img alt="상대팀 로고" src="../img/logo/<%=list.get(i).getVisit_team()%>.png" style="width: 130px; height: 100px;">
						<%		
							}else{
						%>
							<img alt="상대팀 로고" src="../img/logo/<%=list.get(i).getHome_team()%>.png" style="width: 130px; height: 100px;">
						<%		
							}
						%>
					</td>
					<td id="celllocation" style="width: 200px;">
						<%
							if(list.get(i).getHome_team().equals("LG")){ // LG 기준이므로 홈,원정이 경기마다 확인 필요
						%>
							홈
						<%		
							} else{
						%>
							원정
						<%		
							}
						%>
					</td>
					<td id="cellresult" style="width: 150px;">
						<%	
							String gameday = list.get(i).getGyear()+list.get(i).getGmonth()+list.get(i).getDate();
							// 경기 날짜가 현재 날짜보다 앞서고 경기결과가 없을때,
							if(list.get(i).getResult() == null && (Integer.parseInt(today) > Integer.parseInt(gameday))){
						%>
							경기 취소
						<%		
							} else if (Integer.parseInt(today) <= Integer.parseInt(gameday)){ // 경기 날짜가 현재 날짜 이후 이면,
						%>
							경기 전
						<%		
							} else{ // 경기 결과
						%>
							<%=list.get(i).getResult() %>
						<%		
							}
						%>
					</td>
					<td style="width: 200px;">
					<!-- 경기 세부정보 페이지 이동 (url 사용) -->
					<a href="gameResult.jsp?yyyy=<%=list.get(i).getGyear() %>&mm=<%=list.get(i).getGmonth() %>&dd=<%=list.get(i).getDate() %>&vt=<%=list.get(i).getVisit_team() %>&ht=<%=list.get(i).getHome_team() %>" id="detail">경기 점수</a></td>
				</tr>
		<%
			}
		%>
		</table>
		</div>
	</body>
</html>