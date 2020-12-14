<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-18
  Time: 오후 5:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="/resources/userForm/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="/resources/userForm/css/style.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    <%--<link rel="stylesheet" href="/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/animate.css">

    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/css/aos.css">

    <link rel="stylesheet" href="/resources/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/css/jquery.timepicker.css">


    <link rel="stylesheet" href="/resources/css/flaticon.css">
    <link rel="stylesheet" href="/resources/css/icomoon.css">
    <link rel="stylesheet" href="/resources/css/style.css">--%>

    <!-- JS -->
    <script src="/resources/userForm/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/userForm/js/main.js"></script>
</head>
<body>
<div class="main">


    <!-- Sing in  Form -->
    <section class="sign-in">
        <div class="container">
            <a class="navbar-brand" style="color: black;" href="${root}">Minishop</a>
            <button
                    class="navbar-toggler"
                    type="button"
                    data-toggle="collapse"
                    data-target="#ftco-nav"
                    aria-controls="ftco-nav"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
            >
            </button>
            <div class="signin-content">
                <div class="signin-image">
                    <figure><img src="/resources/userForm/images/signin-image.jpg" alt="sing up image"></figure>
                    <%--<a href="/user/joinForm" class="signup-image-link">Create an account</a>--%>
                    <form action="/user/remove" method="post" id="removeForm">
                        <input type="hidden" name="userid" value="<sec:authentication property="principal.member.userid"/>">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <button id="removeMemberBtn" class="btn btn-danger">회원탈퇴</button>
                    </form>
                </div>

                <div class="signin-form">
                    <h2 class="form-title">회원정보 변경</h2>
                    <form action="/user/modify" method="POST" class="register-form" id="modifyForm">
                        <div class="form-group">
                            <label for="userid"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="userid" id="userid" placeholder="Your ID" value="<sec:authentication property="principal.member.userid"/>" readonly/>
                        </div>
                        <div class="form-group">
                            <label for="userpw"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="userpw"  id="userpw" placeholder="비밀번호"/>
                        </div>
                        <div class="form-group">
                            <label for="userpw2"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="userpw2"  id="userpw2" placeholder="비밀번호 확인"/>
                        </div>
                        <div class="form-group">
                            <label for="userName"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="userName" id="userName" value="<sec:authentication property="principal.member.userName"/>" readonly/>
                        </div>

                        <div>
                            &nbsp;
                        </div>


                        <div class="form-group">
                            <button type="button" onclick="sample4_execDaumPostcode()" class="btn btn-info pull-right">우편번호 찾기</button><br>
                        </div>

                        <div class="form-group">
                            <label for="postcode"><i class="zmdi zmdi-truck"></i></label>
                            <input type="text" id="sample4_postcode" value="${member.post_code}" name="post_code" class="text-body" placeholder="우편번호">
                        </div>

                        <div class="form-group">
                            <label for="country"><i class="zmdi zmdi-truck"></i></label>
                            <input type="text" id="sample4_roadAddress" value="${member.street_address}" name="street_address"  placeholder="도로명주소">
                        </div>

                        <div class="form-group">
                            <label for="streetaddress"><i class="zmdi zmdi-truck"></i></label>
                            <input type="text" id="sample4_jibunAddress" value="${member.address}" name="address"  placeholder="지번주소">
                        </div>

                        <div class="form-group">
                            <label for="streetaddress"><i class="zmdi zmdi-truck"></i></label>
                            <input type="text" id="sample4_detailAddress" value="${member.detail_address}" name="detail_address"  placeholder="상세주소">
                        </div>

                        <div class="form-group form-button">
                            <input type="submit" name="signup" id="modBtn" class="form-submit" value="회원 정보 변경"/>
                        </div>

                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    </form>
                </div>
            </div>
        </div>
    </section>

</div>



</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

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
        var form = $("#removeForm");
        var removeBtn = $("#removeMemberBtn");

        // 회원탈퇴 함수
        removeBtn.on("click", function (e) {

            if(confirm("정말 회원탈퇴 하시겠습니까?") == true) {
                form.submit();
            }
        });

        // 사용자 변경 폼
        var modifyForm = $("#modifyForm");

        // 사용자 변경 버튼
        var modBtn = $("#modBtn");

        // 사용자 비밀번호
        var inputUserpw = $("#userpw");
        var inputUserpw2 = $("#userpw2");

        // 사용자 주소 관련 변수
        var post_code = $("input[name='post_code']");
        var street_address = $("input[name='street_address']");
        var address = $("input[name='address']");
        var detail_address = $("input[name='detail_address']");

        // 회원 정보 변경 함수
        modBtn.on("click", function (e) {
            e.preventDefault();

            // 비밀번호 정합성 검증
            if(inputUserpw.val().trim() == "" || inputUserpw2.val().trim() == "") { // 비밀번호 칸이 비어있는 경우
                alert("변경할 비밀번호를 입력해주세요.");
                return;
            } else if (inputUserpw != inputUserpw2) { // 비밀번호가 서로 다른 경우
                alert("비밀번호를 정확히 입력해주세요.");
                return;
            }

            // 주소 정합성 검증
            if (post_code.val().trim() == "" || street_address.val().trim() == "" | address.val().trim() == "" | detail_address.val().trim() == "") {
                alert("주소 정보를 입력해주세요.");
                return;
            }

            if (confirm("회원정보를 변경하시겠습니까?") == true) {
                modifyForm.submit();
            }
        });

    });
</script>
</html>
