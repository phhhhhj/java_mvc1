<%@page import="java.util.ArrayList"%>
<%@page import="bean.ProductDTO"%>
<%@page import="bean.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울의 자존심 LG트윈스!</title>
<jsp:useBean id="dto" class="bean.ProductDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"></jsp:setProperty>
<%
	ProductDAO dao = new ProductDAO();
	ProductDTO dto2 = dao.select(2);
%>

<link rel="stylesheet" type="text/css" href="../css/mainPage.css">
<link rel="stylesheet" type="text/css" href="../css/twins.css">
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(function() {
	$("#bt1").click(function(){
		name = "<%=dto2.getName() %>";
		size = $("#size").val();
		count = $("#amount").val();
		price = "<%=dto2.getPrice() %>";
		allprice = $("#allprice").val();
		$.ajax({
			url: "order.jsp",
			data:{
				id: "abc",
				name: name,
				size: size,
				count: count,
				price: price,
				allprice: allprice
			},
			success : function(result) {
				tr = $(this).parent().parent()
				move = confirm("주문창으로 이동하시겠습니까?")
				if(move == 1){
					location.href = "order.jsp"
				}
			}
		})
	})
})
</script>
<script type="text/javascript">
/* 장바구니 테이블로 상품명,사이즈,수량,가격,총가격 넘겨주기 */
$(function() {
	$("#bt2").click(function(){
		$.ajax({
			url: "basket.jsp",
			data:{
				id: "abc",
				name: '<%=dto2.getName() %>',
				size: $("#size").val(),
				count: $("#amount").val(),
				price: '<%=dto2.getPrice() %>',
				allprice: $("#allprice").val()
			},
			success: function(result){
				//장바구니로 이동하시겠습니까?(comfirm은 확인할거냐 취소할거냐)
				move = confirm("장바구니로 이동하시겠습니까?")
				if(move == 1){
					location.href = "basket.jsp"
				}
			}
		})
	})
})
</script>
</head>
<body onload="init();">
	<script type="text/javascript">
	/* 수량 증감식, 수량x가격 = 총가격 계산식 */
	
		var sell_price;
		var amount;

		function init(){
			sell_price = document.form.sell_price.value;
			amount = document.form.amount.value;
			document.form.sum.value = sell_price;
			change();
		}

		function add() {
			hm = document.form.amount;
			sum = document.form.sum;
			hm.value++;

			sum.value = parseInt(hm.value) * sell_price;
		}

		function del() {
			hm = document.form.amount;
			sum = document.form.sum;
			if (hm.value > 1) {
				hm.value--;
				sum.value = parseInt(hm.value) * sell_price;
			}
		}

		function change() {
			hm = document.form.amount;
			sum = document.form.sum;

			if (hm.value < 0) {
				hm.value = 0;
			}
			sum.value = parseInt(hm.value) * sell_price;
		}
	</script>
	<div id="total">
		<!-- 브라우저의 전체 창을 가운데로 몰아주기 위해 전체를 아우르는 div 생성 -->
		<div id="top">
			<jsp:include page="../base/top.jsp"></jsp:include>
		</div>
		<div id="center" style="height: auto;">
			<div id="goodsMenu">
				<ul id="list"><br>
					<li><a href="goodsMain.jsp"></a><img src="../img/product/Twins1.png"></li><br>
					<li><a href="uniform.jsp">유니폼</a> <!-- 경로 지정 시 a 뒤에 적으면 됨 --></li><br>
					<li><a href="goods.jsp">야구용품</a></li><br>
				</ul>
			</div>
			<div id="uniform_img"><br>
				<li><a><img src="../img/product/2번_팀.jpg"></a></li>
			</div>
			<div id="uniform1_info"><br>
			<!-- 판매상품 테이블 -->
				<table id="sellTable">
					<div>
						<div class="d">상품명</div>
						<div class="e">
						<%=dto2.getName() %></div>
					</div><br><br><br>
					<div>
						<div class="d">판매가</div>
						<div class="e"><%=dto2.getPrice() %>원</div>
					</div><br><br>
					<div>
						<div class="d">사이즈</div>
						<div class="e">
							<select id="size" name="size" style="width: 170px; height: 25px;">
								<option value="사이즈선택" selected="selected">사이즈선택</option>
								<option value="85">85</option>
								<option value="90">90</option>
								<option value="95">95</option>
								<option value="100">100</option>
								<option value="105">105</option>
								<option value="110">110</option>
								<option value="115">115</option>
								<option value="120">120</option>
							</select>
						</div>
					</div><br>
					
				
					<div>
						<form name="form" method="get">
							<br><div class="d">금액</div>
								<input id="allprice" type=hidden name="sell_price" value="79000">
								<input type="text" name="sum" readonly>원
							<br><br><div class="d">수량</div>
								<input id="amount" type="text" name="amount" value="1" size="5" onchange="change();" readonly>
								<input type="button" value=" + " onclick="add();" size="2">
								<input type="button" value=" - " onclick="del();">
							 	
							
						</form>
					</div>
					<br>
					<div class="all">
						<!-- span id="button1">
						<button id="bt1" type="button" style= "width: 120px; height: 50px; background-color: pink;">주문하기</button></span>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
						<span id="button2">
						<button id="bt2" type="button" style="width: 120px; height: 50px; background-color: pink;">장바구니</button></span>
					</div>
				
				</table>

			</div>
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<div id="uniform1_info_img">
				<li><img src="../img/product/1.JPG"></li><br>
				<li><img src="../img/product/2번_팀1.JPG"></li><br><br><br><br><br>
				<li><img src="../img/product/2번_팀2.JPG"></li><br><br><br><br><br>
				<li><img src="../img/product/2번_팀3.JPG"></li><br><br><br><br><br>
				<li><img src="../img/product/옷사이즈표.JPG"></li><br>
			</div>
		</div>
		<div style="clear:both;"></div>
		<br>
		<hr>
		<div id="bottom">
			<jsp:include page="../base/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>