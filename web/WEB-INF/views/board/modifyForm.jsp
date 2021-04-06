<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-06
  Time: 오후 8:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}/"/>

<%@ include file="../includes/header2.jsp" %>

<br/><br/><br/><br/>

<section id="home-section" class="d-flex justify-content-center col-lg-12">

    <div class="col-lg-9">
        <h1>게시글 수정</h1>
        <form action="/board/modify" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <input type="hidden" name="pageNum" value="${cri.pageNum}">
            <input type="hidden" name="amount" value="${cri.amount}">
            <div class="form-group">
                <label for="bno">글 번호</label>
                <input type="text" class="form-control-plaintext" id="bno" placeholder="bno" name="bno"
                       value="<c:out value='${board.bno}'/>" readonly>
            </div>

            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" class="form-control" id="title" placeholder="title" name="title"
                       value="<c:out value='${board.title}'/>">
            </div>
            <div class="form-group">
                <label for="editor1">내용</label>
                <textarea name="content" id="editor1" rows="20" cols="80"><c:out value="${board.content}"/></textarea>
            </div>
            <div class="form-group">
                <label for="writer">작성자</label>
                <input type="text" class="form-control-plaintext" name="writer" id="writer" placeholder="writer"
                       value="<c:out value='${board.writer}'/>" readonly>
            </div>

            <a href="/board/list">
                <button type="button" id="listBtn" class="btn btn-primary">목록</button>
            </a>
            <button type="submit" class="btn btn-info float-right">수정하기</button>
        </form>
    </div>
    </div>
    </div>
</section>
<br/><br/><br/><br/>



<script type="text/javascript">

    $(document).ready(function () {
        $("#listBtn").on("click", function () {
            self.location = "/board/list";
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


<%@ include file="../includes/footer.jsp" %>