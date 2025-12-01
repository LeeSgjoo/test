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
        <h1 class="h3">학생 정보</h1>
        <a href = "write.jsp" class="btn btn-primary">학생 정보 추가</a>
        <a href = fileform.jsp class="btn btn-primary">fileUpload</a>
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
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Major</th>
            <th>Rc</th>
            <th>Hometown</th>
            <th>idcard_photo</th> <%-- [추가] 새 헤더 --%>
            <th>View</th> <%-- [수정] Function 컬럼을 View, Edit, Delete로 분할 --%>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="u">
            <tr>
                <td>${u.getId()}</td>
                <td>${u.getName()}</td>
                <td>${u.getAge()}</td>
                <td>${u.getMajor()}</td>
                <td>${u.getRc()}</td>
                <td>${u.getHometown()}</td>

                    <%-- [추가] 학생증 파일 이름 및 링크 표시 --%>
                <td>
                    <c:if test="${not empty u.getIdcard_filename()}">
                        <%-- 업로드 폴더 위치를 'upload'로 가정하고 링크 생성 --%>
                        <a href="./upload/${u.getIdcard_filename()}" target="_blank">보기</a>
                    </c:if>
                    <c:if test="${empty u.getIdcard_filename()}">
                        -
                    </c:if>
                </td>

                <td><a href="view.jsp?id=${u.getId()}">View</a></td>
                <td><a href="edit.jsp?id=${u.getId()}">Edit</a></td>
                <td><a href="delete_ok.jsp?id=${u.getId()}"
                       onclick="return confirm('정말로 ID ${u.getId()} 학생 정보를 삭제하시겠습니까?');">Delete</a></td>
            </tr>

        </c:forEach>
        </tbody>
    </table>
    <br/>
    <jsp:include page = "bottom.jsp"/>
<%--</body>--%>
<%--</html>--%>