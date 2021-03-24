<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>

<%@ include file="includes/header2.jsp" %>


<!-- END nav -->

<section id="home-section" class="hero">
    <div class="home-slider owl-carousel">
        <%--<div class="slider-item js-fullheight">
            <div class="overlay"></div>
            <div class="container-fluid p-0">
                <div class="row d-md-flex no-gutters slider-text align-items-center justify-content-end"
                     data-scrollax-parent="true">
                    <img class="one-third order-md-last img-fluid" src="/resources/shop/images/bg_1.png" alt="">
                    <div class="one-forth d-flex align-items-center ftco-animate"
                         data-scrollax=" properties: { translateY: '70%' }">
                        <div class="text">
                            <span class="subheading">#New Arrival</span>
                            <div class="horizontal">
                                <h1 class="mb-4 mt-3">Shoes Collection 2019</h1>
                                <p class="mb-4">A small river named Duden flows by their place and supplies it with the
                                    necessary regelialia. It is a paradisematic country.</p>

                                <p><a href="#" class="btn-custom">Discover Now</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>

        <div class="slider-item js-fullheight">
            <div class="overlay"></div>
            <div class="container-fluid p-0">
                <div class="row d-flex no-gutters slider-text align-items-center justify-content-end"
                     data-scrollax-parent="true">
                    <img class="one-third order-md-last img-fluid" src="/resources/shop/images/bg_2.png" alt="">
                    <div class="one-forth d-flex align-items-center ftco-animate"
                         data-scrollax=" properties: { translateY: '70%' }">
                        <div class="text">
                            <span class="subheading">#New Arrival</span>
                            <div class="horizontal">
                                <h1 class="mb-4 mt-3">New Shoes Winter Collection</h1>
                                <p class="mb-4">A small river named Duden flows by their place and supplies it with the
                                    necessary regelialia. It is a paradisematic country.</p>

                                <p><a href="/product/read?product_id=1" class="btn-custom">Discover Now</a></p>
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
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia,
                            there live the blind texts.</p>
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
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia,
                            there live the blind texts.</p>
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
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia,
                            there live the blind texts.</p>
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
                        <a href="/product/read?product_id=${pList.product_id}" class="img-prod"><img
                                class="img-fluid" src="/resources/shop/images/${pList.product_url}"
                                alt="Colorlib Template">
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
                            <h3><a href="/product/read?product_id=${pList.product_id}">${pList.product_name}</a></h3>
                            <div class="pricing">
                                <p class="price"><span><fmt:setLocale value=""/><fmt:formatNumber type="currency"
                                                                                                  currencySymbol="￦"
                                                                                                  value="${pList.product_price}"
                                                                                                  maxFractionDigits="0"/>원 </span>
                                </p>
                            </div>
                            <div class="bottom-area d-flex px-3" id="addCartDiv">
                                <form method="post" action="/cart/add" id="addCartForm${pList.product_id}">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <input type="hidden" name="userid" value="${userid}"/>
                                    <input type="hidden" name="amount" value="1"/>
                                    <input type="hidden" name="product_name" value="${pList.product_name}">
                                    <input type="hidden" name="product_id" value="${pList.product_id}">

                                    <button type="submit" class="btn btn-info addCartBtn"
                                            data-product-id="${pList.product_id}" data-product_id="${pList.product_id}"
                                            name="addCartBtn" id="addCartBtn${pList.product_id}"><span
                                            class="icon-plus"></span>&nbsp; <span class="icon-shopping_cart"></span>
                                    </button>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<section class="ftco-gallery">
    <div class="container">

    </div>
    <div class="container-fluid px-0">
        <div class="row no-gutters">
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="/resources/shop/images/gallery-1.jpg" class="gallery image-popup img d-flex align-items-center"
                   style="background-image: url(/resources/shop/images/gallery-1.jpg);">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="/resources/shop/images/gallery-2.jpg" class="gallery image-popup img d-flex align-items-center"
                   style="background-image: url(/resources/shop/images/gallery-2.jpg);">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="/resources/shop/images/gallery-3.jpg" class="gallery image-popup img d-flex align-items-center"
                   style="background-image: url(/resources/shop/images/gallery-3.jpg);">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="/resources/shop/images/gallery-4.jpg" class="gallery image-popup img d-flex align-items-center"
                   style="background-image: url(/resources/shop/images/gallery-4.jpg);">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="/resources/shop/images/gallery-5.jpg" class="gallery image-popup img d-flex align-items-center"
                   style="background-image: url(/resources/shop/images/gallery-5.jpg);">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
            <div class="col-md-4 col-lg-2 ftco-animate">
                <a href="/resources/shop/images/gallery-6.jpg" class="gallery image-popup img d-flex align-items-center"
                   style="background-image: url(/resources/shop/images/gallery-6.jpg);">
                    <div class="icon mb-4 d-flex align-items-center justify-content-center">
                        <span class="icon-instagram"></span>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
                <button type="button" class="close closeBtn" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                처리가 완료되었습니다.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary closeBtn" data-dismiss="modal">Close</button>
                <sec:authorize access="isAnonymous()">
                    <a href="#"  class="btn btn-primary loginBtn">로그인</a>
                </sec:authorize>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle2">Modal title</h5>
                <button type="button" class="close modalCloseBtn" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>해당 웹 사이트는 포트폴리오로써 실제 결제기능은 제공하지 않습니다.</p>
                <p>해당 웹사이트는 크롬과 파이어폭스 브라우저에 최적화되어있습니다.</p>
            </div>
            <div class="modal-footer">
                <div class="form-check form-check-inline">
                    <label class="form-check-label" for="inlineCheckbox2">오늘 하루 열지 않기</label>
                    <input name="modalClose" class="form-check-input  float-left" type="checkbox" id="inlineCheckbox2"
                           value="option1">
                </div>
                <button type="button" class="btn btn-secondary modalCloseBtn" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<%--<script src="/resources/shop/js/jquery.min.js"></script>
