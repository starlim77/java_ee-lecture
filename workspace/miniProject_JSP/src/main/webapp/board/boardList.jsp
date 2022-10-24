<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String pgString = request.getParameter("pg");
int pg = Integer.parseInt(pgString);
BoardDAO boardDAO = BoardDAO.getInstance();
List<BoardDTO> list = boardDAO.boardList(pg);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" cellpadding="5" cellspacing="0">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
<%
SimpleDateFormat simple = new SimpleDateFormat("yyyy년 MM월 dd일");

for(BoardDTO boardDTO : list){
%>
	<tr>
		<td><%=boardDTO.getSeq() %></td>
		<td><%=boardDTO.getSubject() %></td>
		<td><%=boardDTO.getId() %></td>
		<td><%=simple.format(boardDTO.getLogtime()) %></td>
		<td><%=boardDTO.getHit() %></td>
	</tr>
	<%} %>
</table>
</body>
</html>