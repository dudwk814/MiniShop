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
                                <form action="/admin/member/authModify" method="post" id="memberAuthModifyForm">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                    <input type="hidden" name="userid" value="${member.userid}">
                                    <div class="input-group mb-3">
                                        <select name="auth" class="custom-select" >
                                            <option name="auth" value="${member.authList[0].auth}" selected>Choose...</option>
                                            <option name="auth" value="ROLE_ADMIN">ADMIN</option>
                                            <option name="auth" value="ROLE_MEMBER">MEMBER</option>
                                        </select>
                                        <div class="input-group-append">
                                            <button id="memberAuthModifyBtn" class="btn btn-success authBtn" type="submit">권환 변경</button>
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
                            <th scope="col">제품 삭제</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${productList}" var="product" varStatus="idx">
                                <tr>
                                    <td><img src="/resources/shop/images/${product.product_url}" class="img-thumbnail" style="width: 150px; height: 200px;"/></td>
                                    <td>${product.product_id}</td>
                                    <td><a href="/product/read?product_id=${product.product_id}"> ${product.product_name}</a></td>
                                    <td><fmt:setLocale value=""/><fmt:formatNumber type="currency" currencySymbol="￦" value="${product.product_price}" maxFractionDigits="0"/>원</td>
                                    <td>${product.brand}</td>
                                    <td>
                                        <form action="/admin/product/remove" id="productRemoveForm" method="post">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                            <input type="hidden" name="product_id" value="${product.product_id}">
                                            <input type="submit" class="btn btn-outline-danger productRemoveBtn" value="제품 삭제">
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <a href="/admin/product/insertProduct" class="btn btn-primary">상품</a>
                    <button type="button" class="btn btn-outline-info btn-lg" id="productRegBtn">상품등록</button>
                </div>
            </div>
            <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-day-3-tab">
                <div class="row p-4">
                    <div class="col-md-12">
                        <h3 class="mb-4">23 Reviews</h3>
                        <button type="button" class="btn btn-link btn-lg float-right" id="regBtn">리뷰작성</button>
                        <div class="review_wrapper">
                            <div class="review">
                                <div class="user-img" style="background-image: url(images/person_1.jpg)"></div>
                                <div class="desc">
                                    <h4>
                                        <span class="text-left">Jacob Webb</span>
                                        <span class="text-right">14 March 2018</span>
                                    </h4>
                                    <p class="star">
                                                        <span>
                                                            <i class="ion-ios-star-outline"></i>
                                                            <i class="ion-ios-star-outline"></i>
                                                            <i class="ion-ios-star-outline"></i>
                                                            <i class="ion-ios-star-outline"></i>
                                                            <i class="ion-ios-star-outline"></i>
                                                        </span>
                                        <%-- <span class="text-right"><a href="#" class="reply"><i class="icon-reply"></i></a></span>--%>
                                    </p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrov</p>
                                </div>
                            </div>
                        </div>
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
                <h4 class="modal-title" id="myModalLabel">Product MODAL</h4>
            </div>
            <form action="/admin/product/insertProduct" id="productRegisterForm" method="post" enctype="multipart/form-data">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <div class="modal-body">
                    <div class="form-group">
                        <label>제품명</label>
                        <input class="form-control" name="product_name" placeholder="제품명">
                    </div>
                    <div class="form-group">
                        <label>제품가격</label>
                        <input class="form-control" name="product_price" placeholder="제품가격">
                    </div>
                    <div class="form-group">
                        <label>브랜드</label>
                        <input class="form-control" name="brand" placeholder="브랜드">
                    </div>
                    <div class="form-group">
                        <label>제품설명</label>
                        <textarea class="form-control" name="product_desc" placeholder="제품설명"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="product_img">사진 첨부</label>
                        <input type="file" class="form-control-file" name="product_photo" id="product_img">
                        <div class="select-img"><img src=""/></div>
                    </div>

                    <%=request.getRealPath("/") %>
                </div>

                <div class="modal-footer">
                    <button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
                    <button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
                    <button id="modalRegisterBtn" type="submit" class="btn btn-primary">Register</button>
                    <button id="modalCloseBtn" type="button" class="btn btn-info">Close</button>
                </div>
            </form>
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

<script>

</script>
<script>
    $(document).ready(function () {


        var memberAuthModifyBtn = $(".authBtn");
        var memberAuthModifyForm = $("#memberAuthModifyForm");

        var productRemoveBtn = $(".productRemoveBtn");
        var productRemoveForm = $("#productRemoveForm");

        var productRegisterForm = $("#productRegisterForm");

        memberAuthModifyBtn.on("click", function (e) {

            e.preventDefault();

            if(confirm("회원권한을 변경하시겠습니까?") == true) {
                memberAuthModifyForm.submit();
            } else {
                return;
            }
        });

        productRemoveBtn.on("click", function (e) {
            e.preventDefault();

            if (confirm("제품을 삭제하시겠습니까?") == true) {
                productRemoveForm.submit();
            } else {
                return;
            }
        });

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
        var modalInputReview_title = modal.find("input[name='review_title']");
        var modalInputReview_content = modal.find("input[name='review_content']");
        var modalInputUserId = modal.find("input[name='userid']");
        var modalInputReview_Date = modal.find("input[name='review_date']");

        var modalModBtn = $("#modalModBtn");
        var modalRemoveBtn = $("#modalRemoveBtn");
        var modalRegisterBtn = $("#modalRegisterBtn");
        var modalCloseBtn = $("#modalCloseBtn");

        $("#productRegBtn").on("click", function (e) {


            modal.find("input").val("");
            modal.find(modalInputUserId).val();
            modalInputReview_Date.closest("div").hide();
            modal.find("button[id != 'modalCloseBtn']").hide();

            modalRegisterBtn.show();

            $(".modal").modal("show");
        });


        // 모달창에서 close 버튼 누를 경우 모달창을 닫음
        modalCloseBtn.on("click", function (e) {

            modal.modal("hide");
        });

       /* // 모달창에서 register 버튼을 누를 경우 상품 등록을 수행
        modalRegisterBtn.on("click", function () {

            productRegisterForm.submit();

        });*/
    });
</script>

<%@ include file="../includes/footer.jsp"%>