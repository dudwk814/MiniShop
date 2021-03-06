<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-25
  Time: 오후 7:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}/"/>

<%@ include file="../../includes/header.jsp"%>

<br/><br/><br/><br/>

<section id="home-section" class="d-flex justify-content-center col-lg-12">


<br/><Br/>
<div class="col-lg-9">
    <h1>Notice Register</h1>
    <form action="/notice/modify" method="post">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" placeholder="title" name="title" value="<c:out value="${notice.title}"/>">
        </div>
        <div class="form-group">
            <label for="editor1">내용</label>
            <textarea name="content" id="editor1" rows="100" cols="80"><c:out value="${notice.content}"/></textarea>
        </div>
        <div class="form-group">
            <label for="writer">작성자</label>
            <input type="writer" class="form-control-plaintext" name="writer" id="writer" placeholder="writer" value="<c:out value="${notice.writer}"/>" readonly>
        </div>

        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <input type="hidden" name="amount" value="${cri.amount}"/>
        <input type="hidden" name="pageNum" value="${cri.pageNum}"/>
        <input type="hidden" name="type" value="${cri.type}"/>
        <input type="hidden" name="keyword" value="${cri.keyword}"/>
        <input type="hidden" name="nno" value="${notice.nno}">

        <button type="button" class="btn btn-outline-secondary btn-lg float-left" id="cancelBtn" style="margin-right: 10px;">취소</button>
        <button type="button" class="btn btn-outline-secondary btn-lg" id="listBtn">목록</button>
        <button type="submit" class="btn btn-outline-info float-right btn-lg">수정하기</button>
    </form>

</div>

</section>
<br/><br/><br/>



<script type="text/javascript">

    $(document).ready(function () {
        $("#listBtn").on("click", function () {
            self.location = "/board/list?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}";
        });

        $("#cancelBtn").on("click", function () {
            self.location = "/notice/read?nno=${notice.nno}&pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}";
        });


    });

    var ckeditor_config = {
        resize_enaleb: false,
        enterMode: CKEDITOR.ENTER_BR,
        shiftEnterMode: CKEDITOR.ENTER_P,
        filebrowserUploadUrl: "/board/uploadImg?${_csrf.parameterName}=${_csrf.token}",

    };

    CKEDITOR.replace("content", ckeditor_config);
</script>


<%@ include file="../../includes/footer.jsp"%>