<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AVOCADO</title>
</head>
<body>
 	<!-- ***** Footer Start ***** -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="first-item">
                        <div class="logo">
                            <img id="logo" src="/resources/image/white-logo.png" alt="hexashop ecommerce templatemo">
                        </div>
                        <ul>
                            <li><a href="#">서울 서초구 서초대로74길 33</a></li>
                            <li><a href="https://github.com/SuperRookiee/Library"><i class="bi bi-git"></i> github.com/SuperRookiee/Library</a></li>
                            
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <h4>Search</h4>
                    <ul>
                        <li><a href="#">Search1</a></li>
                        <li><a href="#">Search2</a></li>
                        <li><a href="#">Search3</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h4>추천 도서</h4>
                    <ul>
                        <li><a href="#">주제별 추천도서</a></li>
                        <li><a href="#">연령별 추천도서</a></li>
                        <li><a href="#">성별 추천도서</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h4>Help &amp; Information</h4>
                    <ul>
                        <li><a href="#">Help</a></li>
                        <li><a href="#">FAQ's</a></li>
                        <li><a href="#">Cart</a></li>
                    </ul>
                </div>
                <div class="col-lg-12">
                    <div class="under-footer">
                        <p>Copyright © 2022 HexaShop Co., Ltd. All Rights Reserved. 
                        
                        <br>Design: <a href="https://templatemo.com" target="_parent" title="free css templates">TemplateMo</a></p>
                        <ul>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="https://github.com/SuperRookiee/Library"><i class="fa fa-github"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    
    <!-- Bootstrap -->
    <script src="/resources/hexa/assets/js/popper.js"></script>
    <script src="/resources/hexa/assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="/resources/hexa/assets/js/owl-carousel.js"></script>
    <script src="/resources/hexa/assets/js/accordions.js"></script>
    <script src="/resources/hexa/assets/js/datepicker.js"></script>
    <script src="/resources/hexa/assets/js/scrollreveal.min.js"></script>
    <script src="/resources/hexa/assets/js/waypoints.min.js"></script>
    <script src="/resources/hexa/assets/js/jquery.counterup.min.js"></script>
    <script src="/resources/hexa/assets/js/imgfix.min.js"></script> 
    <script src="/resources/hexa/assets/js/slick.js"></script> 
    <script src="/resources/hexa/assets/js/lightbox.js"></script> 
    <script src="/resources/hexa/assets/js/isotope.js"></script> 
    
    <!-- Global Init -->
    <script src="/resources/hexa/assets/js/custom.js"></script>

    <script>
        $(function() {
            var selectedClass = "";
            $("p").click(function(){
            selectedClass = $(this).attr("data-rel");
            $("#portfolio").fadeTo(50, 0.1);
                $("#portfolio div").not("."+selectedClass).fadeOut();
            setTimeout(function() {
              $("."+selectedClass).fadeIn();
              $("#portfolio").fadeTo(50, 1);
            }, 500);
                
            });
        });
    </script>
<<<<<<< HEAD
=======
    
>>>>>>> 7d06c78148fb95bf037060a9608b57c4c6a820b3
</body>
</html>