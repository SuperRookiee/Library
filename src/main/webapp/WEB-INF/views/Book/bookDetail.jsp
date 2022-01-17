<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../Book/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="EUC-KR">
<title>AVOCADO</title>
<style>
	#explore{
		padding: 50px 0px;
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
							<h2>"${param.bookName}"</h2>
							<span>상세 페이지 </span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ***** Main Banner Area End ***** -->

    <div class="about-us">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="left-image">
                        <img src="/resources/image/books.png" alt="">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="right-content">
                        <h4>${param.bookName}</h4>
                        <span>작가 : ----- </span>
                        <span>출판연도: ----- </span>
                        <div class="quote">
                            <i class="fa fa-quote-left"></i><p>책 내용 --------------------------------------------------------------</p>
                        </div>
						

                        <ul>
                        	<h5>가격: ₩ ??,???원 </h5>
                        	<%-- <p>가격: ₩<fmt:formatNumber value=" " pattern="#,###"/>원 </p> --%>
                        </ul>
                        <section class="section" id="explore">
	                        <div class="left-content">
		                     	<div class="main-border-button">
		                            <a href="#"> <i class="bi bi-bag-check"></i> 카트에 담기</a> <a href="#"> <i class="bi bi-credit-card"></i> 주문하기</a>
		                        </div>
		                    </div>
	                    </section>
                    </div>
                </div>
            </div>
            
            <br>
            <!-- ***** Services Area Starts ***** -->
		    <section class="our-services">
		        <div class="container">
		            <div class="row">
		                <div class="col-lg-12">
		                    <div class="section-heading">
		                        <h2>다른 도서 둘러보기</h2>
		                        <span>Details to details is what makes Hexashop different from the other themes.</span>
		                    </div>
		                </div>
		                <div class="col-lg-4">
		                    <div class="service-item">
		                        <h4>Title 1</h4>
		                        <p>Lorem ipsum dolor sit amet, consecteturti adipiscing elit, sed do eiusmod temp incididunt ut labore, et dolore quis ipsum suspend.</p>
		                        <img src="assets/images/service-01.jpg" alt="">
		                    </div>
		                </div>
		                <div class="col-lg-4">
		                    <div class="service-item">
		                        <h4>Title 2</h4>
		                        <p>Lorem ipsum dolor sit amet, consecteturti adipiscing elit, sed do eiusmod temp incididunt ut labore, et dolore quis ipsum suspend.</p>
		                        <img src="assets/images/service-02.jpg" alt="">
		                    </div>
		                </div>
		                <div class="col-lg-4">
		                    <div class="service-item">
		                        <h4>Title 3</h4>
		                        <p>Lorem ipsum dolor sit amet, consecteturti adipiscing elit, sed do eiusmod temp incididunt ut labore, et dolore quis ipsum suspend.</p>
		                        <img src="assets/images/service-03.jpg" alt="">
		                    </div>
		                </div>
		            </div>
		        </div>
		    </section>
		    <!-- ***** Services Area Ends ***** -->
		    
        </div>
    </div>
    
</div>
</body>
<%@include file="../Book/footer.jsp" %>
</html>