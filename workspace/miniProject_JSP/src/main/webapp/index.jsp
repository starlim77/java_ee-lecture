<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String id = (String)session.getAttribute("memId");
String name = (String)session.getAttribute("memName");
String email = (String)session.getAttribute("memEmail");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>메인화면</h3>
<hr>
<h5>
<% if(id!=null){ %>
	<a href="http://localhost:8080/miniProject_JSP/member/logout.jsp">로그아웃</a><br>
	<a href="http://localhost:8080/miniProject_JSP/board/boardWriteForm.jsp">글쓰기</a><br>
<%}else{ %>
<a href="http://localhost:8080/miniProject_JSP/member/writeForm.jsp">회원가입</a><br>
<a href="http://localhost:8080/miniProject_JSP/member/loginForm.jsp">로그인</a><br>
<%} %>
<a href="http://localhost:8080/miniProject_JSP/board/boardList.jsp">목록</a>
<hr>
</h5>
</body>
</html>