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
#content{
	width:100%;
	height:100%;
}
</style>
</head>
<body>
<form name="boardUpdateForm" id="boardUpdateForm">
	<input id="seq" name="seq" type="hidden" value="${seq}" >
	<input id="pg" name="pg" type="hidden" value="${pg}" >
	<h3>글 수정</h3>
	<hr>
	<table border="1" cellpadding="5" cellspacing="0" width="480">
		<tr>
			<td align="center" width="80">제목</td>
			<td colspan="5">
				<input type="text" id="subject" name="subject">
				<div id="subjectDiv" class="caution"></div>
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
						<textarea rows="50" id="content" name="content"></textarea>
					</pre>
					<div id="contentDiv" class="caution"></div>
				</div>
			</td>
		</tr>
	</table>
	<br>
	
	<div style="margin-top:5px;">
	
	<span id="boardViewSpan">
		<input type="button" value="수정 완료" id="updateBtn">
		<input type="button" value="다시 작성" onclick="location.reload()">
		<input type="button" value="취소" onclick="location.href='/miniProject_MVC/board/boardView.do?seq=${seq}&pg=${pg}'">
		
	</span>
	</div>
	
	
</form>
<script type="text/javascript" src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

$(function(){
	$.ajax({
		url:'/miniProject_MVC/board/getBoard.do',
		type:'post',
		data:'seq='+$('#seq').val(),
		dataType:'json',
		success:function(data){
			$('#subject').val(data.subject);
			$('#seqIn').text(data.seq);
			$('#id').text(data.id);
			$('#hit').text(data.hit);
			$('#content').text(data.content);
			
		},
		error:function(err){
			console.log(err);
		}
	});
});

$('#updateBtn').click(function(){
	$('#subjectDiv').empty;
	$('#contentDiv').empty;
	let sw=0;
	if($('#subject').val()==''){
		$('#subjectDiv').text('제목을 입력하세요');
		$('#subject').focus();
		sw=1;
	}
	if($('#content').val()==''){
		$('#contentDiv').text('내용을 입력하세요');
		$('#content').focus();
		sw=1;
	}
	if(sw==0){
		$.ajax({
			url:'/miniProject_MVC/board/boardUpdate.do',
			type:'post',
			data: $('#boardUpdateForm').serialize(),
			success:function(){
				alert("업데이트 완료");
				location.href='/miniProject_MVC/board/boardList.do?pg='+$('#pg').val();
			},
			error:function(err){
				console.log(err);
			}
		});//$.ajax
	}//if	
});// .click
</script>
</body>
</html>