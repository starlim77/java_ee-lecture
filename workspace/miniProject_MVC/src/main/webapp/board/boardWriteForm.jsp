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
	<input type="button" name="writeBoard" value="글쓰기" id="writeBoardBtn">
	<input type="reset" value="다시작성">
</form>
<script src="../js/board.js"></script>
<script src="../js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$('#writeBoardBtn').click(function(){
	$('#subjectDiv').empty;
	$('#contentDiv').empty;
	let sw=0;
	if($('#subject').val()==''){
		$('#subjectDiv').text('제목을 입력하세요');
		sw=1;
	}
	if($('#content').val()==''){
		$('#contentDiv').text('내용을 입력하세요');
		sw=1;
	}
	if(sw==0){
		$.ajax({
			url:'http://localhost:8080/miniProject_MVC/board/boardWrite.do'
		   ,type:'post'
		   ,data: 'subject='+$('#subject').val()+'&content='+$('#content').val()
		   ,dataType:'text'
		   ,success:function(result){
			   result=result.trim()
			   if(result=='1'){
				   alert('글쓰기 완료')
				   location.href='/miniProject_MVC/index.jsp'
			   }else if(result=='0'){
			   	   alert('글쓰기 실패')
			   	 location.href='/miniProject_MVC/index.jsp'
			   }
		   }
		   ,error:function(err){
			   console.log(err);
		   }
		   
		});
	}
	
	
});
</script>
</body>
</html>