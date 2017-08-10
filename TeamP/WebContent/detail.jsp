<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>일일퀘스트</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/stylish-portfolio.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
	// 사이드바 메뉴 닫는 함수
	$(function() {
		$("#menu-close").click(function(e) {
			e.preventDefault();
			$("#sidebar-wrapper").toggleClass("active");
		});
	});

	// 사이드바 메뉴 오픈시키는 함수
	$(function() {
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#sidebar-wrapper").toggleClass("active");
		});
	});
</script>

</head>


<body>
	<!-- Navigation -->
	<a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i
		class="fa fa-bars"></i></a>
	<nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<a id="menu-close" href="#"
				class="btn btn-light btn-lg pull-right toggle"><i
				class="fa fa-times"></i></a>
			<li><a href="main"><h2>
						<%
							String id = (String) session.getAttribute("id");
						%>
						<c:choose>
							<c:when test="${isLogin }">
					<%=id %>님					
				</c:when>
							<c:otherwise>
					로그인하세요
				</c:otherwise>
						</c:choose>
					</h2></a></li>
			<c:choose>
				<c:when test="${isLogin }">
					<li><a href="logout">로그아웃</a></li>
					<li><a href="myPage">마이페이지</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="login">로그인</a></li>
					<li><a href="join">회원가입</a></li>
				</c:otherwise>
			</c:choose>
			<li><a href="write">해주세요/해드립니다</a></li>
			<li><a href="board">거래목록</a></li>
		</ul>

	</nav>
	<!-- Navigation END -->

	<!-- header -->
	<header class="header">
		<div class="logo">
			<a href="main"><img src="./img/logo1.png" alt="logo" width="50"
				height="50" /></a>
		</div>
	</header>
	<!-- header end -->

	<!-- section1 -->


	<section>

		<!--  게시글 클릭시 디테일 창. -->
		<div class="container">
			<div class="table-responsive" align="center">
				<table class="table">

					<tr>
						<th colspan="5">${dvdto.title}</th>
					</tr>
					<tr>
						<!-- 클릭한 게시글의 정보 -->
						<td rowspan="4"><a href="userDetail"><img
								src="${dvdto.profilesrc}" alt="프사" class="img-rounded" /></a></td>

						<td><h5>${dvdto.regdate}</h5></td>
					</tr>
					<tr>
						<td><b>댓글 N개</b></td>
					</tr>
					<tr>
						<c:if test="${dvdto.category == '구인'}">
							<td>${dvdto.sellgrade}</td>
						</c:if>
						<c:if test="${dvdto.category == '구직'}">
							<td>${dvdto.buygrade}</td>
						</c:if>
					</tr>
					<tr>
						<td>${dvdto.reward}</td>
					</tr>
					<tr>
						<td colspan="5">${dvdto.contents}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<th>지역</th>
						<th>기한</th>
					</tr>
					<tr>
						<td>${dvdto.phone }</td>
						<td>${dvdto.loc }</td>
						<td>${dvdto.time }</td>
					</tr>

				</table>
				<script type="text/javascript"
					src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=cFEzVHezFowJellMimC4&submodules=geocoder"></script>
				<div id="map" style="width: 60%; height: 300px;"></div>
				<script>
					var map = new naver.maps.Map('map');

					//입력된 주소에 따라 지도시작위치가 달라짐.
					var myaddress = '${dvdto.loc }';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
					naver.maps.Service
							.geocode(
									{
										address : myaddress
									},
									function(status, response) {
										if (status !== naver.maps.Service.Status.OK) {
											return alert(myaddress
													+ '의 검색 결과가 없거나 기타 네트워크 에러');
										}
										var result = response.result;
										// 검색 결과 갯수: result.total
										// 첫번째 결과 결과 주소: result.items[0].address
										// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
										var myaddr = new naver.maps.Point(
												result.items[0].point.x,
												result.items[0].point.y);
										map.setCenter(myaddr); // 검색된 좌표로 지도 이동
										// 마커 표시
										var marker = new naver.maps.Marker({
											position : myaddr,
											map : map
										});
										// 마커 클릭 이벤트 처리
										naver.maps.Event.addListener(marker,
												"click", function(e) {
													if (infowindow.getMap()) {
														infowindow.close();
													} else {
														infowindow.open(map,
																marker);
													}
												});
										// 마크 클릭시 인포윈도우 오픈
										var infowindow = new naver.maps.InfoWindow(
												{
													content : '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
												});
									});
				</script>
				<!--  댓글 테이블. db에서 댓글 조회하여 입력시켜야함. -->
				<table class="table">


					<tr class="active">

						<td>댓글 (2개)</td>
					</tr>
					<c:forEach var="cs" items="${list}">
						<tr>
							<td><input type="hidden" name="commentNo"
								value="${cs.commentNo}" /></td>
							<td>${cs.writer}</td>
							<td colspan="3">${cs.contents}</td>
							<td>${cs.regdate}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!--  댓글입력창. form에 액션 추가하고 사용.-->
			<div class="container">
				<form action="writecomments" method="post">
					<div class="form-group">
						<label for="comment">문의하기</label>

						<textarea class="form-control" rows="5" name="comments"
							id="comment" placeholder="궁금하신 점을 작성해주세요~"></textarea>
						<button type="button" class="btn" id="">등록하기</button>
					</div>
				</form>
			</div>
		</div>



	</section>
	<!-- section1 end -->







	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-lg-offset-1 text-center">
					<h4>
						<strong>일일퀘스트</strong>
					</h4>
					<p>
						종각역4번출구 <br>에이콘 아카데미
					</p>
					<ul class="list-unstyled">
						<li><i class="fa fa-phone fa-fw"></i> (033) 123-4567</li>
						<li><i class="fa fa-envelope-o fa-fw"></i>acorn@google.com</a></li>
					</ul>
					<hr class="small">
					<p class="text-muted">Copyright &copy; Your Website 2014</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer END -->


</body>
</html>