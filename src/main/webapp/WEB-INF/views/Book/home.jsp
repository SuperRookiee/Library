<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../Book/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AVOCADO</title>

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

<c:set var="list" value="${bestlist}"/>

<style>
	#rc_img{
		padding: 2px;
		height: 27vh;
	}
</style>


</head>


<body>
 	<!-- ***** Main Banner Area Start ***** -->
    <div class="main-banner" id="top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6">
                    <div class="left-content">
                        <div class="thumb">
                            <div class="inner-content">
                                <h4> &quot;베스트 셀러&quot; <br></h4>
                                <span style="font-size: 1.5em; background-color: rgba(0,0,0,0.7);"><c:out value="${list[0].bookName}"/></span>

                                <span>많은 사람들이 선택한 책을 읽어보세요</span>
                                <span>수 많은 선택을 받은 책에는 이유가 있습니다</span>
                                <div class="main-border-button">
                                    <a href="/Book/bookDetail?isbn=<c:out value='${list[0].bookIsbn}'/>">Purchase Now!</a>
                                </div>
                            </div>
                            <img src="/resources/image/bookstore.jpg" alt="" height="794px">
                        </div>
                    </div>
                </div>
                
                <c:set var="list" value="${bestlist}"/>
                <div class="col-lg-6">
                    <div class="right-content">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="right-first-image">
                                    <div class="thumb">
                                        <div class="inner-content">
                                            <h4>Our Team</h4>
                                            <span>AVOCADO서점에 오신 것을 환영합니다</span>
                                        </div>
                                        <div class="hover-content">
                                            <div class="inner">
                                                <h4><c:out value="Team AVOCADO"/></h4>
                                                <p>저희 페이지를 소개합니다.</p>
                                                <<div class="main-border-button">
                                                	<div class="scroll-to-section">
                                                		<a href="#explore">더 알아보기</a>
                                                	</div>

                                                </div>
                                            </div>
                                        </div>
                                        <img src="/resources/image/avocado.jpg" height="382.06px">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="right-first-image">
                                    <div class="thumb">
                                        <div class="inner-content">
                                            <h4>20대 추천도서</h4>
                                            <span style="background-color: rgba(0,0,0,0.7)">어떤 책을 가장 많이 읽었는지 확인해보세요</span>
                                        </div>
                                        <div class="hover-content">
                                            <div class="inner">
                                                <h4>20대 추천도서</h4>
                                                <p>20대만의 베스트셀러들을 만나보세요</p>
                                                <div class="main-border-button">
                                                    <a href="/Book/findBook">연령별 추천 보러가기</a>
                                                </div>
                                            </div>
                                        </div>
                                        <img src="/resources/image/osusume.jpg" height="382px">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="right-first-image">
                                    <div class="thumb">
                                        <div class="inner-content">
                                            <h4>최근 리뷰</h4>
                                            <span>Recent Reviews</span>
                                        </div>
                                        <div class="hover-content">
                                            <div class="inner">
                                                <h4>--Review--</h4>
                                                <p>Lorem ipsum dolor sit amet, conservisii ctetur adipiscing elit incid.</p>
                                                <div class="main-border-button">
                                                	<div class="scroll-to-section">
                                                		<a href="#social">Show More</a>
                                                	</div>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                        <img src="/resources/image/review.jpg" height="382.06px">
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="right-first-image">
                                    <div class="thumb">
                                        <div class="inner-content">
                                            <h4 style="color: black">OO Membership</h4>
                                            <span style="color: black">더 많은 혜택을 누려보세요</span>
                                        </div>
                                        <div class="hover-content">
                                            <div class="inner">
                                                <h4>멤버쉽 가입</h4>
                                                <p>월 ₩10,000원에 멤버쉽을 경험하실 수 있습니다.</p>
                                                <div class="main-border-button">
                                                    <a href="javascript:;" onclick="BETA()">Membership 가입하기</a>
                                                </div>
                                            </div>
                                        </div>
                                        <img src="/resources/image/membership.jpg" height="382.16px">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->
    
    <!-- ***** Subscribe Area Starts ***** -->
    <div class="subscribe">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="section-heading">
                        <h2>찾으시려는 책이 있으신가요?</h2>
                        <span>--------------------------------------------------------------</span>
                    </div>
                    <form id="subscribe" action="/Book/bookList" method="get">
                        <div class="row">
                          <div class="col-lg-8">
                            <fieldset>
                              <input name="key" type="text" id="key" placeholder="검색어 입력" required="">
                              <input name="pageNum" type="hidden" id="pageNum" value='1'>
                            </fieldset>
                          </div>
                          <div class="col-lg-2">
                            <fieldset>
                              <button type="submit" id="form-submit" class="main-dark-button"><i class="fa fa-paper-plane"></i></button>
                            </fieldset>
                          </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-4">
                    <div class="row">
                        <div class="col-6">
                            <ul>
                                <li>지금 뜨는 검색어:<br><span>수능 특강 영어</span></li>
                                <li>사용  API:<br><span>국립중앙도서관</span></li>
                                <li>사용  API:<br><span>도서관 정보 나루</span></li>
                            </ul>
                        </div>
                        <div class="col-6">
                            <ul>
                                <li>검색 가능 키워드:<br><span>책 제목</span><br><span>작가</span><br><span>....</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Subscribe Area Ends ***** -->
    
    <!-- ***** Recommend Area Starts ***** -->
    <section class="section" id="Recommend">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-heading">
                        <h2>추천 도서</h2>
                        <span>가장 많은 추천을 받은 리뷰순으로 나열됩니다.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="men-item-carousel">
                        <div class="owl-men-item owl-carousel">
                        
                       		<!-- foreach -->
                       		<c:forEach var="item" items="${bestlist}" varStatus="indexNo">
	                       		<div class="item">
	                                <div class="thumb">
	                                    <div class="hover-content">
	                                        <ul>
	                                            <li><a href="/Book/bookDetail?isbn=<c:out value='${item.bookIsbn}'/>"><i class="fa fa-eye"></i></a></li>	<!-- detailList -->
	                                            <li><a href="javascript:;"><i class="fa fa-star"></i></a></li>	
	                                            <li><a href="javascript:;"><i class="fa fa-shopping-cart"></i></a></li>
	                                        </ul>
	                                    </div>
	                                    <img src="${item.bookImageURL}" height="490" style="border: 0.5px solid black">
	                                </div>
	                                <div class="down-content">
	                                    <h4><a style="color: black;" class="detail" href="<c:out value='${item.bookIsbn}'/>"> ${item.bookName}</a></h4>
	                                    <form id="actionForm" action="/Book/bookDetail">
											<input type="hidden" name="isbn">
										</form>
	                                    <span>${indexNo.count}위</span>
	                                    <ul class="stars">
	                                    	
	                                       <!--  <li><i class="fa fa-star"></i></li>
	                                        <li><i class="fa fa-star"></i></li>
	                                        <li><i class="fa fa-star"></i></li>
	                                        <li><i class="fa fa-star"></i></li>
	                                        <li><i class="fa fa-star"></i></li> -->
	                                    </ul>
	                                </div>
	                            </div>
                       		</c:forEach>
                       		<!-- foreach -->
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Recommend Area Ends ***** -->

	<!-- ***** Social Area Starts ***** -->
    <section class="section" id="social">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h2>최근 리뷰</h2>
                        <span>가장 최근에 작성된 리뷰 순으로 보여집니다.</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row images">
            <c:forEach var="rc" items="${RC}">
            	<div class="col-2">
                    <div class="thumb">
                        <div class="icon">
                        <h7 style="color:white; padding:5px">${rc.regdate}</h7>
                        <h5 style="color:white; padding:5px">${rc.content}</h5><br>
                            <a href="/Book/bookDetail?isbn=<c:out value='${rc.isbn}'/>">
                                <h6>${rc.name}</h6>
                                <i class="fa fa-instagram"></i>
                            </a>
                        </div>
                        <img id="rc_img" src="${rc.pic}" onerror="this.src='/resources/image/books.png';"/>
                    </div>
                </div>
            </c:forEach>
                
                
            </div>
        </div>
    </section>
    <!-- ***** Social Area Ends ***** -->

    <!-- ***** Explore Area Starts ***** -->
    <section class="section" id="explore">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="left-content">
                        <h2>Bookstore AVOCADO</h2>
                        <span>AVOCADO는 고객의 진정한 지식 및 (예술)문화콘텐츠 파트너입니다.<br>
                        <br>
						<b>핵심 목적</b><br>
						우리의 사명은 모든 사람이 다양한 지식 및 (예술)문화콘텐츠를 경험해 지적/문화적/사회적으로
						성장할 수 있도록 도와드리는 것입니다.<br>
						</span>

                        <div class="quote">
                            <i class="fa fa-quote-left"></i><p>AVOCADO는 예술문화경험과 다양한 지식을 제공합니다.</p>
                        </div>
                        <p>
						<b>지적 성장</b> : &nbsp;‘지식’습득을 넘어 스스로 생각을 키워 나가는 ‘지성’을 함양하는 것
						</p>
                        <p> <b>문화적 성장</b> : &nbsp;다양한 지식과 예술문화콘텐츠를 수용, 해석, 창작하는 역량을 갖추는 것
						</p>
						<p><b>사회적 성장</b> : &nbsp;지적/문화적 성장을 통해 사회에 선한 영향을 끼치는 사람으로 변화하는 것</p>
                        <div class="main-border-button">
                            <a href="https://github.com/SuperRookiee/Library#readme">Discover More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="right-content">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="leather" style="background-image: url(/resources/image/JHJ.jpg)">
                                    <!-- <h4>여기에</h4>
                                    <span>페이지 소개를 넣을까해요</span> -->
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="first-image">
                                    <img src="/resources/image/JJH.jpg" alt="">
                                    <!-- 임시 사진 -->
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="second-image">
                                    <img src="/resources/image/GHW.jpg" alt="">
                                    <!-- 임시 사진 -->
                                </div>
                            </div>
                            <div class="col-lg-6" >
                                <div class="leather" style="background-image: url(/resources/image/KJB.jpg)">
                                    <!-- <h4>여기에는 </h4>
                                    <span>팀원 소개도 넣어볼까해요</span> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Explore Area Ends ***** -->
</body>
<%@include file="../Book/footer.jsp" %>
</html>