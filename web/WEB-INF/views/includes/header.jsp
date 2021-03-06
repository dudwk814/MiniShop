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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

    <link rel="stylesheet" href="/resources/toastr-master/build/toastr.css">


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
            <span class="oi oi-menu">MENU</span>
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">

                <li class="nav-item"><a href="/board/list" class="nav-link"><i class="fa fa-th-list fa-lg"
                                                                               aria-hidden="true"></i>&nbsp;게시판</a></li>

                <li class="nav-item"><a href="/shop" class="nav-link"><i class="fa fa-shopping-bag fa-lg"
                                                                         aria-hidden="true"></i>&nbsp;상품</a></li>

                <%-- 로그인 안 한 경우 로그인 모달 생성 --%>
                <li class="nav-item"><a href="#" class="nav-link cartBtn"><i class="fa fa-shopping-cart fa-lg"
                                                                             aria-hidden="true"></i>&nbsp;장바구니<span
                        class="badge badge-success">${cartCount}</span></a></li>



                <sec:authorize access="isAnonymous()">
                    <li class="nav-item"><a href="#" class="nav-link loginBtn" data-toggle="modal"
                                            data-target="#staticBackdrop"><i class="fa fa-user fa-lg"
                                                                             aria-hidden="true"></i>&nbsp;로그인</a></li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">

                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li class="nav-item"><a href="/admin/page" class="nav-link"><i class="fa fa-lock fa-lg"
                                                                                       aria-hidden="true"></i>&nbsp;관리자</a>
                        </li>
                    </sec:authorize>

                    <li class="nav-item dropdown">

                        <a class="nav-link dropdown-toggle" href="#" id="dropdown05" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false"><i class="fa fa-user fa-lg"
                                                                         aria-hidden="true"></i>&nbsp;회원</a>
                        <ul class="dropdown-menu" aria-labelledby="dropdown05">
                            <a class="dropdown-item" href="/user/checkUserForm"><i class="fa fa-user"
                                                                                   aria-hidden="true"></i>&nbsp;회원
                                정보</a>
                            <a class="dropdown-item"
                               href="/order/getOrderList?userid=<sec:authentication property="principal.user.userid"/>"><i
                                    class="fa fa-list" aria-hidden="true"></i>&nbsp;주문
                                내역</a>
                            <div class="dropdown-divider"></div>
                            <a href="/user/logout" class="dropdown-item" id="logoutBtn">
                                <i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;로그아웃
                            </a>
                        </ul>
                    </li>

                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>
<!-- END nav -->

<!--로그인 Modal -->
<div class="modal fade" id="loginModal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalCenterTitle"
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
                        <input type="text" class="form-control rounded" name="userid" id="userid" placeholder="Your ID">
                    </div>

                    <div class="form-group">
                        <label for="userpw">비밀번호</label>
                        <input type="password" class="form-control rounded" name="userpw" id="userpw"
                               placeholder="Password"/>
                    </div>


                    <div class="form-check">

                        <input class="form-check-input" name="remember-me" id="remember-me" type="checkbox" value=""
                               id="defaultCheck1">
                        <a class="float-right" href="/user/joinForm">회원가입</a>
                        <label class="form-check-label" for="defaultCheck1">
                            <span>로그인 유지</span>
                        </label>
                    </div>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-outline-primary">로그인</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {

        var modal = $("#loginModal");

        $(".cartBtn").on("click", function (e) {
            e.preventDefault();

            <sec:authorize access="isAnonymous()">
            modal.modal("show");
            return;
            </sec:authorize>

            <sec:authorize access="isAuthenticated()">
            location.href = "/cart/cart?userid=<sec:authentication property="principal.user.userid"/>";
            </sec:authorize>
        });


        $(".loginBtn").on("click", function (e) {
            e.preventDefault();

            modal.modal("show");
        });


    });
</script>