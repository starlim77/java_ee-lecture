<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name;

MemberDTO memberDTO = new MemberDTO();
memberDTO.setId(id);
memberDTO.setPwd(pwd);

MemberDAO memberDAO = MemberDAO.getInstance();
name = memberDAO.memberLogin(memberDTO);
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<% if(name == null){%>
		<span>아이디 또는 비밀번호가 틀렸습니다</span>
	<% }else{%>
		<span><%=name %>님 로그인</span>
	<% }%>
	<br>
	<input type="button" value="로그인" onclick="location.href='loginForm.jsp';">
</body>
</html>