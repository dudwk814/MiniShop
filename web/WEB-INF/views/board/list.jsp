<%--  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-05
  Time: 오전 10:34
  To change this template use File | Settings | File Templates.--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>
<%@ include file="../includes/header2.jsp"%>

    <br/><br/><br/><br/>

    <section id="home-section" class="d-flex justify-content-center col-lg-12">



        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Board
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                         <button id="noticeRegBtn" type="button" class="btn btn-danger float-right">Register New Notice </button> &nbsp;
                    </sec:authorize>
                    <button id="regBtn" type="button" class="btn btn-link float-right">Register New Board</button></h6>

            </div>
            <br/>


            <%--<div class="col-lg-auto">

            </div>--%>
            <div class="card-body">

                <div class="table-responsive">
                    <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr class="table-primary table-borderless">
                            <th>#번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>수정일</th>
                            <th>조회수</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="notice" items="${noticeList}">
                            <tr class="table-success">
                                <td align="center"><c:out value="${notice.nno}"/></td>
                                <td><a href="/notice/read?nno=<c:out value='${notice.nno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}'/>"><c:out value="${notice.title}"/></a></td>
                                <td align="center"><c:out value="${notice.writer}"/></td>
                                <td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.regDate}"/></td>
                                <td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.updateDate}"/></td>
                                <td align="center"><c:out value="${notice.hit}"/></td>
                            </tr>
                        </c:forEach>

                        <c:forEach var="board" items="${board}">
                            <tr>
                                <td align="center"><c:out value="${board.bno}"/></td>
                                <td><a href="${root}board/read?bno=<c:out value='${board.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}'/>"><c:out
                                        value="${board.title}"/>
                                    <span class="badge badge-info float-right"><c:out value="${board.replyCnt}"/></span>
                                </a></td>
                                <td align="center"><c:out value="${board.writer}"/></td>
                                <td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}"/></td>
                                <td align="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
                                <td align="center"><c:out value="${board.hit}"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <div class="row">
                        <div class="col-lg-auto">
                            <form id="searchForm" action="/board/list" method="get">
                                <!-- Search form -->
                                <div class="form-group"> &nbsp;&nbsp;&nbsp;&nbsp;
                                    <select name="type">
                                        <option value="">--</option>
                                        <option value="T">제목</option>
                                        <option value="C">내용</option>
                                        <option value="W">작성자</option>
                                        <option value="TC">제목 OR 내용</option>
                                        <option value="TW">제목 OR 작성자</option>
                                        <option value="TWC">제목 OR 내용 OR 작성자</option>
                                    </select>
                                    <input type="text" name="keyword" placeholder="검색" />
                                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                    <button id="searchBtn" class="btn btn-info">검색</button>

                                </div>
                            </form>
                        </div>

                    </div>

                    <div class="float-right">
                        <nav aria-label="page navigation">
                            <ul class="pagination">
                                <c:if test="${pageMaker.prev}">
                                    <li class="page-item"> <a class="page-link" href="${root}board/list?pageNum=${pageMaker.startPage - 1}&amount=10">Previous</a></li>
                                </c:if>
                                &nbsp;
                                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                    <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""}"> <a class="page-link" href="${root}board/list?pageNum=${num}&amount=10&keyword=${pageMaker.cri.keyword}&type=${pageMaker.cri.type}">${num}</a>
                                </c:forEach>
                                &nbsp;
                                <c:if test="${pageMaker.next}">
                                    <li class="page-item"> <a class="page-link" href="${root}board/list?pageNum=${pageMaker.endPage + 1}&amount=10">Next</a></li>
                                </c:if>
                            </ul>
                        </nav>
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
                    <button id="regBtn2" type="button" class="btn btn-primary float-left">글 쓰기</button>

                </div>
            </div>
        </div>

    </div>
    <!-- /.container-fluid -->

    </section>
<br/>

<script src="/resources/shop/js/jquery.min.js"></script>
<script src="/resources/shop/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/resources/shop/js/popper.min.js"></script>
<script src="/resources/shop/js/bootstrap.min.js"></script>
<script src="/resources/shop/js/jquery.easing.1.3.js"></script>
<script src="/resources/shop/js/jquery.waypoints.min.js"></script>
<script src="/resources/shop/js/jquery.stellar.min.js"></script>
<script src="/resources/shop/js/owl.carousel.min.js"></script>
<script src="/resources/shop/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/shop/js/aos.js"></script>
<script src="/resources/shop/js/jquery.animateNumber.min.js"></script>
<script src="/resources/shop/js/bootstrap-datepicker.js"></script>
<script src="/resources/shop/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/resources/shop/js/google-map.js"></script>
<script src="/resources/shop/js/main.js"></script>

<script type="text/javascript">
    $(document).ready(function () {

        // 관리자 공지 글 작성
        var noticeRegBtn = $("#noticeRegBtn");

        noticeRegBtn.on("click", function () {
            location.href = "/notice/registerFrom";
        })

        // 게시글을 등록할 때의 bno값 (register 메서드의 bno값)
        var result = '<c:out value="${result}"/>';
        var writerValue = '<c:out value="${writer}"/>';

        var pageNum = '<c:out value="${pageMaker.cri.pageNum}"/>';
        var amount = '<c:out value="${pageMaker.cri.amount}"/>';

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

        $("#regBtn2").on("click", function () {
            self.location = "/board/registerForm";
        });

        var searchForm = $("#searchForm");

        $("#searchForm #searchBtn").on("click", function (e) {

            if (!searchForm.find("option:selected").val()) {
                alert("검색 조건을 선택하세요.");
                return false;
            }

            if (!searchForm.find("input[name='keyword']").val()) {
                alert("키워드를 입력하세요.");
                return false;
            }

            searchForm.find("input[name='pageNum']").val("1");
            e.preventDefault();

            searchForm.submit();
        });
    });


</script>


<%@ include file="../includes/footer.jsp" %>
</body>