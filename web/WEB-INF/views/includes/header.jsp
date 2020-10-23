<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-04
  Time: 오후 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Homepage - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <%--<link href="/resources/shop/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="/resources/shop/css/shop-homepage.css" rel="stylesheet">

    <!-- icomoon.io icon -->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">


</head>

<body>
<script src="/resources/shop/vendor/jquery/jquery.min.js"></script>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="${root}">Mini Shop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="${root}">shop
                        <span class="sr-only">(current)</span>
                    </a>
                </li>


                <li class="nav-item active">
                    <a class="nav-link" href="/board/list">Board</a>
                </li>

                <li class="nav-item active">
                    <div class="dropdown nav-link">
                        <span class="lnr lnr-user dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                        </span>
                        <div class="dropdown-menu">
                            <sec:authorize access="isAnonymous()">
                                <a class="dropdown-item lnr lnr-users" href="/user/joinForm"> 회원가입</a>
                                <a class="dropdown-item lnr lnr-user" href="/user/loginForm"> 로그인</a>
                            </sec:authorize>
                            <sec:authorize access="isAuthenticated()">
                                <h6 class="dropdown-header"><i class="lnr lnr-license"></i>&nbsp; <sec:authentication property="principal.member.userName"/></h6>
                                <div class="dropdown-divider"></div>
                                <a id="logoutBtn" class="dropdown-item lnr lnr-exit" href="/user/logout"> 로그아웃</a>
                                <a class="dropdown-item lnr lnr-users" href="/user/checkMemberForm"> 회원 설정</a>
                            </sec:authorize>
                        </div>
                    </div>
                    <%--<a class="nav-link dropdown" href="/user/loginForm">
                        <span class="lnr lnr-user"></span></a>--%>
                </li>

            </ul>
        </div>
    </div>
</nav>

<script>
    $(document).ready(function (e) {
        var logoutBtn = $("#logoutBtn");

        logoutBtn.on("click", function (e) {
            e.preventDefault();

            var newForm = $('<form></form>');
            newForm.attr("action", "/user/logout");
            newForm.attr("method", "post");
            newForm.appendTo('body');

            var input = $('<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>');

            newForm.append(input);

            newForm.submit();

        });
    }) ;
</script>

<!-- Page Content -->
<div class="container">

    <div class="row">

        <div class="col-lg-3">

            <h1 class="my-4">Mini Shop</h1>
            <div class="list-group">
                <a href="#" class="list-group-item">Category 1</a>
                <a href="#" class="list-group-item">Category 2</a>
                <a href="#" class="list-group-item">Category 3</a>
            </div>

        </div>

        <!-- /.col-lg-3 -->