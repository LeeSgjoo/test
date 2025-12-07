<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import ="org.example.web_project_3.student.StudentDAO.studentDAO"%>
<%@ page import ="org.example.web_project_3.student.StudentDAO.studentVO"%>
<%@ page import="java.util.List" %>

<%request.setCharacterEncoding("UTF-8");%>



<jsp:include page="top.jsp"/>
<h2 class="text-center mb-5 text-primary">학생 상세 정보 조회</h2>
<%
    String idStr = request.getParameter("id");
    if (idStr == null || idStr.isEmpty()) {
        System.out.println("error: 유효하지 않은 접근 (view.jsp liner:18)");
        response.sendRedirect("list.jsp"); // 검색해봄. list.jsp로 이동시키는 코드
        // out.println("<script>alert('조회할 학생 ID가 지정되지 않았습니다.'); location.href='list.jsp';</script>");
        return;
    }
    int id = 0; // ***** id를 이 스코프에서 선언해야 vo.setId(id);를 할 때 id를 넘길 수 있다.
    try{
        id = Integer.parseInt(idStr);
    }catch(NumberFormatException e) {
        response.sendRedirect("list.jsp"); // 검색해봄. list.jsp로 이동시키는 코드
        return;
    }

    // dao를 통해서 데이터베이스에 접근하여 학생정보를 조회한다.
    studentDAO dao = new studentDAO();
    studentVO vo = new studentVO();
    vo.setId(id);

    studentVO student = dao.getStudent(vo); //낚시용으로 id만 있는거 말고 데이터베이스에서 뽑아온 진짜 학생 정보를 가져
    // 조회 결과가 null인지 확인한다.
    if (student == null) {
        // 학생 정보가 없을 경우에도 리다이렉트 처리
        response.sendRedirect("list.jsp");
        return;
    }
%>

<div class="card shadow-sm">
    <div class="card-header bg-primary text-white">
        <h5 class="mb-0">학생 ID: <%=student.getId()%></h5>
    </div>
    <div class="card-body">
        <table class="table table-bordered">
            <tbody>
            <tr>
                <th scope="row" class="w-25">이름</th>
                <td><%=student.getName()%></td>
            </tr>
            <tr>
                <th scope="row">나이</th>
                <td><%=student.getAge()%> 세</td>
            </tr>
            <tr>
                <th scope="row">전공</th>
                <td><%=student.getMajor()%></td>
            </tr>
            <tr>
                <th scope="row">기숙사 (RC)</th>
                <td><%=student.getRc()%></td>
            </tr>
            <tr>
                <th scope="row">본가</th>
                <td><%=student.getHometown()%></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="card-footer text-end">
        <!-- 수정 페이지로 이동 -->
        <a href="edit.jsp?id=<%=student.getId()%>" class="btn btn-warning me-2">수정하기</a>
        <!-- 삭제 처리 (delete_ok.jsp로 이동) -->
        <a href="javascript:delete_ok('<%=student.getId()%>" class="btn btn-danger me-2">삭제하기</a>
        <!-- 목록 페이지로 이동 -->
        <a href="list.jsp" class="btn btn-secondary">목록</a>
    </div>
</div>

<!-- 삭제 확인을 위한 JavaScript 함수 (list.jsp에서 재사용) -->
<script>
    function delete_ok(studentId) {
        if (confirm(studentId + "번 학생 정보를 정말로 삭제하시겠습니까?")) {
            location.href = 'delete_ok.jsp?id=' + studentId;
        } else {
            alert("삭제가 취소되었습니다.");
        }
    }
</script>
<jsp:include page = "bottom.jsp"/>