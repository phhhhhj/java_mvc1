<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>서울의 자존심 LG트윈스!</title>
	<link rel="stylesheet" type="text/css" href="../css/mypage.css">
</head>
<body>
	<div id="total">
		<div id="top">
			<jsp:include page="../base/top.jsp"></jsp:include>
		</div>
		<div id="mypageContain">
			<div id="mypageMenu">
				<dl>
					<dt>마이페이지</dt>
					<dd><a href="mypageBuy.jsp"><span id="now">- 구매/예매 내역</span></a></dd>
					<dd><a href="mypageUpdate.jsp">- 회원 정보 수정</a></dd>
					<dd><a href="mypageLeave.jsp">- 회원 탈퇴</a></dd>
				</dl>
			</div>
			<div id="mypageContent">
				<div class="buy">
					<h1>상품 구매 내역</h1>
					<hr color="#a50034" width="95%">
					<table>
						<tr>
							<th width="60%">구매한 상품(상품명, 개수)</th>
							<th width="20%">총 결제 금액</th>
							<th width="20%">구매일</th>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>2</td>
							<td>2</td>
							<td>2</td>
						</tr>
					</table>
				</div>
				<div class="buy">
				<h1>티켓 예매 내역</h1>
					<hr color="#a50034" width="95%">
					<table>
						<tr>
							<th width="25%">경기 일자</th>
							<th width="25%">예매 좌석</th>
							<th width="25%">총 결제 금액</th>
							<th width="25%">구매일</th>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>2</td>
							<td>2</td>
							<td>2</td>
							<td>2</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div id="bottom">
			<jsp:include page="../base/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>