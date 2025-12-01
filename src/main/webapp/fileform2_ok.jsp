<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.web_project_2_2.fileupload" %>
<%@ page import="org.example.web_project_2_2.bean.fileVO" %>
<%@ page import="org.example.web_project_2_2.DAO.studentDAO" %>
<%@ page import="org.example.web_project_2_2.bean.studentVO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> <%-- MultipartRequest 클래스 접근용 --%>

<% request.setCharacterEncoding("UTF-8"); %>

<%
    String msg = "";
    int studentId = 0;

    fileupload fileUpload = new fileupload();
    fileVO fileInfo = null;
    MultipartRequest multi = null; // fileUpload에서 가져올 객체

    try {
        // 1. 파일 업로드 실행 (파일이 디스크에 저장됨)
        fileInfo = fileUpload.uploadFile(request);
        multi = fileUpload.getMultipartRequest(); // [수정된 fileupload.java를 통해 MultipartRequest 접근]

        if (multi == null) {
            throw new Exception("파일 업로드 처리에 실패했습니다. (MultipartRequest 객체 null)");
        }

        // 2. 파라미터 추출 (MultipartRequest 객체에서 추출)
        String idStr = multi.getParameter("id");
        String existingFilename = multi.getParameter("existing_filename");
        String newFilename = (fileInfo != null) ? fileInfo.getFilename() : null; // 새로 업로드된 파일명

        if (idStr == null || idStr.isEmpty()) {
            throw new Exception("학생 ID가 누락되었습니다.");
        }

        studentId = Integer.parseInt(idStr);
        String finalFilename = existingFilename; // 최종 파일명은 기본적으로 기존 파일명

        // 3. 파일 이름 결정 및 기존 파일 삭제
        if (newFilename != null) {
            // 새 파일이 성공적으로 업로드된 경우
            finalFilename = newFilename;

            // 기존 파일이 있었다면 서버에서 삭제
            if (existingFilename != null && !existingFilename.isEmpty()) {
                String realPath = application.getRealPath("upload");
                File oldFile = new File(realPath, existingFilename);
                if (oldFile.exists()) {
                    oldFile.delete(); // 실제 서버 디스크 파일 삭제
                }
            }
        } else {
            // 파일이 선택되지 않았거나 업로드에 실패한 경우
            msg = "ERROR: 파일 업로드 실패. 파일이 유효하지 않거나 크기 제한 초과.";
            throw new Exception(msg);
        }

        // 4. DB 업데이트 (파일 이름만 업데이트)
        studentDAO dao = new studentDAO();
        studentVO s = new studentVO();
        s.setId(studentId);

        // **[핵심]** 파일명만 업데이트하기 위해 기존 학생 정보를 모두 조회
        s = dao.getStudent(s);

        if (s == null) {
            // DB에 파일명 저장 실패 시, 새로 업로드된 파일도 삭제 (롤백)
            if (newFilename != null) {
                String realPath = application.getRealPath("upload");
                File uploadedFile = new File(realPath, newFilename);
                if (uploadedFile.exists()) {
                    uploadedFile.delete();
                }
            }
            throw new Exception("해당 ID의 학생 정보를 찾을 수 없습니다.");
        }

        s.setIdcard_filename(finalFilename); // 파일 이름만 업데이트

        int updateResult = dao.updateStudent(s);

        if (updateResult == 1) {
            msg = studentId + "번 학생의 파일 정보가 성공적으로 업데이트되었습니다.";
        } else {
            msg = "ERROR: DB 업데이트에 실패했습니다.";
        }

    } catch (NumberFormatException e) {
        msg = "ERROR: 유효하지 않은 학생 ID 형식입니다.";
    } catch (Exception e) {
        // 모든 예외를 최종적으로 잡아서 메시지를 출력합니다.
        msg = e.getMessage().contains("ERROR") ? e.getMessage() : "ERROR: 시스템 처리 중 오류 발생";
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head></head>
<body>
<script>
    alert("<%=msg%>");
    location.href = "list.jsp";
</script>
</body>
</html>