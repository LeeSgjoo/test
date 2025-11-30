<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <title>fileform.jsp</title>
</head>
<body>
    <form action = fileform_ok.jsp method = "post" enctype ="multipart/form-data">
        <input type = "file" name = "photo" />
        <input type = "submit" value = "upload" />
    </form>
    <a href = "list.jsp">리스트 페이지 돌아가기</a>
</body>
</html>