&lt;%&ndash;<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>&ndash;%&gt;

<script src="/resources/shop/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/resources/jquery.cookie.js"></script>
<script src="/resources/shop/js/jquery.easing.1.3.js"></script>
<script src="/resources/shop/js/jquery.waypoints.min.js"></script>
<script src="/resources/shop/js/jquery.stellar.min.js"></script>
<script src="/resources/shop/js/popper.min.js"></script>
<script src="/resources/shop/js/owl.carousel.min.js"></script>
<script src="/resources/shop/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/shop/js/aos.js"></script>
<script src="/resources/shop/js/jquery.animateNumber.min.js"></script>
<script src="/resources/shop/js/bootstrap-datepicker.js"></script>
<script src="/resources/shop/js/scrollax.min.js"></script>
<script src="/resources/shop/js/main.js"></script>
&lt;%&ndash;<script src="/resources/shop/js/bootstrap.min.js"></script>&ndash;%&gt;
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>--%>

<script>

    $(document).ready(function (e) {


        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";

        // Ajax spring security header.
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
        });


        // RedirectAttributes로 부터 전달받은 값
        var result = '<c:out value="${result}"/>';

        // 모달 close 버튼
        var closeBtn = $("#closeBtn");

        closeBtn.on("click", function () {

            $("#myModal").modal("hide");
        })


        checkModal(result);

        function checkModal(result) {

            if (result === '') {
                return;
            }

            $("#myModal").modal("show");
        }

        var logoutBtn = $("#logoutBtn");

        var addCartBtn = $(".addCartBtn");


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

            var product_id = $(this).data("product-id");

            <sec:authorize access="isAnonymous()">
            alert("로그인 후 이용가능합니다.");
            return;
            </sec:authorize>

            if (confirm('장바구니에 추가하시겠습니까?') == true) {
                $("#addCartForm" + product_id).submit();
            } else {
                return;
            }

            <%--<sec:authorize access="isAuthenticated()">
                var userid = "<sec:authentication property="principal.member.userid"/>";
            </sec:authorize>

            var product = {
                userid : userid,
                amount : 1,
                product_name : $("#addCartBtn" + product_id).find("input[name='product_name']").val(),
                product_id : product_id
            };

            $.ajax({
                type : 'post',
                url : '/cart/add',
                data : product,
                contentType : "application/json; charset=utf-8",
                success : function (result, status, xhr) {
                    if (confirm("장바구니에 상품이 추가되었습니다. 장바구니로 이동하시겠습니까?") == true) {
                        location.href = "/cart/cart?userid=" + userid;
                    } else {
                        return;
                    }

                }

            });--%>

        });

        // 홈 화면 팝업 모달
        $("#inlineCheckbox2").change(function () {
            if ($("#inlineCheckbox2").is(":checked") == true) {
                $.cookie("close", "Y", {expires: 1});
                console.log("Y");
                $("#myModal2").modal("hide");
            }
        });

        console.log($.cookie("close"));

        if ($.cookie('close') == "Y") {
            $("#myModal2").modal("hide");
        } else {
            $("#myModal2").modal("show");
        }

        <!-- 회원가입 로그인 버튼 클릭시 모달 hide -->
        $(".loginBtn").on("click", function () {
            $("#myModal").modal("hide");
        })

    });
</script>

<%@ include file="includes/footer.jsp" %>