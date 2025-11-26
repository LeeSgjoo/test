package org.example.web_project_2_2.common;

import java.sql.DriverManager;
import java.util.*;
import java.sql.Connection;

public class JDBCUtil {
    private static Connection conn = null;
    public static Connection getConnection(){
        try{
            if(conn == null || conn.isClosed()){
                Class.forName("org.mariadb.jdbc.Driver"); // 마리아디비의 드라이버를 작성
                conn = DriverManager.getConnection("jdbc:mariadb://walab.handong.edu:3306","W25_22300546","Ri0xae");
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return conn;
    }

//    public static void main(String[] args) {
//        System.out.println("1");
//        Connection conn = JDBCUtil.getConnection(); // static은 객체없이 클래스명으로 바로 쓸 수 있었지
//        if(conn != null){
//            System.out.println("DB연결 성공!!");
//        }
//    }
}
