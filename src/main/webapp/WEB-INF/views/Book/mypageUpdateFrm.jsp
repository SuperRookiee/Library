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
<style>
        @import url('https://fonts.googleapis.com/css?family=Dosis');

:root {
  /* generic */
  --gutterSm: 0.4rem;
  --gutterMd: 0.8rem;
  --gutterLg: 1.6rem;
  --gutterXl: 2.4rem;
  --gutterXx: 7.2rem;
  --colorPrimary400: #92bCa6;
  --colorPrimary600: #A2CCB6;
  --colorPrimary800: #32a852;
  --fontFamily: "Dosis", sans-serif;
  --fontSizeSm: 1.2rem;
  --fontSizeMd: 1.6rem;
  --fontSizeLg: 2.1rem;
  --fontSizeXl: 2.8rem;
  --fontSizeXx: 3.6rem;
  --lineHeightSm: 1.1;
  --lineHeightMd: 1.8;
  --transitionDuration: 300ms;
  --transitionTF: cubic-bezier(0.645, 0.045, 0.355, 1);
  
  /* floated labels */
  --inputPaddingV: var(--gutterMd);
  --inputPaddingH: var(--gutterLg);
  --inputFontSize: var(--fontSizeLg);
  --inputLineHeight: var(--lineHeightMd);
  --labelScaleFactor: 0.8;
  --labelDefaultPosY: 50%;
  --labelTransformedPosY: calc(
    (var(--labelDefaultPosY)) - 
    (var(--inputPaddingV) * var(--labelScaleFactor)) - 
    (var(--inputFontSize) * var(--inputLineHeight))
  );
  --inputTransitionDuration: var(--transitionDuration);
  --inputTransitionTF: var(--transitionTF);
}

*,
*::before,
*::after {
  box-sizing: border-box;
}

.Wrapper {
  flex: 0 0 80%;
  max-width: 80%;
}

.Title {
  margin: 0 0 var(--gutterXx) 0;
  padding: 0;
  color: #fff;
  font-size: var(--fontSizeXx);
  font-weight: 400;
  line-height: var(--lineHeightSm);
  text-align: center;
  text-shadow: -0.1rem 0.1rem 0.2rem var(--colorPrimary800);
}

.Input {
  position: relative;
  margin-bottom: 5px;
}

.Input-text {
  display: block;
  margin: 0;
  color: inherit;
  width: 100%;
  font-family: inherit;
  font-size: 28px;
  font-weight: inherit;
  line-height: var(--inputLineHeight);
  border: none;
  border-radius: 0.4rem;
  transition: box-shadow var(--transitionDuration);
}

.Input-text::placeholder {
  color: #B0BEC5;
}

.Input-text:focus {
  outline: none;
  box-shadow: 0.2rem 0.8rem 1.6rem var(--colorPrimary600);
}

.Input-label {
  display: block;
  position: absolute;
  bottom: 50%;
  left: 1rem;
  color: #fff;
  font-family: inherit;
  font-size: var(--inputFontSize);
  font-weight: inherit;
  line-height: var(--inputLineHeight);
  opacity: 0;
  transform: 
    translate3d(0, var(--labelDefaultPosY), 0)
    scale(1);
  transform-origin: 0 0;
  transition:
    opacity var(--inputTransitionDuration) var(--inputTransitionTF),
    transform var(--inputTransitionDuration) var(--inputTransitionTF),
    visibility 0ms var(--inputTransitionDuration) var(--inputTransitionTF),
    z-index 0ms var(--inputTransitionDuration) var(--inputTransitionTF);
}

.Input-text:placeholder-shown + .Input-label {
  visibility: hidden;
  z-index: -1;
}

.Input-text:not(:placeholder-shown) + .Input-label,
.Input-text:focus:not(:placeholder-shown) + .Input-label {
  visibility: visible;
  z-index: 1;
  opacity: 1;
  transform:
    translate3d(0, var(--labelTransformedPosY), 0)
    scale(var(--labelScaleFactor));
  transition:
    transform var(--inputTransitionDuration),
    visibility 0ms,
    z-index 0ms;
}

/* submit 버튼 */
input[type=submit] {
        background-color: #A2CCB6;
        border: none;
        color: #fff;
        text-decoration: none;
        margin: 4px 2px;
        cursor: pointer;
        float: right;
        width: 100px;
        height: 50px;
        margin-top: 30px;
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
						<h2>My Page Update Form</h2>
						<span>내 정보 수정페이지입니다</span>
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
					<div class="img circle-img" style="background-image: url('${image2}')"></div>
					</c:otherwise>
					</c:choose>
	  				<!-- 끝  -->
	  				<h3><c:out value="${list.name }"/></h3>
	  			</div>
	  		</div>
	        <ul class="list-unstyled components mb-5">
	          <li class="active">
	            <a href="/Book/myPage"><span class="fa fa-home mr-3"></span> Home</a>
	          </li>
	          <li>
	              <a href="#"><span class="fa fa-id-card mr-3"><small class="d-flex align-items-center justify-content-center"></small></span> Membership</a>
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
		  <h2 class="mb-4">My Page Update Form</h2>
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
					<c:otherwise>
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

          <form method="POST" action="/update" enctype="multipart/form-data">
          <input type="hidden" name="id" value="${list.id }">
          <div class="general">
            <h1>회원 정보 수정</h1><br>
            <div class="Input">
	          <input type="text" id="input" name="email" class="Input-text" placeholder="email" value="${list.email }">
        	</div>
            <div class="Input">
	          <input type="Number" id="input" name="birthyear" class="Input-text"
	          value="${list.birthyear }">
        	</div>
            <div class="Input">
	          <input type="text" id="input" name="birthday" class="Input-text" value="${list.birthday }">
        	</div>
            <div class="Input">
	          <input type="text" id="input" name="mobile" class="Input-text" value="${list.mobile }">
        	</div>
        	<input type="file" name="uploadFile">
        	<input type="submit" value="수정">
          </div>
          <!-- general end -->
          </form>
        </div>
      </div>
      
   </div>

    <script src="/resources/sidebar/js/popper.js"></script>
    <script src="/resources/sidebar/js/main.js"></script>
</div>
</body>
<%@include file="../Book/footer.jsp" %>
</html>