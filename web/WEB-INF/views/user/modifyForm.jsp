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
            <a class="navbar-brand" href="${root}">Minishop</a>
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
                    <h2 class="form-title">Modify Member</h2>
                    <form action="/user/modify" method="POST" class="register-form" id="login-form">
                        <div class="form-group">
                            <label for="userid"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="userid" id="userid" placeholder="Your ID" value="<sec:authentication property="principal.member.userid"/>" readonly/>
                        </div>
                        <div class="form-group">
                            <label for="userpw"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="userpw" id="userpw" placeholder="Password"/>
                        </div>
                        <div class="form-group">
                            <label for="userName"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="userName" id="userName" value="<sec:authentication property="principal.member.userName"/>" readonly/>
                        </div>
                        <div class="form-group">
                            <label for="address"><i class="zmdi zmdi-truck"></i></label>
                            <input type="text" name="address" id="address" value="<sec:authentication property="principal.member.address"/>"/>
                        </div>

                        <div class="form-group form-button">
                            <input type="submit" name="signup" id="signup" class="form-submit" value="Modify Account Info"/>
                        </div>

                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    </form>
                </div>
            </div>
        </div>
    </section>

</div>



</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

<script>
    $(document).ready(function () {
        var form = $("#removeForm");
        var removeBtn = $("#removeMemberBtn");

        removeBtn.on("click", function (e) {

            if(confirm("정말 회원탈퇴 하시겠습니까?") == true) {
                form.submit();
            }
        });

    });
</script>
</html>
