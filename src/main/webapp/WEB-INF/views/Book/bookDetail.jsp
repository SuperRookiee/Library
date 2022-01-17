<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	
</script>
</head>
<body>
	<table>
		<tr>
			<td>이름</td><td>${book.bookName}</td>
		</tr>
		<tr>
			<td>이미지</td><td><img alt="없음" src="${book.bookImageURL}"/></td>
		</tr>
		<tr>
			<td>카테고리</td><td>${book.category}</td>
		</tr>
		<tr>
			<td>작가 및 번역</td><td>${book.writer}</td>
		</tr>
		<tr>
			<td>출판사</td><td>${book.publisher}</td>
		</tr>
		<tr>
			<td>출판년도</td><td>${book.bookPublishYear}</td>
		</tr>
		<tr>
			<td>상세설명</td><td>${book.description}</td>
		</tr>
		<tr>
			<td>가격</td><td>${book.bookPrice}</td>
		</tr>
	</table>
	
	<input type="button" id="toCart" onclick="cart()" value="장바구니에 담기">
</body>
</html>