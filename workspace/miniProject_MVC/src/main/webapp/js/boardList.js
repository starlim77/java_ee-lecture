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
					text:items.subject
				})).append($('<td/>',{
					align: 'center',
					text:items.id
				})).append($('<td/>',{
					align: 'center',
					text:items.hit
				})).append($('<td/>',{
					align: 'center',
					text:items.logtime
				})).appendTo($('#boardListTable'));
				
			});
		},
		error:function(err){
			console.log(err);
		}
	});
});