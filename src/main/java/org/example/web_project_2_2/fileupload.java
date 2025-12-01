package org.example.web_project_2_2;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import org.example.web_project_2_2.bean.fileVO;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class fileupload {

// 이 메서드는 파일 업로드를 처리하고, 저장된 파일의 정보(제목과 파일명)를 FileVO 객체로 반환합니다.
public fileVO uploadFile(HttpServletRequest request) { // 메소드 이름은 uploadFile로 추정하여 변경

int sizeLimit = 15 * 1024 * 1024; // 15MB로 크기 제한 (15 * 1024 KB * 1024 B)

// 실제 파일이 저장될 서버의 물리적 경로를 가져옵니다. (예: webapp/upload)
String realPath = request.getServletContext().getRealPath("upload");
//System.out.println(realPath); // 경로 확인용 출력문 (주석 처리)

// 저장 경로가 디렉토리인지 확인하고, 없으면 생성합니다.
File dir = new File(realPath);
if (!dir.exists()) {
dir.mkdirs();
}

MultipartRequest multipartRequest = null;
String title = null;
String filename = null;

try {
// MultipartRequest 객체를 생성하는 순간 파일이 서버의 realPath에 저장됩니다.
multipartRequest = new MultipartRequest(request, realPath,
sizeLimit, "utf-8", new DefaultFileRenamePolicy());

// 폼 필드로부터 데이터(title)와 업로드된 파일명(photo)을 가져옵니다.
filename = multipartRequest.getFilesystemName("photo"); // 서버에 저장된 파일 이름
title = multipartRequest.getParameter("title"); // 파일 외의 일반 폼 데이터

} catch (IOException e) {
// 파일 업로드 중 IO 관련 예외 발생 시 처리
//throw new RuntimeException(e); // 예외를 던지거나
System.out.println("업로드 중 오류!"); // 콘솔에 오류 메시지 출력
e.printStackTrace();
}

// 업로드된 파일의 정보와 제목을 담은 FileVO 객체를 반환합니다.
return new fileVO(title, filename);
}
}