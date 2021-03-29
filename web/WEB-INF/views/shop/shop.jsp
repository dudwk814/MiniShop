<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2021-03-27
  Time: 오후 4:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>

<%@ include file="../includes/header2.jsp" %>

<div class="hero-wrap hero-bread" style="background-image: url('/resources/shop/images/bg_6.jpg');">
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="${root}">Home</a></span> <span>Shop</span></p>
                <h1 class="mb-0 bread">Shop</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-lg-10 order-md-last">
                <div class="row">
                    <c:forEach var="product" items="${productList}">
                        <div class="col-sm-12 col-md-12 col-lg-4 ftco-animate d-flex">
                            <div class="product d-flex flex-column">
                                <a href="/product/read?product_id=${product.product_id}" class="img-prod"><img class="img-fluid" src="/resources/shop/images/${product.product_url}" alt="Colorlib Template">
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
                                    <h3><a href="/product/read?product_id=${product.product_id}">${product.product_name}</a></h3>
                                    <div class="pricing">
                                        <p class="price"><span><fmt:setLocale value=""/><fmt:formatNumber type="currency"
                                                                                                          currencySymbol="￦"
                                                                                                          value="${product.product_price}"
                                                                                                          maxFractionDigits="0"/>원 </span></p>
                                    </div>
                                    <p class="bottom-area d-flex px-3">
                                        <a href="#" class="add-to-cart text-center py-2 mr-1" data-order-id="${product.product_id}" id="addCartBtn${product.product_id}"><span>Add to cart <i class="ion-ios-add ml-1"></i></span></a>
                                        <%--<a href="#" class="buy-now text-center py-2">Buy now<span><i class="ion-ios-cart ml-1"></i></span></a>--%>
                                    </p>
                                    <sec:authorize access="isAuthenticated()">
                                        <form method="post" action="/cart/add" id="addCartForm${product.product_id}">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                            <input type="hidden" name="userid" value="<sec:authentication property="principal.member.userid"/>"/>
                                            <input type="hidden" name="amount" value="1"/>
                                            <input type="hidden" name="product_name" value="${product.product_name}">
                                            <input type="hidden" name="product_id" value="${product.product_id}">
                                        </form>
                                    </sec:authorize>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul>
                                <li><a href="#">&lt;</a></li>
                                <li class="active"><span>1</span></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">&gt;</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-lg-2">
                <div class="sidebar">
                    <div class="sidebar-box-2">
                        <h2 class="heading">Price Range</h2>
                        <form method="post" class="colorlib-form-2">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="guests">Price from:</label>
                                        <div class="form-field">
                                            <i class="icon icon-arrow-down3"></i>
                                            <select name="people" id="people" class="form-control">
                                                <option value="#">1</option>
                                                <option value="#">200</option>
                                                <option value="#">300</option>
                                                <option value="#">400</option>
                                                <option value="#">1000</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="guests">Price to:</label>
                                        <div class="form-field">
                                            <i class="icon icon-arrow-down3"></i>
                                            <select name="people" id="people" class="form-control">
                                                <option value="#">2000</option>
                                                <option value="#">4000</option>
                                                <option value="#">6000</option>
                                                <option value="#">8000</option>
                                                <option value="#">10000</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    $(document).ready(function (e) {

        $(".add-to-cart").on("click", function (e) {
           e.preventDefault();

            <sec:authorize access="isAnonymous()">
                alert("로그인 해주세요.");
                return;
            </sec:authorize>

            var order_id = $(this).data("order-id");

            var form = $("#addCartForm" + order_id);

            if (confirm("상품을 장바구니에 추가하시겠습니까?") == true) {
                form.submit();
            } else {
                return;
            }

        });


    });
</script>

<%@ include file="../includes/footer.jsp" %>