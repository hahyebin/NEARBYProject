<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>404문제 발생</h1>
    <h4 th:text="${exception.getMessage()}"></h4>
    <ul>
        <th:block th:each="stack : ${exception.getStackTrace()}">
            <li th:text="${stack}"></li>
        </th:block>
    </ul>
</body>
</html>