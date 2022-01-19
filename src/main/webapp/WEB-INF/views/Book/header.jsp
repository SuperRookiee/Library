<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>AVOCADO</title>


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="/resources/hexa/assets/css/bootstrap.min.css?after">

    <link rel="stylesheet" type="text/css" href="/resources/hexa/assets/css/font-awesome.css?after">

    <link rel="stylesheet" href="/resources/hexa/assets/css/templatemo-hexashop.css?after">

    <link rel="stylesheet" href="/resources/hexa/assets/css/owl-carousel.css?after">

    <link rel="stylesheet" href="/resources/hexa/assets/css/lightbox.css?after">

	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- BootStrap icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css?after">

	<!-- 다크모드 -->
	<style>
		:root {
		  --background: #fff;
		  --text: #363636;
		  --heading-text: #000;
		  --anchor-text: #0076d1;
		  --code-background: #efefef;
		  --code-text: #000;
		}
		
		@media (prefers-color-scheme: dark) {
		  :root {
		    --background: #202b38;
		    --text: #dbdbdb;
		    --heading-text: #fff;
		    --anchor-text: #0076d1;
		    --code-background: #161f27;
		    --code-text: #ffbe85;
		  }
		}
		
		.dark-mode {
		  background: var(--background);
		  line-height: 1.6;
		  margin: 0 auto;
		}
		
		.dark-mode h1,
		.dark-mode h2,
		.dark-mode h3,
		.dark-mode .nav {
		  color: var(--heading-text);
		}
		
		.dark-mode p,
		.dark-mode dl {
		  color: var(--text);
		}
		
		.dark-mode a {
		  color: var(--anchor-text);
		  text-decoration: none;
		}
		
		.dark-mode code {
		  color: var(--code-text);
		  background: var(--code-background);
		  border-radius: 6px;
		  padding: 2.5px 5px;
		}
		
		.dark-mode header,
		.dark-mode #main,
		.dark-mode body{
		  background: var(--background);
		}
		
	</style>
	
	<script>
		function myFunction() {
			document.body.classList.toggle("dark-mode");
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
                        <a href="/Book/home" class="logo">
                            <img src="/resources/image/logo.png">
                        </a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li class="scroll-to-section"><a href="/Book/home">홈 화면</a></li>
                            <li class="scroll-to-section"><a href="/Book/findBook">조건 검색</a></li>
                            <li class="scroll-to-section"><a href="/Book/cart">담아둔 상품</a></li>
                            
                            <li class="submenu">
                                <a href="javascript:;">추천도서</a>
                                <ul>
                                    <li><a href="/Book/recommend?sort=주제">주제별 추천도서</a></li>
                                    <li><a href="/Book/recommend?sort=연령">연령별 추천도서</a></li>
                                    <li><a href="/Book/recommend?sort=성">성별 추천도서</a></li>
                                </ul>
                            </li>
                            <li class="scroll-to-section">
	                            <c:choose>
	                            	<c:when test="${sessionId == null}">
		                            <a href="/login">로그인</a>
		                            </c:when>
		                           <c:otherwise>
		                            <a href="/Book/myPage">마이페이지</a>
		                           </c:otherwise>
		                        </c:choose>
                            </li>
                        </ul>        
                        <a class='menu-trigger'>
                            <span>Menu</span>
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