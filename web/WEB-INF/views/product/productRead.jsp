<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-27
  Time: 오후 3:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>

<%@ include file="../includes/header2.jsp"%>

<Br/><br/><Br/><br/>
<section>
<div class="container">
    <div class="row">

        <div class="col-md-6">
            <div class="col-md-6">
                <img src="/resources/shop/images/${product.product_url}" width="350px"/>
            </div>
        </div>

        <div class="row">
            <div class="w-100"></div>
        </div>
        <div class="col-md-6">
            <div class="row">
                <div class="w-100"></div>

                <div class="col-md-12">
                    &nbsp;
                </div>
                <div class="col-md-12">
                    &nbsp;
                </div>

                <div class="col-md-12">
                    <h1>${product.product_name}</h1>
                </div>
            </div>
            <div class="row">


                <div class="col-md-12">
                    <span class="badge badge-primary">Shose</span>&nbsp;
                    <span class="monospaced">No. ${product.product_id}</span>
                </div>
                <br/>
                    <div class="col-md-12">
                        <p>${product.product_desc}</p>
                    </div>
                <div class="col-md-12">
                   <h4> <p class="price"><span><fmt:setLocale value=""/><fmt:formatNumber type="currency" currencySymbol="￦" value="${product.product_price}" maxFractionDigits="0"/>원 </span></p></h4>
                </div>
            </div><!-- end row -->

            <div class="row add-to-cart">

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