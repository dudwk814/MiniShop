<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-24
  Time: 오후 6:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<%--
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
        <label for="title">제목</label>
        <input type="text" class="form-control" placeholder="Enter title" name="title" id="title">
    </div>
    <div class="form-group">
        <label for="content">내용</label>
        <input type="text" class="form-control" placeholder="Enter content" name="content" id="content">
    </div>
    <div class="form-group">
        <label for="writer">작성자</label>
        <input type="text" class="form-control" placeholder="Enter writer" name="writer" id="writer">
    </div>
    <a href="/board/list"><button id="listBtn" type="button" class="btn btn-info">목록</button></a>
    <button type="submit" class="btn btn-primary">작성</button>
</form>
</div>
</div>--%>

<br/><Br/>
<div class="container">
    <h1>Board Register</h1>
    <form action="/notice/register" method="post">
        <div class="form-group">
            <label for="title">title</label>
            <input type="text" class="form-control" id="title" placeholder="title" name="title">
        </div>
        <div class="form-group">
            <label for="content">content</label>
            <textarea name="content" id="content" class="form-control" placeholder="content"></textarea>
        </div>
        <div class="form-group">
            <label for="writer">writer</label>
            <input type="writer" class="form-control" name="writer" id="writer" placeholder="writer" value="<sec:authentication property="principal.member.userid"/>">
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


        <button type="submit" class="btn btn-info float-right">Submit Information</button>
    </form>
</div>
<br/><br/><br/><br/>

<script type="text/javascript">



    $(document).ready(function () {
        $("#listBtn").on("click", function () {
            self.location = "/board/list";
        });

    });
</script>



<%@ include file="../../includes/footer.jsp"%>