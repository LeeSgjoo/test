<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!--isELIgnored="false" : EL태그를 사용할 수 있도록 EL무시 속성을 false로 설정 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="top.jsp"/>
<h1>데이터 추가</h1>
<form action = "addok" method = "post">
    <table class="table" id = edit >
        <tr> <td>이름:</td> <td><input type = "text" name = "name"></td></tr>
        <tr> <td>나이:</td> <td><input type = "number" name = "age"></td></tr>
        <tr> <td>전공:</td> <td><input type = "text" name = "major"></td></tr>
        <tr> <td>rc:</td> <td><input type = "text" name = "rc"></td></tr>
        <tr> <td>고향:</td> <td><input type = "text" name = "hometown"></td></tr>
        <tr> <td>학생증 파일명:</td> <td><input type = "text" name = "idcard_filename"></td></tr>
    </table>
    <button type = "submit">등록하기</button><br>
    <a href="./list">목록으로 돌아가기</a>
</form>
<!--
private int id;
private String name;
private int age;
private String major;
private String rc;
private String hometown;
private String idcard_filename;
-->

<jsp:include page="bottom.jsp"/>