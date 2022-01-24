<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="Book/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AVOCADO</title>

<link rel="stylesheet" href="/resources/css/login.css">

</head>
<body>
	<div id="main">
		<!-- ***** Main Banner Area Start ***** -->
		<div class="page-heading about-page-heading" id="top">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="inner-content">
							<h2>Login</h2>
							<span>아보카도에 오신 것을 환영합니다! </span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ***** Main Banner Area End ***** -->

		<!-- ***** Contact Area Starts ***** -->
		<div class="contact-us">
			<div class="container">
				<div class="row">
					<div class="col-lg-4"></div>
					<c:choose>
						<c:when test="${sessionId != null}">
							<div class="col-lg-6">
								<div class="section-heading">
									<h2>'${sessionId}' 님 환영합니다!</h2>
									<section class="section" id="explore">
										<div class="left-content">
											<div class="main-border-button" style="margin-left: -40px;">
												<a href="/Book/home"> 홈 화면으로 가기</a> 
												<a href="/Book/myPage?id=${result.id}"> 마이페이지로 가기</a> 
												<a href="/logout"> 로그아웃 </a>
											</div>
										</div>
									</section>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							
							<!-- 로그인 화면 start-->
							<div class="login-form">
								<form>
									<h1>로그인</h1>
									<div class="form-group">
										<input type="email" name="email" placeholder="E-mail Address">
										<span class="input-icon"><i class="fa fa-envelope"></i></span>
									</div>
									<div class="form-group">
										<input type="password" name="psw" placeholder="Password">
										<span class="input-icon"><i class="fa fa-lock"></i></span>
									</div>
									<button class="login-btn" onclick="BETA()">Login</button>
									<a class="reset-psw" href="#" onclick="BETA()">Forgot your password?</a>
									<div class="seperator">
										<b>or</b>
									</div>
									<!-- Social login buttons -->
									<div id="naver_id_login" style="text-align: center">
										<a href="${url}"> <img width="223"
											src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
									</div>
								</form>
							</div>
							<!-- 로그인 화면 end-->
							
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<!-- ***** Contact Area Ends ***** -->
	</div>
</body>
<%@include file="Book/footer.jsp"%>
</html>
