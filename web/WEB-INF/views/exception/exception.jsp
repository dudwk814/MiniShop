<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-11-14
  Time: 오후 7:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>

<%@ include file="../includes/header.jsp"%>

<div class="hero-wrap hero-bread" style="background-image: url('/resources/shop/images/bg_6.jpg');">
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="breadcrumbs"><span class="mr-2"><a href="${root}">Home</a></span></p>
                <h1 class="mb-0 bread">잘못된 요청입니다.</h1>
                <h1 class="mb-0 bread">해당 페이지가 반복된다면 잠시 후 다시 시도 하시거나 관리자에게 문의해주세요.</h1>
            </div>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp"%>