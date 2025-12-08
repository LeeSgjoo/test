<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!--isELIgnored="false" : EL태그를 사용할 수 있도록 EL무시 속성을 false로 설정 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="top.jsp"/>

<table class="table">
    <!--
    private int id;
    private String name;
    private int age;
    private String major;
    private String rc;
    private String hometown;
    private String idcard_filename;
    -->
    <tr>
        <th>id</th>
        <th>name</th>
        <th>age</th>
        <th>major</th>
        <th>rc</th>
        <th>hometown</th>
        <th>filename</th>

    </tr>
    <c:forEach items="${studentList}" var="student">
        <tr>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>${student.age}</td>
            <td>${student.major}</td>
            <td>${student.rc}</td>
            <td>${student.hometown}</td>
            <td>${student.idcard_filename}</td>
        </tr>
    </c:forEach>
</table>
<br>
<button type="button" onclick="location.href='add'">학생 추가</button>

<jsp:include page="bottom.jsp"/>