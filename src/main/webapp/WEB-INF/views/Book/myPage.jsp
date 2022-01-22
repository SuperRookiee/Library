<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../Book/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/sidebar/css/style.css">

<link rel="stylesheet" href="/resources/css/myPage.css">
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
	  			<!-- 시작 -->
	  				<c:choose>
	  				<c:when test="${list.profile_image != null}">
					<!-- profile 사진이 있으면? -->
					<div class="img circle-img" style="background-image: url('/display?fileName=${list.profile_image}')"></div>
					</c:when>
					<c:otherwise>
<<<<<<< HEAD
					<div class="img" style="background-image: url('/resources/image/user.png')"></div>
=======
					<div class="img" style="background-image: url('${image2}')"></div>
>>>>>>> 0b565539e84fffcd5b42b5b7ab6942205a239fd5
					</c:otherwise>
					</c:choose>
	  				<!-- 끝  -->
	  				<!-- <div class="img" style="background-image: url(/resources/image/conan.jpeg);"></div> -->	<!-- 프로필 사진 -->
	  				<h3><c:out value="${list.name }"/></h3>
	  			</div>
	  		</div>
	        <ul class="list-unstyled components mb-5">
	          <li class="active">
	            <a href="/Book/myPage"><span class="fa fa-home mr-3"></span> Home</a>
	          </li>
	          <li>
	              <a href="javascript:;" onclick="BETA()"><span class="fa fa-id-card mr-3"><small class="d-flex align-items-center justify-content-center"></small></span> Membership</a>
	          </li>
	          <li>
	            <a href="/pay/result?userId=${result.name}"><span class="fa fa-gift mr-3"></span> Paybill</a>
	          </li>
	          <li>
	            <a href="javascript:;" onclick="LightMode()"><span class="fa fa-cog mr-3"></span>Light Mode</a>
	          </li>
	          <li>
	            <a href="javascript:;" onclick="DarkMode()"><span class="fa fa-cog mr-3"></span>Dark Mode</a>
	          </li>
	          <li>
	            <a href="/update?id=${list.id }"><span class="fa fa-support mr-3"></span> 회원 정보 수정</a>
	          </li>
	          <li>
	            <a href="/logout"><span class="fa fa-sign-out mr-3"></span> 로그 아웃</a>
	          </li>
	          <li>
	            <a href="/remove?token='<c:out value="${access_token }"/>'"><span class="fa fa-sign-out mr-3"></span> 회원 탈퇴</a>
	          </li>
	        </ul>
   		</nav>
   		
	    <!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
		  <h2 class="mb-4">My Page ${list.profile_image}</h2>
		  <div class="card green">
          <div class="additional">
            <div class="user-card">
              <!-- svg시작 -->
              <div>
              <c:choose>
					<c:when test="${list.profile_image != null}">
					<!-- profile 사진이 있으면? -->
					<div class="img circle-img" style="background-image: url('/display?fileName=${list.profile_image}')"></div>
					</c:when>
					<c:otherwise> <!-- null 일 때 -->
					
					<div class="img circle-img" style="background-image: url('${image2}')"></div>
               </c:otherwise>
           </c:choose>
              </div>
              <!-- svg 끝 -->
            </div>
            <div class="more-info">
              <h1 class="nameStyle">${list.name }</h1>
              <div class="stats">
                <div>
                  <div class="title">Age</div>
                  <i class="fa fa-trophy"></i>
                  <div class="value">${list.age }</div>
                </div>
                <div>
                  <div class="title">Coffee</div>
                  <i class="fa fa-coffee"></i>
                  <div class="value infinity">∞</div>
                </div>
              </div>
            </div>
          </div>
          <div class="general">
            <h1>회원 정보</h1><br>
            <p class="mypage-content"><span class="fontStyle">이메일</span> ${list.email }</p>
            <p class="mypage-content"><span class="fontStyle">생년월일</span> ${list.birthyear }-${list.birthday }</p>
            <p class="mypage-content"><span class="fontStyle">성별</span> ${list.gender }</p>
            <p class="mypage-content"><span class="fontStyle">전화번호</span> ${list.mobile }</p>
            <img src="/resources/image/logo.png" class="logoPlace">
          </div>
        </div>
      </div>
   </div>

    <script src="/resources/sidebar/js/popper.js"></script>
    <script src="/resources/sidebar/js/main.js"></script>
</div>
</body>
<%@include file="../Book/footer.jsp" %>
</html>