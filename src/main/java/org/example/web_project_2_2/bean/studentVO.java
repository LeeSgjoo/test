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

    public studentVO(){}

    public studentVO(String name, int age, String major, String rc, String hometown) {
        this.name = name;
        this.age = age;
        this.major = major;
        this.rc = rc;
        this.hometown = hometown;
    }

    public int getId() {
        return id;
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
}
