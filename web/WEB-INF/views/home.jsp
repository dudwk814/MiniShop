<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>

<%@ include file="includes/header2.jsp"%>


<!-- END nav -->

<section id="home-section" class="hero">
    <div class="home-slider owl-carousel">
        <div class="slider-item js-fullheight">
            <div class="overlay"></div>
            <div class="container-fluid p-0">
                <div class="row d-md-flex no-gutters slider-text align-items-center justify-content-end" data-scrollax-parent="true">
                    <img class="one-third order-md-last img-fluid" src="/resources/shop/images/bg_1.png" alt="">
                    <div class="one-forth d-flex align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                        <div class="text">
                            <span class="subheading">#New Arrival</span>
                            <div class="horizontal">
                                <h1 class="mb-4 mt-3">Shoes Collection 2019</h1>
                                <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country.</p>

                                <p><a href="#" class="btn-custom">Discover Now</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="slider-item js-fullheight">
            <div class="overlay"></div>
            <div class="container-fluid p-0">
                <div class="row d-flex no-gutters slider-text align-items-center justify-content-end" data-scrollax-parent="true">
                    <img class="one-third order-md-last img-fluid" src="/resources/shop/images/bg_2.png" alt="">
                    <div class="one-forth d-flex align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
                        <div class="text">
                            <span class="subheading">#New Arrival</span>
                            <div class="horizontal">
                                <h1 class="mb-4 mt-3">New Shoes Winter Collection</h1>
                                <p class="mb-4">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country.</p>

                                <p><a href="#" class="btn-custom">Discover Now</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section ftco-no-pt ftco-no-pb">
    <div class="container">
        <div class="row no-gutters ftco-services">
            <div class="col-lg-4 text-center d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services p-4 py-md-5">
                    <div class="icon d-flex justify-content-center align-items-center mb-4">
                        <span class="flaticon-bag"></span>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">Free Shipping</h3>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 text-center d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services p-4 py-md-5">
                    <div class="icon d-flex justify-content-center align-items-center mb-4">
                        <span class="flaticon-customer-service"></span>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">Support Customer</h3>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 text-center d-flex align-self-stretch ftco-animate">
                <div class="media block-6 services p-4 py-md-5">
                    <div class="icon d-flex justify-content-center align-items-center mb-4">
                        <span class="flaticon-payment-security"></span>
                    </div>
                    <div class="media-body">
                        <h3 class="heading">Secure Payments</h3>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row justify-content-center mb-3 pb-3">
            <div class="col-md-12 heading-section text-center ftco-animate">
                <h2 class="mb-4">신상품</h2>
                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <c:forEach var="pList" items="${pList}">
                <div class="col-sm-12 col-md-6 col-lg-3 ftco-animate d-flex">
                    <div class="product d-flex flex-column">
                        <a href="#" class="img-prod"><img class="img-fluid" src="/resources/shop/images/${pList.product_url}" alt="Colorlib Template">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3">
                            <div class="d-flex">
                                <div class="cat">
                                    <span>Lifestyle</span>
                                </div>
                                <div class="rating">

                                </div>
                            </div>
                            <h3><a href="#">${pList.product_name}</a></h3>
                            <div class="pricing">
                                <p class="price"><span><fmt:setLocale value=""/><fmt:formatNumber type="currency" currencySymbol="￦" value="${pList.product_price}" maxFractionDigits="0"/>원 </span></p>
                            </div>
                            <div class="bottom-area d-flex px-3" id="addCartDiv">
                                <form method="post" action="/cart/add" id="addCartForm">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type="hidden" name="userid" value="${userid}"/>
                                        <input type="hidden" name="amount" value="1"/>
                                        <input type="hidden" name="product_id" value="${pList.product_id}">

                                   <%-- <a class="add-to-cart text-center py-2 mr-1" id="addCartBtn"><span>Add to cart <i class="ion-ios-add ml-1"></i></span></a>--%>
                                    <button type="submit" class="btn btn-primary" id="addCartBtn">장바구니에 담기</button>

                                    <button type="button" class="btn btn-info">바로 구매</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>



