<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
String seq = request.getParameter("seq");
String pg = request.getParameter("pg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
seq = <%= seq %>
<br>
pg =  <%= pg %>

</head>
<body>
</body>
</html>