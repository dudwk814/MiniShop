<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2021-03-15
  Time: 오후 4:41
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
                <p class="breadcrumbs"><span class="mr-2"><a href="${root}">Home</a></span></p>
                <h1 class="mb-0 bread">checkMember Form</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-lg-center">

            <div class="card col-md-9">
                <div class="card-header text-center">
                    비밀번호 확인
                </div>
                <div class="card-body">
                    <form action="${root}user/modifyForm" method="post" id="checkForm">
                        <div class="form-group row">
                            <label for="joinUserid" class="col-sm-3 col-form-label">아이디</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control userid" id="joinUserid" name="userid"  placeholder="아이디를 입력하세요!" readonly data-name="아이디" value="<sec:authentication property='principal.member.userid'/>"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="checkUserpw" class="col-sm-3 col-form-label">비밀번호</label>
                            <div class="col-sm-7" id="password-filed">
                                <input type="password" class="form-control" name="userpw" id="checkUserpw" placeholder="비밀번호를 입력하세요!" data-name="비밀번호"/>
                            </div>
                        </div>

                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                        <div>
                            <button type="submit" id="checkPasswordBtn" class="btn btn-primary">비밀번호 확인</button>
                        </div>

                    </form>
                </div>
            </div>

        </div>
    </div>
</section>
<script>
    $(document).ready(function (e) {
       var password = $("#checkUserpw");

       var checkPasswordBtn = $("#checkPasswordBtn");

       var passwordFiled = $("#password-filed");

       checkPasswordBtn.on("click", function (e) {

           var str = "";

           e.preventDefault();

           if (password.val().trim() == '') {
               alert("비밀번호를 입력해주세요.");
               return;
           }

           $("#checkForm").submit();

       });
    });
</script>
<%@ include file="../includes/footer.jsp" %>