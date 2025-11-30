package org.example.web_project_2_2.DAO;

import org.example.web_project_2_2.bean.studentVO;
import org.example.web_project_2_2.common.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class studentDAO {

    private final String STUDNET_INSERT = "INSERT INTO student(name, age, major, rc, hometown) VALUES(?, ?, ?, ?, ?)";
    private final String STUDENT_UPDATE = "UPDATE student SET name=?, age=?, major=?, rc=?, hometown=? WHERE id=?";
    private final String STUDENT_DELETE = "DELETE FROM student WHERE id=?";
    private final String STUDENT_GET = "SELECT * FROM student WHERE id=?";
    private final String STUDENT_LIST = "SELECT * FROM student ORDER BY id DESC"; // id 기준 내림차순 정렬


    private void closeResources(Connection conn, PreparedStatement stmt, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public int insertStudent(studentVO VO) {
        Connection conn = null;
        PreparedStatement stmt = null;
        System.out.println("inside insertStudent");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(STUDNET_INSERT);
            stmt.setString(1, VO.getName());
            stmt.setInt(2, VO.getAge());
            stmt.setString(3, VO.getMajor());
            stmt.setString(4, VO.getRc());
            stmt.setString(5, VO.getHometown());
            int result = stmt.executeUpdate();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, null); // ResultSet이 없으므로 null 전달
        }
        return 0;
    }

    public int updateStudent(studentVO VO) {
        Connection conn = null;
        PreparedStatement stmt = null;
        System.out.println("inside updateStudent");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(STUDENT_UPDATE);
            // 1~5번: 새롭게 변경할 필드 값
            stmt.setString(1, VO.getName());
            stmt.setInt(2, VO.getAge());
            stmt.setString(3, VO.getMajor());
            stmt.setString(4, VO.getRc());
            stmt.setString(5, VO.getHometown());
            // 6번: WHERE 조건 (어떤 id를 수정할지)
            stmt.setInt(6, VO.getId());
            int result = stmt.executeUpdate();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, null);
        }
        return 0;
    }

    public int deleteStudent(studentVO VO) {
        Connection conn = null;
        PreparedStatement stmt = null;
        System.out.println("inside deleteStudent");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(STUDENT_DELETE);
            stmt.setInt(1, VO.getId()); // 삭제할 id 지정
            int result = stmt.executeUpdate();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, null);
        }
        return 0;
    }


    public studentVO getStudent(studentVO VO) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        studentVO student = null;
        System.out.println("inside getStudent");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(STUDENT_GET);
            stmt.setInt(1, VO.getId()); // *** 조회할 id 지정 ***
            rs = stmt.executeQuery();

            if (rs.next()) {
                student = new studentVO();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setAge(rs.getInt("age"));
                student.setMajor(rs.getString("major"));
                student.setRc(rs.getString("rc"));
                student.setHometown(rs.getString("hometown"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return student;
    }


    public List<studentVO> getStudentList() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<studentVO> studentList = new ArrayList<>();
        System.out.println("inside getStudentList");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(STUDENT_LIST);
            rs = stmt.executeQuery();

            while (rs.next()) {
                studentVO student = new studentVO();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setAge(rs.getInt("age"));
                student.setMajor(rs.getString("major"));
                student.setRc(rs.getString("rc"));
                student.setHometown(rs.getString("hometown"));
                studentList.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, stmt, rs);
        }
        return studentList;
    }

//    public static void main (String[]args){
//        studentDAO dao = new studentDAO();
//
//        // 1. INSERT 테스트
//        studentVO insertVO = new studentVO("김철수", 25, "컴퓨터공학", "기숙사", "서울");
//        if(dao.insertStudent(insertVO) == 1){
//            System.out.println("[INSERT] 데이터 추가 성공!!");
//        } else {
//            System.out.println("[INSERT] 데이터 추가 실패...");
//        }
//
//        // 2. LIST 테스트 (전체 목록 출력)
//        System.out.println("\n--- 전체 학생 목록 조회 ---");
//        List<studentVO> list = dao.getStudentList();
//        for (studentVO student : list) {
//            System.out.println(student.getId() + ": " + student.getName() + ", " + student.getMajor());
//        }
//
//        // 3. GET 테스트 (특정 ID 조회) - 목록의 첫 번째 학생을 조회한다고 가정
//        if (!list.isEmpty()) {
//            studentVO firstStudent = list.get(0);
//            studentVO getVO = new studentVO();
//            getVO.setId(firstStudent.getId()); // 첫 번째 학생의 ID 설정
//
//            studentVO resultStudent = dao.getStudent(getVO);
//            if (resultStudent != null) {
//                System.out.println("\n[GET] ID " + getVO.getId() + " 학생 조회 성공: " + resultStudent.getName() + " (" + resultStudent.getMajor() + ")");
//
//                // 4. UPDATE 테스트
//                resultStudent.setName("이승주_수정");
//                resultStudent.setMajor("경영정보");
//                resultStudent.setHometown("부산"); // 생성자에 없는 필드도 설정 가능하도록 가정
//
//                if (dao.updateStudent(resultStudent) == 1) {
//                    System.out.println(" [UPDATE] ID " + resultStudent.getId() + " 학생 수정 성공!");
//                    // 수정 후 다시 조회하여 확인
//                    studentVO updatedStudent = dao.getStudent(resultStudent);
//                    System.out.println("   -> 수정된 내용: " + updatedStudent.getName() + ", " + updatedStudent.getMajor());
//                } else {
//                    System.out.println("[UPDATE] 학생 수정 실패...");
//                }
//
//                // 5. DELETE 테스트
//                if (dao.deleteStudent(resultStudent) == 1) {
//                    System.out.println("\n[DELETE] ID " + resultStudent.getId() + " 학생 삭제 성공!");
//                } else {
//                    System.out.println("\n[DELETE] 학생 삭제 실패...");
//                }
//            } else {
//                System.out.println("\n[GET] 학생 조회 실패...");
//            }
//        } else {
//            System.out.println("\n[MAIN] 데이터가 없어 테스트를 진행할 수 없습니다.");
//        }
//    }
}