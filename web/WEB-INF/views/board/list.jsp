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

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <!-- icomoon.io icon -->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
</head>
<body>
<script src="/resources/shop/vendor/jquery/jquery.min.js"></script>
<div>


    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="${root}">Mini Shop</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                    aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
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
        <h1 class="h3 mb-2 text-gray-800">게시판</h1><br/>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Board</h6>
            </div>
            <br/>

            <div class="col-lg-auto">
                <form>
                    <!-- Search form -->
                    <div class="form-group">
                        <input class="form-control col-lg-3" type="text" placeholder="Search" aria-label="Search">
                        <button class="btn btn-info">검색</button>
                        <button id="regBtn" type="button" class="btn btn-info float-right">Register New Board</button>
                    </div>
                </form>
            </div>
            <%--<div class="col-lg-auto">

            </div>--%>
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
                                <td><a href="${root}board/read?bno=<c:out value='${board.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}'/>"><c:out
                                        value="${board.title}"/></a></td>
                                <td><c:out value="${board.writer}"/></td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}"/></td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <div class="float-right">
                        <ul class="pagination">
                            <c:if test="${pageMaker.prev}">
                                <a href="${root}board/list?pageNum=${pageMaker.startPage - 1}&amount=10"><button class="btn btn-info">Previous</button> </a>
                            </c:if>
                            &nbsp;
                            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                <a href="${root}board/list?pageNum=${num}&amount=10"><button class="btn btn-outline-secondary ${pageMaker.cri.pageNum == num ? "active" : ""}">${num}</button> </a>
                            </c:forEach>
                            &nbsp;
                            <c:if test="${pageMaker.next}">
                                <a href="${root}board/list?pageNum=${pageMaker.endPage + 1}&amount=10"><button class="btn btn-info">Next</button> </a>
                            </c:if>
                        </ul>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    처리가 완료되었습니다.
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button id="listBtn" type="button" class="btn btn-primary float-left">List</button>

                </div>
            </div>
        </div>

    </div>
    <!-- /.container-fluid -->
</div>

<script type="text/javascript">
    $(document).ready(function () {

        // 게시글을 등록할 때의 bno값 (register 메서드의 bno값)
        var result = '<c:out value="${result}"/>';
        var writerValue = '<c:out value="${writer}"/>';

        checkModal(result);

        history.replaceState({}, null, null);
        function checkModal(result) {

            if (result === '' || history.state) {
                return;
            }

            if(parseInt(result) > 0) {
                $(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
            }

            $("#myModal").modal('show');
        }
        $("#regBtn").on("click", function () {
            self.location = "/board/registerForm";
        });
    });
</script>


<%@ include file="../includes/footer.jsp" %>
</body>