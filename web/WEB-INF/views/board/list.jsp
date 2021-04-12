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
<%@ include file="../includes/header.jsp" %>

<br/><br/><br/><br/>

<section id="home-section" class="d-flex justify-content-center col-lg-12">
    <div class="container">
        <div class="row">


            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Board
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <button id="noticeRegBtn" type="button" class="btn btn-link float-right"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;공지 쓰기</button>
                            &nbsp;
                        </sec:authorize>
                        <button id="regBtn" type="button" class="btn btn-link float-right"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp; 글 쓰기</button>
                    </h6>
                </div>
                <br/>


                <div class="row">
                    <div class="col-lg-12 col-12">
                        <br/>

                        <form id="searchForm" action="/board/list" method="get">
                            <!-- Search form -->
                            <div class="form-group"> &nbsp;&nbsp;&nbsp;&nbsp;
                                <select name="type" class="custom-select col-4" id="inputGroupSelect02"
                                        style="width: 200px;">
                                    <option value="" <c:out value="${pageMaker.cri.type == null ? 'selected':''}"/>>--
                                    </option>
                                    <option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"/>>제목
                                    </option>
                                    <option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"/>>내용
                                    </option>
                                    <option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected':''}"/>>작성자
                                    </option>
                                    <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':''}"/>>제목
                                        OR
                                        내용
                                    </option>
                                    <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected':''}"/>>제목
                                        OR
                                        작성자
                                    </option>
                                    <option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected':''}"/>>
                                        제목
                                        OR 내용 OR 작성자
                                    </option>
                                </select>
                                <input type="text" name="keyword" placeholder="검색"
                                       value="<c:out value="${pageMaker.cri.keyword}"/>" class="col-5 col-md-2"/>
                                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                                <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                <button id="searchBtn" class="btn btn-info">검색</button>

                            </div>
                        </form>
                    </div>

                </div>


                <div class="card-body">
                    <div class="container-fluid">
                        <div class="row">

                            <div class="table-responsive-sm table-sm">
                                <table class="table table-borderless table-hover" id="dataTable">
                                    <thead>
                                    <tr>
                                        <th scope="col">#번호</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">작성자</th>
                                        <th scope="col">작성일</th>
                                        <th scope="col">수정일</th>
                                        <th scope="col">조회수</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach var="notice" items="${noticeList}">
                                        <tr class="table-success">
                                            <td align="center">#<c:out value="${notice.nno}"/></td>
                                            <td><a style="color: black;"
                                                   href="/notice/read?nno=<c:out value='${notice.nno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}'/>">
                                                <c:out value="${notice.title}"/></a></td>
                                            <td align="center"><c:out value="${notice.writer}"/></td>
                                            <td align="center"><fmt:formatDate pattern="yyyy-MM-dd"
                                                                               value="${notice.regDate}"/></td>
                                            <td align="center"><fmt:formatDate pattern="yyyy-MM-dd"
                                                                               value="${notice.updateDate}"/></td>
                                            <td align="center"><c:out value="${notice.hit}"/></td>
                                        </tr>
                                    </c:forEach>

                                    <c:forEach var="board" items="${board}">
                                        <tr>
                                            <td align="center">#<c:out value="${board.bno}"/></td>
                                            <td><a style="color: black;"
                                                   href="${root}board/read?bno=<c:out value='${board.bno}&pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}'/>">
                                                <c:out
                                                        value="${board.title}"/>
                                                <span class="badge badge-info float-right"><c:out
                                                        value="${board.replyCnt}"/></span>
                                            </a></td>
                                            <td align="center"><c:out value="${board.writer}"/></td>
                                            <td align="center"><fmt:formatDate pattern="yyyy-MM-dd"
                                                                               value="${board.regDate}"/></td>
                                            <td align="center"><fmt:formatDate pattern="yyyy-MM-dd"
                                                                               value="${board.updateDate}"/></td>
                                            <td align="center"><c:out value="${board.hit}"/></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>


                                <div class="d-flex justify-content-center">
                                    <nav aria-label="page navigation ">
                                        <ul class="pagination d-flex justify-content-center">
                                            <c:if test="${pageMaker.prev}">
                                                <li class="page-item"><a class="page-link"
                                                                         href="${root}board/list?pageNum=${pageMaker.startPage - 1}&amount=10&keyword=${pageMaker.cri.keyword}&type=${pageMaker.cri.type}">Previous</a>
                                                </li>
                                            </c:if>

                                            <c:forEach var="num" begin="${pageMaker.startPage}"
                                                       end="${pageMaker.endPage}">
                                            <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""}"><a
                                                    class="page-link"
                                                    href="${root}board/list?pageNum=${num}&amount=10&keyword=${pageMaker.cri.keyword}&type=${pageMaker.cri.type}">${num}</a>
                                                </c:forEach>

                                                <c:if test="${pageMaker.next}">
                                            <li class="page-item"><a class="page-link"
                                                                     href="${root}board/list?pageNum=${pageMaker.endPage + 1}&amount=10&keyword=${pageMaker.cri.keyword}&type=${pageMaker.cri.type}"">Next</a>
                                            </li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </div>

                                <!-- Modal -->
                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                                     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                처리가 완료되었습니다.
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                                    Close
                                                </button>
                                                <button type="button" class="btn btn-primary">Save changes</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        </dlv>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->
        </div>
    </div>
</section>

<br/>


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

        /* 글 작성 후 모달 활성화 체크 함수 */
        function checkModal(result) {

            if (result === '' || history.state) {
                return;
            }

            if (parseInt(result) > 0) {
                $(".modal-body").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
            }

            $("#myModal").modal('show');
        }


        /* 글쓰기 버튼 클릭 시 글쓰기 폼으로 이동 */
        $("#regBtn").on("click", function () {

            <sec:authorize access="isAnonymous()">
            alert("로그인 후 이용가능합니다.");
            return;
            </sec:authorize>
            self.location = "/board/registerForm";
        });


        /* 검색 폼 */
        var searchForm = $("#searchForm");

        /* 검색 관련 함수 */
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