<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-11-21
  Time: 오후 1:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>

<%@ include file="../includes/header2.jsp"%>

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

<section class="ftco-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 mb-5 ftco-animate">
                <a href="/resources/shop/images/${product.product_url}" class="image-popup prod-img-bg"><img src="/resources/shop/images/${product.product_url}" class="img-fluid" alt="Colorlib Template"></a>
            </div>
            <div class="col-lg-6 product-details pl-md-5 ftco-animate">
                <h3>${product.product_name}</h3>
                <p class="price"><span><fmt:setLocale value=""/><fmt:formatNumber type="currency" currencySymbol="￦" value="${product.product_price}" maxFractionDigits="0"/>원</span></p>
                <p><small>배송비 : 3000원 (5만원이상 주문 시 배송비 무료)</small></p>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                <p>On her way she met a copy. The copy warned the Little Blind Text, that where it came from it would have been rewritten a thousand times and everything that was left from its origin would be the word "and" and the Little Blind Text should turn around and return to its own, safe country. But nothing the copy said could convince her and so it didn’t take long until a few insidious Copy Writers ambushed her, made her drunk with Longe and Parole and dragged her into their agency, where they abused her for their.
                </p>
                <div class="row mt-4">
                    <div class="col-md-6">
                        <div class="form-group d-flex">
                        </div>
                    </div>
                    <div class="w-100"></div>
                </div>
                    <div class="w-100"></div>
                    <div class="form-group">
                        <form action="/cart/add" method="post" id="addCartForm">
                            <div class="input-group col-md-6 d-flex mb-3">
                                <input type="text" id="quantity" name="amount" class="quantity form-control input-number" value="1" min="1" max="100">&nbsp;&nbsp;
                                <input type="hidden" name="product_id" value="${product.product_id}">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                <input type="hidden" name="userid" value="${userid}">
                                <input id="addCartBtn" type="submit" class="btn btn-primary btn-lg" value="AddtoCart">
                            </div>

                        </form>
                    </div>
                </div>

            </div>
        </div>




        <div class="row mt-5">
            <div class="col-md-12 nav-link-wrap">
                <div class="nav nav-pills d-flex text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                    <a class="nav-link ftco-animate active mr-lg-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Description</a>

                    <a class="nav-link ftco-animate mr-lg-1" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Manufacturer</a>

                    <a class="nav-link ftco-animate" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">Reviews</a>

                </div>
            </div>
            <div class="col-md-12 tab-wrap">

                <div class="tab-content bg-light" id="v-pills-tabContent">

                    <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
                        <div class="p-4">
                            <h3 class="mb-4">${product.product_name}</h3>
                            <p>${product.product_desc}</p>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-day-2-tab">
                        <div class="p-4">
                            <h3 class="mb-4">Manufactured By Nike</h3>
                            <p>On her way she met a copy. The copy warned the Little Blind Text, that where it came from it would have been rewritten a thousand times and everything that was left from its origin would be the word "and" and the Little Blind Text should turn around and return to its own, safe country. But nothing the copy said could convince her and so it didn’t take long until a few insidious Copy Writers ambushed her, made her drunk with Longe and Parole and dragged her into their agency, where they abused her for their.</p>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-day-3-tab">
                        <div class="row p-4">
                            <div class="col-md-12">
                                <h3 class="mb-4">Reviews</h3>
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

                            <div class="review_paging">

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
                <h4 class="modal-title" id="myModalLabel">Review MODAL</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>Grade <span class="grade"></span></label>
                    <div class="starrr"></div>
                </div>
                <div class="form-group">
                    <label>리뷰 제목</label>
                    <input class="form-control" name="review_title" value="New Reply!!">
                </div>
                <div class="form-group">
                    <label>리뷰 본문</label>
                    <input class="form-control" name="review_content">
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
<script src="/resources/starrr.js"></script>
<script>


    $(document).ready(function (e) {


        var grade = 0;

        // starrr 레이팅
        $(".starrr").starrr({
            rating: grade,
            change : function (e, value) {
                if (value) {
                    console.log(value);
                    grade = value;
                }
            }
        });

        // 장바구니 추가 버튼
        var addBtn = $("#addCartBtn");
        // 장바구니 추가 폼
        var addCartForm = $("#addCartForm");


        var userid = '${userid}';
        var product_id_value = '<c:out value="${product.product_id}"/>';

        console.log("userid : " + userid);


        // 주문 수량 정합성 검증 이벤트
        addBtn.on("click", function (e) {
            e.preventDefault();


            // 주문 수량
            var amount = $("input[name='amount']").val();

            // 주문 수량 정합성 체크 정규식 (숫자만 가능)
            var regex= /^[0-9]/g;



            <sec:authorize access="isAnonymous()">
                alert("로그인 후 이용가능합니다.");
                return;
            </sec:authorize>

            // 주문 수량 정합성 검증
            if(amount <= 0) {
                alert("상품 수량을 0보다 크게 해주세요.");
                return;
            } else if (amount > 100) {
                alert("최대 100개까지만 주문 가능합니다.");
                return;
            } else if (!regex.test(amount)) {
                alert("올바른 상품 수량을 입력해주세요.");
                return;
            } else if (amount == "") {
                alert("올바른 상품 수량을 입력해주세요.");
                return;
            }
            addCartForm.submit();
        });


        console.log("product_id : " + product_id_value);



        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";

        // Ajax spring security header.
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
        });



        var reviewDIV = $(".review_wrapper");

        showList(1);

        // 화면 하단 리뷰 출력
        function showList(page) {

            reviewService.getList({product_id:product_id_value, page: page || 1}, function (reviewCnt, list) {

                console.log("reviewCnt : " + reviewCnt);
                console.log("list : " + list);

                if (page == -1) {
                    pageNum = Math.ceil(reviewCnt/10.0);
                    showList(pageNum);
                    return ;
                }
                var str = "";

                if (list == null || list.length == 0) {
                    reviewDIV.html("");
                    return ;
                }

                for (var i = 0, len = list.length || 0; i < len; i++) {
                    str += "<div class='review' data-review_no='" + list[i].review_no + "'>";
                    str += "    <div class='desc'>";
                    str += "    <p class='star' style='margin-bottom: 0px;'>";
                    for (var k = 0; k < list[i].review_star; k++) {
                        str += "<i class='fa fa-star'></i>";
                    }
                    str += "    </p><div class='review-div'><span class='text-left'>" + list[i].userid + "&nbsp; | &nbsp;" + list[i].review_title + "</span>";
                    str += "        &nbsp; | &nbsp; <span>" + reviewService.displayTime(list[i].review_date) + "</span><img src='/resources/shop/images/gallery-1.jpg' style='width: 100px; height: 100px;' alt='...' class='img-thumbnail float-right'></div>";

                    str += "<p>" + list[i].review_content + "</p>";
                    str += "</div></div>";

                }

                reviewDIV.html(str);

                showReviewPage(reviewCnt);
            });
        } //end showList

        var modal = $(".modal");
        var modalInputReview_title = modal.find("input[name='review_title']");
        var modalInputReview_content = modal.find("input[name='review_content']");
        var modalInputUserId = modal.find("input[name='userid']");
        var modalInputReview_Date = modal.find("input[name='review_date']");
        var modalInputUploadFile = modal.find("input[name='uploadFile']");
        var modalInputStarValue = modal.find("select[name='review_star']");

        var modalModBtn = $("#modalModBtn");
        var modalRemoveBtn = $("#modalRemoveBtn");
        var modalRegisterBtn = $("#modalRegisterBtn");

        $("#regBtn").on("click", function (e) {

            <sec:authorize access="isAuthenticated()">
            modal.find("input").val("");
            modal.find(modalInputUserId).val(userid);
            modalInputReview_Date.closest("div").hide();
            modal.find("button[id != 'modalCloseBtn']").hide();

            modalRegisterBtn.show();

            $(".modal").modal("show");

            return ;
            </sec:authorize>

            alert("로그인 해주세요");
        });

        var regex = new RegExp("(.*?)\.(JPG|jpg|jpeg|JPEG|png|PNG|gif|GIF|bmp|BMP)$"); // 파일 확장자 정규식 (리뷰 이미지 파일 체크)
        var maxSize = 20971520; // 20MB

        // 리뷰 이미지 업로드 파일 체크 함수
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

        // 리뷰 이미지 업로드
        $("input[type='file']").change(function (e) {

            console.log(modalInputUploadFile);

            var formData = new FormData(); // form 생성

            var inputFile = $("input[name='uploadFile']");

            var files = inputFile[0].files;

            for (var i = 0; i < files.length; i++) {

                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }
                formData.append("uploadFile", files[i]);
            }

            $.ajax({
                url: '/uploadAjaxAction',
                processData : false,
                contentType : false,
                data: formData,
                type : 'POST',
                dataType : 'json',
                success : function (result) {
                    console.log(result);
                    showUploadResult(result);
                }
            }); // end ajax
        });

        // 리뷰 이미지 input추가 (모달 창)
        function showUploadResult(uploadResultArr) {

            if(!uploadResultArr || uploadResultArr.length == 0){ return; }

            var uploadResult = $(".uploadResult");

            var str = "";

            $(uploadResultArr).each(function (i, obj) {

                if (obj.image) {
                    var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
                    str += "<input type='hidden' name='uuid' value='" + obj.uuid + "'><br/>";
                    str += "<input type='hidden' name='uploadPath' value='" + obj.uploadPath + "'><br/>";
                    str += "<input type='hidden' name='fileName' value='" + obj.fileName + "'><br/>";
                    str += "<input type='hidden' name='fileType' value='I'><br/>";
                }

                uploadResult.append(str);
            });
        }

        // 리뷰 작성
        modalRegisterBtn.on("click", function (e) {

            if (modalInputStarValue.val() == 0) {
                alert("별점을 선택해주세요.");
                return;
            }

            review = {
                review_title: modalInputReview_title.val(),
                review_content: modalInputReview_content.val(),
                userid : modalInputUserId.val(),
                product_id: product_id_value,
                review_star : modalInputStarValue.val()
            };

            reviewService.add(review, function (result) {
                alert(result);

                modal.find("input").val("");
                modal.modal("hide");

                showList(-1);
            });
        });

        // 리뷰 조회 클릭 이벤트
        $(".review_wrapper").on("click", "div", function (e) {

            var review_no = $(this).data("review_no");

            reviewService.get(review_no, function (review) {

                modalInputReview_content.val(review.review_content);
                modalInputReview_title.val(review.review_title);
                modalInputUserId.val(review.userid);
                modalInputReview_Date.val(reviewService.displayTime(review.review_date)).attr("readonly", "readonly");
                modalInputStarValue.val(review.review_star);
                modal.data("review_no", review.review_no);

                modal.find("button[id != 'modalCloseBtn']").hide();
                <sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')">
                modalModBtn.show();
                modalRemoveBtn.show();
                </sec:authorize>

                $(".modal").modal("show");
            });
        });

        // 리뷰 수정
        modalModBtn.on("click", function (e) {

            var review = {
                review_no : modal.data("review_no"),
                review_title : modalInputReview_title.val(),
                review_content : modalInputReview_content.val()
            };

            reviewService.update(review, function (result) {

                alert(result);
                modal.modal("hide");
                showList(1);
            });
        });

        // 리뷰 삭제
        modalRemoveBtn.on("click", function (e) {

            var review_no = modal.data("review_no");

            reviewService.remove(review_no, function (result) {
                alert(result);
                modal.modal("hide");
                showList(1);
            });
        });

        var pageNum = 1;
        var reviewPageFooter = $(".review_paging");

        function showReviewPage(reviewCnt) {

            var endNum = Math.ceil(pageNum / 5.0) * 10;
            var startNum = endNum - 9;

            var prev = startNum != 1;
            var next = false;

            if (endNum * 5 >= reviewCnt) {
                endNum = Math.ceil(reviewCnt / 5.0);
            }

            if (endNum * 5 < reviewCnt) {
                next = true;
            }

            var str = "<ul class='pagination float-right'>";

            if (prev) {
                str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1)+"'>Previous</a></li>";
            }

            for (var i = startNum; i <= endNum; i++) {

                var active = pageNum == i ? "active" : "";

                str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
            }

            if (next) {
                str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + "'>Next</a></li>";
            }

            str += "</ul></div>";

            console.log(str);

            reviewPageFooter.html(str);
        }

        reviewPageFooter.on("click", "li a", function (e) {
            e.preventDefault();

            var targetNum = $(this).attr("href");

            console.log("targetPageNum = " + targetNum);

            pageNum = targetNum;

            showList(pageNum);
        });

    });
</script>
<%@ include file="../includes/footer.jsp"%>