<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2021-03-09
  Time: 오후 7:46
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
                <p class="breadcrumbs"><span class="mr-2"><a href="${root}">Home</a></span> <span>Join</span></p>
                <h1 class="mb-0 bread">Join Form</h1>
            </div>
        </div>
    </div>
</div>

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-lg-center">

            <div class="card col-md-9">
                <div class="card-header text-center">
                    회원가입
                </div>
                <div class="card-body">
                    <form>
                        <div class="form-group row">
                            <label for="username" class="col-sm-3 col-form-label">이름</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="userName" id="userName" placeholder="이름을 입력하세요!" value="${memberVO.userName}"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="userid" class="col-sm-3 col-form-label">아이디</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="userid" id="userid" placeholder="아이디를 입력하세요!"/>
                            </div>
                            <div class="tagcloud">
                                <a type="button" class="tag-cloud-link">중복확인</a>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="userpw" class="col-sm-3 col-form-label">비밀번호</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="userpw" id="userpw" placeholder="비밀번호를 입력하세요!"/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="userpw2" class="col-sm-3 col-form-label">비밀번호 확인</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control" name="userpw2" id="userpw2" placeholder="비밀번호를 재입력해주세요!"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</section>

<%@ include file="../includes/footer.jsp" %>
