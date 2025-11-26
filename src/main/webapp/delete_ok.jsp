<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import ="org.example.web_project_2_2.DAO.studentDAO"%>
<%@ page import ="org.example.web_project_2_2.bean.studentVO"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
    <title>delete_ok.jsp</title>
</head>
<body>
<%
    // 1. list.jsp에서 넘겨받은 'id' 파라미터 값 읽기
    String idParam = request.getParameter("id");
    int studentId = -1; // 기본값 설정
    String msg = "";

    if (idParam != null && !idParam.isEmpty()) {
        try {
            // 2. 파라미터 값(문자열)을 정수형 ID로 변환
            studentId = Integer.parseInt(idParam);

            // 3. DAO를 사용하기 위한 VO 객체 준비
            studentVO vo = new studentVO();
            vo.setId(studentId); // 삭제할 ID 설정

            // 4. DAO를 통해 데이터베이스에서 삭제 실행
            studentDAO dao = new studentDAO();
            if (dao.deleteStudent(vo) == 1) {
                msg = studentId + ": Success to delete Student Data!";
            } else {
                msg = studentId + "ERROR: fail to delete Student Data";
            }

        } catch (NumberFormatException e) {
            msg = "ERROR: strange structure of Student ID";
        }
    } else {
        msg = "ERROR: fail to delete student Data";
    }
%>
</body>
<script>
    // 5. 처리 결과 알림 후 list.jsp로 이동
    alert("<%=msg%>");
    location.href = "list.jsp";
</script>
</html>