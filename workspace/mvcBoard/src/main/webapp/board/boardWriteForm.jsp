<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.caution{
	color:red;
	font-size:0.7em;
	font-weight:bold;
}
</style>
</head>
<body>
<form name="boardWriteForm" method="post" action="boardWrite.do">
	<h3>글 쓰기</h3>
	<hr>
	<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<td align="center" width="80">제목</td>
			<td>
				<input type="text" name="subject" id="subject" placeholder="제목 입력">
				<div class="caution" id="subjectDiv"></div>
			</td>
		</tr>
		<tr>
			<td align="center">내용</td>
			<td>
				<textarea class="writeContent" rows="10" cols="30" name="content" id="content" placeholder="내용 입력" ></textarea>
				<div class="caution" id="contentDiv"></div>
			</td>
		</tr>
	</table>
	<br>
	<input type="button" name="writeBoard" value="글쓰기" onclick="boardWriteCheck()">
	<input type="reset" value="다시작성">
</form>
<script src="../js/board.js"></script>
</body>
</html>