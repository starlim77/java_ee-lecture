<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardPaging"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String pgString = request.getParameter("pg");

int pg = Integer.parseInt(pgString);
//DB
BoardDAO boardDAO = BoardDAO.getInstance();
List<BoardDTO> list = boardDAO.boardList(pg);

//페이징 처리
int totalA = boardDAO.getTotalA();//총글수


BoardPaging boardPaging = new BoardPaging();

boardPaging.setCurrentPage(pg);
boardPaging.setPageBlock(3);
boardPaging.setPageSize(5);
boardPaging.setTotalA(totalA);

boardPaging.makePagingHTML();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#pagingDiv{
	/* border:1px solid red; */
	text-align:center;
	width:950px;
	margin-top:10px;
	display:inline-block;
}
#currentPaging{
	border:1px solid blue;
	padding : 7px 10px;
	margin:10px;
	color: red;
	cursor:pointer;
}
#currentPaging:hover, #paging:hover{
	text-decoration:underline;
}
#paging{
	/* border:1px solid blue; */
	margin:10px;
	padding : 7px 10px;
	cursor:pointer;
}
#haha{
	position:relative;
}
input{
	position: absolute;
	top:10px;
}
.subjectA{
	text-decoration:none;
	color:black;
}
.subjectA:hover{   /* link, visited, hover, active */
	text-decoration:underline;
	color:green;
	cursor:pointer;
}
</style>
</head>
<body>
<table border="1" cellpadding="5" frame="hsides" rules="rows">
	<tr>
		<th style="width:100px">글번호</th>
		<th style="width:400px">제목</th>
		<th style="width:100px">작성자</th>
		<th style="width:100px">조회수</th>
		<th style="width:200px">작성일</th>
	</tr>
<%
SimpleDateFormat simple = new SimpleDateFormat("yyyy.MM.dd");
String id=null;
id = (String)session.getAttribute("memId");
%>
<% if(list!=null){%>
	<%for(BoardDTO boardDTO : list){%>
	<tr>
		<td class="seq"  align="center"><%=boardDTO.getSeq() %></td>
		<td class="subjectA" onclick="isLogin('<%=id %>',<%=boardDTO.getSeq()%>,<%=pg%>)"><%=boardDTO.getSubject() %></td>
		<td align="center"><%=boardDTO.getId() %></td>
		<td align="center"><%=boardDTO.getHit() %></td>
		<td align="center"><%=simple.format(boardDTO.getLogtime()) %></td>
	</tr>
	
	<%
	} %>
<%} %>
</table>
<div id="haha">
	<input type="button" value="메인화면" onclick="location.href='../index.jsp'">
	<div id="pagingDiv">
		<%= boardPaging.getPagingHTML() %>
	</div>
</div>

<script type="text/javascript">
function boardPaging(pg){
	location.href="boardList.jsp?pg="+pg;
}

function isLogin(id,seq,pg){
	if(id != "null" ){
		location.href="boardView.jsp?seq="+seq+"&pg="+pg;
	}
	else alert("로그인 먼저 하세요");
}
</script>
</body>
</html>