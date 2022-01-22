<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<title>AVOCADO</title>


<!-- Additional CSS Files -->
<link rel="stylesheet" type="text/css"
	href="/resources/hexa/assets/css/bootstrap.min.css?after">

<link rel="stylesheet" type="text/css"
	href="/resources/hexa/assets/css/font-awesome.css?after">

<link rel="stylesheet"
	href="/resources/hexa/assets/css/templatemo-hexashop.css?after">

<link rel="stylesheet"
	href="/resources/hexa/assets/css/owl-carousel.css?after">

<link rel="stylesheet"
	href="/resources/hexa/assets/css/lightbox.css?after">

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- BootStrap icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css?after">

<!-- 다크모드 -->
<link rel="stylesheet" type="text/css"
	href="/resources/css/DarkMode.css?after">

<!-- 아이콘 -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">

<script>
	//쿠키 생성
	var setCookie = function(name, value, exp) {
		var date = new Date();
		date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000);
		document.cookie = name + '=' + value + ';expires='
				+ date.toUTCString() + ';path=/';
	};
	
	//쿠기 가져오기
	var getCookie = function(name) {
		var value = document.cookie.match('(^|;) ?' + name
				+ '=([^;]*)(;|$)');
	
		return value ? value[2] : null;
	};
	//Mode 쿠키 가져오기
	var Mode = getCookie("Mode");
	
	
	//라이트모드 실행
	function LightMode() {
		setCookie("Mode", "false", 30);
		document.body.classList.remove("dark-mode");
	}
	//다크모드 실행
	function DarkMode() {
		setCookie("Mode", "true", 30);
		document.body.classList.add("dark-mode");
	}
	
	$(document).ready(function() {
		console.log("쿠키 Dark변수에 저장된 값: " + Mode);

		if (Mode == "true") {
			DarkMode()
		} 
		else {
			LightMode()
		}

	});

	function BETA(){ 
		alert('(BETA) 정식 서비스를 기대해주세요!!'); 
	}
</script>

</head>
<body>
	<!-- ***** Preloader Start ***** -->
	<div id="preloader">
		<div class="jumper">
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>
	<!-- ***** Preloader End ***** -->


	<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->
						<a href="/Book/home" class="logo"> <img
							src="/resources/image/logo.png">
						</a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Menu Start ***** -->
						<ul class="nav">
							<li class="scroll-to-section"><a href="/Book/home">홈 화면</a></li>
							<li class="scroll-to-section"><a href="/Book/findBook">조건 검색</a></li>
							<li class="scroll-to-section"><a href="/cart/cart?userId=${result.name}">담아둔 상품</a></li>
							<li class="submenu"><a href="javascript:;">추천도서</a>
								<ul>
									<li><a href="/Book/recommend?sort=kdc">주제별 추천도서</a></li>
									<li><a href="/Book/recommend?sort=age">연령별 추천도서</a></li>
									<li><a href="/Book/recommend?sort=gender">성별 추천도서</a></li>
								</ul></li>
							<li class="scroll-to-section"><c:choose>
									<c:when test="${sessionId == null}">
										<a href="/login">로그인</a>
									</c:when>
									<c:otherwise>
										<a href="/Book/myPage?id=${result.id}">마이페이지</a>
									</c:otherwise>
								</c:choose></li>
						</ul>
						<a class='menu-trigger'> <span>Menu</span>
						</a>
						<!-- ***** Menu End ***** -->
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- ***** Header Area End ***** -->
</body>
</html>