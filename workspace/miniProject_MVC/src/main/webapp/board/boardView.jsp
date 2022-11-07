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
<form name="boardViewForm" id="boardViewForm">  <!-- 동적으로 action 속성(태그 > 속성) 추가 -->
	<input id="seq" name="seq" type="hidden" value="${seq}" >
	<input id="pg" name="pg" type="hidden" value="${pg}">
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
		<!-- <input type="button" value="글수정" onclick="mode(1)">  onclick="location.href='/miniProject_MVC/board/boardUpdateForm.do?seq=${seq}&pg={pg}'"
		<input type="button" value="글삭제" id="boardDeleteBtn"> -->
		
		<input type="button" value="글수정" id="boardUpdateBtn">
		<input type="button" value="글삭제" id="boardDeleteBtn">
		
	</span>
	</div>
	
	
</form>
<script type="text/javascript">
/* 	function mode(num){
		if(num == 1 ){//글 수정 -seq, pg
			document.boardViewForm.method="get";
			document.boardViewForm.action="/miniProject_MVC/board/boardUpdateForm.do";
			document.boardViewForm.submit();
		}else if(num == 2){//글 삭제 -seq
			if(confirm("정말로 삭제하시겠습니까?")){
				document.boardViewForm.method="post";
				document.boardViewForm.action="/miniProject_MVC/board/boardDelete.do";
				document.boardViewForm.submit();
			}//if
		}//else if
	}//mode() */
</script>
<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="../js/boardView.js"></script>
</body>
</html>