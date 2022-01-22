<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../Book/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AVOCADO</title>
</head>
<body>

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


<div id="main">
	<!-- ***** Main Banner Area Start ***** -->
	<div class="page-heading about-page-heading" id="top">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="inner-content">
						<h2>${sort}별 추천도서</h2>
						<span>${sort}별로 정렬된 도서 목록입니다</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Main Banner Area End ***** -->
	<c:set var="i" value="0"/>
	<c:forEach var="item" items="${bookList}">
	
	<section class="section" id="products">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h2>${select.get(i)}의 인기도서</h2>
                        <span>추천 도서를 확인해보세요.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
        	<div class="row">
		<c:forEach var="book" items="${item}">
			<div class="col-lg-4">
            	<div class="item">
                	<div class="thumb">
                    	<div class="hover-content">
                        	<ul>
                            	<li><a href="single-product.html"><i class="fa fa-eye"></i></a></li>
                                <li><a href="single-product.html"><i class="fa fa-star"></i></a></li>
                                <li><a href="single-product.html"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <img src="${book.bookImageURL}" alt="">
                    </div>
                    <div class="down-content">
                        <h4><a class="detail" href="<c:out value='${book.bookIsbn}'/>">${book.bookName}</a></h4>
                        <span>₩<fmt:formatNumber value="${book.bookPrice}" pattern="#,###"/>원</span>
                    </div>
                </div>
            </div>
		</c:forEach>
			</div>
		</div>
	</section>
	<c:set var="i" value="${i+1}"/>
	</c:forEach>
    <form id="actionForm" action="/Book/bookDetail">
		<input type="hidden" name="isbn">
	</form>
</div>
</body>
<%@include file="../Book/footer.jsp" %>
</html>