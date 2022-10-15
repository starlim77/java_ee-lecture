<%@page import="javax.security.auth.Subject"%>
<%@page import="guestbook.bean.GuestbookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="guestbook.dao.GuestbookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
 
/*  ArrayList<GuestbookDTO> arraylist = new ArrayList<>();
 GuestbookDAO.getIntense().guestbookListArray(arraylist);
 
for(int i=0;i<arraylist.size();i++){
	String name = arraylist.get(i).getName();
	String logtime = arraylist.get(i).getLogtime();
	String email = arraylist.get(i).getEmail();
	String homepage = arraylist.get(i).getHomepage();
	String subject = arraylist.get(i).getSubject();
	String content = arraylist.get(i).getContent(); */
	
ArrayList<GuestbookDTO> arraylist = GuestbookDAO.getIntense().guestbookListArray();
for(int i=0;i<arraylist.size();i++){
	String name = arraylist.get(i).getName();
	String logtime = arraylist.get(i).getLogtime();
	String email = arraylist.get(i).getEmail();
	String homepage = arraylist.get(i).getHomepage();
	String subject = arraylist.get(i).getSubject();
	String content = arraylist.get(i).getContent(); 
	
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestbookListArray</title>
<style type="text/css">
.row1, .row3{
	width:150px;
	text-align:center;
}
.row2{
	width:300px;
}
.content{
	height:300px;
}
</style>
</head>
<body>
<table border="1" cellspacing="0" cellpadding="5">
	<tr>
		<td class="row1">작성자</td>
		<td class="row2"><%=name %></td>
		<td class="row1">작성일</td>
		<td class="row2"><%=logtime %></td>
	</tr>
	<tr>
		<td class="row1">이메일</td>
		<td colspan="3"><%=email %></td>
	</tr>
	<tr>
		<td class="row1">홈페이지</td>
		<td colspan="3"><%=homepage %></td>
	</tr>
	<tr>
		<td class="row1">제목</td>
		<td colspan="3"><%=subject %></td>
	</tr>
	<tr>
		<td class="content" colspan="4" style="vertical-align : top;"><%=content %></td>
	</tr>
</table>
<hr>
</body>
</html>

<% } %>