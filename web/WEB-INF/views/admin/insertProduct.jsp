<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-11-28
  Time: 오후 10:51
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
                <h1 class="mb-0 bread">Product registration Page</h1>
            </div>
        </div>
    </div>
</div>
<section class="ftco-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12 ftco-animate">
                <h3 class="mb-4 billing-heading">Product registration</h3>
                <form action="/admin/product/insertProduct" method="post" enctype="multipart/form-data" id="productRegForm">
                    <div class="form-group">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    </div>
                    <div class="form-group">
                        <label>제품명</label>
                        <input name="product_name" class="form-control" placeholder="제품명"/>
                    </div>
                    <div class="form-group">
                        <label>제품 가격</label>
                        <input name="product_price" id="product_price" class="form-control" placeholder="제품 가격"/>
                    </div>
                    <div class="form-group">
                        <label>브랜드</label>
                        <input name="brand" class="form-control" placeholder="브랜드"/>
                    </div>
                    <div class="form-group">
                        <label>제품 설명</label>
                        <textarea name="product_desc" id="editor1" rows="10" cols="80"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="product_img">사진 첨부</label>
                        <input type="file" class="form-control-file" name="product_photo" id="product_img">
                        <div class="select-img"><img src=""/></div>
                    </div>
                    <input type="submit" class="btn btn-primary btn-lg" id="productRegBtn" value="확인">
                </form>
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
<script src="/resources/ckeditor/ckeditor.js"></script>

<script>
    $(document).ready(function () {
        // Replace the <textarea id="editor1"> with a CKEditor 4
        // instance, using default configuration.
        CKEDITOR.replace( 'editor1' );

        var imgRegex = new RegExp("(.*?)\.(JPG|jpg|jpeg|JPEG|png|PNG|gif|GIF|bmp|BMP)$"); // 파일 확장자 정규식
        var maxSize = 20971520; // 20MB
        var productRegBtn = $("#productRegBtn"); // 상품 등록 버튼 변수
        var productRegForm = $("#productRegForm"); // 상품 등록 폼

        // 업로드 파일 검사 함수
        function checkExtension(fileName, fileSize) {

            if (fileSize >= maxSize) {
                alert("파일 사이즈 초과입니다.");
                return false;
            }

            if (!imgRegex.test(fileName)) {
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

        productRegBtn.on("click", function (e) {
            e.preventDefault();

            var productImg = $("#product_img").val();
            var productName = $("input[name='product_name']").val();
            var productPrice = $("#product_price").val();
            var brand = $("input[name='brand']").val();
            var numRegex= /^[0-9]/g; // 상품 가격 숫자 체크 정규식

            if (confirm("상품을 등록하시겠습니까?") == true) {

                if (!productName) {
                    alert("상품명을 입력해주세요.");
                    return;
                } else if(!productPrice){
                    alert("상품 가격을 입력해주세요.");
                    return;
                } else if(!brand){
                    alert("브랜드를 입력해주세요.");
                    return;
                } else if (!productImg) {
                    alert("상품 이미지를 등록해주세요.");
                    return;
                }

               if(!numRegex.test(productPrice)){
                    alert("숫자만 입력가능합니다.");
                    return;
                }

                productRegForm.submit();
            }
        });
    });
</script>



<%@ include file="../includes/footer.jsp"%>