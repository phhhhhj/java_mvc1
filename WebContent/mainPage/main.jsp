<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>서울의 자존심 LG트윈스!</title>
	<link rel="stylesheet" type="text/css" href="../css/mainPage.css">
</head>
<body>
	<div id="total">
		<div id="top"> <!-- 상단 메뉴 -->
			<jsp:include page="../base/top.jsp"></jsp:include>
		</div>
		<div id="center"> <!-- 각 페이지의 내용 -->
			<div id="black"></div>
			<div id="centerBg">
				<div id="centerImg">
					<img src="../img/mainPage/mainImg.jpg">
				</div>
			</div>
		</div>
		<div id="bottom"> <!-- 하단 footer -->
			<jsp:include page="../base/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>