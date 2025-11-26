<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import ="org.example.web_project_2_2.DAO.studentDAO"%>
<%@ page import ="org.example.web_project_2_2.bean.studentVO"%>
<%@ page import="java.util.List" %>

<%request.setCharacterEncoding("UTF-8");%>


<!DOCTYPE html>
<html>
<head>
    <title>wirte.jsp</title>
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <h1>자유게시판</h1>
    <%
        studentDAO studentDAO = new studentDAO();
        List<studentVO> list = studentDAO.getStudentList();

        // 가져온 리스트를 request 영역에 "list"라는 이름으로 저장합니다.
        request.setAttribute("list", list);
    %>

    <table id="list" width="90%">
        <tr>
            <th>Id</th>
            <th>name</th>
            <th>age</th>
            <th>major</th>
            <th>rc</th>
            <th>hometown</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>

        <c:forEach items="${list}" var="u">
            <tr>
                <td>${u.}</td>  <!-- studentVO의 id 출력 -->
                <td>${u.}</td>
                <td>${u.getAge()}</td>
                <td>${u.getMajor()}</td>
                <td>${u.getRc()}</td>
                <td>${u.getHometown()}</td>

                <!-- 수정 링크: 게시글의 Seq를 파라미터로 넘겨 edit.jsp로 이동 -->
                <td><a href="edit.jsp?id=${u.getId()}">Edit</a></td>


                <td><a href="javascript:delete_ok('${u.getId()}')">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    <br/>
    <a href="write.jsp">Add New Post</a>

</body>
</html>