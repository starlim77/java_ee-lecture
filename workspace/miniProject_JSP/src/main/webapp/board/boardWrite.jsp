<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
String id = (String)session.getAttribute("memId");
String name = (String)session.getAttribute("memName");
String email = (String)session.getAttribute("memEmail");

/* BoardDTO boardDTO = new BoardDTO();
boardDTO.setSubject(subject);
boardDTO.setContent(content);
boardDTO.setId(id);
boardDTO.setName(name);
boardDTO.setEmail(email); */

Map<String, String> map = new HashMap<String, String>();
map.put("subject",subject);
map.put("content",content);
map.put("id",id);
map.put("name",name);
map.put("email",email);

BoardDAO boardDAO = BoardDAO.getInstance();
int su = boardDAO.boardWrite(map); //boardWriteForm에서 유효성 검사로 실패할 일이 없으므로, 조건을 넣지 않아도 됨

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(su==1){%>    <!-- boardWriteForm에서 유효성 검사로 실패할 일이 없으므로, 조건을 넣지 않아도 됨. -->
	<h3>작성하신 글을 저장하였습니다</h3>
<%}else{ %>
	<h3>글쓰기 실패</h3>
<%} %>
<br>
<input type="button" value="메인화면" onclick="location.href='../index.jsp';">
</body>
<script type="text/javascript">
window.onload=function(){
	alert("완료");
	location.href="boardList.jsp?pg=1";
}
</script>
</html>