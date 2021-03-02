<script>


    $(document).ready(function (e) {


    var grade = 5;

    // starrr 레이팅
    $(".starrr").starrr({
    rating: grade,
    change: function (e, value) {
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
    var regex = /^[0-9]/g;


    <sec:authorize access="isAnonymous()">
    alert("로그인 후 이용가능합니다.");
    return;
    </sec:authorize>

    // 주문 수량 정합성 검증
    if (amount <= 0) {
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

    reviewService.getList({product_id: product_id_value, page: page || 1}, function (reviewCnt, list) {

    console.log("reviewCnt : " + reviewCnt);
    console.log("list : " + list);

    if (page == -1) {
    pageNum = Math.ceil(reviewCnt / 10.0);
    showList(pageNum);
    return;
}
    var str = "";

    if (list == null || list.length == 0) {
    reviewDIV.html("");
    return;
}


    for (var i = 0, len = list.length || 0; i < len; i++) {
    str += "<div class='review  row justify-content-start' data-review_no='" + list[i].review_no + "'>";
    str += "    <div class='desc col-8 float-left'>";
    str += " &nbsp;&nbsp; <div class='grade_div'>";

    for (var j = 0; j < list[i].grade; j++) {
    str += "    <i class='fa fa-star'></i>";
}
    str += "        &nbsp;&nbsp;<span>" + list[i].userid + "</span>&nbsp;&nbsp;"
    str += "                    <span>" + reviewService.displayTime(list[i].review_date) + "</span>";
    str += "            </div>";
    str += "            <details><summary><strong>" + list[i].review_title + "</strong></summary>";
    str += "                    <p><span>" + list[i].review_content + "</span>";
    if (list[i].userid == userid) {
    str += "                        <button type='button' class='btn btn-info float-right' id='reviewModBtn' data-grade='" + list[i].grade + "' data-review_no='" + list[i].review_no + "'>수정</button>";
}
    str += "</p></details>";
    str += "    </div>";
    str += "<a href='/resources/shop/images/gallery-1.jpg' data-lightbox='example-set" + i + "' ><img src='/resources/shop/images/gallery-1.jpg' style='width: 100px; height: 100px;' alt='...' class='rounded  img-fluid float-right'></a>";
    str += "</div>";

}

    reviewDIV.html(str);


    showReviewPage(reviewCnt);
});
} //end showList


    /**
     * 모달 관련 변수
     **/
    var modal = $(".modal");
    var modalInputReview_title = modal.find("input[name='review_title']");
    var modalInputReview_content = modal.find("input[name='review_content']");
    var modalInputUserId = modal.find("input[name='userid']");
    var modalInputReview_Date = modal.find("input[name='review_date']");

    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");
    var modalCloseBtn = $("#modalCloseBtn");

    /**
     * 리뷰 이미지 Array
     **/

    var review_image = new Array();

    /**
     * 리뷰 모달
     **/
    $("#regBtn").on("click", function (e) {

    console.log("userid : " + userid);

    <sec:authorize access="isAuthenticated()">
    modal.find("input").val("");
    modal.find(modalInputUserId).val(userid);
    modalInputReview_Date.closest("div").hide();
    modal.find("button[id != 'modalCloseBtn']").hide();

    modalRegisterBtn.show();

    $(".modal").modal("show");

    return;
    </sec:authorize>

    alert("로그인 해주세요");
});

    var regex = new RegExp("(.*?)\.(JPG|jpg|jpeg|JPEG|png|PNG|gif|GIF|bmp|BMP)$"); // 파일 확장자 정규식 (리뷰 이미지 파일 체크)
    var maxSize = 20971520; // 20MB

    /**
     * 리뷰 이미지 파일 체크
     **/
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

    /**
     * 리뷰 이미지 업로드
     **/
    $("input[type='file']").change(function (e) {

    /* console.log(modalInputUploadFile);*/

    var formData = new FormData(); // form 생성

    var inputFile = $("input[name='uploadFile']");

    console.log("inputFile : " + inputFile);

    var files = inputFile[0].files;

    for (var i = 0; i < files.length; i++) {

    if (!checkExtension(files[i].name, files[i].size)) {
    return false;
}
    formData.append("uploadFile", files[i]);
}

    $.ajax({
    url: '/uploadAjaxAction',
    processData: false,
    contentType: false,
    data: formData,
    type: 'POST',
    dataType: 'json',
    success: function (result) {
    console.log(result);
    showUploadResult(result);
    review_image = result;
    console.log("review-image-array : " + review_image);
}
}); // end ajax
});


    /**
     * 리뷰 이미지 조회 (모달창)
     **/
    function showUploadResult(uploadResultArr) {

    if (!uploadResultArr || uploadResultArr.length == 0) {
    return;
}

    var uploadResultUL = $(".uploadResult ul");

    var str = "";

    $(uploadResultArr).each(function (i, obj) {

    str += "<li data-name='" + obj.fileName + "' data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "'>";
    str += "<div>";
    str += "<span class='fa fa-times fa-2x img-remove-btn' aria-hidden='true' data-file=\'" + obj.imageURL + "\'></span><br/>";
    str += "<img src='/display?fileName=" + obj.thumbnailURL + "'>";
    str += "</div></li>";

});

    uploadResultUL.append(str);
}

    $(".img-remove-btn").mouseenter(function () {
    $(this).css("color", "red");
});

    <!-- 리뷰 이미지 삭제 -->
    $(".uploadResult").on("click", "li span", function (e) {

    console.log("delete file");

    var targetFile = $(this).data("file");

    var targetLi = $(this).closest("li");

    $.ajax({
    url: '/removeFile',
    data: {fileName : targetFile},
    dataType: 'text',
    type : 'post',
    success: function (result) {
    alert(result);
    targetLi.remove();
}
});
});

    // 리뷰 작성
    modalRegisterBtn.on("click", function (e) {


    review = {
    review_title: modalInputReview_title.val(),
    review_content: modalInputReview_content.val(),
    userid: modalInputUserId.val(),
    product_id: product_id_value,
    grade: grade,
    attachList : review_image
};

    reviewService.add(review, function (result) {
    alert(result);

    modal.find("input").val("");
    modal.modal("hide");

    showList(-1);
});
});

    /**
     * 리뷰 조회 이벤트
     */
    $(document).on("click", "#reviewModBtn", function (e) {


    var review_no = $(this).data("review_no");

    console.log("Review_no : " + review_no);

    reviewService.get(review_no, function (review) {


    modalInputReview_content.val(review.review_content);
    modalInputReview_title.val(review.review_title);
    modalInputUserId.val(review.userid);
    modalInputReview_Date.val(reviewService.displayTime(review.review_date)).attr("readonly", "readonly");
    var grade = review.grade;

    $(".starrr a:nth-child(" + grade + ")").trigger('click');
    console.log("grade : " + grade);
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
    review_no: modal.data("review_no"),
    review_title: modalInputReview_title.val(),
    review_content: modalInputReview_content.val(),
    grade: grade
};

    console.log("updated grade : " + grade);

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

    var str = "<br/><ul class='pagination float-left'>";

    if (prev) {
    str += "<li class='page-item'><a class='page-link' href='" + (startNum - 1) + "'>Previous</a></li>";
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

    /**
     * 리뷰 모달 닫기 버튼
     */
    modalCloseBtn.on("click", function () {
    modal.modal("hide");
});

});
</script>