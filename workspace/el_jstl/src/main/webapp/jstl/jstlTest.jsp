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

<h3>***변수 설정***</h3>
<% String name ="홍길동"; %>

<c:set var="name" value="홍길동"></c:set>
<c:set var="age">25</c:set>

나의 이름은 <c:out value="${name }"></c:out> 입니다 <br>
나의 나이는 ${age } 입니다

<h3>*** for each ***</h3>
<c:forEach var="i" begin="1" end="10" step="1">
${i}
</c:forEach>
<br>

<c:forEach var="i" begin="1" end="10" step="1">
<c:set var="sum" value="${sum+i }"></c:set>
</c:forEach><br>
${sum}
<br><br>

<c:forEach var="i" begin="0" end="9" step="1">
${10 - i}
</c:forEach>
<br><br>

<h3>*** forToken***</h3>
<c:forTokens var="car" items="소나타,아우디,링컨,페라리,벤츠" delims=",">
	${car}<br>
</c:forTokens>


</body>
</html>