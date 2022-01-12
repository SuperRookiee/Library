<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="EUC-KR">
<title>bookList</title>
</head>

<script type="text/javascript">
	$(document).ready(function()
	{
		var actionForm=$("#actionForm");
		
		$(".detail").on("click",function(e)
		{
			e.preventDefault();
			console.log('detailClick');
			actionForm.append("<input type='hidden' name=''")
		})
	})

</script>
<body>
	
		<table>
		<tr>
			<th>이름</th><th>내용</th><th>가격</th><th>이미지</th>
		</tr>
		<c:forEach var="item" items="${list}">
		<tr>
			
			<td><a class="detail" href="Book/bookDetail?isbn=<c:out value='${item.bookIsbn}'/>" onclick="nameClick()">${item.bookName}</a></td>
			<td>
				${item.description}<br>
				${item.writer}<br>
				출판사 : ${item.publisher}<br>
				카테고리 : ${item.category} 출판년도 : ${item.bookPublishYear}
			</td>
			<td>${item.bookPrice}</td>
			<td><img alt="없음" src="${item.bookImageURL}"></td>
		</tr>
		</c:forEach>
		</table>
		<form id="actionForm" action="Book/bookList" method="get">
			
		</form>
</body>
</html>