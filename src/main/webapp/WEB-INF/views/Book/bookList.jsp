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
		
<<<<<<< HEAD
		
=======
>>>>>>> c340c869b3307af1f1ed4ed574a5222d1f310d8f
		$(".detail").on("click",function(e)
		{
			e.preventDefault();
			console.log('detailClick');
<<<<<<< HEAD
			actionForm.find("input[name='bookIsbn']").val($(this).attr("href"));
			if(!actionForm.find("input[name='bookIsbn']").val())
			{
				alert('�ش� å�� �󼼳����� ã�� �� �����ϴ�.')
				return false;
			}
			actionForm.submit();
=======
			actionForm.append("<input type='hidden' name=''")
>>>>>>> c340c869b3307af1f1ed4ed574a5222d1f310d8f
		})
	})

</script>
<body>
	
		<table>
		<tr>
			<th>�̸�</th><th>����</th><th>����</th><th>�̹���</th>
		</tr>
		<c:forEach var="item" items="${list}">
		<tr>

			<td><a class="detail" href="<c:out value='${item.bookIsbn}'/>" onclick="nameClick()">${item.bookName}</a></td>
			<td>
				${item.description}<br>
				${item.writer}<br>
				���ǻ� : ${item.publisher}<br>
				ī�װ� : ${item.category} ���ǳ⵵ : ${item.bookPublishYear}
			</td>
			<td>${item.bookPrice}</td>
			<td><img alt="����" src="${item.bookImageURL}"></td>
		</tr>
		</c:forEach>
		</table>
		<form id="actionForm" action="Book/bookDetail" method="get">
			<input type='hidden' name='bookIsbn'/>
		</form>
</body>
</html>