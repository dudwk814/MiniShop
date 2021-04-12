<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-06
  Time: 오전 7:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="root" value="${pageContext.request.contextPath}/"/>
<%@ include file="../includes/header.jsp" %>

<br/><br/><br/><br/>

<section id="home-section" class="d-flex justify-content-center col-lg-12">

<div class="container">
    <h1>Board Register</h1>
    <form action="/board/register" method="post">
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
            <input type="writer" class="form-control" name="writer" id="writer" placeholder="writer" value="<sec:authentication property="principal.member.userid"/>">
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


        <button type="submit" class="btn btn-info float-right">글 작성</button>
    </form>
</div>
</section>
<br/><br/><br/><br/>

<script>
    var ckeditor_config = {
        resize_enaleb : false,
        enterMode : CKEDITOR.ENTER_BR,
        shiftEnterMode : CKEDITOR.ENTER_P,
        filebrowserUploadUrl : "/board/uploadImg?${_csrf.parameterName}=${_csrf.token}",
    };

    CKEDITOR.replace("content", ckeditor_config);
</script>

<script type="text/javascript">
    $(document).ready(function () {
       $("#listBtn").on("click", function () {
           self.location = "/board/list";
       });

        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";


        // Ajax spring security header.
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
        });
    });
</script>

</section>
<br/>

<%@ include file="../includes/footer.jsp"%>