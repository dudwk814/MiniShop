<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-11-28
  Time: 오후 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>

<html>
<head>

</head>
<body>
<section>
    <div class="form-group">
        <form action="/admin/product/insertProduct" method="post" enctype="multipart/form-data">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <input name="product_name" class="form-control"/><br/>
            <input name="product_price" class="form-control"/><br/>
            <input name="brand" class="form-control"/><br/>
            <textarea name="product_desc" class="form-control"></textarea><br/>
            <input type="file" name="product_photo" class="form-control"><br/>
            <input type="submit" value="확인">
        </form>
    </div>
</section>
</body>
</html>