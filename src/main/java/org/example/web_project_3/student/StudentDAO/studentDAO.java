package org.example.web_project_3.student.StudentDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository // Spring Bean으로 등록하며 데이터 접근 계층임을 명시
public class studentDAO {

    // Spring 컨테이너에 등록된 JdbcTemplate Bean을 자동 주입 (DI) 받습니다.
    @Autowired
    private JdbcTemplate template;

    public void setJdbcTemplate(JdbcTemplate template) {
        this.template = template;
    }

    // SQL 쿼리 문자열 정의
    private final String STUDENT_INSERT =
            "INSERT INTO student(name, age, major, rc, hometown, idcard_filename) VALUES(?, ?, ?, ?, ?, ?)";
    private final String STUDENT_LIST =
            "SELECT * FROM student ORDER BY id DESC"; // 기본 목록 조회 쿼리 (ID 내림차순)
    private final String STUDENT_GET =
            "SELECT * FROM student WHERE id=?";

    private final String STUDENT_UPDATE =
            "UPDATE student SET name=?, age=?, major=?, rc=?, hometown=?, idcard_filename=? WHERE id=?";
    private final String STUDENT_DELETE =
            "DELETE FROM student WHERE id=?";


    /**
     * 내부 클래스: DB의 ResultSet 행을 studentVO 객체로 매핑하는 역할
     * JdbcTemplate의 필수 요소입니다.
     */
    class StudentRowMapper implements RowMapper<studentVO> {
        @Override
        public studentVO mapRow(ResultSet rs, int rowNum) throws SQLException {
            studentVO student = new studentVO();
            student.setId(rs.getInt("id"));
            student.setName(rs.getString("name"));
            student.setAge(rs.getInt("age"));
            student.setMajor(rs.getString("major"));
            student.setRc(rs.getString("rc"));
            student.setHometown(rs.getString("hometown"));
            student.setIdcard_filename(rs.getString("idcard_filename")); // studentVO 필드 매핑
            return student;
        }
    }

    //------------------------------------------------------------
    // temlate.update() 파트

    // 학생 데이터 추가 (CREATE)
    public int insertStudent(studentVO vo) {
        // JdbcTemplate.update() 메서드는 INSERT, UPDATE, DELETE 쿼리를 실행합니다.
        // 연결 관리, PreparedStatement 생성, 리소스 해제 등을 모두 자동으로 처리합니다.
        return template.update(STUDENT_INSERT,
                vo.getName(),
                vo.getAge(),
                vo.getMajor(),
                vo.getRc(),
                vo.getHometown(),
                vo.getIdcard_filename()
        );
    }

    // 학생 데이터 수정 (UPDATE)
    public int updateStudent(studentVO vo) {
        return template.update(STUDENT_UPDATE,
                vo.getName(),
                vo.getAge(),
                vo.getMajor(),
                vo.getRc(),
                vo.getHometown(),
                vo.getIdcard_filename(),
                vo.getId() // WHERE 조건
        );
    }

    // 5. 학생 데이터 삭제 (DELETE)
    public int deleteStudent(int id) {
        return template.update(STUDENT_DELETE, id);
    }


    //------------------------------------------------------------
    /** temlate.query() 파트 **/
    // 학생 목록 조회 (READ LIST)
    public List<studentVO> getStudentList() {
        // JdbcTemplate.query() 메서드는 SELECT 쿼리를 실행하고,
        // 결과를 StudentRowMapper를 통해 List<studentVO>로 변환하여 반환합니다.
        return template.query(STUDENT_LIST, new RowMapper<studentVO>(){
            /** RowMapper 클래스의 mapRow() 메서드를 구현함 **/
            @Override
            public studentVO mapRow(ResultSet rs, int rowNum) throws SQLException {
                studentVO student = new studentVO();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setAge(rs.getInt("age"));
                student.setMajor(rs.getString("major"));
                student.setRc(rs.getString("rc"));
                student.setHometown(rs.getString("hometown"));
                student.setIdcard_filename(rs.getString("idcard_filename"));
                return student;
            }
        }
        );
    }

    // 특정 학생 상세 조회 (READ ONE)
    public studentVO getStudent(int id) {
        // queryForObject() 메서드는 단일 행을 반환할 때 사용합니다.
        // ID를 매개변수로 전달합니다.
        return template.queryForObject(STUDENT_GET,
                new Object[]{id}, new BeanPropertyRowMapper<studentVO>(studentVO.class));
    }
}