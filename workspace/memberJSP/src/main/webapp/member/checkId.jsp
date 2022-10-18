<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//데이터
String id = request.getParameter("id");

MemberDAO memberDAO = MemberDAO.getInstance();//싱글톤 
boolean exist = memberDAO.isExistId(id); //아이디가 있으면 true-사용 불가능, 아이디가 없으면 false-사용 가능
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(exist){%>
	<h3><%=id %>는 사용 불가능</h3>
<% }else {%>
	<h3><%=id %>는 사용 가능</h3>
<% }%>
</body>
</html>