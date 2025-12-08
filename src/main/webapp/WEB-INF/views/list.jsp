<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!--isELIgnored="false" : EL태그를 사용할 수 있도록 EL무시 속성을 false로 설정 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="top.jsp"/>

<h1>학생 목록</h1>
<table border="1" width="80%">
    <tr>
        <th>학번 (sid)</th>
        <th>이름 (name)</th>
        <th>이메일 (email)</th>
        <th>전공 (major)</th>
    </tr>
    <c:forEach items="${studentList}" var="student">
        <tr>
            <td>${student.sid}</td>
            <td>${student.name}</td>
            <td>${student.email}</td>
            <td>${student.major}</td>
        </tr>
    </c:forEach>
</table>
<br>
<button type="button" onclick="location.href='add'">학생 추가</button>

<jsp:include page="bottom.jsp"/>