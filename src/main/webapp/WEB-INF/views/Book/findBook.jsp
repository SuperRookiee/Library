<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../Book/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AVOCADO</title>

<link rel="stylesheet" href="/resources/css/findBook.css">
</head>

<script>
	
	var search="";
	$(document).ready(function()
	{
		
		$('input[name="chkbox1"]').change(function()
				{
					console.log('chkbox1 change...');
					const regex=/\&age=-*[0-9]*/g;
					search=search.replace(regex,"");
					var checked_age=$('input[name="chkbox1"]:checked').val();
					if(checked_age=="-2")
					{
						updateList();
						return;
					}
					search+="&age="+checked_age;
					console.log(search);
					updateList();
				})
				
				$('input[name="chkbox2"]').change(function()
				{
					search=search.replace(/\&kdc=-*[0-9]*/,"");
					var checked_kdc=$('input[name="chkbox2"]:checked').val();
					if(checked_kdc=="-1")
					{
						updateList();
						return;
					}
					search+="&kdc="+checked_kdc;
					updateList();
				})
				
				$('input[name="chkbox3"]').change(function()
				{
					search=search.replace(/\&gender=[0-9]*/,"");
					var checked_gender=$('input[name="chkbox3"]:checked').val();
					if(checked_gender=="-1")
					{
						updateList();
						return;
					}
					search+="&gender="+checked_gender;
					updateList();
				})
	})
	
	function updateList()
	{
		$("#search").empty();
		$.ajax({
			url:"http://data4library.kr/api/loanItemSrch?authKey=516d6057acf9b3415283b1b6459355d04fdc09061bb8b2aad43f086301d5c6dd&startDt=2022-01-01&endDt=2022-01-18&pageSize=3"+search,
			dataType:'xml',
			error:function()
			{
				alert('에러가 발생하였습니다.');
			},
			success:function(xml)
			{
				$(xml).find('doc').each(function()
				{
					var bookname=$(this).find('bookname').text();
					var authors=$(this).find('authors').text();
					var publisher=$(this).find('publisher').text();
					var pubyear=$(this).find('publication_year').text();
					var isbn13=$(this).find('isbn13').text();
					var category=$(this).find('class_nm').text();
					var bookImg=$(this).find('bookImageURL').text();
					
					var bookPrice=(parseInt(isbn13.charAt(isbn13.length-1))+1)*20000/4;
					

					var section=document.createElement('section');
					section.className='section';
					section.id='product';
					
					var div_con=document.createElement('div');
					div_con.className='container';
					
					var div_row=document.createElement('div');
					div_row.className='row';
					
					var div_col4=document.createElement('div');
					div_col4.className='col-lg-4';
					
					var div_img=document.createElement('div');
					div_img.className='left-images';
					
					var img_book=document.createElement('img');
					img_book.id="IMG";
					img_book.src=bookImg;
					img_book.onerror=function(){
						$(this).src='/resources/image/books.png';
					}
					
					var div_col8=document.createElement('div');
					div_col8.className='col-lg-8';
					
					var div_right=document.createElement('div');
					div_right.className='right-content';
					
					var h4_a=document.createElement('h4');
					
					var a_detail=document.createElement('a');
					a_detail.href=isbn13;
					a_detail.className='detail';
					a_detail.append(bookname);
					
					var span_authors=document.createElement('span');
					span_authors.className='price';
					span_authors.append(authors);
					
					var span_pub=document.createElement('span');
					span_pub.className='price';
					span_pub.append("출판사 : "+publisher+"	/	출판년도 : "+pubyear);
					
					var ul_cate=document.createElement('ul');
					ul_cate.className='stars';
					
					var li_cate=document.createElement('li');
					li_cate.append(category);
					
					var span_des=document.createElement('span');
					span_des.append()
					
					var div_total=document.createElement('div');
					div_total.className='total';
					
					var h4_price=document.createElement('h4');
					h4_price.append("₩"+bookPrice+"원");
					
					var div_cart=document.createElement('div');
					div_cart.className='main-border-button';
					
					var a_cart=document.createElement('a');
					a_cart.href="#";
					a_cart.append("Add To Cart");
					
					var search=document.getElementById('search');
					
					
					search.append(section);
					section.append(div_con);
					div_con.append(div_row);
					div_row.append(div_col4);
					div_col4.append(div_img);
					div_img.append(img_book);
					
					
					
					div_row.append(div_col8);
					div_col8.append(div_right);
					div_right.append(h4_a);
					h4_a.append(a_detail);
					div_right.append(span_authors);
					div_right.append(span_pub);
					div_right.append(ul_cate);
					ul_cate.append(li_cate);
					div_right.append(div_total);
					div_total.append(h4_price);
					div_total.append(div_cart);
					div_cart.append(a_cart);
				})
			}
		})
	}
