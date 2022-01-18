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
function checkBox(checked){
    var result = document.getElementById("checkResult");
    
    /* if( checked.checked==true ){
        console.log(result.value);
        if(result.value == "" ){
            result.value = checked.getAttribute("value");
        }else{
            result.value += ","+ checked.getAttribute("value");
        }
    }else {

        var resultArr = result.value.split(",");
        for(var i=0; i<resultArr.length; i++){
            if(resultArr[i] == checked.getAttribute("value")){
                resultArr.splice(i,1);
                break;
            }
        }
        result.value  = resultArr.join(",");

    } */
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
			<label><input onchange="checkBox(this)" name="chkbox1" type="radio" class="option-input radio" name="example" checked/>전체&nbsp;</label></label>
			<label><input onchange="checkBox(this)" name="chkbox1" type="radio" class="option-input radio" name="example" />영유아(0~5세)&nbsp;</label></label>
			<label><input onchange="checkBox(this)" name="chkbox1" type="radio" class="option-input radio" name="example" />영유아(6~7세)&nbsp;</label></label>
			<label><input onchange="checkBox(this)" name="chkbox1" type="radio" class="option-input radio" name="example" />초등(8~13세)&nbsp;</label></label>
			<label><input onchange="checkBox(this)" name="chkbox1" type="radio" class="option-input radio" name="example" />청소년(14~19세)&nbsp;</label></label>
			<label><input onchange="checkBox(this)" name="chkbox1" type="radio" class="option-input radio" name="example" />20대&nbsp;</label></label>
			<label><input onchange="checkBox(this)" name="chkbox1" type="radio" class="option-input radio" name="example" />30대&nbsp;</label></label>
			<label><input onchange="checkBox(this)" name="chkbox1" type="radio" class="option-input radio" name="example" />40대&nbsp;</label></label>
			<label><input onchange="checkBox(this)" name="chkbox1" type="radio" class="option-input radio" name="example" />50대&nbsp;</label></label>
			<label><input onchange="checkBox(this)" name="chkbox1" type="radio" class="option-input radio" name="example" />60 이상&nbsp;</label></label>
			<label><input onchange="checkBox(this)" name="chkbox1" type="radio" class="option-input radio" name="example" />미상&nbsp;</label></label>
		</div>                                                                                              
	</div>
	<div class="main2" id ="category">
		<div>
			<label><input onchange="checkBox(this)"  name="chkbox2" type="radio" class="option-input radio" name="example" checked/>전체&nbsp;</label>
			<label><input onchange="checkBox(this)"  name="chkbox2" type="radio" class="option-input radio" name="example" />총류&nbsp;</label>
			<label><input onchange="checkBox(this)"  name="chkbox2" type="radio" class="option-input radio" name="example" />철학&nbsp;</label>
			<label><input onchange="checkBox(this)"  name="chkbox2" type="radio" class="option-input radio" name="example" />종교&nbsp;</label>
			<label><input onchange="checkBox(this)"  name="chkbox2" type="radio" class="option-input radio" name="example" />사회과학&nbsp;</label>
			<label><input onchange="checkBox(this)"  name="chkbox2" type="radio" class="option-input radio" name="example" />자연과학&nbsp;</label>
			<label><input onchange="checkBox(this)"  name="chkbox2" type="radio" class="option-input radio" name="example" />기술과학&nbsp;</label>
			<label><input onchange="checkBox(this)"  name="chkbox2" type="radio" class="option-input radio" name="example" />예술&nbsp;</label>
			<label><input onchange="checkBox(this)"  name="chkbox2" type="radio" class="option-input radio" name="example" />언어&nbsp;</label>
			<label><input onchange="checkBox(this)"  name="chkbox2" type="radio" class="option-input radio" name="example" />문학&nbsp;</label>
			<label><input onchange="checkBox(this)"  name="chkbox2" type="radio" class="option-input radio" name="example" />역사&nbsp;</label>
		</div>
	</div>
	<div class="main3" id="gender">
		<div>
			<label><input onchange="checkBox(this)"  name="chkbox3" type="radio" class="option-input radio" name="example" checked/>전체&nbsp;</label>
			<label><input onchange="checkBox(this)"  name="chkbox3" type="radio" class="option-input radio" name="example" />남성&nbsp;</label>
			<label><input onchange="checkBox(this)"  name="chkbox3" type="radio" class="option-input radio" name="example" />여성&nbsp;</label>
			<label><input onchange="checkBox(this)"  name="chkbox3" type="radio" class="option-input radio" name="example" />미상&nbsp;</label>
		</div>
		<br>
	</div>
	
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
	<hr>
	
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