<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-24
  Time: 오후 6:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:set var="root" value="${pageContext.request.contextPath}/"/>

<%@ include file="../../includes/header.jsp"%>


<br/><Br/>
<div class="col-lg-9">
    <h1>Board Register</h1>
    <form action="/notice/modify" method="post">
        <div class="form-group">
            <label for="title">title</label>
            <input type="text" class="form-control" id="title" placeholder="title" name="title">
        </div>
        <div class="form-group">
            <label for="content">content</label>
            <textarea name="content" id="content" class="form-control" placeholder="content"></textarea>
        </div>
        <div class="form-group">
            <label for="writer">writer</label>
            <input type="writer" class="form-control" name="writer" id="writer" placeholder="writer" value="<sec:authentication property="principal.member.userid"/>" readonly>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

        <button type="button" class="btn btn-outline-primary float-left" id="listBtn">List</button>
        <button type="submit" class="btn btn-info float-right">Submit Information</button>
    </form>

</div>


</div>
</div>


<script type="text/javascript">



    $(document).ready(function () {

        $("#listBtn").on("click", function () {
            location.href = "/board/list";
        })

    });
</script>



<br/><br/><br/><br/><br/><br/>

<%@ include file="../../includes/footer.jsp"%>