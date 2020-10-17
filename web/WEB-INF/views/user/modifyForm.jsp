<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-14
  Time: 오후 7:58
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
            <div class="signup-content">
                <div class="signup-form">
                    <h2 class="form-title">Sign up</h2>
                    <form action="${root}user/join" method="POST" class="register-form" id="register-form">
                        <div class="form-group">
                            <label for="user_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="user_name" id="user_name" placeholder="Your Name"/>
                        </div>
                        <div class="form-group">
                            <label for="user_id"><i class="zmdi zmdi-account-circle"></i></label>
                            <input type="text" name="user_id" id="user_id" placeholder="Your ID"/>
                        </div>
                        <div class="form-group">
                            <label for="user_pw"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="user_pw" id="user_pw" placeholder="Password"/>
                        </div>
                        <div class="form-group">
                            <label for="user_pw2"><i class="zmdi zmdi-lock-outline"></i></label>
                            <input type="password" name="user_pw2" id="user_pw2" placeholder="Repeat your password"/>
                        </div>
                        <div class="form-group">
                            <label for="address"><i class="zmdi zmdi-truck"></i></label>
                            <input type="text" name="address" id="address" placeholder="Your address"/>
                        </div>
                        <div class="form-group">
                            <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                            <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                        </div>
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
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>