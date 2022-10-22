<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//String name = request.getParameter("name");
String name = (String)session.getAttribute("memName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3><%=name %>님 로그인</h3>
<br>
<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
</body>
</html>