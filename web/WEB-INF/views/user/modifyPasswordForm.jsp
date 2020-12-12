<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-12-12
  Time: 오후 9:20
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
                    <h2 class="form-title">비밀번호 변경</h2>
                    <form action="${root}user/modifyPassword" method="post" class="register-form" id="modifyForm">
                        <input type="hidden" name="userid" value="${member.userid}">

                        <div class="form-group">
                            <input type="password" name="userpw" class="form-control" id="userpw" placeholder="비밀번호"/>
                        </div>
                        <div class="form-group">
                            <input type="password" name="userpw2" class="form-control" id="userpw2" placeholder="비밀번호 확인"/>
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

        var userpw = $("input[name='userpw']");
        var userpw2 = $("input[name='userpw2']");

        var modifyForm = $("#modifyForm");

        $("input[type='submit']").on("click", function (e) {
            e.preventDefault();

            if (userpw.val().trim() == "" | userpw2.val().trim() == "") {
                alert("비밀번호를 입력해주세요.");
                return;
            }

            if (userpw.val() != userpw2.val()) {
                alert("비밀번호가 일치하지 않습니다.");
                return;
            }

            modifyForm.submit();

        });
    })
</script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>