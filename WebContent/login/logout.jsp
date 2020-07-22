<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<%
		// 세션 끊어주기
		session.invalidate();
		//session.setAttribute("id", null);
	%>
	<jsp:forward page="../mainPage/main.jsp"></jsp:forward> <!-- 메인페이지로 이동 -->
</body>
</html>