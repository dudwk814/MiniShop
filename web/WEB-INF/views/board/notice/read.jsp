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
        <div class="col align-content-center">

            <div class="col-lg-auto">
                    <strong><h1>${notice.title}</h1></strong>
                    <span>${notice.writer}</span> | <span><fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd"/> </span>
            </div>

            <hr/>

                        <form action="/board/register" method="post" id="form">
                            <input type="hidden" name="pageNum" value="${cri.pageNum}">
                            <input type="hidden" name="amount" value="${cri.amount}">
                            <input type="hidden" name="nno" value="${notice.nno}">
                            <div class="form-group" style="margin-bottom: 20px">
                                <p>${notice.content}</p>

                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        </form>

            <hr/>

                        <a href="/board/list?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}">
                            <button id="listBtn" type="button" class="btn btn-info">목록</button>
                        </a>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <a href="/notice/modifyForm?nno=${notice.nno}&pageNum=${cri.pageNum}&amount=${cri.amount}"
                               class="float-right">
                                <button id="modBtn" type="button" class="btn btn-danger">수정</button>
                            </a>&nbsp; &nbsp; &nbsp;

                            <button id="removeBtn" type="button" class="btn btn-warning float-right" style="margin-right: 10px;">삭제</button>
                        </sec:authorize>

        </div>
    </div>

</div>
</section>
<br/><br/>

<script>
    $(document).ready(function (e) {
        var form = $("#form");
        var removeBtn = $("#removeBtn");
        
        removeBtn.on("click", function (e) {

            if(confirm("글을 삭제하시겠습니까?") == true){
                form.attr("action", "/notice/remove");
                form.submit();
            } else {
                return;
            }
        });
    });


</script>

<%@ include file="../../includes/footer.jsp" %>