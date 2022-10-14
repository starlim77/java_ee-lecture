<%@page import="guestbook.dao.GuestbookDAO"%>
<%@page import="guestbook.bean.GuestbookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String email = request.getParameter("email");
String homepage = request.getParameter("homepage");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
if(homepage.equals("http://")) email="";

GuestbookDTO guestbookDTO = new GuestbookDTO(name,email,homepage,subject,content);
int su = GuestbookDAO.getIntense().guestbookWrite(guestbookDTO);
String writeResult="";

if(su==1) writeResult = "작성하신 글을 저장하였습니다.";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= writeResult %>
</body>
</html>