<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

	//검색관련 제이쿼리
	$(function() {
		$("#searchButton").on(
				"click",
				function() {
					if ($("#searchText").val() == "") {
						alert("검색어를 입력해주세요");
					} else {
						$(location
								).attr('href',
								"board?keyword=" + $("#searchText").val());
					}
				})

	});
</script>
<style>
.carousel-control.right, .carousel-control.left {
	background-image: none;
	color: #f4511e;
}
a:link{
	color: white;
}
a:visited {
	color: #24BDAD;
}
</style>
</head>


<body>
	<!-- Navigation -->
	<a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i
		class="fa fa-bars"></i></a>
	<nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
			<li><a href="main">			
			<c:choose>
				<c:when test="${isLogin }">
					<h2>${id}님</h2>					
				</c:when>
				<c:otherwise>
					<h2>로그인하세요</h2>
				</c:otherwise>
			</c:choose>
			</a></li>
			<c:choose>
				<c:when test="${isLogin }">
					<li><a href="logout">로그아웃</a></li>
					<li><a href="myPage?id=${id }">마이페이지</a></li>					
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
		<!-- 헤더의 로고부분 -->
		<div>
			<a href="main"><img src="./img/logo1.png" alt="logo" width="50"
				height="50" /></a>


			<!-- 헤더에서 검색텍스트에어리어와 검색버튼 -->
			<!--  <div class="input-group" style="display:inline">
    <input type="text" class="form-control" style="width:300px" placeholder="Search">
    <div class="input-group-btn" style="float:left">
      <button class="btn btn-default" type="submit">
        <i class="glyphicon glyphicon-search"></i>
      </button>
    </div>
  </div>
			<a href="board"> <img src="./img/listIcon.png" alt="listIcon"
				width="50" height="40" style="margin-top: 2px" />
			</a>
		</div> -->

	</header>
	<!-- header end -->

	<!-- section1 -->
	<section id="myCarousel" class="carousel slide text-center"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="./img/mainSlide1.jpg" alt="" />
			</div>
			<div class="item">
				<img src="./img/mainSlide2.jpg" alt="" />
			</div>
			<div class="item">
				<img src="./img/mainSlide3.jpg" alt="" />
			</div>
			<div class="item">
				<img src="./img/mainSlide4.jpg" alt="" />
			</div>
			<div class="item">
				<img src="./img/mainSlide5.jpg" alt="" />
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</section>
	<!-- section1 end -->

	<!-- section2 -->
	<section class="mid-down">
		<h1 align="center" style="margin-top: 300px">
		<c:forEach var="list" items="${list }">
		<a href="board?keyword=${list.kword }">${list.kword }</a>
		</c:forEach>
		</h1>
	</section>
	<!-- section2 END -->







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