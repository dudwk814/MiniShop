<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-11-07
  Time: 오후 8:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contentType}/"/>

<%@ include file="../includes/header2.jsp"%>

<section class="ftco-section ftco-cart">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 d-flex">
                <div class="cart-detail cart-total bg-light p-3 p-md-4">
                    <h3 class="billing-heading mb-4">Order Result</h3>
                    <p class="d-flex">
                        <span>성명</span>
                        <span><sec:authentication property="principal.member.userName"/> </span>
                    </p>
                    <p class="d-flex">
                        <span>주문 번호</span>
                        <span><a href="#">${order.order_id}</a></span>
                    </p>
                    <hr>
                    <p class="d-flex total-price">
                        <span>결제수단</span>
                        <span>${order.payment_option}</span>
                    </p>
                </div>
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

<%@ include file="../includes/footer.jsp"%>