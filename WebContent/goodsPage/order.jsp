<%@page import="bean.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.BasketDTO"%>
<%@page import="bean.BasketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울의 자존심 LG트윈스!</title>


<link rel="stylesheet" type="text/css" href="../css/twins.css">
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
// 상품 결제 페이지
function pay() {
    IMP.init('imp61925111');

    IMP.request_pay({
        pg : 'inicis', // version 1.1.0부터 지원.
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '주문명:결제테스트',
        amount : '<%= session.getAttribute("total") %>'
	, //판매 가격
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456'
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
			location.href = 'order.jsp'
		});
	}
	$(function() {
		$("#pay").click(function() {
			money = $("#money").val()
			alert(money)
			pay(parseInt(money))	
		})
	})
</script>
</head>
<body>
	<div id="total">
		<!-- 브라우저의 전체 창을 가운데로 몰아주기 위해 전체를 아우르는 div 생성 -->
		<div id="top">
			<jsp:include page="../base/top.jsp"></jsp:include>
		</div>
		<div id="center" style="height: auto; border: none;">
    	<hr>
			<div id="goodsMenu">	
				<ul id="list">
					<br>
					<li><a href="goodsMain.jsp"><img src="../img/product/Twins1.png"></a></li>
				</ul>
			</div>
			<br> <br>
			<table border="1" style="width: 850px;">
				<tr>
					<th>순번</th>
					<th>상품명</th>
					<th>사이즈</th>
					<th>수량</th>
					<th>상품금액</th>
					<th>총상품금액</th>
				</tr>
				
				<%
					// db에서 장바구니 정보 불러오기
					BasketDAO dao = new BasketDAO();
					ArrayList<BasketDTO> list = dao.list();
				%>
				
				<%
					// 불러온 장바구니 정보를 한줄씩 for문을 통해 결제테이블 생성
					int total=0; // 모든 상품 총결제액
        			for(BasketDTO dto5 : list){
	        			int hap = 0; // 상품별 결제금액
        				hap = hap + Integer.parseInt(dto5.getCount()) * Integer.parseInt(dto5.getPrice());
        				total = total + Integer.parseInt(dto5.getCount()) * Integer.parseInt(dto5.getPrice());
        				
    			%>
				<tr>
					<td align="right"><%=dto5.getNo()%></td>
					<td align="right"><%=dto5.getName()%></td>
					<td align="right"><%=dto5.getSize()%></td>
					<td align="right"><%=dto5.getCount()%></td>
					<td align="right"><%=dto5.getPrice()%></td>
					<td align="right"><%=hap%></td>
				</tr>
				<%
					session.setAttribute("hap", hap);
        			} //for문 종료
				%>
				<%
					session.setAttribute("total", total);
				%>
				<td colspan="6" align="center">결제할 총금액: 
        		<input id="money" style="font-size: 20px; color:red; font-style:bold" value=<%=total %> readonly="readonly">
				<button id="pay" style="color: red; background: yellow; width: 70px; height: 30px; font-size: 15pt;">결제</button>
			</td>
			</table>	
			
			<br> <br> <br>
		</div>
		<div style="clear: both;"></div>
		<br>
		<hr>
		<div id="bottom">
			<jsp:include page="../base/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>