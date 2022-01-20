<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../Book/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="EUC-KR">
<title>AVOCADO</title>

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
		$(".toCart").on("click",function(e)
		{
			e.preventDefault();
			console.log('cartClick');
			var amount=$(".amount").val();
			actionForm.find("input[name='amount']").val(amount);
			actionForm.submit();
		})
	})
</script>

</head>

<script type="text/javascript">
	$(document).ready(function()
	{
		var actionForm=$("#actionForm");
		
		$(".detail").on("click",function(e)
		{
			e.preventDefault();
			console.log('detailClick');
			actionForm.find("input[name='isbn']").val($(this).attr("href"));
			if(actionForm.find("input[name='isbn']").val()=="")
			{
				alert("해당 책의 상세정보가 없습니다.");
				return;
			}	
			actionForm.submit();
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
							<h2><strong>"${param.key}"</strong> 에 대한 검색 결과입니다</h2>
							<span>일반 검색 - <b>${param.pageNum}</b> 페이지 </span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ***** Main Banner Area End ***** -->
		
		<div id="products">
			<div class="col-lg-12">
				<div class="pagination">
				    <ul>
				        <li class="active">
				            <a href="./bookList?key=${param.key}&pageNum=1">1</a>
				        </li>
				        <li >
				            <a href="./bookList?key=${param.key}&pageNum=2">2</a>
				        </li>
				        <li>
				            <a href="./bookList?key=${param.key}&pageNum=3">3</a>
				        </li>
				        <li>
				            <a href="./bookList?key=${param.key}&pageNum=4">4</a>
				        </li>
				        <li>
				            <a href="./bookList?key=${param.key}&pageNum=5">5</a>
				        </li>
				        <li>
				            <a href="#">></a>
				        </li>
				    </ul>
				</div>
			</div>
		</div>
		
		<c:forEach var="item" items="${list}">
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
		                    <h4><a class="detail" href="<c:out value='${item.bookIsbn}'/>">${item.bookName}</a></h4>
		                    <span class="price">${item.writer}</span>
		                    <span class="price">출판사 : ${item.publisher}	/	출판년도 : ${item.bookPublishYear}</span>
		                    
		                    <ul class="stars">
		                        <li>${item.category}</li>
		                    </ul>
		                    <span>${item.description}</span>
		                    <br>
		                    <div class="total">
		                        <h4>₩<fmt:formatNumber value="${item.bookPrice}" pattern="#,###"/>원</h4>
		                        <div class="main-border-button"><a class="toCart" href="${book.bookIsbn}">Add To Cart</a></div>
		                    </div>
		                </div>
		            </div>
		            </div>
		        </div>
		    </section>
		    <!-- ***** Product Area Ends ***** -->
		    <hr>
		</c:forEach>
		<form id="actionForm" action="/Book/bookDetail">
			<input type="hidden" name="isbn">
		</form>
		<div id="products">
			<div class="col-lg-12">
				<div class="pagination">
				    <ul>
				        <li class="active">
				            <a href="./bookList?key=${param.key}&pageNum=1">1</a>
				        </li>
				        <li >
				            <a href="./bookList?key=${param.key}&pageNum=2">2</a>
				        </li>
				        <li>
				            <a href="./bookList?key=${param.key}&pageNum=3">3</a>
				        </li>
				        <li>
				            <a href="./bookList?key=${param.key}&pageNum=4">4</a>
				        </li>
				        <li>
				            <a href="./bookList?key=${param.key}&pageNum=5">5</a>
				        </li>
				        <li>
				            <a href="#">></a>
				        </li>
				    </ul>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="../Book/footer.jsp" %>
</html>