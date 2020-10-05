<%--
  Created by IntelliJ IDEA.
  User: PCY
  Date: 2020-10-06
  Time: 오전 7:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/board/register" method="post">
        제목 <input type="text" name="title"><br/>
        내용 <input type="text" name="content"><br/>
        작성자 <input type="text" name="writer"></br>

        <button type="submit">확인</button>
    </form>
</body>
</html>
