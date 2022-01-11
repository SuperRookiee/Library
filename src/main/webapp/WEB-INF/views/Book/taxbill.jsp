<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../Book/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AVOCADO Taxbill</title>
	<link rel="shortcut icon" href="paypal.png">
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/taxbill.css" charset="utf-8">
</head>
<body>
<div class="paypal">
      <div class="paypal__header">
        <div class="paypal__logo-wrapper">
          <img src="https://i.ibb.co/DrvmW5y/paypal.png" alt="Paypal" class="paypal__logo">
        </div>

        <div class="paypal__header-info">
          <span class="paypal__date">25.04.2016</span>
          <span class="paypal__ref">0f-113</span>
        </div>
      </div>

      <div class="paypal__subheader-wrapper">
        <div class="paypal__subheader">
          <h1 class="paypal__username">VladysLav, Hi</h1>
          <span class="paypal__help-text">you've purchased three (3) items in our store:</span>
        </div>
      </div>

      <div class="paypal__cart">
        <h2 class="paypal__cart-title">Cart:</h2>

        <ul class="paypal__cart-list">
          <li class="paypal__cart-item">
            <span class="paypal__index">1</span>
            <span class="paypal__item-name">t-Shirt Lacoste</span>
            <span class="paypal__item-price">$48.00</span>
          </li>

          <li class="paypal__cart-item">
            <span class="paypal__index">2</span>
            <span class="paypal__item-name">Snickers Nike</span>
            <span class="paypal__item-price">$125.00</span>
          </li>

          <li class="paypal__cart-item">
            <span class="paypal__index">3</span>
            <span class="paypal__item-name">All Stars</span>
            <span class="paypal__item-price">$95.00</span>
          </li>

          <li class="paypal__cart-item">
            <span class="paypal__cart-total">Total</span>
            <span class="paypal__item-price">$268.00</span>
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