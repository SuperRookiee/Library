<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@include file="Book/header.jsp" %> --%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="/resources/hexa/assets/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="/resources/hexa/assets/css/font-awesome.css">

    <link rel="stylesheet" href="/resources/hexa/assets/css/templatemo-hexashop.css">

    <link rel="stylesheet" href="/resources/hexa/assets/css/owl-carousel.css">

    <link rel="stylesheet" href="/resources/hexa/assets/css/lightbox.css">
<!--

TemplateMo 571 Hexashop

https://templatemo.com/tm-571-hexashop

-->
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

    <!-- ***** Main Banner Area Start ***** -->
    <div class="page-heading about-page-heading" id="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="inner-content">
                        <h2>Login</h2>
                        <span>Awesome, clean &amp; creative HTML5 Template</span>
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
                <div class="col-lg-4">
                </div>
                <c:choose>
				<c:when test="${sessionId != null}">
                <div class="col-lg-6">
                    <div class="section-heading">
                        <h2>'${sessionId}' 님 환영합니다!</h2>
                        <a href="logout">Logout</a>
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
				</form>
				<br>
				<div id="naver_id_login" style="text-align: center">
					<a href="${url}"> <img width="223"
						src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
				</div>
				</c:otherwise>
				</c:choose>
            </div>
        </div>
    </div>
    <!-- ***** Contact Area Ends ***** -->
    

    <!-- jQuery -->
    <script src="/resources/hexa/assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="/resources/hexa/assets/js/popper.js"></script>
    <script src="/resources/hexa/assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="/resources/hexa/assets/js/owl-carousel.js"></script>
    <script src="/resources/hexa/assets/js/accordions.js"></script>
    <script src="/resources/hexa/assets/js/datepicker.js"></script>
    <script src="/resources/hexa/assets/js/scrollreveal.min.js"></script>
    <script src="/resources/hexa/assets/js/waypoints.min.js"></script>
    <script src="/resources/hexa/assets/js/jquery.counterup.min.js"></script>
    <script src="/resources/hexa/assets/js/imgfix.min.js"></script> 
    <script src="/resources/hexa/assets/js/slick.js"></script> 
    <script src="/resources/hexa/assets/js/lightbox.js"></script> 
    <script src="/resources/hexa/assets/js/isotope.js"></script> 
    
    <!-- Global Init -->
    <script src="/resources/hexa/assets/js/custom.js"></script>

    <script>

        $(function() {
            var selectedClass = "";
            $("p").click(function(){
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("."+selectedClass).fadeOut();
            setTimeout(function() {
              $("."+selectedClass).fadeIn();
              $("#portfolio").fadeTo(50, 1);
            }, 500);
                
            });
        });

    </script>

  </body>
<%@include file="Book/footer.jsp" %>
</html>
