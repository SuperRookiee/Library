<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../Book/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/sidebar/css/style.css">

<style>
	#sidebarCollapse{
		
	}
</style>

</head>
<body>
<div id="main">
	<!-- ***** Main Banner Area Start ***** -->
	<div class="page-heading about-page-heading" id="top">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="inner-content">
						<h2>My Page</h2>
						<span>마이페이지입니다</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Main Banner Area End ***** -->
	
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar">
			<div class="custom-menu">
				<button type="button" id="sidebarCollapse" class="btn btn-dark"> <i class="bi bi-arrow-left-right"></i> </button>
				<!-- <button type="button" id="sidebarCollapse" class="btn btn-dark"></button> -->
       		</div>
	  		<div class="img bg-wrap text-center py-4" style="background-image: url(/resources/sidebar/images/bg_1.jpg);">
	  			<div class="user-logo">
	  				<div class="img" style="background-image: url(/resources/image/conan.jpeg);"></div>
	  				<h3>User 이름</h3>
	  			</div>
	  		</div>
	        <ul class="list-unstyled components mb-5">
	          <li class="active">
	            <a href="#"><span class="fa fa-home mr-3"></span> Home</a>
	          </li>
	          <li>
	              <a href="#"><span class="fa fa-download mr-3 notif"><small class="d-flex align-items-center justify-content-center">5</small></span> Download</a>
	          </li>
	          <li>
	            <a href="#"><span class="fa fa-gift mr-3"></span> Cart</a>
	          </li>
	          <li>
	            <a href="#"><span class="fa fa-cog mr-3"></span> Settings</a>
	          </li>
	          <li>
	            <a href="#"><span class="fa fa-support mr-3"></span> 회원 정보 수정</a>
	          </li>
	          <li>
	            <a href="#"><span class="fa fa-sign-out mr-3"></span> 로그 아웃</a>
	          </li>
	          <li>
	            <a href="#"><span class="fa fa-sign-out mr-3"></span> 회원 탈퇴</a>
	          </li>
	        </ul>
   		</nav>
   		
	    <!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
		  <h2 class="mb-4">My Page</h2>
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
		</div>
		
	</div>

    <script src="/resources/sidebar/js/popper.js"></script>
    <script src="/resources/sidebar/js/main.js"></script>
	
</div>
</body>
<%@include file="../Book/footer.jsp" %>
</html>