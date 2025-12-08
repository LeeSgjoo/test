package org.example.web_project_3;

import org.example.web_project_3.student.StudentDAO.studentDAO;
import org.example.web_project_3.student.StudentDAO.studentService;
import org.example.web_project_3.student.StudentDAO.studentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class StudentController {

    @Autowired
    studentDAO studentDAO;

    // 0. index.jsp 페이지로 이동
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index"; // indext.jsp로 이동
    }

    // 1. 학생 목록 조회 (GET /student/list)
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String studentList(Model model) {
        // DAO를 호출하여 데이터 가져오기
        model.addAttribute("studentList", studentDAO.getStudentList());
        return "list"; // list.jsp로 이동
    }

    // 2. 학생 추가 페이지 이동 (GET /student/add)
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addStudent() {
        return "add"; // write.jsp로 이동
    }

    // 3. 학생 추가 처리 (POST /student/addok)
    @RequestMapping(value = "/addok", method = RequestMethod.POST)
    public String addStudentOK(studentVO vo) {
        // Service를 호출하여 DB에 저장
        int i = studentDAO.insertStudent(vo);
        if (i == 0) {
            System.out.println("데이터 추가 실패");
        }
        else System.out.println("데이터 추가 성공");

        return "redirect:list"; // 목록 페이지로 리다이렉트
    }


}