<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-05
  Time: 오전 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>
<%--<%@ include file="../includes/header.jsp"%>--%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Homepage - Start Bootstrap Template</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <!-- icomoon.io icon -->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
</head>

<div>


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
                    <a class="nav-link" href="${root}">Shop
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="${root}board/list">Board</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">Contact</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link dropdown" href="/user/loginForm">
                        <span class="lnr lnr-user"></span></a>
                </li>

            </ul>
        </div>
    </div>
</nav>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Board</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Board</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>#번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>수정일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="board" items="${board}">
                    <tr>
                        <td><c:out value="${board.bno}"/></td>
                        <td><a href="${root}board/read?bno=<c:out value='${board.bno}'/>"><c:out value="${board.title}"/></a></td>
                        <td><c:out value="${board.writer}"/></td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}"/></td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <button id="listBtn" type="button" class="btn btn-primary float-left">List</button>
                <a href="/board/registerForm"> <button id="regBtn" type="button" class="btn btn-info float-right">Register New Board</button></a>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->
</div>

<%--
<script type="text/javascript">
    $(document).ready(function () {
       $("#regBtn").on("click", function () {
          self.location = "/board/registerForm";
       });
    });
</script>
--%>


<%@ include file="../includes/footer.jsp"%>
