<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import ="org.example.web_project_2_2.DAO.studentDAO"%>
<%@ page import ="org.example.web_project_2_2.bean.studentVO"%>
<%@ page import="java.text.NumberFormat" %>

<%request.setCharacterEncoding("UTF-8");%>


<!DOCTYPE html>
<html>
<head>
    <title>wirte.jsp</title>
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%
    // 지정된 id의 studnetvo 객체를 dao를 통해 데이터 베이스에서 가져오는 과정
    /*
        1. dao, vo(낚시용) 객체 생성
        2. idStr를 request 객체로 파라미터를 id 이름으로 가져오기
        3. 그걸 Integer 클래스로 parseInt한 후에 낚시용 vo객체에 setId(id)하기
        4. 진짜 데이터 베이스에서 가져온 학생 정보를 담을 vo 객체를 student라는 이름으로 생성하고
        5. dao.getStudent(vo)를 넣어서 dao메서드로 vo속 아이디를 사용해서 데이터 베이스 내 일치하는 학생 데이터를 가져온다.
        6. 그 학생 데이터를 가진 객체를 student 객체에 덮어쓰기 한다.
        7. 이제 student의 vo 메서드로 학생 정보에 자유롭게 접근이 가능하다.
     */
    String idStr = request.getParameter("id"); //파라미터 이름으로 가져오기
    studentDAO dao = new studentDAO();
    studentVO vo = new studentVO();

    int id = 0;
    try{
        id = Integer.parseInt(idStr);
    }catch(NumberFormatException e){
        return;
    }
    vo.setId(id);
    studentVO student = new studentVO();
    student = dao.getStudent(vo);

%>
<h1>Edit the Studnent Data</h1>
<form action = "edit_ok.jsp" method = "post">
    <table>
        <tr>
            <td>Name: </td>
            <td><input type = "text" name = "name" placeholder=<%=student.getName()%> /></td>
            <%---placeholder로 원래 데이터를 입력창에 깔아줬다 ---%>
        </tr>
        <tr>
            <td>Age: </td>
            <td><input type = "number" name = "age"placeholder=<%=student.getAge()%> /></td>
        </tr>
        <tr>
            <td>Major: </td>
            <td><input type = "text" name = "major" placeholder=<%=student.getMajor()%> /></td>
        </tr>
        <tr>
            <td>RC: </td>
            <td><input type = "text" name = "rc" placeholder=<%=student.getRc()%> /></td>
        </tr>
        <tr>
            <td>Hometown: </td>
            <td><input type = "text" name = "hometown placeholder=<%=student.getHometown()%>" /></td>
        </tr>
        <tr>
            <td><a href = "list.jsp">View All Records</a></td>
            <td>
                <input type="submit"
                       value = "Add post"
                       onclick="return confirm('정말로 학생 정보를 수정하시겠습니까?');"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>