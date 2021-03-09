<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-02
  Time: 오후 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ftm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contentType}/"/>

<%@ include file="../includes/header2.jsp"%>

<section class="ftco-section ftco-cart">
    <div class="container">
        <div class="row">
            <div class="col-md-12 ftco-animate">
                <div class="cart-list">
                    <table class="table">
                        <thead class="thead-primary">
                        <tr class="text-center">
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                        </thead>
                        <c:choose>
                            <c:when test="${cartCount >= 1}">
                                <c:forEach var="cart" items="${cart}">
                                    <tbody>
                                    <tr class="text-center">
                                        <td class="product-remove">
                                            <form action="/cart/remove" method="post" id="removeForm${cart.cart_id}">
                                                <input type="hidden" name="cart_id" value="${cart.cart_id}"/>
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                <input type="hidden" name="userid" value="${userid}"/>
                                                <a type="submit" <%--class="btn btn-outline-primary removeBtn"--%> data-cart-id="${cart.cart_id}">
                                                    <span class="ion-ios-close"></span>
                                                </a>
                                            </form>
                                        </td>

                                        <td class="image-prod"><div class="img" style="background-image:url(/resources/shop/images/${cart.product_url});"></div></td>

                                        <td class="product-name">
                                            <h3>${cart.product_name}</h3>
                                        </td>

                                        <td class="price"><fmt:setLocale value=""/><fmt:formatNumber type="currency" currencySymbol="￦" value="${cart.product_price}" maxFractionDigits="0"/>원</td>

                                        <td class="quantity">
                                            <form id="amountModifyForm" action="/cart/amountModify" method="post">
                                            <div class="input-group mb-3">
                                                <input type="hidden" name="cart_id" value="${cart.cart_id}"/>
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                <input type="hidden" name="userid" value="${userid}"/>
                                                <input type="hidden" name="product_id" value="${cart.product_id}"/>
                                                <input type="text" name="amount" class="quantity form-control input-number" value="${cart.amount}" min="1" max="100">
                                            </div>
                                            <div>
                                                <input type="submit" class="btn btn-outline-primary" value="변경" id="amountModifyBtn"/>
                                            </div>
                                            </form>
                                        </td>

                                        <td class="total"><fmt:setLocale value=""/><fmt:formatNumber type="currency" currencySymbol="￦" value="${cart.product_price * cart.amount}" maxFractionDigits="0"/>원</td>
                                    </tr><!-- END TR-->


                                    </tbody>
                                </c:forEach>
                            </c:when>
                        </c:choose>

                    </table>
                </div>
            </div>
        </div>
        <div class="row justify-content-start">
            <div class="col col-lg-5 col-md-6 mt-5 cart-wrap ftco-animate">
                <div class="cart-total mb-3">
                    <h3>Cart Totals</h3>
                    <p class="d-flex">
                        <span>Subtotal</span>
                        <span><ftm:setLocale value=""/><fmt:formatNumber type="currency" currencySymbol="￦" value="${sumMoney}" maxFractionDigits="0"/>원</span>
                    </p>
                    <p class="d-flex">
                        <span>Delivery</span>
                        <span><ftm:setLocale value=""/><fmt:formatNumber type="currency" currencySymbol="￦" value="${fee}" maxFractionDigits="0"/>원 (50,000원 이상 배송비 무료)</span>
                    </p>
                     <hr>
                    <p class="d-flex total-price">
                        <span>Total</span>
                        <span><ftm:setLocale value=""/><fmt:formatNumber type="currency" currencySymbol="￦" value="${AllSumMoney}" maxFractionDigits="0"/>원
                    </p>
                </div>
                <p class="text-center"><a href="/order/orderForm?userid=<sec:authentication property="principal.member.userid"/>" class="btn btn-primary py-3 px-4">주문하기</a></p>
            </div>
        </div>
    </div>
</section>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                ${result}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <a href="${root}"> <button type="button" class="btn btn-primary">쇼핑 계속하기</button></a>
            </div>
        </div>
    </div>
</div>
<button id="regBtn2" type="button" class="btn btn-primary float-left">글 쓰기</button>

</div>

<%--<script src="/resources/shop/js/jquery.min.js"></script>--%>
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

        // 모달 reuslt
        var result = '<c:out value="${result}"/>';

        checkModal(result);

        function checkModal(result) {

            if (result === '') {
                return;
            }

            $("#myModal").modal("show");
        }

        if(${cartCount == 0}) {
            alert("장바구니가 비었습니다.");
            location.href = "/";
        }


        var amountModifyForm = $("#amountModifyForm");
        var amountModifyBtn = $("#amountModifyBtn");

        var removeBtn = $(".removeBtn");

        removeBtn.on("click", function (e) {
            e.preventDefault();

            var cart_id = $(this).data("cart-id");

            console.log(cart_id);

            if (confirm("장바구니에 상품을 삭제하시겠습니까?") == true) {
                $("#removeForm" + cart_id).submit();
            } else {
                return;
            }
        });

        amountModifyBtn.on("click", function (e) {

            e.preventDefault();

            var regex= /^[0-9]/g;

            var amount = $("input[name='amount']").val();

            if(amount <= 0) {
                alert("상품 수량을 0보다 크게 해주세요.");
                return;
            } else if (amount > 100) {
                alert("최대 100개까지만 주문 가능합니다.");
                return;
            } else if (!regex.test(amount)) {
                alert("올바른 상품 수량을 입력해주세요.");
                return;
            } else if (amount.trim() == "") {
                alert("올바른 상품 수량을 입력해주세요.");
                return;
            }

            amountModifyForm.submit();

        });




    });
</script>

<%@ include file="../includes/footer.jsp"%>