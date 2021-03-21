<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-11-02
  Time: 오후 7:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="../includes/header2.jsp"%>


<div class="hero-wrap hero-bread" style="background-image: url('/resources/shop/images/bg_6.jpg');">
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Checkout</span></p>
                <h1 class="mb-0 bread">Checkout</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-10 ftco-animate">
                <form action="/order/order" id="orderForm" class="billing-form" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="userid" value="<sec:authentication property="principal.member.userid"/>"/>
                    <input type="hidden" name="sum_price" value="${AllSumMoney}"/>
                    <h3 class="mb-4 billing-heading">Billing Details</h3>




                    <div class="row align-items-end">

                        <div class="col-lg-12">
                            <div class="form-group">
                                <label>받는 분 성함</label>
                                <input type="text" class="form-control" value="<sec:authentication property="principal.member.userName"/>">
                            </div>
                        </div>

                        <div class="w-100"></div>

                        <hr/>

                        <div class="col-lg-12">
                            <div class="form-check">

                                <button type="button" onclick="sample4_execDaumPostcode()" class="btn btn-primary float-right" value="우편번호 찾기">우편번호 찾기</button><br>
                            </div>
                        </div>

                        <div class="w-100"></div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="postcode">우편번호</label>
                               <input type="text" id="sample4_postcode" name="post_code" class="form-control text-body" placeholder="우편번호" value="${user.post_code}" />
                            </div>
                        </div>

                        <div class="w-100"></div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="country">도로명주소</label>
                                    <input type="text" id="sample4_roadAddress" name="street_address" class="form-control" placeholder="도로명주소" value="${user.street_address}">
                            </div>
                        </div>
                        <div class="w-100"></div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="streetaddress">지번주소</label>
                                <input type="text" id="sample4_jibunAddress" name="address" class="form-control" placeholder="지번주소" value="${user.address}">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" id="sample4_detailAddress" name="detail_address" class="form-control" placeholder="상세주소" value="${user.detail_address}">
                            </div>
                        </div>
                        <div class="w-100"></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="towncity">참고항목</label>
                                <input type="text" id="sample4_extraAddress" name="note" class="form-control" placeholder="참고항목">
                            </div>
                        </div>

                        <div class="w-100"></div>
                    </div>




                <div class="row mt-5 pt-3 d-flex">
                    <div class="col-md-6 d-flex">
                        <div class="cart-detail cart-total bg-light p-3 p-md-4">
                            <h3 class="billing-heading mb-4">Cart Total</h3>
                            <p class="d-flex">
                                <span>Subtotal</span>
                                <span><ftm:setLocale value=""/><fmt:formatNumber type="currency" currencySymbol="￦" value="${sumMoney}" maxFractionDigits="0"/>원</span>
                            </p>
                            <p class="d-flex">
                                <span>Delivery</span>
                                <span><ftm:setLocale value=""/><fmt:formatNumber type="currency" currencySymbol="￦" value="${fee}" maxFractionDigits="0"/>원</span>
                            </p><span>${fee}</span>
                            <hr>
                            <p class="d-flex total-price">
                                <span>Total</span>
                                <span><ftm:setLocale value=""/><fmt:formatNumber type="currency" currencySymbol="￦" value="${AllSumMoney}" maxFractionDigits="0"/>원</span>
                            </p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="cart-detail bg-light p-3 p-md-4">
                            <h3 class="billing-heading mb-4">결제 방법</h3>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <div class="radio">
                                        <label><input type="radio" name="payment_option" class="mr-2" value="계좌이체"> 계좌이체</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <div class="radio">
                                        <label><input type="radio" name="payment_option" class="mr-2" value="신용카드"> 신용카드</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <div class="checkbox">
                                        <label><input type="checkbox" name="chkAgreement" value="" id="chkAgreement" class="mr-2"> 동의합니다. (전자상거래법 제 8조 제2항)</label>
                                    </div>
                                </div>
                            </div>
                            <p><button id="orderBtn" type="submit" class="btn btn-primary py-3 px-4">Place an order</button></p>
                </form><!-- END -->
                        </div>
                    </div>
                </div>
            </div> <!-- .col-md-8 -->
        </div>
    </div>
</section> <!-- .section -->


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<script>
    $(document).ready(function (e) {

        var chkAgreement = $("#chkAgreement");

        var orderBtn = $("#orderBtn");

        var orderForm = $("#orderForm");

        var post_code_value = $("input[name=post_code]").val();
        var street_address_value = $("input[name=street_address]").val();
        var address_value = $("#input[name=address]").val();
        var detail_address_value = $("#input[name=detail_address]").val();



        orderBtn.on("click", function (e) {
            e.preventDefault();

            if($("input:checkbox[name=chkAgreement]").is(":checked") != true) {

                alert("동의항목을 체크하여 주세요.");
                return ;
            }

            orderForm.submit();
        });


    });
</script>

<%@ include file="../includes/footer.jsp"%>

