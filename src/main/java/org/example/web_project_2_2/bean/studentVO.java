package org.example.web_project_2_2.bean;

import org.example.web_project_2_2.common.JDBCUtil;

import java.sql.Connection;

public class studentVO {
    private int id;
    private String name;
    private int age;
    private String major;
    private String rc;
    private String hometown;
    // [추가] 학생증 파일 이름 필드
    private String idcard_filename; //

    public studentVO(){}

    public studentVO(String name, int age, String major, String rc, String hometown, String idcard_filename) {
        this.name = name;
        this.age = age;
        this.major = major;
        this.rc = rc;
        this.hometown = hometown;
        this.idcard_filename = idcard_filename; // 추가
    }

    public int getId() {
        return this.id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getAge() {
        return age;
    }
    public void setAge(int age) {
        this.age = age;
    }
    public String getMajor() {
        return major;
    }
    public void setMajor(String major) {
        this.major = major;
    }
    public String getRc() {
        return rc;
    }
    public void setRc(String rc) {
        this.rc = rc;
    }
    public String getHometown() {
        return hometown;
    }
    public void setHometown(String hometown) {
        this.hometown = hometown;
    }

    // 학생증 파일이름에 대한 getter setter를 추가
    public String getIdcard_filename() {return idcard_filename;}
    public void setIdcard_filename(String idcard_filename) {this.idcard_filename = idcard_filename;}
}
