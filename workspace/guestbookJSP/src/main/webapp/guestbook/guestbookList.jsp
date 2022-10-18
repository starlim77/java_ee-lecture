<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="guestbook.dao.GuestbookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ResultSet rs = GuestbookDAO.getIntense().guestbookList();


while(rs.next()){
	
	String name=rs.getString("name");
	String logtime=rs.getString("logtime");
	String email=rs.getString("email");
	String homepage=rs.getString("homepage");
	String subject=rs.getString("subject");
	String content=rs.getString("content");
	
	if(name==null) name="";
	if(email==null) email="";
	if(homepage==null) homepage="";
	
	SimpleDateFormat sqlDateFormat = new SimpleDateFormat("yyyy-MM-dd H:m:s");
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd");
	logtime = simpleDateFormat.format(sqlDateFormat.parse(logtime));
	
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestbookList</title>
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
		<td class="row2">&nbsp;<%=name %></td>
		<td class="row1">작성일</td>
		<td class="row2">&nbsp;<%=logtime %></td>
	</tr>
	<tr>
		<td class="row1">이메일</td>
		<td colspan="3">&nbsp;<%=email %></td>
	</tr>
	<tr>
		<td class="row1">홈페이지</td>
		<td colspan="3">&nbsp;<%=homepage %></td>
	</tr>
	<tr>
		<td class="row1">제목</td>
		<td colspan="3">&nbsp;<%=subject %></td>
	</tr>
	<tr>
		<td class="content" colspan="4" style="vertical-align : top;">&nbsp;<%=content %></td>
	</tr>
</table>
<hr>
</body>
</html>
<% } %>
<%
rs.close();
GuestbookDAO.getIntense().getPstmt().close();
GuestbookDAO.getIntense().getConn().close();
%>
