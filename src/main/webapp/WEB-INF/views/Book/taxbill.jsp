<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../Book/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AVOCADO</title>
	<link rel="shortcut icon" href="paypal.png">
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/taxbill.css" charset="utf-8">
</head>
<body>
<!-- ***** Main Banner Area Start ***** -->
   <div class="page-heading about-page-heading" id="top">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="inner-content">
                  <h2>구매 목록</h2>
                  <span>구매한 도서의 목록을 불러옵니다</span>
               </div>
            </div>
         </div>
      </div>
   </div>
<!-- ***** Main Banner Area End ***** -->


<div class="paypal">
      <div class="paypal__header">
        <div class="paypal__logo-wrapper">
          <img src="https://i.ibb.co/DrvmW5y/paypal.png" alt="Paypal" class="paypal__logo">
        </div>

        <div class="paypal__header-info">
          <span class="paypal__date">${date}</span>
        </div>
      </div>

      <div class="paypal__subheader-wrapper">
        <div class="paypal__subheader">
          <h1 class="paypal__username">${payuserId}님, 안녕하세요</h1>
          <span class="paypal__help-text">you've purchased three ${paycount} items in our store:</span>
        </div>
      </div>

      <div class="paypal__cart">
        <h2 class="paypal__cart-title">결제내역</h2>

        <ul class="paypal__cart-list">
    <c:forEach var="item" items="${paylist}" varStatus="status">
          <li class="paypal__cart-item">
            <span class="paypal__index">${status.count}</span>
            <span class="paypal__item-name">[${item.category}]</span>
            <span class="paypal__item-name">${item.bookName}</span>
            <span class="paypal__item-price">${item.price*item.amount}원</span>
          </li>
          </c:forEach>
          <li class="paypal__cart-item">
            <span class="paypal__cart-total">Total</span>
            <span class="paypal__item-price">${paytotalSum}원</span>
          </li>
          
        </ul>
      </div>

      <div class="paypal__footer">
        <img src="https://i.ibb.co/c8CQvBq/barcode.png" alt="Paypal Barcode" class="paypal__barcode">
      </div>
    </div>
    <span class="inspired-by">
      Inspired by <a href="https://dribbble.com/shots/2738907-PayPal-Email-Receipt">Vladyslav Tyzun / Awesomed</a>
    </span>
</body>
<%@include file="../Book/footer.jsp" %>
</html>