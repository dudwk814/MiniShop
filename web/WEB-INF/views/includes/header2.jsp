<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-27
  Time: 오후 5:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Minishop - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
    <link rel="stylesheet" href="/resources/shop/css/style.css">

</head>
<body class="goto-here">



<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="/">Minishop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a href="index.html" class="nav-link">Home</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Catalog</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown04">
                        <a class="dropdown-item" href="shop.html">Shop</a>
                        <a class="dropdown-item" href="product-single.html">Single Product</a>
                        <a class="dropdown-item" href="/cart/">Cart</a>
                        <a class="dropdown-item" href="checkout.html">Checkout</a>
                    </div>
                </li>
                <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
                <li class="nav-item"><a href="/board/list" class="nav-link">Board</a></li>
                <li class="nav-item cta cta-colored"><a href="cart.html" class="nav-link"><span class="icon-shopping_cart"></span>[0]</a></li>
                <sec:authorize access="isAnonymous()">
                    <li class="nav-item"><a href="/user/loginForm" class="nav-link">Login</a></li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown05" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">USER</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown04">
                            <a class="dropdown-item" href="/user/checkMemberForm">Modify</a>
                            <a class="dropdown-item" href="/user/checkMemberForm">My Page</a>
                        </div>
                    </li>
                    <li class="nav-item"><a href="/user/logout" class="nav-link" id="logoutBtn">Logout</a></li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>