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
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
                    <%--<div class="col-md-12">
                        <p>${product.product_desc}</p>
                    </div>--%>
                <div class="col-md-12">
                   <h4> <p class="price">
                   <span><fmt:setLocale value=""/><fmt:formatNumber type="currency" currencySymbol="￦" value="${product.product_price}" maxFractionDigits="0"/>원 </span></p></h4>
                </div>
                <span class="col-md-12">배송비 : 3,000원 (5만원 이상 주문 시 배송비 무료) </span>
            </div><!-- end row -->

            <div class="col-md-12">
                <form method="post" action="/cart/add" id="productForm">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="product_id" value="${product.product_id}">
                    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')">
                        <input type="hidden" name="userid" value='<sec:authentication property="principal.member.userid"/>'/>
                    </sec:authorize>
                    <div class="input-group h-25 d-inline-block">
                        <label style="color: black">수량</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="number" name="amount" value="1" style="width: 60px; color: black; text-align: center" >
                    </div >

                    <div>
                        &nbsp;
                    </div>
                    <div>
                        &nbsp;
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn-lg btn-primary"><span class="icon-shopping_cart"></span>장바구니에 담기</button> &nbsp;&nbsp;
                       <%-- <button type="button" id="orderBtn" class="btn-lg btn-info">바로 구매</button>--%>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
</section>

<div class="w-100"/>
<section>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <i class="fa fa-comments fa -fw"></i> Review
                <span class="float-right"><a href="#" class="active">최신순</a>&nbsp; | &nbsp;<a href="#">추천순</a></span>
            </div>
            <%-- /.card - header --%>
            <div class="card-body">
                <ul class="chat">
                    <%-- start review --%>
                    <li class="left clearfix" data-rview_no="4">
                        <div>
                            <div class="header">
                                <strong class="primary-font">user00</strong>
                            </div>
                        </div>
                    </li>
                </ul>

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
<script src="/resources/review.js"></script>
<script>
    $(document).ready(function (e) {
        var form = $("#productForm");

        var orderBtn = $("#orderBtn");

        orderBtn.on("click", function (e) {

            form.attr("action", "/order/orderForm");
            form.attr("method", "get");

            form.submit();
        });


        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";

        // Ajax spring security header.
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
        });

        var product_id_value = '<c:out value="${product.product_id}"/>';

        reviewServie.getList({product_id:product_id_value, page:1}, function (list) {
            for (var i = 0, len = list.length || 0; i < len; i++) {
                console.log(list[i]);
            }
        });

        /*reviewServie.remove(3, function (count) {

            console.log(count);

            if(count === "success") {
                alert("REMOVED");
            }
        }, function (err) {
            alert('ERROR...');
        });*/

        /*reviewServie.update({
            review_no : 4,
            review_title : "review",
            review_content: "review"
        }, function (result) {
            alert("수정 완료");
        });*/

        reviewServie.get(4, function (data) {
            console.log(data);
        })
    });
</script>
<script>
</script>


<%@ include file="../includes/footer.jsp"%>