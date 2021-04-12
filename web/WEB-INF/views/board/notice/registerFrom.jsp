<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-24
  Time: 오후 6:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="root" value="${pageContext.request.contextPath}/"/>
<%@ include file="../../includes/header.jsp" %>


<br/><br/><br/><br/>

<section id="home-section" class="d-flex justify-content-center col-lg-12">
<div class="col-lg-9">
    <h1>Notice Register</h1>
    <form action="/notice/register" method="post">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" placeholder="title" name="title">
        </div>
        <div class="form-group">
            <label for="editor1">내용</label>
            <textarea name="content" id="editor1" rows="20" cols="80"></textarea>
        </div>
        <div class="form-group">
            <label for="writer">작성자</label>
            <input type="writer" class="form-control-plaintext" name="writer" id="writer" placeholder="writer" value="<sec:authentication property="principal.member.userid"/>" readonly>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

        <button type="button" class="btn btn-primary float-left" id="listBtn">목록</button>
        <button type="submit" class="btn btn-info float-right">공지 작성</button>
    </form>

</div>
</section>


<script type="text/javascript">

    $(document).ready(function () {

        $("#listBtn").on("click", function () {
            location.href = "/board/list";
        })

    });
</script>

<script>
    var ckeditor_config = {
        resize_enaleb : false,
        enterMode : CKEDITOR.ENTER_BR,
        shiftEnterMode : CKEDITOR.ENTER_P,
        filebrowserUploadUrl : "/board/uploadImg?${_csrf.parameterName}=${_csrf.token}",

    };



    CKEDITOR.replace("content", ckeditor_config);
</script>

<br/><br/><br/>

<%@ include file="../../includes/footer.jsp"%>