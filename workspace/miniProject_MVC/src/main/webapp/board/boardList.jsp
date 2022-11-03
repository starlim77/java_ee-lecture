<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<input type="hidden" id="pg" value="${pg}">

<table id="boardListTable" border="1" cellpadding="5" frame="hsides" rules="rows">
	<tr>
		<th style="width:100px">글번호</th>
		<th style="width:400px">제목</th>
		<th style="width:100px">작성자</th>
		<th style="width:100px">조회수</th>
		<th style="width:200px">작성일</th>
	</tr>
	
	<!-- 동적 처리 -->
	
</table>
<div id="haha">
	<input type="button" value="메인화면" onclick="location.href='../index.jsp'">
	<div id="pagingDiv">
		${pagingHTML}
	</div>
</div>

<script type="text/javascript">
function boardPaging(pg){
	location.href="boardList.do?pg="+pg;
}

function isLogin(id,seq,pg){
	if(id != "null" ){
		location.href="boardView.do?seq="+seq+"&pg="+pg;
	}
	else alert("로그인 먼저 하세요");
}
</script>
<script type="text/javascript" src="http://code.jquery.com.jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="../js/boardList.js"></script>
</body>
</html>