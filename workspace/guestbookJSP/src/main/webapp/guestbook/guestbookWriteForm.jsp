<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row1{
	text-align:center;
	width:60px;
}
.row2{
	width:500px;
}
input{
	width:300px;
}
.button{
	width:65px;
}
.content{
	height:150px;
}
.writeContent{
	width:500px;
}
</style>
</head>
<body>
<form name="guestbookWriteForm" method="post" action="guestbookWrite.jsp">
<table border="1" cellspacing="0" cellpadding="5">
	<tr>
		<td class="row1">작성자</td>
		<td class="row2">
			<input type="text" name="name" placeholder="작성자 입력" >
		</td>
	</tr>
	<tr>
		<td class="row1">이메일</td>
		<td>
			<input type="email" name="email" placeholder="이메일 입력" >
		</td>
	</tr>
	<tr>
		<td class="row1">홈페이지</td>
		<td>
			<input type="text" name="homepage" value="http://" placeholder="홈페이지 입력" >
		</td>
	</tr>
	<tr>
		<td class="row1">제목</td>
		<td>
			<input type="text" name="subject" placeholder="제목 입력" >
			<div id="subjectDiv"></div>
		</td>
	</tr>
	<tr>
		<td class="row1 content">내용</td>
		<td>
			<textarea class="content writeContent" name="content" placeholder="내용 입력" ></textarea>
			<div id="contentDiv"></div>
		</td>
	</tr>

	<tr>
		<td class="row1" colspan="2">
			<input class="button" type="button" value="글작성" onclick="checkGuestbookWrite()">
			<input class="button" type="reset" value="다시 작성">
			<input class="button" type="button" value="글목록" onclick="location.href='guestbookList.jsp'">
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
	function checkGuestbookWrite(){
		sw=0;
		document.getElementById("subjectDiv").innerText="";
		document.getElementById("contentDiv").innerText="";
		if(document.guestbookWriteForm.subject.value==""){
			document.getElementById("subjectDiv").innerText="제목을 입력하세요";
			sw=1;
		}
		if(document.guestbookWriteForm.content.value==""){
			document.getElementById("contentDiv").innerText="내용을 입력하세요";
			sw=1;
		}
		if(sw==0) document.guestbookWriteForm.submit();
		
	}
</script>
</body>
</html>