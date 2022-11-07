/*
$(function(){
	$.ajax({
		url:'/miniProject_MVC/board/plusHit.do',
		type:'post',
		data:'seq='+$('#seq').val(),
		//dataType:'json',
		success:function(){
			
		},
		error:function(err){
			console.log(err);
		}
	});
});
*/


$(function(){
	$.ajax({
		url:'/miniProject_MVC/board/getBoard.do',
		type:'post',
		data:'seq='+$('#seq').val(),
		dataType:'json',
		success:function(data){
			$('#subject').text(data.subject);
			$('#seqIn').text(data.seq);
			$('#id').text(data.id);
			$('#hit').text(data.hit);
			$('#content').text(data.content);
			
			if($('#memId').val()==data.id){
				$('#boardViewSpan').show();
			}else{
				$('#boardViewSpan').hide();
			}
			
			
		},
		error:function(err){
			console.log(err);
		}
	});
});


$('#boardDeleteBtn').click(function(){
	if(confirm("정말로 삭제하시겠습니까?")){
		$.ajax({
			url:'/miniProject_MVC/board/boardDelete.do',
			type:'post',
			data:'seq='+$('#seq').val(),
			success:function(){
				alert("삭제 완료");
				location.href='/miniProject_MVC/board/boardList.do?pg=1';	
			},
			error:function(err){
				console.log(err);
			}
		});//$.ajax
	}//if
});


//글 수정
$('#boardUpdateBtn').click(function(){
	$('#boardViewForm').attr('action','/miniProject_MVC/board/boardUpdateForm.do');
	$('#boardViewForm').submit();
});
