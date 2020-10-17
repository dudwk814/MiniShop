<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-18
  Time: 오전 2:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Custom Login</h1>
    <h2><c:out value="${error}"/></h2>
    <h2><c:out value="${logout}"/></h2>

    <form action="/login" method="post">
        <input type="text" name="userid" value="admin"><br>
        <input type="password" name="userpw" value="admin"><br>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <input type="submit">
    </form>
</body>
</html>