</script>


<body>
	<!-- ***** Main Banner Area Start ***** -->
	<div class="page-heading about-page-heading" id="top">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="inner-content">
						<h2>조건 검색</h2>
						<span>카테고리 및 키워드로 검색하실 수 있습니다</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Main Banner Area End ***** -->
	
	<div class="main1" id ="age">
		<!-- <div>
			<label> <input type="checkbox" class="option-input checkbox" checked />전체</label> 
			<label> <input type="checkbox" class="option-input checkbox" />Checkbox</label> 
			<label> <input type="checkbox" class="option-input checkbox" />Checkbox</label>
		</div> -->
		<div>
			<label><input name="chkbox1" value="-2" type="radio" class="option-input radio" name="example" checked/>전체&nbsp;</label>
			<label><input name="chkbox1" value="0" type="radio" class="option-input radio" name="example" />영유아(0~5세)&nbsp;</label>
			<label><input name="chkbox1" value="6" type="radio" class="option-input radio" name="example" />영유아(6~7세)&nbsp;</label>
			<label><input name="chkbox1" value="8" type="radio" class="option-input radio" name="example" />초등(8~13세)&nbsp;</label>
			<label><input name="chkbox1" value="14" type="radio" class="option-input radio" name="example" />청소년(14~19세)&nbsp;</label>
			<label><input name="chkbox1" value="20" type="radio" class="option-input radio" name="example" />20대&nbsp;</label>
			<label><input name="chkbox1" value="30" type="radio" class="option-input radio" name="example" />30대&nbsp;</label>
			<label><input name="chkbox1" value="40" type="radio" class="option-input radio" name="example" />40대&nbsp;</label>
			<label><input name="chkbox1" value="50" type="radio" class="option-input radio" name="example" />50대&nbsp;</label>
			<label><input name="chkbox1" value="60" type="radio" class="option-input radio" name="example" />60 이상&nbsp;</label>
			<label><input name="chkbox1" value="-1" type="radio" class="option-input radio" name="example" />미상&nbsp;</label>
		</div>                                                                                              
	</div>
	<div class="main2" id ="category">
		<div>
			<label><input name="chkbox2" value="-1" type="radio" class="option-input radio" name="example" checked/>전체&nbsp;</label>
			<label><input name="chkbox2" value="0" type="radio" class="option-input radio" name="example" />총류&nbsp;</label>
			<label><input name="chkbox2" value="1" type="radio" class="option-input radio" name="example" />철학&nbsp;</label>
			<label><input name="chkbox2" value="2" type="radio" class="option-input radio" name="example" />종교&nbsp;</label>
			<label><input name="chkbox2" value="3" type="radio" class="option-input radio" name="example" />사회과학&nbsp;</label>
			<label><input name="chkbox2" value="4" type="radio" class="option-input radio" name="example" />자연과학&nbsp;</label>
			<label><input name="chkbox2" value="5" type="radio" class="option-input radio" name="example" />기술과학&nbsp;</label>
			<label><input name="chkbox2" value="6" type="radio" class="option-input radio" name="example" />예술&nbsp;</label>
			<label><input name="chkbox2" value="7" type="radio" class="option-input radio" name="example" />언어&nbsp;</label>
			<label><input name="chkbox2" value="8" type="radio" class="option-input radio" name="example" />문학&nbsp;</label>
			<label><input name="chkbox2" value="9" type="radio" class="option-input radio" name="example" />역사&nbsp;</label>
		</div>
	</div>
	<div class="main3" id="gender">
		<div>
			<label><input name="chkbox3" value="-1" type="radio" class="option-input radio" name="example" checked/>전체&nbsp;</label>
			<label><input name="chkbox3" value="0" type="radio" class="option-input radio" name="example" />남성&nbsp;</label>
			<label><input name="chkbox3" value="1" type="radio" class="option-input radio" name="example" />여성&nbsp;</label>
			<label><input name="chkbox3" value="2" type="radio" class="option-input radio" name="example" />미상&nbsp;</label>
		</div>
		<br>
	</div>
	<hr>
	<div id="search">
	
	</div>
	<!-- foreach 문 -->
	<%-- <c:forEach var="item" items="${list}">
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
	                    <h4><a class="detail" href="./bookDetail?isbn=<c:out value='${item.bookIsbn}'/>&bookName=<c:out value='${item.bookName}'/>" onclick="nameClick()">${item.bookName}</a> </h4>
	                    <span class="price">${item.writer}</span>
	                    <span class="price">출판사 : ${item.publisher}	/	출판년도 : ${item.bookPublishYear}</span>
	                    
	                    <ul class="stars">
	                        <li>${item.category}</li>
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
	    <hr>
	</c:forEach> --%>
	
</body>
<%@include file="../Book/footer.jsp"%>
</html>