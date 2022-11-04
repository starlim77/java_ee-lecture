//$(function(){});
$(document).ready(function(){
	$.ajax({
		url:'/miniProject_MVC/board/getBoardList.do',
		type:'post',
		data:'pg='+$('#pg').val(),
		dataType:'json',
		success:function(data){
			//alert(JSON.stringify(data));
			//alert(data.list[0].id)
			$.each(data.list, function(index, items){
				//console.log(index, items.seq, items.id, items.subject);
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text:items.seq
				})).append($('<td/>',{
					
					}).append($('<a/>',{
						//href:'/miniProject_MVC/board/boardView.do?pg='+$('#pg').val()+"?seq="+items.seq,
						text:items.subject,
						class:'subjectA'
					}))
				).append($('<td/>',{
					align: 'center',
					text:items.id
				})).append($('<td/>',{
					align: 'center',
					text:items.hit
				})).append($('<td/>',{
					align: 'center',
					text:items.logtime
				})).appendTo($('#boardListTable'));
				
			});//$each
			//페이징 처리
			
			//이동 
			$('#pagingDiv').html(data.pagingHTML);
			
			//로그인 여부
			$('.subjectA').click(function(){
				if($('#memId').val()=='')
					alert('먼저 로그인 하세요');
				else{
					//alert($(this).parent().prev().prop('tagName'));
					//alert($(this).parent().prev().text());   //DOM 글번호 찍어오기
					var seq = $(this).parent().prev().text();
					location.href='/miniProject_MVC/board/boardView.do?pg='+$('#pg').val()+"&seq="+seq;
				}
			});
			
			
		},//success
		error:function(err){
			console.log(err);
		}
	});
});