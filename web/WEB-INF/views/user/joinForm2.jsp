<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2021-03-09
  Time: 오후 7:46
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
                <p class="breadcrumbs"><span class="mr-2"><a href="${root}">Home</a></span> <span>Join</span></p>
                <h1 class="mb-0 bread">Join Form</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-lg-center">

            <div class="card col-md-9">
                <div class="card-header text-center">
                    회원가입
                </div>
                <div class="card-body">
                    <form action="/user/join" method="post" id="joinForm">
                        <h5>회원 기본 정보</h5>
                        <div class="form-group row">
                            <label for="userName" class="col-sm-3 col-form-label">이름</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="userName" id="joinUserName" placeholder="이름을 입력하세요!" data-name="이름"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="joinUserid" class="col-sm-3 col-form-label">아이디</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control userid" id="joinUserid" name="userid"  placeholder="아이디를 입력하세요!" data-name="아이디"/>
                            </div>
                            <div class="tagcloud">
                                <a href="#" type="button" class="tag-cloud-link" id="chkUseridBtn" name="chkUseridBtn">중복확인</a>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="userpw" class="col-sm-3 col-form-label">비밀번호</label>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" name="userpw" id="userpw" placeholder="비밀번호를 입력하세요!" data-name="비밀번호"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="userpw2" class="col-sm-3 col-form-label">비밀번호 확인</label>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" name="userpw2" id="userpw2" placeholder="비밀번호를 재입력해주세요!" data-name="비밀번호 확인"/>
                            </div>
                        </div>
                        <br/>



                        <div class="form-group tagcloud">
                            <span style="font-size: large; color: black;">배송지 주소

                            </span>
                            <a style="color: black;" type="button" onclick="sample4_execDaumPostcode()" class="tag-cloud-link float-right">우편번호 찾기</a>
                        </div>

                        <div class="form-group">
                            <label for="postcode">우편번호</label>
                                <input type="text" id="sample4_postcode" name="post_code" class="form-control text-body" placeholder="우편번호" data-name="우편번호">
                        </div>

                        <div class="form-group">
                            <label for="country">도로명 주소</label>
                            <input type="text" id="sample4_roadAddress" name="street_address" class="form-control" placeholder="도로명주소" data-name="도로명주소">
                        </div>

                        <div class="form-group">
                            <label for="streetaddress">지번주소</label>
                            <input type="text" id="sample4_jibunAddress" name="address" class="form-control" placeholder="지번주소" data-name="지번주소">
                        </div>

                        <div class="form-group">
                            <label for="streetaddress">상세주소</label>
                            <input type="text" id="sample4_detailAddress" name="detail_address" class="form-control" placeholder="상세주소" data-name="상세주소">
                        </div>

                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                        <div>
                            <input type="checkbox" id="checkAgree" name="checkAgree"> 회원가입의 동의합니다.
                            <button type="button" id="signup" class="btn btn-primary float-right">회원가입</button>
                        </div>

                   </form>
                </div>
            </div>

        </div>
    </div>
</section>

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

    $(document).ready(function () {
        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";



        // Ajax spring security header.
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
        });



        var userIdExist = false;


        $("#chkUseridBtn").on("click", function (e) {

            e.preventDefault();

            var userid = $("#joinUserid").val();

            if (userid.trim() == "") {
                alert("아이디를 입력해주세요.");
                return;
            }


            $.ajax({
                url: '/user/ID_Check',
                type: 'POST',
                dataType: 'text', //서버로부터 내가 받는 데이터의 타입
                contentType : 'application/json; charset=utf-8',//내가 서버로 보내는 데이터의 타입
                data: userid ,

                success: function(data){
                    if(data == 0){
                        console.log("아이디 없음");
                        console.log(userid);
                        alert("사용하실 수 있는 아이디입니다.");
                        userIdExist = true;
                    }else{
                        console.log("아이디 있음");
                        console.log(userid);
                        alert("중복된 아이디가 존재합니다.");
                        userIdExist = false;
                    }
                },
                error: function (){

                }
            });
        });

        <!-- 회원가입 버튼 클릭 -->
        $("#signup").on("click", function (e) {
            e.preventDefault();

            if (userIdExist == false) {
                alert("아이디 중복체크를 해주세요.");
                return;
            }

            $("#joinForm").find("input[type=text]").each(function(index, item){
                // 아무값없이 띄어쓰기만 있을 때도 빈 값으로 체크되도록 trim() 함수 호출
                if ($(this).val().trim() == '') {
                    alert($(this).attr("data-name")+" 항목을 입력하세요.");
                    return;
                }
            });

            if($("input:checkbox[name=checkAgree]").is(":checked") == false) {
                alert("회원가입 동의를 해주세요.");
                return;
            }
        });
    });
</script>



<%@ include file="../includes/footer.jsp" %>


