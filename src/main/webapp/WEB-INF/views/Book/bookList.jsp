<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../Book/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="EUC-KR">
<title>AVOCADO</title>
</head>

<style>
	#IMG{
		width: 210px;
		height: 297px;
		border: 0.5px solid gray;
	}
</style>

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
	<div id="main">
		<!-- ***** Main Banner Area Start ***** -->
		<div class="page-heading about-page-heading" id="top">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="inner-content">
							<h2>"${param.key}" 에 대한 검색 결과입니다</h2>
							<span>일반 검색</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ***** Main Banner Area End ***** -->
		
		
		<c:forEach var="item" items="${list}">
			<hr>
			<!-- ***** Product Area Starts ***** -->
		    <section class="section" id="product">
		        <div class="container">
		            <div class="row">
		                <div class="col-lg-4">
		                <div class="left-images">
		                    <img id="IMG" src="${item.bookImageURL}" onerror="this.src='/resources/image/books.png';"/>
		                </div>
		            </div>
		            <div class="col-lg-8">
		                <div class="right-content">
		                    <h4><a class="detail" href="Book/bookDetail?isbn=<c:out value='${item.bookIsbn}'/>" onclick="nameClick()">${item.bookName}</a> </h4>
		                    <span class="price">${item.writer}</span>
		                    <span class="price">출판년도 : ${item.bookPublishYear}</span>
		                    
		                    <ul class="stars">
		                        ${item.category}
		                    </ul>
		                    <span>${item.description}</span>
		                    <br>
		                    <div class="total">
		                        <h4>₩<fmt:formatNumber value="${item.bookPrice}" pattern="#,###"/>원</h4>
		                        <div class="main-border-button"><a href="#">Add To Cart</a></div>
		                    </div>
		                </div>
		            </div>
		            </div>
		        </div>
		    </section>
		    <!-- ***** Product Area Ends ***** -->
		</c:forEach>
		
	</div>
</body>
<%@include file="../Book/footer.jsp" %>
</html>