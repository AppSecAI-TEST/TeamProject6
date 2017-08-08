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
<style type="text/css">
.filter {
	text-align: center;
	height: 30%;
	left: 1%;
	position: absolute;
	width: 10%;
}

.miniTable {
	width: 200px;
	height: 300px;
}

.val {
	width: 50px;
}

.title {
	text-align: left;
	font-size: large;
	font: bold;
	font-weight: bold;
	width: 60%;
}

.type {
	width: 30%;
}

.writer {
	text-align: left;
	width: 15%;
}

.loc {
	text-align: left;
	font: bold;
	width: 70%;
}

.money {
	text-align: right;
	font: bold;
	font-weight: bold;
	font-size: medium;
	width: 15%;
}
</style>
</head>


<body>
	<!-- Navigation -->
	<a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i
		class="fa fa-bars"></i></a>
	<nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<a href="#" id="menu-close"
				class="btn btn-light btn-lg pull-right toggle"><i
				class="fa fa-times"></i></a>
			<li><a href="main"><h2>일일퀘스트</h2></a></li>
			<li><a href="login">로그인</a></li>
			<li><a href="join">회원가입</a></li>
			<li><a href="writeForm">해주세요/해드립니다</a></li>
			<li><a href="board">거래목록</a></li>
		</ul>
	</nav>
	<!-- Navigation END -->

	<!-- header -->
	<header class="header">
		<div class="logo">
			<a href="main"><img src="./img/logo.png" alt="logo" width="50"
				height="50" /></a>
		</div>
	</header>
	<!-- header end -->

	<!-- section1 -->
	<section>
		<div class="container">
			<div class="filter">
				<form action="board">
					<table class="miniTable">

						<tr>
							<td><label><input type="radio" name="optionJob" value="일감">일감</label></td>
							<td><label><input type="radio" name="optionJob" value="일손">일손</label></td>
							<td><label><input type="radio" name="optionJob" value="전체">전체</label></td>
						</tr>
						<tr>
							<td><label><input type="radio" name="optionGender" value="여자">여자</label></td>
							<td><label><input type="radio" name="optionGender" value="남자">남자</label></td>
							<td><label><input type="radio" name="optionGender" value="무관">무관</label></td>
						</tr>
						<tr>
							<td><input type="text" class="val" name="minVal"
								placeholder="0" /></td>

							<td><input type="text" class="val" name="maxVal"
								placeholder="100000" /></td>
							<td><input type="submit" value="검색" /></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="table-responsive" align="center">
				<table class="table">
					<tr>
						<td rowspan="2" width="100px"><img src="./img/mal2.png"
							alt="userPic" /></td>
						<td class="type">해주세요.</td>
						<td class="title" colspan="2">멍멍이좀 찾아주세요</td>
					</tr>
					<tr>
						<td class="writer">개장수</td>
						<td class="loc">서울시 도봉구 도봉동</td>

						<td class="money">99000</td>
					</tr>

					<tr>
						<td rowspan="2"><img src="./img/mal2.png" alt="userPic" /></td>
						<td class="type">해드립니다.</td>
						<td class="title" colspan="2">사람 찾아드립니다.</td>
					</tr>
					<tr>
						<td class="writer">마포갈비</td>
						<td class="loc">서울시 마포구 상암동</td>

						<td class="money">30000000</td>
					</tr>
					<tr>
						<td rowspan="2"><img src="./img/mal2.png" alt="userPic" /></td>
						<td class="type">해드립니다.</td>
						<td class="title" colspan="2">방학숙제해드립니다.</td>
					</tr>
					<tr>
						<td class="writer">대학생</td>
						<td class="loc">서울시 관악구 신림동</td>

						<td class="money">20000</td>
					</tr>
					<tr>
						<td rowspan="2"><img src="./img/mal2.png" alt="userPic" /></td>
						<td class="type">해주세요.</td>
						<td class="title" colspan="2">머리풍성 하게 해주세요.</td>
					</tr>
					<tr>
						<td class="writer">김광규</td>
						<td class="loc">서울시 종로구 창신동</td>

						<td class="money">50000000</td>
					</tr>

				</table>
			</div>


			<div class="container">

				<!-- Trigger the modal with a button -->
				<button type="button" class="btn btn-info btn-lg"
					data-toggle="modal" data-target="#myModal">로그인하기</button>

				<!-- Modal -->
				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">로그인</h4>
							</div>
							<div class="modal-body">
								<table class="table">
									<tr>
										<th>ID</th>
										<td><input type="text" name="id" id="" /></td>
									</tr>
									<tr>
										<th>PW</th>
										<td><input type="password" name="pw" id="" /></td>
									</tr>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">로그인</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
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