<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-11-24
  Time: 오후 6:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>

<%@ include file="../includes/header2.jsp"%>

<div class="hero-wrap hero-bread" style="background-image: url('/resources/shop/images/bg_6.jpg');">
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="${root}">Home</a></span> <span>Shop</span></p>
                <h1 class="mb-0 bread">Admin Page</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section">
    <div class="row mt-5">
        <div class="col-md-12 nav-link-wrap">
            <div class="nav nav-pills d-flex text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <a class="nav-link ftco-animate active mr-lg-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">회원관리</a>

                <a class="nav-link ftco-animate mr-lg-1" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">상품관리</a>

                <a class="nav-link ftco-animate" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">주문관리</a>

            </div>
        </div>
    </div>
    <div class="col-md-12 tab-wrap">

        <div class="tab-content bg-light" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
                <div class="p-4">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">회원 이 름</th>
                            <th scope="col">회원 아이디</th>
                            <th scope="col">가입 일</th>
                            <th scope="col">회원 등급</th>
                            <th scope="col">회원 등급 변경</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="member" items="${memberList}" varStatus="idx">
                        <tr>
                            <td>${idx.count}</td>
                            <td>${member.userName}</td>
                            <td>${member.userid}</td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${member.regDate}"/></td>
                            <td>${member.authList[0].auth}</td>
                            <td>
                                <form action="/admin/member/authModify" method="post" id="memberAuthModifyForm${member.userid}">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                    <input type="hidden" name="userid" value="${member.userid}">
                                    <div class="input-group mb-3">
                                        <select name="auth" class="custom-select" id="authSelect${member.userid}">
                                            <option name="auth" value="" selected>Choose...</option>
                                            <option name="auth" value="ROLE_ADMIN">ADMIN</option>
                                            <option name="auth" value="ROLE_MEMBER">MEMBER</option>
                                        </select>
                                        <div class="input-group-append">
                                            <button id="memberAuthModifyBtn" class="btn btn-success authBtn" data-user-id="${member.userid}" type="submit">권환 변경</button>
                                        </div>
                                    </div>
                                </form>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-day-2-tab">
                <div class="p-4">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">상품 번호</th>
                            <th scope="col">상품 이름</th>
                            <th scope="col">상품 가격</th>
                            <th scope="col">브랜드</th>
                            <th scope="col">상품 삭제</th>
                        </tr>
                        </thead>
                        <tbody id="product_tbody">
                            <c:forEach items="${productList}" var="product" varStatus="idx">
                                <tr data-product-id="${product.product_id}" >
                                    <td><img src="/resources/shop/images/${product.product_url}" class="img-thumbnail" style="width: 150px; height: 200px;"/></td>
                                    <td>${product.product_id}</td>
                                    <td><a href="/admin/product/modify?product_id=${product.product_id}"> ${product.product_name}</a></td>
                                    <td><fmt:setLocale value=""/><fmt:formatNumber type="currency" currencySymbol="￦" value="${product.product_price}" maxFractionDigits="0"/>원</td>
                                    <td>${product.brand}</td>
                                    <td>
                                        <form action="/admin/product/remove" id="productRemoveForm${product.product_id}" method="post">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                            <input type="hidden" name="product_id" value="${product.product_id}">
                                            <input type="submit" class="btn btn-outline-danger productRemoveBtn" data-product-id="${product.product_id}" value="상품 삭제">
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <a href="/admin/product/insertProduct" class="btn btn-primary">상품등록</a>
                </div>
            </div>
            <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-day-3-tab">
                <div class="row p-4">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">주문 ID</th>
                            <th scope="col">주문자 ID</th>
                            <th scope="col">주문날짜</th>
                            <th scope="col">결제금액</th>
                            <th scope="col">결제방법</th>
                            <th scope="col">결제상태</th>
                            <th scope="col">결제취소</th>
                        </tr>
                        </thead>
                        <tbody id="order_tbody">
                            <c:forEach var="order" items="${orderList}" varStatus="idx">
                                <tr data-order-id = "${order.order_id}">
                                    <td>${idx.count}</td>
                                    <td>${order.order_id}</td>
                                    <td>${order.userid}</td>
                                    <td><fmt:formatDate value="${order.order_date}" pattern="yyyy-MM-dd"/></td>
                                    <td><fmt:setLocale value=""/><fmt:formatNumber type="currency" currencySymbol="￦" value="${order.sum_price}" maxFractionDigits="0"/>원</td>
                                    <td>${order.payment_option}</td>
                                    <td>입금 전</td>
                                    <td>
                                        <form action="/admin/order/cancel" method="post" id="orderCancelForm${order.order_id}">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                            <input type="hidden" name="order_id" value="${order.order_id}">
                                            <input type="submit" class="btn btn-outline-danger cancelBtn" data-order-id="${order.order_id}" value="주문 취소">
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Modal Title</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body"><h3>처리가 완료되었습니다.</h3></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-link" id="closeBtn" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {

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


        var memberAuthModifyBtn = $(".authBtn");

        var productRemoveBtn = $(".productRemoveBtn");

        var orderCancelBtn = $(".cancelBtn"); // 주문 취소 버튼 변수


        memberAuthModifyBtn.on("click", function (e) {  // 회원 권한 등급 변경 체크 함수

            e.preventDefault();

            var user_id = $(this).data("user-id");

            console.log(user_id);

            if ($("#authSelect" + user_id + " option:selected").val() == "") {
                alert("옵션을 선택해주세요.");
                return;
            }

            if(confirm("회원권한을 변경하시겠습니까?") == true) {
                $("#memberAuthModifyForm" + user_id).submit();
            } else {
                return;
            }
        });

        productRemoveBtn.on("click", function (e) {     // 상품 삭제 체크 함수
            e.preventDefault();

            var product_id = $(this).data("product-id");

            console.log(product_id)

            if (confirm("제품을 삭제하시겠습니까?") == true) {
                $("#productRemoveForm" + product_id).submit();
            } else {
                return;
            }
        });

        orderCancelBtn.on("click", function (e) {       // 주문 취소 체크 함수
            e.preventDefault();

            var order_id = $(this).data("order-id");

            console.log(order_id);

            if (confirm("주문을 취소하시겠습니까?") == true) {
                $("#orderCancelForm" + order_id).submit();
            } else {
                return;
            }

            return;

        })

        var regex = new RegExp("(.*?)\.(JPG|jpg|jpeg|JPEG|png|PNG|gif|GIF|bmp|BMP)$"); // 파일 확장자 정규식
        var maxSize = 20971520; // 20MB

        // 업로드 파일 검사 함수
        function checkExtension(fileName, fileSize) {

            if (fileSize >= maxSize) {
                alert("파일 사이즈 초과입니다.");
                return false;
            }

            if (!regex.test(fileName)) {
                alert("이미지 파일만 업로드가 가능합니다.");
                return false;
            }

            return true;
        }

        // 모달 창에서 이미지 선택 시 이미지 조회 함수
        $("#product_img").change(function () {
            if (this.files && this.files[0]) {

                if (!checkExtension(this.files[0].name, this.files[0].size)) {
                    return;
                };
                var reader = new FileReader();
                reader.onload = function (data) {
                    $(".select-img img").attr("src", data.target.result).width(250);
                }
                reader.readAsDataURL(this.files[0]);
            }
        });

        var modal = $(".modal");

    });
</script>

<%@ include file="../includes/footer.jsp"%>