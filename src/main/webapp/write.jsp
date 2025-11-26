<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import ="org.example.web_project_2_2.DAO.studentDAO"%>
<%@ page import ="org.example.web_project_2_2.bean.studentVO"%>

<%request.setCharacterEncoding("UTF-8");%>


<!DOCTYPE html>
<html>
    <head>
        <title>wirte.jsp</title>
        <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <h1>Add New Studnent</h1>
        <form action = "write_ok.jsp" method = "post">
            <table>
                <tr>
                    <td>Name: </td>
                    <td><input type = "text" name = "name"/></td>
                </tr>
                <tr>
                    <td>Age: </td>
                    <td><input type = "number" name = "age"/></td>
                </tr>
                <tr>
                    <td>Major: </td>
                    <td><input type = "text" name = "major"/></td>
                </tr>
                <tr>
                    <td>RC: </td>
                    <td><input type = "text" name = "rc"/></td>
                </tr>
                <tr>
                    <td>Hometown: </td>
                    <td><input type = "text" name = "hometown"/></td>
                </tr>
                <tr>
                    <td><a href = "list.jsp">View All Records</a></td>
                    <td><input type="submit" value = "Add post"/> </td>
                </tr>
            </table>
        </form>
    </body>
</html>