<section class="ftco-section ftco-choose ftco-no-pb ftco-no-pt">
    <div class="container">
        <div class="row no-gutters">
            <div class="col-lg-4">
                <div class="choose-wrap divider-one img p-5 d-flex align-items-end" style="background-image: url(/resources/shop/images/choose-1.jpg);">

                    <div class="text text-center text-white px-2">
                        <span class="subheading">Men's Shoes</span>
                        <h2>Men's Collection</h2>
                        <p>Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                        <p><a href="#" class="btn btn-black px-3 py-2">Shop now</a></p>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="row no-gutters choose-wrap divider-two align-items-stretch">
                    <div class="col-md-12">
                        <div class="choose-wrap full-wrap img align-self-stretch d-flex align-item-center justify-content-end" style="background-image: url(/resources/shop/images/choose-2.jpg);">
                            <div class="col-md-7 d-flex align-items-center">
                                <div class="text text-white px-5">
                                    <span class="subheading">Women's Shoes</span>
                                    <h2>Women's Collection</h2>
                                    <p>Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                                    <p><a href="#" class="btn btn-black px-3 py-2">Shop now</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="row no-gutters">
                            <div class="col-md-6">
                                <div class="choose-wrap wrap img align-self-stretch bg-light d-flex align-items-center">
                                    <div class="text text-center px-5">
                                        <span class="subheading">Summer Sale</span>
                                        <h2>Extra 50% Off</h2>
                                        <p>Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                                        <p><a href="#" class="btn btn-black px-3 py-2">Shop now</a></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="choose-wrap wrap img align-self-stretch d-flex align-items-center" style="background-image: url(/resources/shop/images/choose-3.jpg);">
                                    <div class="text text-center text-white px-5">
                                        <span class="subheading">Shoes</span>
                                        <h2>Best Sellers</h2>
                                        <p>Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                                        <p><a href="#" class="btn btn-black px-3 py-2">Shop now</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section ftco-deal bg-primary">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <img src="/resources/shop/images/prod-1.png" class="img-fluid" alt="">
            </div>
            <div class="col-md-6">
                <div class="heading-section heading-section-white">
                    <span class="subheading">Deal of the month</span>
                    <h2 class="mb-3">Deal of the month</h2>
                </div>
                <div id="timer" class="d-flex mb-4">
                    <div class="time" id="days"></div>
                    <div class="time pl-4" id="hours"></div>
                    <div class="time pl-4" id="minutes"></div>
                    <div class="time pl-4" id="seconds"></div>
                </div>
                <div class="text-deal">
                    <h2><a href="#">Nike Free RN 2019 iD</a></h2>
                    <p class="price"><span class="mr-2 price-dc">$120.00</span><span class="price-sale">$80.00</span></p>
                    <ul class="thumb-deal d-flex mt-4">
                        <li class="img" style="background-image: url(/resources/shop/images/product-6.png);"></li>
                        <li class="img" style="background-image: url(/resources/shop/images/product-2.png);"></li>
                        <li class="img" style="background-image: url(/resources/shop/images/product-4.png);"></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section testimony-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-5">
                <div class="services-flow">
                    <div class="services-2 p-4 d-flex ftco-animate">
                        <div class="icon">
                            <span class="flaticon-bag"></span>
                        </div>
                        <div class="text">
                            <h3>Free Shipping</h3>
                            <p class="mb-0">Separated they live in. A small river named Duden flows</p>
                        </div>
                    </div>
                    <div class="services-2 p-4 d-flex ftco-animate">
                        <div class="icon">
                            <span class="flaticon-heart-box"></span>
                        </div>
                        <div class="text">
                            <h3>Valuable Gifts</h3>
                            <p class="mb-0">Separated they live in. A small river named Duden flows</p>
                        </div>
                    </div>
                    <div class="services-2 p-4 d-flex ftco-animate">
                        <div class="icon">
                            <span class="flaticon-payment-security"></span>
                        </div>
                        <div class="text">
                            <h3>All Day Support</h3>
                            <p class="mb-0">Separated they live in. A small river named Duden flows</p>
                        </div>
                    </div>
                    <div class="services-2 p-4 d-flex ftco-animate">
                        <div class="icon">
                            <span class="flaticon-customer-service"></span>
                        </div>
                        <div class="text">
                            <h3>All Day Support</h3>
                            <p class="mb-0">Separated they live in. A small river named Duden flows</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="heading-section ftco-animate mb-5">
                    <h2 class="mb-4">Our satisfied customer says</h2>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
                </div>
                <div class="carousel-testimony owl-carousel">
                    <div class="item">
                        <div class="testimony-wrap">
                            <div class="user-img mb-4" style="background-image: url(/resources/shop/images/person_1.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                            </div>
                            <div class="text">
                                <p class="mb-4 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                <p class="name">Garreth Smith</p>
                                <span class="position">Marketing Manager</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap">
                            <div class="user-img mb-4" style="background-image: url(/resources/shop/images/person_2.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                            </div>
                            <div class="text">
                                <p class="mb-4 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                <p class="name">Garreth Smith</p>
                                <span class="position">Interface Designer</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap">
                            <div class="user-img mb-4" style="background-image: url(/resources/shop/images/person_3.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                            </div>
                            <div class="text">
                                <p class="mb-4 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                <p class="name">Garreth Smith</p>
                                <span class="position">UI Designer</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap">
                            <div class="user-img mb-4" style="background-image: url(/resources/shop/images/person_1.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                            </div>
                            <div class="text">
                                <p class="mb-4 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                <p class="name">Garreth Smith</p>
                                <span class="position">Web Developer</span>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimony-wrap">
                            <div class="user-img mb-4" style="background-image: url(/resources/shop/images/person_1.jpg)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                            </div>
                            <div class="text">
                                <p class="mb-4 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                <p class="name">Garreth Smith</p>
                                <span class="position">System Analyst</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="ftco-gallery">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 heading-section text-center mb-4 ftco-animate">
                <h2 class="mb-4">Follow Us On Instagram</h2>
                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
            </div>
        </div>
    </div>
    <div class="container-fluid px-0">
        <div class="row no-gutters">
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="/resources/shop/images/gallery-1.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(/resources/shop/images/gallery-1.jpg);">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="/resources/shop/images/gallery-2.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(/resources/shop/images/gallery-2.jpg);">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="/resources/shop/images/gallery-3.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(/resources/shop/images/gallery-3.jpg);">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="/resources/shop/images/gallery-4.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(/resources/shop/images/gallery-4.jpg);">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="/resources/shop/images/gallery-5.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(/resources/shop/images/gallery-5.jpg);">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="/resources/shop/images/gallery-6.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(/resources/shop/images/gallery-6.jpg);">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>

