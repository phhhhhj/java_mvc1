<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>서울의 자존심 LG트윈스!</title>
	<link rel="stylesheet" type="text/css" href="../css/gameInfo.css">
	<link rel="stylesheet" type="text/css" href="../css/mainPage.css">
	<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".month_toggle").click(function() { // 연도 버튼
				$(".yyyy").val($(this).val()); // 연도 버튼 클릭시 가져오는 값
				$(".toggle").toggle(); // 연도 버튼 클릭시 월별 버튼 보이기
			}); // 연도 버튼
			
			$(".bm").click(function() { // 월별 버튼
				$("#schedule").remove(); // 이전에 생성되어 있는 페이지를 지워줌(새로 찾는 페이지를 보여주기 위해)
				
				$(".mm").val($(this).val()); // 월별 버튼 클릭시 가져오는 값
				$.ajax({
					url : "get_game_list.jsp", // DB검색을 실행할 jsp
					data : {
						gyear : $(".yyyy").val(), // DB에서 검색할 연도
						gmonth : $(".mm").val() // DB에서 검색할 월
					},
					success : function(table) {
						$("#month_schedule").append(table); // 성공시 테이블이 들어갈 div에 테이블 html 추가
					}
				}) // ajax
			}) // 월별 버튼
		}); // function
	</script>
	</head>
<body>
	<div id="total">
		<!-- 브라우저의 전체 창을 가운데로 몰아주기 위해 전체를 아우르는 div 생성 -->
		<div id="top">
			<jsp:include page="../base/top.jsp"></jsp:include>
		</div>
		<br>
		<div id="center" style="height: auto;">
			<div id="gamelist" align="center">
				 <!-- 연도 버튼 -->
				<button class="month_toggle"
					style="width: 100px; height: 50px; font-size: 20pt; font: bold;" value="2019">2019</button>
				<button class="month_toggle"
					style="width: 100px; height: 50px; font-size: 20pt; font: bold;" value="2020">2020</button>
				<div class="toggle" style="display: none;">
					<!-- 월별 버튼 -->
					<button class="bm"
						style="width: 100px; height: 50px; font-size: 15pt;" value="03" >3월</button>
					<button class="bm"
						style="width: 100px; height: 50px; font-size: 15pt;" value="04">4월</button>
					<button class="bm"
						style="width: 100px; height: 50px; font-size: 15pt;" value="05">5월</button>
					<button class="bm"
						style="width: 100px; height: 50px; font-size: 15pt;" value="06">6월</button>
					<br>
					<button class="bm"
						style="width: 100px; height: 50px; font-size: 15pt;" value="07">7월</button>
					<button class="bm"
						style="width: 100px; height: 50px; font-size: 15pt;" value="08">8월</button>
					<button class="bm"
						style="width: 100px; height: 50px; font-size: 15pt;" value="09">9월</button>
					<button class="bm"
						style="width: 100px; height: 50px; font-size: 15pt;" value="10">10월</button>
				</div>
			</div>
			<!-- DB검색에 필요한 값을 임시로 저장(hidden 사용으로 사용자에게 보이지 않게) -->
			<input type="hidden" class="yyyy">
			<input type="hidden" class="mm">
			<div id="month_schedule">

			</div>
			<div style="clear: both;"></div>
		</div>
		<br>
		<hr>
		<div id="bottom">
			<jsp:include page="../base/bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>