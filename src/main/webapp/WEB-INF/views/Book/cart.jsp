<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../Book/header.jsp" %>
<!DOCTYPE html>
<<<<<<< HEAD
<html>
<head>
<meta charset="UTF-8">
<title>AVOCADO Cart</title>
	<link rel="stylesheet" href="/resources/css/cart.css">
</head>
<body>
	<div class="card">
    <div class="row">
        <div class="col-md-8 cart">
            <div class="title">
                <div class="row">
                    <div class="col">
                        <h4><b>Shopping Cart</b></h4>
                    </div>
                    <div class="col align-self-center text-right text-muted">3 items</div>
                </div>
            </div>
            <div class="row border-top border-bottom">
                <div class="row main align-items-center">
                    <div class="col-2"><img class="img-fluid" src="https://i.imgur.com/1GrakTl.jpg"></div>
                    <div class="col">
                        <div class="row text-muted">Shirt</div>
                        <div class="row">Cotton T-shirt</div>
                    </div>
                    <div class="col"> <a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a> </div>
                    <div class="col">&euro; 44.00 <span class="close">&#10005;</span></div>
                </div>
            </div>
            <div class="row">
                <div class="row main align-items-center">
                    <div class="col-2"><img class="img-fluid" src="https://i.imgur.com/ba3tvGm.jpg"></div>
                    <div class="col">
                        <div class="row text-muted">Shirt</div>
                        <div class="row">Cotton T-shirt</div>
                    </div>
                    <div class="col"> <a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a> </div>
                    <div class="col">&euro; 44.00 <span class="close">&#10005;</span></div>
                </div>
            </div>
            <div class="row border-top border-bottom">
                <div class="row main align-items-center">
                    <div class="col-2"><img class="img-fluid" src="https://i.imgur.com/pHQ3xT3.jpg"></div>
                    <div class="col">
                        <div class="row text-muted">Shirt</div>
                        <div class="row">Cotton T-shirt</div>
                    </div>
                    <div class="col"> <a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a> </div>
                    <div class="col">&euro; 44.00 <span class="close">&#10005;</span></div>
                </div>
            </div>
            <div class="back-to-shop"><a href="#">&leftarrow;</a><span class="text-muted">Back to shop</span></div>
        </div>
        <div class="col-md-4 summary">
            <div>
                <h5><b>Summary</b></h5>
            </div>
            <hr>
            <div class="row">
                <div class="col" style="padding-left:0;">ITEMS 3</div>
                <div class="col text-right">&euro; 132.00</div>
            </div>
            <form>
                <p>SHIPPING</p> <select>
                    <option class="text-muted">Standard-Delivery- &euro;5.00</option>
                </select>
                <p>GIVE CODE</p> <input id="code" placeholder="Enter your code">
            </form>
            <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                <div class="col">TOTAL PRICE</div>
                <div class="col text-right">&euro; 137.00</div>
            </div> <button class="btn">CHECKOUT</button>
        </div>
    </div>
  </div>
=======
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
						<div class="col align-self-center text-right text-muted">3 items</div>
					</div>
				</div>
				<div class="row border-top border-bottom">
					<div class="row main align-items-center">
						<div class="col-2">
							<img class="img-fluid" src="https://i.imgur.com/1GrakTl.jpg">
						</div>
						<div class="col">
							<div class="row text-muted">Shirt</div>
							<div class="row">Cotton T-shirt</div>
						</div>
						<div class="col">
							<a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a>
						</div>
						<div class="col">
							&euro; 44.00 <span class="close">&#10005;</span>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="row main align-items-center">
						<div class="col-2">
							<img class="img-fluid" src="https://i.imgur.com/ba3tvGm.jpg">
						</div>
						<div class="col">
							<div class="row text-muted">Shirt</div>
							<div class="row">Cotton T-shirt</div>
						</div>
						<div class="col">
							<a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a>
						</div>
						<div class="col">
							&euro; 44.00 <span class="close">&#10005;</span>
						</div>
					</div>
				</div>
				<div class="row border-top border-bottom">
					<div class="row main align-items-center">
						<div class="col-2">
							<img class="img-fluid" src="https://i.imgur.com/pHQ3xT3.jpg">
						</div>
						<div class="col">
							<div class="row text-muted">Shirt</div>
							<div class="row">Cotton T-shirt</div>
						</div>
						<div class="col">
							<a href="#">-</a><a href="#" class="border">1</a><a href="#">+</a>
						</div>
						<div class="col">
							&euro; 44.00 <span class="close">&#10005;</span>
						</div>
					</div>
				</div>
				<div class="back-to-shop">
					<a href="#">&leftarrow;</a><span class="text-muted">Back to shop</span>
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
					<div class="col" style="padding-left: 0;">ITEMS 3</div>
					<div class="col text-right">&euro; 132.00</div>
				</div>
				<form>
					<p>SHIPPING</p>
					<select>
						<option class="text-muted">Standard-Delivery- &euro;5.00</option>
					</select>
					<p>GIVE CODE</p>
					<input id="code" placeholder="Enter your code">
				</form>
				<div class="row" style="border-top: 1px solid rgba(0, 0, 0, .1); padding: 2vh 0;">
					<div class="col">TOTAL PRICE</div>
					<div class="col text-right">&euro; 137.00</div>
				</div>
				<button class="btn">CHECKOUT</button>
			</div>
		</div>
	</div>
</div>
>>>>>>> 56e4316a6fa6cce627d3e1fe3ce40a4eb3d9846e
</body>
<%@include file="../Book/footer.jsp" %>
</html>