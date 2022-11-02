<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<c:forEach var="personDTO" items="${list}">
	이름 : ${personDTO.name}<br>
	나이 : ${personDTO.age}<br><br>
</c:forEach>
<br><br>

<!--  pageScope.list에서 찾는다 => list는 pageScope에 없다
		=> requestScope에서 찾는다 -->
list = ${list }
<br><br>

list[2] = ${list[2]}
</body>
</html>