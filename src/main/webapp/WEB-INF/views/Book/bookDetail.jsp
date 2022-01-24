<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../Book/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>AVOCADO</title>
<link rel="stylesheet" href="/resources/css/bookDetail.css?after">
</head>
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

<body>
<div id="main">
		<!-- ***** Main Banner Area Start ***** -->
		<div class="page-heading about-page-heading" id="top">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="inner-content">
							<h2 class="bookName">"${book.bookName}"</h2>
							<span>상세 페이지 </span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ***** Main Banner Area End ***** -->

    <div class="about-us">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="left-image">
                        <img class="bookImageURL" src="${book.bookImageURL}" onerror="this.src='/resources/image/books.png';">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="right-content">
                        <h4>${book.bookName}</h4>
                        <span>작가 : ${book.writer} </span>
                        <span>출판연도: ${book.bookPublishYear} </span>
                        <div class="quote">
                            <i class="fa fa-quote-left"></i><p>${book.description}</p>
                        </div>
						

                        <ul>
                        	<h5>가격: ₩<fmt:formatNumber value="${book.bookPrice}" pattern="#,###"/>원</h5>
                        </ul>
                        <section class="section" id="explore">
	                        <div class="left-content">
		                     	<div class="main-border-button">
									수량 : <input class="amount" type="number" min="1" max="5" name="amount" value = "1">
		                            <a class="toCart" href="${book.bookIsbn}"> <i class="bi bi-bag-check"></i> 카트에 담기</a>
		                        </div>
		                    </div>
	                    </section>
                    </div>
                </div>
            </div>
            <br>
            
            <!-- reply Area Starts -->
            <div class="container mt-5 mb-5">
		        <div class="col-md-13">
		            <div class="card">
		                <div class="p-3">
		                    <h6>Comments</h6>
		                </div>
		                <c:choose>
	                        <c:when test="${not empty result.name}">
	                        	<div class="mt-3 d-flex flex-row align-items-center p-3 form-color">
	                        	<c:choose>
	                        	<c:when test='${not empty list}'>
	                        		<img src="/display?fileName=${list}" width="50" class="rounded-circle mr-2">
	                        	</c:when>
	                        	<c:otherwise>
				                	<img src="${result.profile_image}" width="50" class="rounded-circle mr-2">
				                </c:otherwise>
	                        	</c:choose>

				                <form id="frm" action="/comment/register" method = "post">
				                	<input type="text" name="content" class="form-control" placeholder="댓글을 입력하세요...">
				                	<input type="hidden" name="pic" value="${book.bookImageURL}">
				                	<c:choose>
	                        			<c:when test='${not empty list}'>
	                        				<input type="hidden" name="img_Url" value="/display?fileName=${list}">
	                        			</c:when>
	                        			<c:otherwise>
	                        				<input type="hidden" name="img_Url" value="${result.profile_image}">
				                		</c:otherwise>
	                        		</c:choose>
				                	<input type="hidden" name="name" value="${result.name}">
			    					<input type="hidden" name="isbn" value="${book.bookIsbn}">
				                	<input type="submit" class="btn btn-outline-primary" value="send" id="sendButton">
				                </form>
				                </div>
			                </c:when>
			            </c:choose>
						<div class="panel-body">
							<ul class="media-list">
							   <c:forEach var="item" items="${commentList}">
		                        	<li class="media">
		                            	<a href="#" class="pull-left">
		                                	<img src="${item.img_Url}" alt="" class="img-circle">
		                            	</a>
		                            	<div class="media-body">
		                                	<span class="text-muted pull-right">
		                                   		<small class="text-muted">${item.regdate}</small>
		                                	</span>
		                                	<strong class="text-info">${item.name}</strong>
		                                	<p id="content">
		                                    	${item.content}
		                                	</p>
		                                	<div class="pull-right">
												<c:choose>
													<c:when test="${item.name eq result.name}">
														<form action="/comment/remove">
															<input type="hidden" value="${item.rno }" name="rno" /> 
															<input type="hidden" value="${item.isbn }" name="isbn" /> 
															<input type="submit" value="remove" class="btn btn-outline-danger"/>
														</form>
													</c:when>
												</c:choose>
											</div>
		                            	</div>
		                        	</li>
		                       </c:forEach>
		                    </ul>
	                 	</div>
		            </div>	
			    </div>
			</div>
            <!-- reply Area Ends -->
            
<!-- ***** Another Book Area Starts ***** -->
		    <section class="our-services">
		        <div class="container">
		            <div class="row">
		                <div class="col-lg-12">
		                    <div class="section-heading">
		                        <h2>다른 도서 둘러보기</h2>
		                        <span>또 다른 책도 함께 읽어보세요</span>
		                    </div>
		                </div>
		                <div class="col-lg-4">
		                    <div class="service-item">
		                        <h4><a href="/Book/bookDetail?isbn=9788983928078">해리포터 : 죽음의 성물</a></h4>
								<p>1997년 영국에서 출간된 이래 [해리 포터] 시리즈는 지금까지 200개국 이상 80개의 언어로 번역되고 출간되어 5억 부 이상을 판매했다. 20주년을 맞아 새롭게 출간한 [해리 포터] 시리즈는 '21세기 고전'이라 불릴 만한 품격에 맞춰 작품의 완성도를 높였다.</p>
		                        <img id="s_img" src="/resources/image/sample1.jpg" alt="">
		                    </div>
		                </div>
		                <div class="col-lg-4">
		                    <div class="service-item">
		                    	<h4><a href="/Book/bookDetail?isbn=9788925556789">마션 :어느 괴짜 과학자의 화성판 어드벤처 생존기</a></h4>
		                        <p>화성에서 조난당한 한 남자에 대한 이야기. 컴퓨터 프로그래머 출신인 작가 앤디 위어가 2009년 취미 삼아 개인 블로그에 연재를 시작했던 [마션]은 독자들의 요청으로 2011년 아마존 킨들 버전으로 출판되었다.</p>
		                        <img id="s_img" src="/resources/image/sample2.jpg" alt="">
		                    </div>
		                </div>
		                <div class="col-lg-4">
		                    <div class="service-item">
		                    	<h4><a href="/Book/bookDetail?isbn=9791189184018">(코드로 배우는) 스프링 웹 프로젝트</a></h4>
								<p>Spring Framework를 사용해서 ‘웹 프로젝트’를 어떻게 진행하는지를 설명한다. 좀 더 구체적으로는 스프링으로 웹 프로젝트에서 사용되는 게시물 관리를 만들어 보는 것이 주된 목적이다.<p>
			                    <img id="s_img" src="/resources/image/sample3.jpg" alt="">
		                    </div>
		                </div>
		            </div>
		        </div>
		    </section>
		    <!-- ***** Another Book Area Ends ***** -->
		    <form id="actionForm" action="../cart/register" method="post">
	    		<input type="hidden" name="userId" value="${result.name}">
	    		<input type="hidden" name="bookName" value="${book.bookName}">
				<input type="hidden" name="category" value="${book.category}">
				<input type="hidden" name="imgUrl" value="${book.bookImageURL}">
				<input type="hidden" name="bookIsbn" value="${book.bookIsbn}">
				<input type="hidden" name="price" value="${book.bookPrice}">
				<input type="hidden" name="amount">
    		</form>
        </div>
    </div>
</div>
</body>
<%@include file="../Book/footer.jsp" %>
</html>