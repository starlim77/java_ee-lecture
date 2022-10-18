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
if(homepage.equals("http://")) homepage=null;

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
<img src="../img/marie.jpeg" width="100" width="100"
     onclick="location.href='guestbookWriteForm.jsp'" 
	 style="cursor:pointer">
<br>
<%= writeResult %>
<br>
<input type="button" value ="뒤로" onclick="history.back()"> <!-- history.go(-1) -->
<input type="button" value="글 목록" onclick="location.href='guestbookListArray.jsp?pg=1'">
</body>
</html>