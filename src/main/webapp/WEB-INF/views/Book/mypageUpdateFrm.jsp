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

/* html {
  font-size: 10px;
}
 */
/* body {
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  width: 100vw;
  height: 100vh;
  color: #455A64;
  background-color: #7E57C2;
  font-family: var(--fontFamily);
  font-size: var(--fontSizeMd);
  line-height: var(--lineHeightMd);
} */

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
					<div class="img" style="background-image: url('${list.profile_image}')"></div>
	  				<h3><c:out value="${list.name }"/></h3>
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
	            <a href="javascript:;" onclick="myFunction()"><span class="fa fa-cog mr-3"></span>Dark Mode</a>
	          </li>
	          <li>
	            <a href="#"><span class="fa fa-support mr-3"></span> 회원 정보 수정</a>
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
					<div class="img circle-img" style="background-image: url('${list.profile_image}')"></div>
					</c:when>
					<c:otherwise>
					<svg width="110" height="110" viewBox="0 0 250 250" xmlns="http://www.w3.org/2000/svg" role="img" aria-labelledby="title desc" class="center">
                <title id="title">Teacher</title>
                <desc id="desc">Cartoon of a Caucasian woman smiling, and wearing black glasses and a purple shirt with white collar drawn by Alvaro Montoro.</desc>
                <defs>
                  <clipPath id="scene">
                    <circle cx="125" cy="125" r="115"/>
                  </clipPath>
                  <clipPath id="lips">
                    <path d="M 106,132 C 113,127 125,128 125,132 125,128 137,127 144,132 141,142  134,146  125,146  116,146 109,142 106,132 Z" />
                  </clipPath>
                </defs>
                <circle cx="125" cy="125" r="120" fill="rgba(0,0,0,0.15)" />
                <g stroke="none" stroke-width="0" clip-path="url(#scene)">
                  <rect x="0" y="0" width="250" height="250" fill="#b0d2e5" />
                  <g id="head">
                    <path fill="none" stroke="#111111" stroke-width="2" d="M 68,103 83,103.5" />
                    <path class="hair" d="M 67,90 67,169 78,164 89,169 100,164 112,169 125,164 138,169 150,164 161,169 172,164 183,169 183,90 Z" />
                    <circle cx="125" cy="100" r="55" class="skin" />
                    <ellipse cx="102" cy="107" rx="5" ry="5" class="eyes" id="eye-left" />
                    <ellipse cx="148" cy="107" rx="5" ry="5" class="eyes" id="eye-right" />
                    <rect x="119" y="140" width="12" height="40" class="skin" />
                    <path class="line eyebrow" d="M 90,98 C 93,90 103,89 110,94" id="eyebrow-left" />
                    <path class="line eyebrow" d="M 160,98 C 157,90 147,89 140,94" id="eyebrow-right"/>
                    <path stroke="#111111" stroke-width="4" d="M 68,103 83,102.5" />
                    <path stroke="#111111" stroke-width="4" d="M 182,103 167,102.5" />
                    <path stroke="#050505" stroke-width="3" fill="none" d="M 119,102 C 123,99 127,99 131,102" />
                    <path fill="#050505" d="M 92,97 C 85,97 79,98 80,101 81,104 84,104 85,102" />
                    <path fill="#050505" d="M 158,97 C 165,97 171,98 170,101 169,104 166,104 165,102" />
                    <path stroke="#050505" stroke-width="3" fill="rgba(240,240,255,0.4)" d="M 119,102 C 118,111 115,119 98,117 85,115 84,108 84,104 84,97 94,96 105,97 112,98 117,98 119,102 Z" />
                    <path stroke="#050505" stroke-width="3" fill="rgba(240,240,255,0.4)" d="M 131,102 C 132,111 135,119 152,117 165,115 166,108 166,104 166,97 156,96 145,97 138,98 133,98 131,102 Z" />
                    <path class="hair" d="M 60,109 C 59,39 118,40 129,40 139,40 187,43 189,99 135,98 115,67 115,67 115,67 108,90 80,109 86,101 91,92 92,87 85,99 65,108 60,109" />
                    <path id="mouth" fill="#d73e3e" d="M 106,132 C 113,127 125,128 125,132 125,128 137,127 144,132 141,142  134,146  125,146  116,146 109,142 106,132 Z" /> 
                    <path id="smile" fill="white" d="M125,141 C 140,141 143,132 143,132 143,132 125,133 125,133 125,133 106.5,132 106.5,132 106.5,132 110,141 125,141 Z" clip-path="url(#lips)" />
                  </g>
                  <g id="shirt">
                    <path fill="#8665c2" d="M 132,170 C 146,170 154,200 154,200 154,200 158,250 158,250 158,250 92,250 92,250 92,250 96,200 96,200 96,200 104,170 118,170 118,170 125,172 125,172 125,172 132,170 132,170 Z"/>
                    <path id="arm-left" class="arm" stroke="#8665c2" fill="none" stroke-width="14" d="M 118,178 C 94,179 66,220 65,254" />
                    <path id="arm-right" class="arm" stroke="#8665c2" fill="none" stroke-width="14" d="M 132,178 C 156,179 184,220 185,254" />
                    <path fill="white" d="M 117,166 C 117,166 125,172 125,172 125,182 115,182 109,170 Z" />
                    <path fill="white" d="M 133,166 C 133,166 125,172 125,172 125,182 135,182 141,170 Z" />
                    <circle cx="125" cy="188" r="4" fill="#5a487b" />
                    <circle cx="125" cy="202" r="4" fill="#5a487b" />
                    <circle cx="125" cy="216" r="4" fill="#5a487b" />
                    <circle cx="125" cy="230" r="4" fill="#5a487b" />
                    <circle cx="125" cy="244" r="4" fill="#5a487b" />
                    <path stroke="#daa37f" stroke-width="1" class="skin hand" id="hand-left" d="M 51,270 C 46,263 60,243 63,246 65,247 66,248 61,255 72,243 76,238 79,240 82,243 72,254 69,257 72,254 82,241 86,244 89,247 75,261 73,263 77,258 84,251 86,253 89,256 70,287 59,278" /> 
                    <path stroke="#daa37f" stroke-width="1" class="skin hand" id="hand-right" d="M 199,270 C 204,263 190,243 187,246 185,247 184,248 189,255 178,243 174,238 171,240 168,243 178,254 181,257 178,254 168,241 164,244 161,247 175,261 177,263 173,258 166,251 164,253 161,256 180,287 191,278"/> 
                  </g>
                </g>
              </svg>
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
          <form method="POST" action="/update">
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
        	<!-- <input type="file" name="profile_image"> -->
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