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
<%@ include file="../../includes/header.jsp" %>



<div class="col-lg-9">
    <div class="row">
        <div class="col align-content-center">
            <div class="card">
                <div class="card-header">
                    Notice
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <form action="/board/register" method="post" id="form">
                            <input type="hidden" name="pageNum" value="${cri.pageNum}">
                            <input type="hidden" name="amount" value="${cri.amount}">
                            <div class="form-group">
                                <label for="nno">nno</label>
                                <input type="text" class="form-control" placeholder="Enter title" name="nno" id="nno"
                                       value="<c:out value='${notice.nno}'/>" readonly>
                            </div>
                            <div class="form-group">
                                <label for="title">title</label>
                                <input type="text" class="form-control" placeholder="Enter title" name="title"
                                       id="title" value="<c:out value='${notice.title}'/>" readonly>
                            </div>
                            <div class="form-group">
                                <label for="regDate">date</label>
                                <input type="text" class="form-control" name="regDate" id="regDate"
                                       value="<fmt:formatDate pattern="yyyy-MM-dd" value='${notice.regDate}'/>" readonly>
                            </div>
                            <div class="form-group">
                                <label for="content">content</label>
                                <textarea class="form-control" name="content" id="content" readonly><c:out
                                        value="${notice.content}"/></textarea>
                            </div>
                            <div class="form-group">
                                <label for="writer">writer</label>
                                <input type="text" class="form-control" placeholder="Enter writer" name="writer"
                                       id="writer" value="<c:out value='${notice.writer}'/>" readonly>
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        </form>

                        <a href="/board/list?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}">
                            <button id="listBtn" type="button" class="btn btn-info">목록</button>
                        </a>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <a href="/notice/modifyForm?nno=${notice.nno}&pageNum=${cri.pageNum}&amount=${cri.amount}"
                               class="float-right">
                                <button id="modBtn" type="button" class="btn btn-danger">수정</button>
                            </a>&nbsp; &nbsp; &nbsp;

                            <button id="removeBtn" type="button" class="btn btn-warning float-right">삭제</button>
                        </sec:authorize>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</div>
</div>

<script>
    $(document).ready(function (e) {
        var form = $("#form");
        var removeBtn = $("#removeBtn");
        
        removeBtn.on("click", function (e) {
            form.attr("action", "/notice/remove");
            form.submit();
        })
    })
</script>

<%@ include file="../../includes/footer.jsp" %>