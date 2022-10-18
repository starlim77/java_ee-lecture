<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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
	
//데이터
int pg = Integer.parseInt(request.getParameter("pg"));
	
//페이징 처리 - 1페이지당 3개씩
int endNum = pg*3;
int startNum = endNum - 2;

Map<String, Integer> map = new HashMap<String, Integer>();
map.put("startNum", startNum);
map.put("endNum", endNum); 
ArrayList<GuestbookDTO> arraylist = GuestbookDAO.getIntense().guestbookListArray(map); 
	
int totalA = GuestbookDAO.getIntense().getTotalA();
int totalPage = (totalA + 2)/3;

if(arraylist!=null) {
	for(int i=0;i<arraylist.size();i++){// for(GuestbookDTO guestbookDTO : list)
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
	vertical-align : top;
}
#currentPagging{
	color:red;
	text-decoration:underline;
}
div{
	text-align:center;
}
#paging{
	color:black;
	text-decoration:none;
}
p{
	display:block;
}
pre{
 	white-space: pre-wrap;
 	word-break : break-word;
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
		<td class="content" colspan="4"><p><pre><%=content %></pre></p></td>
	</tr>
</table>
<hr>


<% } 
}%>
<!--  페이지 번호  -->
<div>
<%
for(int i=1;i<=totalPage;i++){
	if(i==pg){%>
		<span style="border:1px solid green;"><a id = "currentPaging" href="guestbookListArray.jsp?pg=<%= i%>"><%=i %></a></span>
	<%}else{%>
		<a id = "paging" href="guestbookListArray.jsp?pg=<%= i%>"><%=i %></a>    <!-- 줄바꿈 white-space , 가운데 정렬 -->
	<%}%>
	
<% }//for%>
</div>
</body>
</html>