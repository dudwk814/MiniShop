<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-11-10
  Time: 오후 11:38
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
            <div class="col-md-12 ftco-animate">
                <div class="cart-list">
                    <table class="table">
                        <thead class="thead-primary">
                        <tr class="text-center">
                            <th></th>
                            <th>번호</th>
                            <th>주문일시</th>
                            <th>주문번호</th>
                            <th>결제방법</th>
                            <th>주문금액</th>
                            <th>배송상태</th>
                        </tr>
                        </thead>
                        <c:choose>
                            <c:when test="${orderCount == 0}">
                                <tbody class="text-center">
                                <td>
                                    <h1>장바구니가 비었습니다.</h1>
                                </td>
                                </tbody>
                            </c:when>
                            <c:when test="${orderCount >= 1}">
                                <c:forEach var="order" items="${orderList}" varStatus="idx">
                                    <tbody>
                                    <tr class="text-center">

                                        <td class="product-remove">
                                            <form action="/order/remove" method="post" id="removeForm${order.order_id}">
                                                <input type="hidden" name="order_id" value="${order.order_id}"/>
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                <input type="hidden" name="userid" value="${order.userid}"/>
                                                <a type="submit"  class="orderRemoveBtn" data-order-id="${order.order_id}">
                                                    <span class="ion-ios-close"></span>
                                                </a>
                                            </form>
                                        </td>

                                        <td class="product-remove">
                                            ${idx.count}
                                        </td>

                                        <td class="image-prod"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.order_date}"/></td>

                                        <td class="product-name">
                                            <a href="#">${order.order_id}</a>
                                        </td>

                                        <td>${order.payment_option}</td>

                                        <td class="price">
                                            <fmt:setLocale value=""/><fmt:formatNumber type="currency" currencySymbol="￦" value="${order.sum_price}" maxFractionDigits="0"/>원
                                        </td>

                                        <td class="total">배송중</td>

                                    </tr><!-- END TR-->


                                    </tbody>
                                </c:forEach>
                            </c:when>
                        </c:choose>

                    </table>
                </div>
            </div>
        </div>

        <br/>

        <div class="float-right">
            <nav aria-label="page navigation">
                <ul class="pagination">
                    <c:if test="${pageMaker.prev}">
                        <li class="page-item"> <a class="page-link" href="${root}order/getOrderList?userid=<sec:authentication property="principal.member.userid"/>&pageNum=${pageMaker.startPage - 1}&amount=10">Previous</a></li>
                    </c:if>
                    &nbsp;
                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""}"> <a class="page-link" href="${root}order/getOrderList?userid=<sec:authentication property="principal.member.userid"/>&pageNum=${num}&amount=10&keyword=${pageMaker.cri.keyword}&type=${pageMaker.cri.type}">${num}</a>
                        </c:forEach>
                        &nbsp;
                        <c:if test="${pageMaker.next}">
                    <li class="page-item"> <a class="page-link" href="${root}order/getOrderList?userid=<sec:authentication property="principal.member.userid"/>&pageNum=${pageMaker.endPage + 1}&amount=10">Next</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>

    </div>
</section>

<!-- Modal -->
<div class="modal fade" id="orderRemoveResultModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                ${removeMsg}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <a href="${root}"> <button type="button" class="btn btn-primary">쇼핑 계속하기</button></a>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function (e) {

        // 모달 reuslt
        var result = '<c:out value="${removeMsg}"/>';

        checkModal(result);

        function checkModal(result) {

            if (result === '') {
                return;
            }

            $("#orderRemoveResultModal").modal("show");
        }

        <!-- 주문 취소 -->
        $(".orderRemoveBtn").on("click", function (e) {
            e.preventDefault();

            var order_id = $(this).data("order-id");

            if (confirm("주문을 취소하시겠습니까?") == true) {
                $("#removeForm" + order_id).submit();
            } else  {
                return;
            }

        });
    });
</script>


<%@ include file="../includes/footer.jsp"%>