// src/main/java/org/example/web_project_3/student/StudentDAO/studentService.java
package org.example.web_project_3.student.StudentDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service // 이 객체를 Spring Service Bean으로 등록
public class studentService {

    // studentDAO 객체를 주입받습니다.
    @Autowired
    studentDAO studentDAO;

    /** (1) 학생 데이터 추가 로직 **/
    public int insertStudent(studentVO vo) {
        // [비즈니스 로직 위치]: 이메일 형식 검사, 학번 중복 확인 등
        // 현재는 단순하게 DAO만 호출
        return studentDAO.insertStudent(vo);
    }

    /** (2) 학생 목록 조회 로직 **/
    public List<studentVO> getStudentList() {
        // [비즈니스 로직 위치]: 페이징 처리, 캐싱 로직 등

        // DAO를 호출하여 DB에서 데이터를 가져옵니다.
        List<studentVO> list = studentDAO.getStudentList();

        // 가져온 리스트에 추가적인 가공이 필요하다면 여기서 수행

        return list;
    }
}