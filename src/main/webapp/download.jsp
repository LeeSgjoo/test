<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.ServletContext" %>
<%@ page import="javax.servlet.ServletOutputStream" %>

<%
    // 1. URL 파라미터로 다운로드할 파일명을 받습니다.
    String fileName = request.getParameter("filename");
    String oFilename = fileName; // oFilename은 실제 파일명을 저장합니다.
    // String oFilename = request.getParameter("orgfilename"); // 원본 파일명이 별도로 있다면 이 코드를 사용

    // 2. 파일이 저장된 웹 애플리케이션 내의 논리적 경로를 지정합니다.
    String savePath = "./upload";

    // 3. ServletContext를 통해 논리적 경로를 서버의 물리적 경로로 변환합니다.
    ServletContext context = request.getServletContext();
    String realPath = context.getRealPath(savePath);

    // 4. 다운로드할 파일의 실제 물리적 위치를 완성합니다.
    String sFilePath = realPath + "/" + fileName;

    // 5. 파일을 읽어들일 FileInputStream을 생성합니다.
    FileInputStream in = new FileInputStream(sFilePath);

    // 6. 파일의 MIME 타입(Content Type)을 가져옵니다.
    String sMimeType = context.getMimeType(sFilePath);

    // MIME 타입이 인식되지 않을 경우 기본값(바이너리 데이터)을 설정합니다.
    if (sMimeType == null) {
        sMimeType = "application/octet-stream";
    }
    // System.out.println("sMimeType>>" + sMimeType); // 디버깅용 출력문

    // 7. 응답 헤더 설정
    // 클라이언트 브라우저에게 응답 타입(MIME Type)을 설정합니다.
    response.setContentType(sMimeType);

    // 브라우저에게 파일을 다운로드 형식("attachment")으로 처리하도록 설정합니다.
    // filename에는 다운로드 시 클라이언트에게 보여줄 파일명(원본 파일명)을 설정합니다.
    response.setHeader("Content-Disposition", "attachment; filename=\"" + oFilename + "\"");

    // 8. 응답 스트림 준비 (클라이언트에게 데이터를 전송할 통로)
    ServletOutputStream fileOut = response.getOutputStream();

    // 9. 파일 데이터 읽기 및 전송 (Buffer를 사용하여 효율적으로 전송)
    int numRead;
    byte b[] = new byte[4096]; // 4KB 버퍼

    while ((numRead = in.read(b, 0, b.length)) != -1) {
        fileOut.write(b, 0, numRead);
    }

    // 10. 자원 해제 및 종료
    fileOut.flush();
    fileOut.close();
    in.close();
%>