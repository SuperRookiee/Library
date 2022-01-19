<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="Book/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AVOCADO</title>

<style>
	#explore{
		padding: 10px 10px;
		border-bottom: none;
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
						<h2>Login</h2>
<<<<<<< HEAD
						<span>아보카도에 오신 것을 환영합니다! </span>
=======
						<span>아보카도에 오신 것을 환영합니다!</span>
>>>>>>> 70a2499e0f961ce7a284f689019aa753c4be2f8a
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
				                     	<div class="main-border-button">
				                            <a href="/Book/myPage"> 마이페이지로 가기</a> <a href="/logout"> 로그아웃 </a>
				                        </div>
				                    </div>
			                    </section>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<form action="login.userdo" method="post" name="frm"
							style="width: 470px;">
							<h2>로그인</h2>
							<input type="text" name="id" id="id" class="w3-input w3-border"
								placeholder="아이디" value="${id}"> <br> <input
								type="password" id="pwd" name="pwd" class="w3-input w3-border"
								placeholder="비밀번호"> <br> <input type="submit"
								value="로그인" onclick="#"> <br>
							<br>
							<div id="naver_id_login" style="text-align: center">
								<a href="${url}"> <img width="223"
								 src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
							</div>
							
						</form>
						
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
