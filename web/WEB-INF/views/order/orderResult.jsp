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

<%@ include file="../includes/header.jsp" %>

<section class="ftco-section ftco-cart">
    <div class="container">
        <div class="row">
            <div class="col-md-12 ftco-animate">
                <div class="cart-list">
                    <div class="table-responsive-md table-md">
                        <table class="table">
                            <thead class="thead-primary">
                            <tr class="text-center">
                                <th>&nbsp;</th>
                                <th>Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>TotalPrice</th>
                            </tr>
                            </thead>

                            <c:forEach var="product" items="${productVOList}" varStatus="status">
                                <tbody>
                                <tr class="text-center">

                                    <td class="image-prod">
                                        <a href="/product/read?product_id=${product.product_id}">
                                            <div class="img"
                                                 style="background-image:url(/resources/shop/images/${product.product_url});">
                                            </div>
                                        </a>
                                    </td>

                                    <td class="product-name">
                                        <a href="/product/read?product_id=${product.product_id}">
                                            <h3>${product.product_name}</h3>
                                        </a>
                                    </td>

                                    <td class="price"><fmt:setLocale value=""/><fmt:formatNumber type="currency"
                                                                                                 currencySymbol="￦"
                                                                                                 value="${product.product_price}"
                                                                                                 maxFractionDigits="0"/>원
                                    </td>

                                    <td class="quantity"><c:out value="${amountMap.get(status.index)}"/></td>

                                    <td class="total-price">
                                        <fmt:setLocale value=""/><fmt:formatNumber type="currency"
                                                                                   currencySymbol="￦"
                                                                                   value="${product.product_price * amountMap.get(status.index)}"
                                                                                   maxFractionDigits="0"/>원</td>

                               </tr><!-- END TR-->


                                </tbody>
                            </c:forEach>

                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 d-flex">
                <div class="cart-detail cart-total bg-light p-3 p-md-4">
                    <h3 class="billing-heading mb-4">Order Result</h3>
                    <p class="d-flex">
                        <span>성명</span>
                        <span><sec:authentication property="principal.user.userName"/> </span>
                    </p>
                    <p class="d-flex">
                        <span>주문 번호</span>
                        <span><c:out value="${order.order_id}"/></span>
                    </p>
                    <p class="d-flex">
                        <span>결제 금액</span>
                        <span><fmt:setLocale value=""/><fmt:formatNumber type="currency"
                                                                         currencySymbol="￦"
                                                                         value="${totalPrice >= 50000 ? totalPrice : totalPrice + 3000}"
                                                                         maxFractionDigits="0"/>원 &nbsp;&nbsp; <small>배송비 3,000원 (50,000원 이상 배송비 무료)</small></span>
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

<!-- Modal -->
<div class="modal fade" id="orderResultModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="orderResultModal modal-body">
                처리가 완료되었습니다.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <a href="${root}">
                    <button type="button" class="btn btn-primary">쇼핑 계속하기</button>
                </a>
            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function () {

        <!-- RedirectAttributes로 부터 전달받은 값 -->
        var result = '<c:out value="${result}"/>';

        <!-- 모달 close 버튼 -->
        var closeBtn = $("#closeBtn");

        closeBtn.on("click", function () {

            $("#orderResultModal").modal("hide");
        });

        <!-- 주문 완료시 모달 생성 -->
        checkModal(result);

        function checkModal(result) {

            if (result === '') {
                return;
            }

            $(".orderResultModal").html(result);

            $("#orderResultModal").modal("show");
        }


    });
</script>

<%@ include file="../includes/footer.jsp" %>