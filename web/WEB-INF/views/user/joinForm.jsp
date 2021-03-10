<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-03
  Time: 오후 2:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="/resources/shop/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/resources/shop/css/animate.css">

    <link rel="stylesheet" href="/resources/shop/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/shop/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/shop/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/shop/css/aos.css">

    <link rel="stylesheet" href="/resources/shop/css/ionicons.min.css">

    <link rel="stylesheet" href="/resources/shop/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/shop/css/jquery.timepicker.css">


    <link rel="stylesheet" href="/resources/shop/css/flaticon.css">
    <link rel="stylesheet" href="/resources/shop/css/icomoon.css">

    <!-- Font Icon -->
    <link rel="stylesheet" href="/resources/userForm/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="/resources/userForm/css/style.css">
</head>
<body>


<div class="main">


    <!-- Sign up form -->
    <section class="signup">
        <div class="container">
            <H2>
             &nbsp;<a class="navbar-brand" href="${root}" STYLE="text-decoration: none; color: #6f42c1">Minishop</a>
            </H2>
            <div class="signup-content">
                <div class="signup-form">
                    <h2 class="form-title">회원 가입</h2>
                    <form action="${root}user/join" method="POST" class="register-form" id="register-form">
                        <div class="form-group">
                            <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="userName" id="userName" placeholder="Your Name" value="${memberVO.userName}"/>
                        </div>
                        <div class="form-group">
                            <label for="userid"><i class="zmdi zmdi-account-circle"></i></label>
                            <input type="text" name="userid" id="userid" placeholder="Your ID" value="${memberVO.userid}"/>
                        </div>
                        <div class="form-button">
                            <button type="button" class="btn btn-primary" id="chkUseridBtn" name="chkUseridBtn" onclick="check()">아이디 중복 확인</button>
                        </div>

                        <div>
                            &nbsp;
                        </div>

                        <div class="form-group">
                            <label for="userpw"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="userpw" id="userpw" placeholder="Password"/>
                        </div>

                        <div>
                            &nbsp;
                        </div>


                        <div class="form-group">
                            <button type="button" onclick="sample4_execDaumPostcode()" class="btn btn-info pull-right">우편번호 찾기</button><br>
                        </div>

                        <div class="form-group">
                            <label for="postcode"><i class="zmdi zmdi-truck"></i></label>
                            <input type="text" id="sample4_postcode" name="post_code" class="form-control text-body" placeholder="우편번호">
                        </div>

                        <div class="form-group">
                            <label for="country"><i class="zmdi zmdi-truck"></i></label>
                            <input type="text" id="sample4_roadAddress" name="street_address" class="form-control" placeholder="도로명주소">
                        </div>

                        <div class="form-group">
                            <label for="streetaddress"><i class="zmdi zmdi-truck"></i></label>
                            <input type="text" id="sample4_jibunAddress" name="address" class="form-control" placeholder="지번주소">
                        </div>

                        <div class="form-group">
                            <label for="streetaddress"><i class="zmdi zmdi-truck"></i></label>
                            <input type="text" id="sample4_detailAddress" name="detail_address" class="form-control" placeholder="상세주소">
                        </div>

                        <div class="form-group">
                            <input type="checkbox" name="chkAgreement" id="agree-term" class="agree-term" />
                            <label for="agree-term" class="label-agree-term" id="chkAgreement"><span><span></span></span>회원가입에 동의합니다.</label>
                        </div>

                        <div class="form-group form-button">
                            <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    </form>

                </div>
                <div class="signup-image">
                    <figure><img src="/resources/userForm/images/signup-image.jpg" alt="sing up image"></figure>
                    <a href="/user/loginForm" class="signup-image-link">I am already member</a>
                </div>
            </div>
        </div>
    </section>


</div>



<!-- JS -->
<script src="/resources/userForm/vendor/jquery/jquery.min.js"></script>
<script src="/resources/userForm/js/main.js"></script>

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

    var userIdExist = false;

    function check(){
        var id = $("#userid").val();

        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";



        // Ajax spring security header.
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
        });

        $.ajax({
            url: '/user/ID_Check',
            type: 'POST',
            dataType: 'text', //서버로부터 내가 받는 데이터의 타입
            contentType : 'text/plain; charset=utf-8;',//내가 서버로 보내는 데이터의 타입
            data: id ,

            success: function(data){
                if(data == 0){
                    console.log("아이디 없음");
                    console.log(id);
                    alert("사용하실 수 있는 아이디입니다.");
                    userIdExist = true;
                }else{
                    console.log("아이디 있음");
                    alert("중복된 아이디가 존재합니다.");
                    userIdExist = false;
                }
            },
            error: function (){

            }
        });


    }
    $(document).ready(function (e) {

        var register_form = $("#register-form");

        var signUpBtn = $("#signup");

        var username = $("#userName");
        var userid = $("#userid")
        var userpw = $("#userpw");

        var detailAddress = $("#sample4_detailAddress");
        var post_code = $("#sample4_postcode");
        var street_address = $("#sample4_roadAddress");
        var address = $("#sample4_jibunAddress");

        signUpBtn.on("click", function (e) {
            e.preventDefault();

            if(username.val().trim() == "" || userid.val().trim() == "" || userpw.val().trim() == "") {
                alert("회원정보를 입력해주세요.");
                return;
            } else if(post_code.val().trim() == ""
                || detailAddress.val().trim() == ""
                || street_address.val().trim() == ""
                || address.val().trim() == "") {

                alert("주소를 정확히 입력해주세요.");
                return;
            } else if($("input:checkbox[name=chkAgreement]").is(":checked") != true) {

                alert("동의항목을 체크하여 주세요.");
                return ;
            } else if(userIdExist == false) {
                alert("아이디 중복체크를 해주세요.");
                return ;
            } else if (userid.trim().val().length < 5) {
                alert("아이디는 5글자 이상이여야합니다.");
                return;
            } else if (userpw.trim().val().length < 5) {
                alert("비밀번호는 5글자 이상이여야합니다.");
                return;
            }

            register_form.submit();
        });



    })
</script>
<script>

</script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
