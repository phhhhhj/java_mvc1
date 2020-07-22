<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울의 자존심 LG트윈스!</title>
<link rel="stylesheet" type="text/css" href="../css/twins.css">
</head>
<body>
	<div id="total">
		<!-- 브라우저의 전체 창을 가운데로 몰아주기 위해 전체를 아우르는 div 생성 -->
		<div id="top">
			<jsp:include page="../base/top.jsp"></jsp:include>
		</div>
		<div id="center" style="height: auto;">
			<div id="goodsMenu">
				<ul id="list"><br>
					<li><a href="goodsMain.jsp"><img src="../img/product/Twins1.png"></a></li><br>
					<li><a href = "uniform.jsp">유니폼</a> <!-- 경로 지정 시 a 뒤에 적으면 됨 --></li><br>
					<li><a href = "goods.jsp">야구용품</a></li><br>
						
				</ul>
			</div>
			<div id="shop">
				<div class="c"><img src="../img/product/1번_모자.png"></div>
				<div class="c"><img src="../img/product/2번_모자.PNG"></div>
				<div class="c"><img src="../img/product/1번_의류.jpg"></div>
				<div class="c"><img src="../img/product/1번_패션.png"></div>
			</div>
			<div style="clear:both;"></div>
		</div>
		<br>
		<hr>
		<div id="bottom">
			<jsp:include page="../base/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>