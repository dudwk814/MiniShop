<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-12-12
  Time: 오후 8:55
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-14
  Time: 오후 7:58
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

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="/resources/css/open-iconic-bootstrap.min.css">
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
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>


<div class="main">


    <!-- Sign up form -->
    <section class="signup">
        <div class="container">
            <a class="navbar-brand" href="${root}">Minishop</a>

            <div class="signup-content">
                <div class="signup-form">
                    <h2 class="form-title">비밀번호 찾기</h2>
                    <form action="${root}user/modifyPasswordForm" method="post" class="register-form" id="findForm">
                        <div class="form-group">
                            <label for="userid"><i class="zmdi zmdi-account-circle"></i></label>
                            <input type="text" name="userid" id="userid" placeholder="Your ID"/>
                        </div>
                        <div class="form-group">
                            <label for="userName"><i class="zmdi zmdi-lock"></i></label>
                            <input type="text" name="userName" id="userName" placeholder="userName"/>
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="signup" id="signup" class="form-submit" value="확인"/>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>



<!-- JS -->
<script src="/resources/userForm/vendor/jquery/jquery.min.js"></script>
<script src="/resources/userForm/js/main.js"></script>
<script>
    $(document).ready(function () {

        // 회원정보 변수
        var userid = $("input[name='userid']");
        var userName = $("input[name='userName']");

        // 비밀번호 찾기 폼
        var findForm = $("#findForm");

        // 회원 정보 검증 함수
        $("input[type='submit']").on("click", function (e) {

            e.preventDefault();

            if (userid.val().trim() == "" | userName.val().trim() == "") {
                alert("회원정보를 입력해주세요.");
                return;
            }

            findForm.submit();
        });

    });
</script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>