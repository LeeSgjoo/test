package org.example.web_project_2_2.bean;

public class fileVO {
    private String title;
    private String filename; // 서버에 저장된 고유 파일명
    private String orgFilename; // 사용자가 업로드한 원본 파일명 (추가)
    private long fileSize; // 파일 크기 (bytes) (추가)

    // 1. 기본 생성자
    public fileVO() {
    }

    // 2. 파일 업로드 후 제목과 파일명을 받는 생성자 (강의 노트 기반)
    public fileVO(String title, String filename) {
        this.title = title;
        this.filename = filename;
    }

    // 3. 모든 필드를 받는 생성자 (옵션)
    public fileVO(String title, String filename, String orgFilename, long fileSize) {
        this.title = title;
        this.filename = filename;
        this.orgFilename = orgFilename;
        this.fileSize = fileSize;
    }

    // Getter와 Setter 메서드 (Java Beans 규약)

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getOrgFilename() {
        return orgFilename;
    }

    public void setOrgFilename(String orgFilename) {
        this.orgFilename = orgFilename;
    }

    public long getFileSize() {
        return fileSize;
    }

    public void setFileSize(long fileSize) {
        this.fileSize = fileSize;
    }
}
