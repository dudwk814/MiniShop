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

<%@ include file="../includes/header2.jsp"%>

<br/><br/><br/><br/>

<section id="home-section" class="d-flex justify-content-center col-lg-12">

<div class="col-lg-9">
    <h1>Board Modify</h1>
    <form action="/board/modify" method="post">

        <input type="hidden" name="pageNum" value="${cri.pageNum}">
        <input type="hidden" name="amount" value="${cri.amount}">
        <div class="form-group">
            <label for="bno">bno</label>
            <input type="text" class="form-control" id="bno" placeholder="bno" name="bno" value="<c:out value='${board.bno}'/>" readonly>
        </div>

        <div class="form-group">
            <label for="title">title</label>
            <input type="text" class="form-control" id="title" placeholder="title" name="title" value="<c:out value='${board.title}'/>">
        </div>
        <%--<div class="form-group">
            <label for="regDate">date</label>
            <input type="text" class="form-control" name="regDate" id="regDate" value="<fmt:formatDate pattern="yyyy-MM-dd" value='${board.regDate}'/>" readonly>
        </div>--%>
        <div class="form-group">
            <label for="content">content</label>
            <input type="content" class="form-control" name="content" id="content" placeholder="content" value="<c:out value='${board.content}'/>">
        </div>
        <div class="form-group">
            <label for="writer">writer</label>
            <input type="text" class="form-control" name="writer" id="writer" placeholder="writer" value="<c:out value='${board.writer}'/>" readonly>
        </div>

        <a href="/board/list"><button type="button" id="listBtn" class="btn btn-primary">List</button></a>
        <button type="submit" class="btn btn-info float-right">Submit Information</button>
    </form>
</div>
</div>
</div>
</section>
<br/><br/><br/><br/>

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
        $("#listBtn").on("click", function () {
            self.location = "/board/list";
        });
    });
</script>



<%@ include file="../includes/footer.jsp"%>