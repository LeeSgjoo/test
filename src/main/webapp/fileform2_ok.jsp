<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.web_project_2_2.fileupload" %>
<%@ page import="org.example.web_project_2_2.bean.fileVO" %>
<%
    fileupload fileUpload = new fileupload();
    fileVO vo = fileUpload.uploadFile(request);
%>
제목 : <%=vo.getTitle()%><br>
파일명 : <a href="./upload/<%=vo.getFilename()%>"><%=vo.getFilename()%></a><br>
다운로드 : <a href="download.jsp?filename=<%=vo.getFilename()%>"><%=vo.getFilename()%></a><br>