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
			<td>�̸�</td><td>${book.bookName}</td>
		</tr>
		<tr>
			<td>�̹���</td><td><img alt="����" src="${book.bookImageURL}"/></td>
		</tr>
		<tr>
			<td>ī�װ�</td><td>${book.category}</td>
		</tr>
		<tr>
			<td>�۰� �� ����</td><td>${book.writer}</td>
		</tr>
		<tr>
			<td>���ǻ�</td><td>${book.publisher}</td>
		</tr>
		<tr>
			<td>���ǳ⵵</td><td>${book.bookPublishYear}</td>
		</tr>
		<tr>
			<td>�󼼼���</td><td>${book.description}</td>
		</tr>
		<tr>
			<td>����</td><td>${book.bookPrice}</td>
		</tr>
	</table>
	
	<input type="button" id="toCart" onclick="cart()" value="��ٱ��Ͽ� ���">
</body>
</html>