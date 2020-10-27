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
<%@ include file="../includes/header2.jsp" %>

<br/><br/><br/><br/>

<section id="home-section" class="d-flex justify-content-center col-lg-12">

<div class="container">
    <h1>Board Register</h1>
    <form action="/board/register" method="post">
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
            <input type="writer" class="form-control" name="writer" id="writer" placeholder="writer" value="<sec:authentication property="principal.member.userid"/>">
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


        <button type="submit" class="btn btn-info float-right">Submit Information</button>
    </form>
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

</section>
<br/>

<%@ include file="../includes/footer.jsp"%>