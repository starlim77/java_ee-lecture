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
<form name="boardWriteForm" id="boardWriteForm">
	<input id="seq" type="hidden" value="${seq}" >
	<input id="memId" type="hidden" value="${sessionScope.memId}" >
	<h3>글 열람</h3>
	<hr>
	<table border="1" cellpadding="5" cellspacing="0" width="480">
		<tr>
			<td align="center" width="80">제목</td>
			<td colspan="5">
				<span id="subject"></span>
			</td>
		</tr>
		<tr>
			<td align="center" width="80">글 번호</td>
			<td width="80" align="center">
				<span id ="seqIn"></span>
			</td>
			<td align="center" width="80">작성자</td>
			<td width="80" align="center">
				<span id="id"></span>
			</td>
			<td align="center" width="80">조회수</td>
			<td width="80" align="center">
				<span id="hit"></span>
			</td>
		</tr>
		<tr>
			<td align="center" height="250" >내용</td>
			<td colspan="5" valign="top">
				<div style="width:100%; height:300px; overflow:auto;">
					<pre style="white-space:pre-line; word-break:break-all;">
						<p id="content"></p>
					</pre>
				</div>
			</td>
		</tr>
	</table>
	<br>
	
	<div style="margin-top:5px;">
	<input type="button" name="boardList" value="목록" onclick="location.href='/miniProject_MVC/board/boardList.do?pg=${pg}'">
	
	<span id="boardViewSpan">
		<input type="button" value="글수정" onclick="location.href='/miniProject_MVC/board/boardUpdateForm.do?seq=${seq}&pg=${pg}'">
		<input type="button" value="글삭제" id="boardDeleteBtn">
	</span>
	</div>
	
	
</form>
<script src="../js/board.js"></script>
<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="../js/boardView.js"></script>
</body>
</html>