<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
							<div class="col align-self-center text-right text-muted">3 items</div><!-- getTotalCount -->
						</div>
					</div>
					<!-- 담긴품목 반복문 -->
					<c:forEach var="item" items="${list}" varStatus="status">
						<div class="row border-top border-bottom">
							<div class="row main align-items-center">
								<!-- 도서사진 -->
								<div class="col-2">
									<img class="img-fluid" src="https://i.imgur.com/1GrakTl.jpg">
								</div>
								<!-- 카테고리 -->
								<div class="col">
									<div class="row text-muted">${item.purchaseDate }</div>
									<div class="row">${item.bookName }</div>
								</div>
								<!-- 수량 -->
								<div class="col">
									<a href="#">-</a><a href="#" class="border">${item.amount }</a><a href="#">+</a>
								</div>
								<!-- 가격 -->
								<div class="col">
									${item.price } <span class="close"></span>
								</div>
							</div>
						</div>
					</c:forEach>

					<div class="back-to-shop">
						<a href="/Book/detail.jsp">&leftarrow;</a><span class="text-muted">Back to shop</span>
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
						<div class="col" style="padding-left: 0;">ITEMS 3</div> <!-- getTotalCount -->
						<div class="col text-right">&euro; 132.00</div>
					</div>
					<form>
						<p>SHIPPING</p>
						<select>
							<option class="text-muted">Standard-Delivery- &euro;5.00</option> <!-- totalPrice -->
						</select>
						<p>GIVE CODE</p>
						<input id="code" placeholder="Enter your code">
					</form>
					<div class="row" style="border-top: 1px solid rgba(0, 0, 0, .1); padding: 2vh 0;">
						<div class="col">TOTAL PRICE</div>
						<div class="col text-right">&euro; 137.00</div><!-- totalPrice -->
					</div>
					<button class="btn">CHECKOUT</button>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="../Book/footer.jsp"%>
</html>