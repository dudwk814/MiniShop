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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<section id="home-section" class="d-flex justify-content-center col-lg-12">

    <div class="col-lg-9">
        <div>
            <div class="card">
                <div class="card-header">
                    <span class="lnr lnr-bubble"> Review</span>&nbsp;<span id="replyCnt" class="badge badge-info">${board.replyCnt}</span>
                    <button class="btn btn-link float-right" id="regBtn">New</button>
                </div>
                <div class="card-body">
                    <ul class="chat list-group-flush">
                        <li class="left clearfix" data-review_no='12'>
                            <div>
                                <div class="header">
                                    <strong class="font-weight-bold">user00</strong>
                                    <small class="float-right text-muted">2020-10-12</small>
                                </div>
                                <p>Good Job</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
        <div class="float-right">

        </div>
    </div>
    </div>
    </div>
    </div>
</section>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Review MODAL</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>리뷰 제목</label>
                    <input class="form-control" name="review_title" value="New Reply!!">
                </div>
                <div class="form-group">
                    <label>리뷰 본문</label>
                    <input class="form-control" name="review_content" value="New Reply!!">
                </div>
                <div class="form-group">
                    <label>작성자</label>
                    <input class="form-control" name="userid" value="replyer" readonly>
                </div>
                <div class="form-group">
                    <label>작성날짜</label>
                    <input class="form-control" name="review_date" value="">
                </div>
            </div>
            <div class="modal-footer">
                <button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
                <button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
                <button id="modalRegisterBtn" type="button" class="btn btn-primary">Register</button>
                <button id="modalCloseBtn" type="button" class="btn btn-info">Close</button>
            </div>
        </div>
    </div>
</div>

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

        var reviewUL = $(".chat");

        showList(1);

        function showList(page) {

            reviewService.getList({product_id:product_id_value, page: page || 1}, function (list) {

                var str = "";

                if (list == null || list.length == 0) {
                    reviewUL.html("");
                    return ;
                }

                for (var i = 0, len = list.length || 0; i < len; i++) {
                    str += "<li class='left clearfix list-group-item' data-review_no='"+list[i].review_no + "'>";
                    str += "    <div><div class='header'><small class='font-weight-bolder'>" + list[i].userid + "</small> &nbsp; <small class='font-weight-bolder'>" + list[i].review_title + "</small>";
                    str += "    <small class='float-right text-muted'>"+ reviewService.displayTime(list[i].review_date)+ "</small></div>";
                    str += "    <p>"+list[i].review_content+"</p></div></li>";
                }

                reviewUL.html(str);
            });
        } //end showList

        var modal = $(".modal");
        var modalInputReview_title = modal.find("input[name='review_title']");
        var modalInputReview_content = modal.find("input[name='review_content']");
        var modalInputUserId = modal.find("input[name='userid']");
        var modalInputReview_Date = modal.find("input[name='review_date']");

        var modalModBtn = $("#modalModBtn");
        var modalRemoveBtn = $("#modalRemoveBtn");
        var modalRegisterBtn = $("#modalRegisterBtn");

        $("#regBtn").on("click", function (e) {

            <sec:authorize access="isAuthenticated()">
            modal.find("input").val("");
            modal.find(modalInputUserId).val("<sec:authentication property='principal.member.userid'/>");
            modalInputReview_Date.closest("div").hide();
            modal.find("button[id != 'modalCloseBtn']").hide();

            modalRegisterBtn.show();

            $(".modal").modal("show");

            return ;
            </sec:authorize>

            alert("로그인 해주세요");
        });

        modalRegisterBtn.on("click", function (e) {

            review = {
                review_title: modalInputReview_title.val(),
                review_content: modalInputReview_content.val(),
                userid : modalInputUserId.val(),
                product_id: product_id_value,
            };

            reviewService.add(review, function (result) {
                alert(result);

                modal.find("input").val("");
                modal.modal("hide");

                showList(1);

            });

        });


    });
</script>
<script>
</script>


<%@ include file="../includes/footer.jsp"%>