<script src="/resources/shop/js/jquery.min.js"></script>
<script src="/resources/shop/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/resources/shop/js/popper.min.js"></script>
<script src="/resources/shop/js/bootstrap.min.js"></script>
<script src="/resources/shop/js/jquery.easing.1.3.js"></script>
<script src="/resources/shop/js/jquery.waypoints.min.js"></script>
<script src="/resources/shop/js/jquery.stellar.min.js"></script>
<script src="/resources/shop/js/owl.carousel.min.js"></script>
<script src="/resources/shop/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/shop/js/aos.js"></script>
<script src="/resources/shop/js/jquery.animateNumber.min.js"></script>
<script src="/resources/shop/js/bootstrap-datepicker.js"></script>
<script src="/resources/shop/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/resources/shop/js/google-map.js"></script>
<script src="/resources/shop/js/main.js"></script>

<script>
    $(document).ready(function (e) {
        var logoutBtn = $("#logoutBtn");

        var addCartBtn = $("#addCartBtn");

        var addCartForm = $("#addCartForm");




        logoutBtn.on("click", function (e) {
            e.preventDefault();

            var newForm = $('<form></form>');
            newForm.attr("action", "/user/logout");
            newForm.attr("method", "post");
            newForm.appendTo('body');

            var input = $('<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>');

            newForm.append(input);

            newForm.submit();

        });


           addCartBtn.on("click", function (e) {
                e.preventDefault();



                if (confirm('장바구니에 추가하시겠습니까?') == true) {
                    addCartForm .submit();
                } else {
                    return;
                }
            });



    });
</script>

<%@ include file="includes/footer.jsp"%>