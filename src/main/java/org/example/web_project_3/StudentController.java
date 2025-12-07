package org.example.web_project_3;

import org.example.web_project_3.student.StudentDAO.studentService;
import org.example.web_project_3.student.StudentDAO.studentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/list")
public class StudentController {

    // DAO 대신 Service 객체를 주입받습니다.
    @Autowired
    studentService studentService;

    // 1. 학생 목록 조회 (GET /student/list)
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String studentList(Model model) {
        // Service를 호출하여 데이터 가져오기
        model.addAttribute("studentList", studentService.getStudentList());
        return "list"; // list.jsp로 이동
    }

    // 2. 학생 추가 페이지 이동 (GET /student/add)
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addStudent() {
        return "write"; // write.jsp로 이동
    }

    // 3. 학생 추가 처리 (POST /student/addok)
    @RequestMapping(value = "/addok", method = RequestMethod.POST)
    public String addStudentOK(studentVO vo) {
        // Service를 호출하여 DB에 저장
        studentService.insertStudent(vo);

        return "redirect:list"; // 목록 페이지로 리다이렉트
    }
}