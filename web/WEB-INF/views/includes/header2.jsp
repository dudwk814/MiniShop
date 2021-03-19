<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-27
  Time: 오후 5:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Minishop</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="icon" href="data:;base64,iVBORw0KGgo=">

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
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/starrr.css">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">

    <style>
        .select-img img {
            margin: 20px 100px 0;
        }

        .uploadResult {
            width: 100%;
            margin-top: 10px;
        }

        .uploadResult ul {
            display: flex;
            flex-flow: row;
            justify-content: center;
            vertical-align: top;
            overflow: auto;
        }

        .uploadResult ul li {
            list-style: none;
            padding: 10px;
            margin-left: 2em;
        }

        .uploadResult ul li img {
            width: 100px;
        }
    </style>
    <script src="/resources/shop/js/jquery.min.js"></script>
    <script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body class="goto-here">


<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="${root}">Minishop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
                aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> 메뉴
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">

                <li class="nav-item"><a href="/board/list" class="nav-link">게시판</a></li>

                <%-- 로그인 안 한 경우 로그인 페이지로 이동 --%>
                <sec:authorize access="isAnonymous()">
                    <li class="nav-item"><a href="/cart/cart" class="nav-link">장바구니<span
                            class="badge badge-success">${cartCount}</span></a></li>
                </sec:authorize>

                <%-- 로그인 한 경우 장바구니 페이지로 이동 --%>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item"><a
                            href="/cart/cart?userid=<sec:authentication property="principal.member.userid"/>"
                            class="nav-link">장바구니<span class="badge badge-success">${cartCount}</span> </a></li>
                </sec:authorize>

                <sec:authorize access="isAnonymous()">
                    <li class="nav-item"><a href="#" class="nav-link loginBtn">로그인</a></li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown05" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">회원</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown04">
                            <a class="dropdown-item" href="/user/checkMemberForm">회원 정보</a>
                            <a class="dropdown-item"
                               href="/order/getOrderList?userid=<sec:authentication property="principal.member.userid"/>">주문
                                내역</a>
                        </div>
                    </li>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li class="nav-item"><a href="/admin/page" class="nav-link">관리자</a></li>
                    </sec:authorize>
                    <li class="nav-item"><a href="/user/logout" class="nav-link" id="logoutBtn">로그아웃</a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>

<!-- Modal -->
<div class="modal fade" id="loginModal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">로그인</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/login" method="POST" class="register-form" id="login-form">
                <div class="modal-body">

                    <div class="form-group">
                        <label for="userid">아이디</label>
                        <input type="text" class="form-control" name="userid" id="userid" placeholder="Your ID">
                    </div>
                    <div class="form-group">
                        <label for="userpw">비밀번호</label>
                        <input type="password" class="form-control" name="userpw" id="userpw" placeholder="Password"/>
                    </div>

                    <div class="form-check">
                        <a class="float-right" href="/user/joinForm">회원가입</a>
                        <input class="form-check-input" name="remember-me" id="remember-me" type="checkbox" value=""
                               id="defaultCheck1">
                        <label class="form-check-label" for="defaultCheck1">
                            <span>로그인 유지</span>
                        </label>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-outline-primary">로그인</button>
                    <%--<button type="button" class="btn btn-secondary close" data-dismiss="modal">닫기</button>--%>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        var modal = $("#loginModal");

        $(".loginBtn").on("click", function (e) {
            e.preventDefault();

            modal.modal("show");
        });

    });
</script>