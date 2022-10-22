<%@page import="java.util.Map"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.HashMap"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

Map<String, String> map = new HashMap<String, String>();
map.put("id",id);
map.put("pwd",pwd);

MemberDAO memberDAO = MemberDAO.getInstance();
MemberDTO memberDTO = memberDAO.memberLogin(map);
id = null;
String name=null;
String email=null;
if(memberDTO!=null){
	id = memberDTO.getId();
	name = memberDTO.getName();
	email = memberDTO.getEmail1() + "@" + memberDTO.getEmail2();
}
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(id!=null){
	session.setAttribute("memId", id);
	session.setAttribute("memName", name);
	session.setAttribute("memEmail", email);
%>
	<%=name %>님 로그인~ 환영합니다.
<% }else{%>	
	아이디 또는 비밀번호가 틀렸습니다.
<% } %>
<br>
<input type="button" value="메인화면" onclick="location.href='../index.jsp';">
</body>
</html>