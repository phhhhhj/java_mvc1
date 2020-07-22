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
<jsp:useBean id="dto" class="bean.BasketDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"></jsp:setProperty>
<%
	BasketDAO dao = new BasketDAO();
	dao.insert(dto);
	/* System.out.print(dto); */
%>

<link rel="stylesheet" type="text/css" href="../css/twins.css">
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		// 각 각의 상품별 삭제기능
		$("button").click(function() {
			noValue = $(this).attr('value')
			idValue = $(this).attr('id')
			console.log(noValue + ', ' + idValue)
			if(idValue == 'delete'){
				$.ajax({
					url : "delete.jsp",
					data : {
						no : noValue
					},
					success : function(result) {
						console.log(result)
						tr = $(this).parent().parent()
						tr.remove()
						location.href="basket.jsp"
					}
				})
			// 버튼 누르면 order 페이지로 이동
			}if(idValue == 'order'){
				
							location.href = "order.jsp"

			}
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
			<div id="goodsMenu">
				<ul id="list">
					<br>
					<li><a href="goodsMain.jsp"><img src="../img/product/Twins1.png"></a></li>
				</ul>
			</div>
			<br> <br>

			<table border=1>
				<tr class="info">
					<td>순번</td>
					<td width=300 height=30>상품명</td>
					<td width=70 height=30>사이즈</td>
					<td width=70 height=30>수량</td>
					<td width=120 height=30>상품금액</td>
					<td width=120 height=30>총상품금액</td>
					<td>삭제</td>
				</tr>
				<!-- 상품 장바구니에 넣으면 리스트들 불러오기 -->
				<%
					BasketDAO dao2 = new BasketDAO();
					ArrayList<BasketDTO> list = dao2.list();
					for (BasketDTO dto3 : list) {
				%>
				
				
				<tr class="info">
					<td id="<%=dto3.getNo()%>No"><%=dto3.getNo() %></td>
					<td id="<%=dto3.getNo()%>Name"><%=dto3.getName()%></td>
					<td id="<%=dto3.getNo()%>Size"><%=dto3.getSize()%></td>
					<td id="<%=dto3.getNo()%>Count"><%=dto3.getCount()%></td>
					<td id="<%=dto3.getNo()%>Price"><%=dto3.getPrice()%></td>
					<td id="<%=dto3.getNo()%>AllPrice"><%=Integer.parseInt
					(dto3.getCount()) * Integer.parseInt(dto3.getPrice())%></td>
					<td>
						<button id="delete" value="<%=dto3.getNo()%>" style="background: orange" 
						type="button">삭제</button>
					</td>
					
				</tr>

				<%
					}
				%>
				<tr>
					<td colspan="7">
						<button id="order" style="background: green" 
						type="button">주문</button>
					</td>
				</tr>

			</table>
			<br>
			<br> <br>
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