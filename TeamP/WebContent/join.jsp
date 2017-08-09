<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	
	
	$(function(){
		if("${filePath}"!=""){
				 $('#imgF').attr('src',"${filePath }");
		}	
	});
	
	/* ./img/defaultman.png
	${filePath } */
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
			<a href="main"><img src="./img/logo1.png" alt="logo" width="50"
				height="50" /></a>
		</div>
	</header>
	<!-- header end -->

	<!-- section1 -->
	<section>
		<div align="center">
			<h1>회원가입</h1>
			<form action="join" method="post">
				<div class="container">
					<table class="table">
						<tr>
							<th>id</th>
							<td colspan="2"><input type="text" name="id" /></td>
						</tr>
						<tr>
							<th>pw</th>
							<td colspan="2"><input type="password" name="pw" /></td>
						</tr>
						<tr>
							<th>pw확인</th>
							<td colspan="2"><input type="password" name="repw" /></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="" id="" /></td>
						</tr>
						<tr>
							<th>email</th>
							<td colspan="2"><input type="email" name="email" /></td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td colspan="2"><input type="text" name="phone"
								placeholder="'-'없이 입력해주세요." /></td>
						</tr>

						<tr>
							<th>성별</th>
							<td colspan="2"><input type="radio" name="gender" id="male" />남자
								<input type="radio" name="gender" id="female" />여자</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td colspan="2"><input type="date" name="birthday" id="" /></td>
						</tr>
						<tr>
							<th>사진 등록</th>
							<!-- ${filePath }-->
							<td><img src="./img/defaultman.png" alt="default" width="50"
								height="50" id="imgF" /></td>
							<!-- 현재  default이미지 파일 선택후 파일이미지로 대체할 예정 -->
							<td><a href="imgPutForm2">사진올리기</a>
							<td>
						</tr>

						<tr>
							<td colspan="3"><input type="submit" value="회원가입" /> <!-- 회원가입 버튼을 누르면 로그인 페이지로 넘어가서 회원 가입 성공창이 뜬다.  -->
								<input type="button" value="취소" id="btn" /></td>
						</tr>
						</div>
					</table>
			</form>
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


<script>

	function chk(){
		/* 회원가입 정보가 제대로 입력되었는지 확인 */
		/* 공란이 없는지, 비밀번호와 비밀번호 확인이 맞는지 */	
		for(var i in $(".warning")){
			// 확인할 때마다 모든 warning div를 초기화시킨다. 
			$(".warning")[i].innerHTML="";
		}		
		
		//	그후 공란이 있는 div에 입력안내 메시지를 띄움
		if($("#id").val()==""){
			$("#divId")[0].innerHTML="<p style='color:red'>아이디를 입력해주세요.</p>";				
		}else if($("#pw").val()==""){
			$("#divPw")[0].innerHTML="<p style='color:red'>패스워드를 입력해주세요.</p>";
		}else if($("#repw").val()==""){
			$("#divRepw")[0].innerHTML="<p style='color:red'>패스워드를 재입력해주세요.</p>";
		}else if($("#pw").val()!=$("#repw").val()){
			$("#divRepw")[0].innerHTML="<p style='color:red'>위에 입력한 것과 다릅니다.</p>";			
		}else if($("#name").val()==""){
			$("#divName")[0].innerHTML="<p style='color:red'>이름을 입력해주세요.</p>";
		}else if($("#email").val()==""){
			$("#divEmail")[0].innerHTML="<p style='color:red'>이메일을 입력해주세요.</p>";
		}else if($("#phone").val()==""){
			$("#divPhone")[0].innerHTML="<p style='color:red'>휴대폰번호를 입력해주세요.</p>";
		}else if($("#gender").val()==""){
			$("#divGender")[0].innerHTML="<p style='color:red'>성별을 선택해주세요.</p>";			
		}else if($("#birth").val()==""){
			$("#divBirth")[0].innerHTML="<p style='color:red'>생일을 선택해주세요.</p>";
		}else{
			/* 모든 입력이 확실하면 전송 */
			$("#joinForm").submit();
	 		console.dir($("#id"));
		}	
	}
	
	function cancel(){
		/* 취소버튼을 누르면 이전페이지로 돌아간다 */
		history.go(-1);				
	}

</script>

</body>
</html>