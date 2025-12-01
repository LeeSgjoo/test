package org.example.web_project_2_2;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import org.example.web_project_2_2.bean.fileVO;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class fileupload {
    private MultipartRequest multipartRequest; // [추가] 객체 저장을 위한 필드

    public fileVO uploadFile(HttpServletRequest request) {
        // ... (기존 realPath, sizeLimit, dir.mkdirs() 로직 생략)

        try {
            // [수정] MultipartRequest 객체를 필드에 저장합니다.
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

            String title = multipartRequest.getParameter("title");
            String filename = multipartRequest.getFilesystemName("photo");

            return new fileVO(title, filename);
        } catch (Exception e) {
            // ... (기존 예외 처리)
            return null;
        }
    }

    // [추가] MultipartRequest 객체를 반환하는 Getter
    public MultipartRequest getMultipartRequest() {
        return multipartRequest;
    }
}