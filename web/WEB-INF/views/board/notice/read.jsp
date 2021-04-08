<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-21
  Time: 오후 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="root" value="${pageContext.request.contextPath}/"/>
<%@ include file="../../includes/header2.jsp" %>

<br/><br/><br/><br/>

<section id="home-section" class="d-flex justify-content-center col-lg-12">

    <div class="col-lg-9">
        <div class="row">
            <div class="col-lg-12">
                <div class="card border-white">
                    <div class="card-header bg-transparent">
                        <strong><h1><c:out value="${notice.title}"/></h1></strong>
                        <small class="card-title">
                            &nbsp;<c:out value="${notice.writer}"/>&nbsp; | &nbsp;<fmt:formatDate
                                value="${notice.regDate}" pattern="yyyy.MM.dd. H:m"/>
                        </small>
                    </div>
                    <div class="card-body" style="border-bottom: 0px;">
                        <article class="content-area">
                            <c:out value="${notice.content}" escapeXml="false"/>
                        </article>
                    </div>
                    <div class="card-body bg-transparent">
                        <a href="/board/list?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}">
                            <button id="listBtn" type="button" class="btn btn-outline-secondary">목록</button>
                        </a>


                        <sec:authorize access="isAuthenticated()">
                            <c:if test="${notice.writer == userid}">
                                <div class="float-right dropdown">
                                    <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                       style="color: black;">
                                        <i class="fa fa-gear fa-lg" data-toggle="tooltip" data-placement="bottom"
                                           title="게시물 메뉴"></i>
                                    </a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li>
                                            <a href="#" id="modBtn" style="color: black;">
                                                &nbsp; <i class="fa fa-edit fa-fw"></i> 수정
                                            </a>
                                        </li>
                                        <li>
                                            <a id="removeBtn" href="#" style="color: black;">
                                                &nbsp; <i class="fa fa-trash-o fa-fw"></i> 삭제
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </c:if>
                        </sec:authorize>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<br/><br/>

<script>
    $(document).ready(function (e) {

        <!-- Bootstrap Tooltips -->
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        });

        // 게시글 작성자
        var writer = '<c:out value="${notice.writer}"/>';

        <sec:authorize access="isAuthenticated()">
        var userid = '<sec:authentication property="principal.member.userid"/>';
        </sec:authorize>

        <!-- 게시글 수정 버튼 클릭 시 /board/modifyForm으로 이동 -->
        $("#modBtn").on("click", function (e) {
            //create element (form)
            var modForm = $('<form></form>');
            modForm.attr("name", "modForm");
            modForm.attr("method", "post");
            modForm.attr("action", "/notice/modifyForm");

            modForm.append($('<input/>', {type: 'hidden', name: 'nno', value: '<c:out value="${notice.nno}"/>'}));
            modForm.append($('<input/>', {type: 'hidden', name: 'pageNum', value: '<c:out value="${cri.pageNum}"/>'}));
            modForm.append($('<input/>', {type: 'hidden', name: 'amount', value: '<c:out value="${cri.amount}"/>'}));
            modForm.append($('<input/>', {type: 'hidden', name: 'type', value: '<c:out value="${cri.type}"/>'}));
            modForm.append($('<input/>', {type: 'hidden', name: 'keyword', value: '<c:out value="${cri.keyword}"/>'}));
            modForm.append($('<input/>', {type: 'hidden', name: '${_csrf.parameterName}', value: '${_csrf.token}'}));

            modForm.appendTo('body');
            modForm.submit();

        });


        <!-- 삭제 버튼 클릭 시 게시글 삭제 -->
        $("#removeBtn").on("click", function () {

            <sec:authorize access="isAnonymous()">
            alert("로그인 후 이용가능합니다.");
            return;
            </sec:authorize>

            var removeForm = $('<form></form>');
            removeForm.attr("name", "removeForm");
            removeForm.attr("method", "post");
            removeForm.attr("action", "/notice/remove");

            removeForm.append($('<input/>', {type: 'hidden', name: 'nno', value: '<c:out value="${notice.nno}"/>'}));
            removeForm.append($('<input/>', {
                type: 'hidden',
                name: 'pageNum',
                value: '<c:out value="${cri.pageNum}"/>'
            }));
            removeForm.append($('<input/>', {type: 'hidden', name: 'amount', value: '<c:out value="${cri.amount}"/>'}));
            removeForm.append($('<input/>', {type: 'hidden', name: 'type', value: '<c:out value="${cri.type}"/>'}));
            removeForm.append($('<input/>', {
                type: 'hidden',
                name: 'keyword',
                value: '<c:out value="${cri.keyword}"/>'
            }));
            removeForm.append($('<input/>', {type: 'hidden', name: '${_csrf.parameterName}', value: '${_csrf.token}'}));

            removeForm.appendTo('body');

            if (userid == writer) {
                if (confirm("글을 삭제하시겠습니까?") == true) {

                    removeForm.submit();
                } else {
                    return;
                }
            } else {
                alert("작성자 본인만 삭제할 수 있습니다.");
                return;
            }

        });

    });


</script>

<%@ include file="../../includes/footer.jsp" %>