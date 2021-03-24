<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2021-03-23
  Time: 오후 8:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>
<%@ include file="../includes/header2.jsp" %>


<div class="hero-wrap hero-bread" style="background-image: url('/resources/shop/images/bg_6.jpg');">
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="${root}">Home</a></span> <span>Login</span></p>
                <h1 class="mb-0 bread">Login Form</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-lg-center">

            <div class="card col-md-9">
                <div class="card-header text-center">
                    로그인
                </div>
                <div class="card-body">
                    <form action="/login" method="post" id="LoginForm">
                        <div class="form-group row">
                            <label for="loginUserid" class="col-sm-3 col-form-label">아이디</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control userid" id="loginUserid" name="userid"
                                       placeholder="아이디를 입력하세요!" data-name="아이디"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="loginUserpw" class="col-sm-3 col-form-label">비밀번호</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" name="userpw" id="loginUserpw"
                                       placeholder="비밀번호를 입력하세요!" data-name="비밀번호"/>
                            </div>
                        </div>

                        <div class="form-check">

                            <input class="form-check-input" name="remember-me" id="remember-me" type="checkbox" value=""
                                   id="defaultCheck1">
                            <label class="form-check-label" for="defaultCheck1">
                                <span>로그인 유지</span>
                            </label>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                        <a class="float-left" href="/user/joinForm">회원가입</a>
                        <button type="submit" class="btn btn-outline-primary float-right">로그인</button>
                    </form>
                </div>
            </div>

        </div>
    </div>
</section>

<script>
    $(document).ready(function (e) {
        $("button[type='submit']").on("click", function (e) {
            e.preventDefault();

            if ($("#loginUserid").val().trim() == "") {
                alert("아이디를 입력해주세요.");
                return;
            } else if ($("#loginUserpw").val().trim() == "") {
                alert("비밀번호를 입력해주세요.");
                return;
            }

            $("#LoginForm").submit();
        });
    });
</script>

<%@ include file="../includes/footer.jsp" %>