<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import ="java.io.File"%>
<%@ page import ="com.oreilly.servlet"%>
<%@ page import ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<html>
<head></head>
<body>
<%
    String filename = "";
    int sizeLimit = 15 * 1024 * 1024; // 15메가바이트를 멕시멈 크기로 잡은 것이다.

    String realPath = request.getServletContext().getRealPath("upload"); //upload란 이름으로 submit했디 때문
    // getServletContext로 현재 위치의 url(?) www.localhost:8080 ... /fileform_ok.jsp 의 내용에서 뭐만? 가지고 오는듯(?)
    System.out.println(realPath);

    File dir = new File(realPath);//File 클래스는 java.io에서 import한 것
    if(!dir.exists()){ // 파일 디렉토리가 존재하지 않는다면
        dir.mkdirs(); // 디렉토리를 생성한다
    }

    MultipartRequest multipartRequest = null;
    multipartRequest = new MultipartRequest(request, realPath,
            sizeLimit, "utf-8", new DefaultFileRenamePolicy());

    filename = multipartRequest.getFilesystemName("photo");

    String imagepath = "";
    if(filename != null){ // null이 아닌 ""로 체크하는 경우가 있으나, 파일이 없는 경우 null이 리턴되므로 null 체크가 안전합니다.
%>
    <h3><%=filename%></h3>
    <img src='./upload/" + filename + "' height=400>
<%
        }
%>
</body>
</html>