<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../Book/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Document</title>
<link href="/resources/css/cart.css" rel="stylesheet" type="text/css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" rel="stylesheet" type="text/css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet" type="text/css">
</head>
<body>
	<!--  Main Banner Area Start  -->
    <div class="page-heading about-page-heading" id="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="inner-content">
                        <h2>Cart</h2>
                        <span>담아 둔 책을 볼 수 있습니다</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--  Main Banner Area End  -->

	<div id="main">
		<div class="card">
			<div class="row">
				<div class="col-md-8 cart">
					<div class="title">
						<div class="row">
							<div class="col">
								<h4>
									<b>Shopping Cart</b>
								</h4>
							</div>

							<!-- 전체수량 -->
							<div class="col align-self-center text-right text-muted">ITEMS : ${count}</div>
							<!-- getTotalCount -->
						</div>
					</div>
					<!-- 담긴품목 반복문 -->
		
					<c:forEach var="item" items="${list}" varStatus="status">
						<div class="row border-top border-bottom">
							<div class="row main align-items-center">
								<!-- 도서사진 -->
								<div class="col-2">
									<img class="img-fluid" src="${item.imgUrl}">
								</div>
								<!-- 카테고리 -->
								<div class="col">
									<div class="row text-muted">${item.category}</div>
									<div class="row">${item.bookName }</div>
								</div>
								<!-- 수량 -->
								<div class="col">
									<form action="/cart/modify">
										<input type="Number" min ="1" max ="5" name = "amount" value="${item.amount}">
										<input type="hidden" name = "userId" value="${item.userId}">
										<input type="hidden" name = "bookName" value="${item.bookName}">
										<input type="submit" value= "변경" class="btn btn-lg btn-default">
									</form>
								</div>
								<!-- 가격 -->
								<div class="col">
									${item.price*item.amount}원<span class="close"></span>
								</div>
								<div>
								</div>
								<div>
									<a href="<c:url value='/cart/remove?userId=${item.userId}&bookName=${item.bookName}' />" class="btn btn-lg btn-danger">삭제</a>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="back-to-shop">
						<a href="/Book/detail">&leftarrow;</a><span class="text-muted">마이페이지로 돌아가기</span>
					</div>
				</div>
				<div class="col-md-4 summary">
					<div>
						<h5>
							<b>Summary</b>
						</h5>
					</div>
					<hr>
					<div class="row">
						<div class="col" style="padding-left: 0;">ITEMS : ${count}</div>
						<!-- getTotalCount -->
						<div class="col text-right"></div>
					</div>
					<form>
						<p>할인쿠폰</p>
						<select>
							<option class="text-muted">신규가입 쿠폰 - 5000원 할인쿠폰</option>
							<option class="text-muted">첫 결제 쿠폰 - 5000원 할인쿠폰</option>
							<!-- totalPrice -->
						</select>
						<p>배달 주소</p>
						<input id="code" placeholder="Enter your Address">
					</form>
					<div class="row" style="border-top: 1px solid rgba(0, 0, 0, .1); padding: 2vh 0;">
						<div class="col">결제 총 금액</div>
						<div class="col text-right">${totalSum-5000}원</div>
						<!-- totalPrice -->
					</div>
					<button class="btn"><a href="<c:url value='/cart/pay?userId=${userId}'/>">결제하기</a></button>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="../Book/footer.jsp"%>
</html>