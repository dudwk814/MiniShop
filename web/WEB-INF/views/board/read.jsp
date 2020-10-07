<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-06
  Time: 오후 4:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                <li class="nav-item">
                    <a class="nav-link" href="${root}board/list">Board</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link dropdown" href="/user/loginForm">
                        <span class="lnr lnr-user"></span></a>
                </li>

            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="col-lg-9">
        <div class="d-flex p-2 bd-highlight">
            <h4>Board Register</h4>
        </div>
    </div>


</div>

<div class="col-lg-auto">
    <form action="/board/register" method="post">
        <div class="form-group">
            <label for="bno">bno</label>
            <input type="text" class="form-control" placeholder="Enter title" name="bno" id="bno" value="<c:out value='${board.bno}'/>" readonly>
        </div>
        <div class="form-group">
            <label for="title">title</label>
            <input type="text" class="form-control" placeholder="Enter title" name="title" id="title" value="<c:out value='${board.title}'/>" readonly>
        </div>
        <div class="form-group">
            <label for="regDate">date</label>
            <input type="text" class="form-control" name="regDate" id="regDate" value="<fmt:formatDate pattern="yyyy-MM-dd" value='${board.regDate}'/>" readonly>
        </div>
        <div class="form-group">
            <label for="content">content</label>
            <textarea class="form-control" name="content" id="content" readonly><c:out value="${board.content}"/></textarea>
        </div>
        <div class="form-group">
            <label for="writer">writer</label>
            <input type="text" class="form-control" placeholder="Enter writer" name="writer" id="writer" value="<c:out value='${board.writer}'/>" readonly>
        </div>
        <a href="/board/list"><button id="listBtn" type="button" class="btn btn-info">목록</button></a>
        <a href="/board/modifyForm?bno=${board.bno}" class="float-right"><button id="modBtn" type="button" class="btn btn-danger">수정</button></a>&nbsp; &nbsp; &nbsp;
        <button id="removeBtn" type="button" class="btn btn-warning">삭제</button>
    </form>
</div>
</div>

<script>
    $(document).ready(function () {
        var formObj = $("form");

        var bnoValue = '${board.bno}';

        $("#removeBtn").on("click", function () {
            formObj.attr("action", "/board/remove");

            formObj.submit();
        });
    });
</script>


<%@ include file="../includes/footer.jsp"%>