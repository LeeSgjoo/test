<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import ="org.example.web_project_2_2.DAO.studentDAO"%>
<%@ page import ="org.example.web_project_2_2.bean.studentVO"%>
<%@ page import="java.util.List" %>

<%request.setCharacterEncoding("UTF-8");%>


<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>wirte.jsp</title>--%>
<%--    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">--%>
<%--</head>--%>
<%--<body>--%>
    <jsp:include page="top.jsp"/>
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1 class="h3">학생 목록</h1>
        <a href="write.jsp" class="btn btn-primary">학생 정보 추가</a>
    </div>
    <%
        studentDAO studentDAO = new studentDAO();
        List<studentVO> list = studentDAO.getStudentList();

        // 가져온 리스트를 request 영역에 "list"라는 이름으로 저장합니다.
        request.setAttribute("list", list);
    %>

    <table class="table table-hover table-striped">
        <thead class="table-dark">
        <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>성별</th>
            <th>주소</th>
            <th>전화번호</th>
            <th>학과</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="u">
                <tr>
                    <td>${u.getId()}</td>  <!-- studentVO의 id 출력 -->
                    <td>${u.getName()}</td>
                    <td>${u.getAge()}</td>
                    <td>${u.getMajor()}</td>
                    <td>${u.getRc()}</td>
                    <td>${u.getHometown()}</td>

                    <td><a href="edit.jsp?id=${u.getId()}">Edit</a></td>


                    <td><a href="javascript:delete_ok('${u.getId()}')">Delete</a></td>
                </tr>

            </c:forEach>
        </tbody>
    </table>
    <br/>
    <a href="write.jsp">Add New Post</a>
    <jsp:include page = "bottom.jsp"/>
<%--</body>--%>
<%--</html>--%>