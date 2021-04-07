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
                <p class="breadcrumbs"><span class="mr-2"><a href="${root}">Home</a></span> <span><a href="/shop">Store</a></span></p>
                <h1 class="mb-0 bread">Store</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section bg-light">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-lg-10 order-md-last">
                <div class="row">
                    <c:choose>
                        <c:when test="${fn:length(productList) >= 1}">
                            <c:forEach var="product" items="${productList}">
                                <div class="col-sm-12 col-md-12 col-lg-4 ftco-animate d-flex">
                                    <div class="product d-flex flex-column">
                                        <a href="/product/read?product_id=${product.product_id}&pageNum=${num}&amount=9&price_from=${searchMaker.cri.price_from}&price_to=${searchMaker.cri.price_to}&brand=${searchMaker.cri.brand}" class="img-prod"><img class="img-fluid" src="/resources/shop/images/${product.product_url}" alt="Colorlib Template">
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
                                            <h3><a href="/product/read?product_id=${product.product_id}&pageNum=${num}&amount=9&price_from=${searchMaker.cri.price_from}&price_to=${searchMaker.cri.price_to}&brand=${searchMaker.cri.brand}">${product.product_name}</a></h3>
                                            <div class="pricing">
                                                <p class="price"><span><fmt:setLocale value=""/><fmt:formatNumber type="currency"
                                                                                                                  currencySymbol="￦"
                                                                                                                  value="${product.product_price}"
                                                                                                                  maxFractionDigits="0"/>원 </span></p>
                                            </div>
                                            <p class="bottom-area d-flex px-3">
                                                <a href="#" class="add-to-cart text-center py-2 mr-1" data-order-id="${product.product_id}" id="addCartBtn${product.product_id}"><span>Add to cart <i class="ion-ios-add ml-1"></i></span></a>
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
                        </c:when>
                        <c:when test="${fn:length(productList) == 0}">
                            <div class="col-sm-12 col-md-12 col-lg-12 d-flex">
                                <div class="product d-flex flex-column text-center">
                                    <span class="fa fa-ban fa-5x"></span>
                                    <h5>판매 중인 상품이 없습니다. 조건을 변경해 보세요!</h5>
                                </div>
                            </div>
                        </c:when>

                    </c:choose>

                </div>
                <div class="row mt-5">
                    <div class="col text-center">
                        <div class="block-27">
                            <ul>
                                <c:if test="${searchMaker.prev}">
                                    <li><a href="${root}shop?pageNum=${searchMaker.startPage - 1}&amount=9">&lt;</a></li>
                                </c:if>

                                <c:forEach var="num" begin="${searchMaker.startPage}" end="${searchMaker.endPage}">
                                    <li class="active ${searchMaker.cri.pageNum == num ? "active":""}"><a href="/shop?pageNum=${num}&amount=9&price_from=${searchMaker.cri.price_from}&price_to=${searchMaker.cri.price_to}&brand=${searchMaker.cri.brand}">${num}</a></li>
                                </c:forEach>

                                <c:if test="${searchMaker.next}">
                                    <li> <a class="page-link" href="${root}shop?pageNum=${searchMaker.endPage + 1}&amount=9">&gt;</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 col-lg-2">
                <div class="sidebar">
                    <div class="sidebar-box-2">
                        <h2 class="heading">Price Range</h2>
                        <form method="get" action="/shop" class="colorlib-form-2">
                            <input type="hidden" name="amount" value="9">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="price_from">Price from:</label>
                                        <div class="form-field">
                                            <i class="icon icon-arrow-down3"></i>
                                            <select name="price_from" id="price_from" class="form-control">
                                                <option value="0" <c:out value="${searchMaker.cri.price_to == 0 ? 'selected' : ''}"/>>전체 금액</option>
                                                <option value="10000" <c:out value="${searchMaker.cri.price_from == 10000 ? 'selected' : ''}"/>>10000원</option>
                                                <option value="20000" <c:out value="${searchMaker.cri.price_from == 20000 ? 'selected' : ''}"/>>20000원</option>
                                                <option value="30000" <c:out value="${searchMaker.cri.price_from == 30000 ? 'selected' : ''}"/>>30000원</option>
                                                <option value="40000" <c:out value="${searchMaker.cri.price_from == 40000 ? 'selected' : ''}"/>>40000원</option>
                                                <option value="50000" <c:out value="${searchMaker.cri.price_from == 50000 ? 'selected' : ''}"/>>50000원</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="price_to">Price to:</label>
                                        <div class="form-field">
                                            <i class="icon icon-arrow-down3"></i>
                                            <select name="price_to" id="price_to" class="form-control">
                                                <option value="0" <c:out value="${searchMaker.cri.price_to == 0 ? 'selected' : ''}"/>>전체 금액</option>
                                                <option value="20000" <c:out value="${searchMaker.cri.price_to == 20000 ? 'selected' : ''}"/>>20000원</option>
                                                <option value="30000" <c:out value="${searchMaker.cri.price_to == 30000 ? 'selected' : ''}"/>>30000원</option>
                                                <option value="60000" <c:out value="${searchMaker.cri.price_to == 60000 ? 'selected' : ''}"/>>60000원</option>
                                                <option value="80000" <c:out value="${searchMaker.cri.price_to == 80000 ? 'selected' : ''}"/>>80000원</option>
                                                <option value="100000" <c:out value="${searchMaker.cri.price_to == 100000 ? 'selected' : ''}"/>>100000원</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="brand">Brand</label>
                                        <div class="form-field">
                                            <i class="icon icon-arrow-down3"></i>
                                            <select name="brand" id="brand" class="form-control">
                                                <option value="" <c:out value="${searchMaker.cri.brand == null ? 'selected' : ''}"/>>전체 상품</option>
                                                <option value="VANS" <c:out value="${searchMaker.cri.brand == 'VANS' ? 'selected' : ''}"/>>VANS</option>
                                                <option value="BROOKS" <c:out value="${searchMaker.cri.brand == 'BROOKS' ? 'selected' : ''}"/>>BROOKS</option>
                                                <option value="자체 생산" <c:out value="${searchMaker.cri.brand == '자체 생산' ? 'selected' : ''}"/>>자체 생산</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="sort">Sort</label>
                                        <div class="form-field">
                                            <i class="icon icon-arrow-down3"></i>
                                            <select name="sort" id="sort" class="form-control">
                                                <option value="" <c:out value="${searchMaker.cri.sort == null ? 'selected' : ''}"/>>정렬 없음</option>
                                                <option value="asc" <c:out value="${searchMaker.cri.sort == 'asc' ? 'selected' : ''}"/>>낮은 가격순</option>
                                                <option value="desc" <c:out value="${searchMaker.cri.sort == 'desc' ? 'selected' : ''}"/>>높은 가격순</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <a type="reset" href="/shop" id="resetBtn" class="btn btn-lg btn-outline-dark" onclick="reset()">초기화</a>
                                    <button type="submit" class="btn btn-lg btn-outline-dark">검색</button>
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

        function reset() {
            location.href = "/shop";
        }


    });
</script>

<%@ include file="../includes/footer.jsp" %>