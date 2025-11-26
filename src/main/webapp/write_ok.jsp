<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import ="org.example.web_project_2_2.DAO.studentDAO"%>
<%@ page import ="org.example.web_project_2_2.bean.studentVO"%>

<!DOCTYPE html>
<html>
<head>
    <title>wirte_ok.jsp</title>
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <%request.setCharacterEncoding("UTF-8");%>
    <jsp:useBean id = "s" class= "org.example.web_project_2_2.bean.studentVO"/>
    <jsp:setProperty property = "*" name = "s"/>


    <%
        studentDAO dao = new studentDAO();
        String msg = "Success to add Student Data";
        if(dao.insertStudent(s) != 1){
            msg = "ERROR: Fail to add Student Data";
        }
    %>
</body>
<script>
    alert(<%=msg%>)
    location.href = "list.jsp" // list 페이지로 돌아감
</script>
</html>