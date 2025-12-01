<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.web_project_2_2.DAO.studentDAO" %>
<%@ page import="org.example.web_project_2_2.bean.studentVO" %>

<%
    // URL에서 학생 ID를 가져옵니다.
    String idStr = request.getParameter("id");
    studentVO student = null;
    String existingFilename = "";

    if (idStr != null && !idStr.isEmpty()) {
        try {
            int studentId = Integer.parseInt(idStr);
            studentDAO dao = new studentDAO();
            studentVO vo = new studentVO();
            vo.setId(studentId);
            student = dao.getStudent(vo); // DB에서 해당 학생 정보 조회

            if (student != null) {
                existingFilename = student.getIdcard_filename() != null ? student.getIdcard_filename() : "";
            }
        } catch (Exception e) {
            // 예외 처리
        }
    }
%>

<h1>학생증 파일 등록/수정</h1>

<% if (student != null) { %>
<h2>[<%= student.getName() %>] 학생 파일 정보</h2>
<% } else { %>
<p>오류: 학생 ID를 찾을 수 없습니다.</p>
<a href="list.jsp">목록으로 돌아가기</a>
<% return; %>
<% } %>

<form action = "fileform2_ok.jsp" method = "post" enctype ="multipart/form-data">
    <input type="hidden" name="id" value="<%= student.getId() %>"/>
    <input type="hidden" name="existing_filename" value="<%= existingFilename %>"/>
    <input type="hidden" name="title" value="<%= student.getName() %> 학생증"/>

    <div style="margin-top: 10px;">
        현재 파일:
        <% if (!existingFilename.isEmpty()) { %>
        <a href="./upload/<%= existingFilename %>" target="_blank"><%= existingFilename %></a>
        <% } else { %>
        등록된 파일 없음
        <% } %>
    </div>

    <hr>

    <label for="file">새 파일 선택:</label>
    <input type = "file" name = "photo" id="file" required/>
    <input type = "submit" value = "파일 업로드 및 저장"/>
    <a href="list.jsp">취소</a>
</form>