function change(){
	document.writeForm.email2.value=document.writeForm.email3.value;
}

function changeEmail(){
	document.updateForm.email2.value=document.updateForm.email3.value;
}


function checkId(){
	var sId = document.getElementById("id").value;
	
	document.getElementById("idDiv").innerText="";
	if(sId=="")
		//document.getElementById("idDiv").innerText="먼저 아이디를 입력하세요";
		document.getElementById("idDiv").innerHTML="<font color='magenta'>먼저 아이디를 입력하세요</font>";
	else
		window.open("/mvcMember/member/checkId.do?id="+sId, "checkId", "width=500 height=150 left=700 top=200");
		//부트스트랩 - dialog로 대체 가능
}
function resetCheck(){
	document.writeForm.check.value=0;
}

//중복 아이디 체크
$('#id').focusout(function(){
//	if(document.getElementById("id").value==""){
//		document.getElementById("idDiv").innerText="아이디를 입력하세요";
		
	if($("#id").val()==''){
		$('#idDiv').text('아이디를 입력하세요');
		$('#idDiv').css('color','magenta');
	}else{
		//서버로 요청하고 제자리로 돌아와라
		//jquery.ajax();
		$.ajax({
			url:'http://localhost:8080/miniProject_MVC/member/checkId.do',//서버로 요청할 url
			type:'post',//get or post
			data: 'id='+$("#id").val(),//서버로 보낼 데이터
			dataType: 'text',//서버로부터 받은 데이텉 자료형 (text, html, xml, json)
			success:function(data){
				data=data.trim();
				if(data == 'exist'){//사용불가능
					$('#idDiv').text('사용 불가능');
					$('#idDiv').css('color','red');
					
				}else if(data == 'non-exist'){//사용 가능
					$('#idDiv').text('사용 가능');
					$('#idDiv').css('color','blue');
					
					$('input[name="check"]').val(1);
				}
				
			},
			error:function(){}
		});//$.ajax
	}
});

//유효성 검사 및 로그인
$('#loginBtn').click(function(){
	$('#idDiv').text('');
	$('#pwdDiv').text('');
	
	if($("#loginId").val()==''){
		$('#idDiv').text('아이디를 입력하세요');
		$('#idDiv').css('color','magenta');
	}
	if($("#loginPwd").val()==''){
		$('#pwdDiv').text('비밀번호를 입력하세요');
		$('#pwdDiv').css('color','magenta');
	}
	
	
	if($("#loginId").val()!='' || $("#loginPwd").val()!=''){
		//서버로 요청하고 제자리로 돌아와라
		//jquery.ajax();
		$.ajax({
			url:'http://localhost:8080/miniProject_MVC/member/login.do',//서버로 요청할 url
			type:'post',//get or post
			//data: 'id='+$("#loginId").val() +'&'+ 'pwd='+$("#loginPwd").val(),//서버로 보낼 데이터
			data: {'id': $('#loginId').val(), 'pwd':$('#loginPwd').val()},
			dataType: 'text',//서버로부터 받은 데이터 자료형 (text, html, xml, json)
			success:function(data){
				data=data.trim();
				if(data == 'login_fail'){
					$('#loginResult').text('아이디 또는 비밀번호가 맞지 않습니다.');
					$('#loginResult').css('color','red');
					$('#loginResult').css('font-size','12pt');
				}else if(data == 'login'){
					location.href='../index.jsp'
				}
				
			},
			error:function(){}
		});//$.ajax
	}
});

//회원가입 버튼
$('#writeBtn').click(function(){
	$('#nameDiv').empty;
	$('#idDiv').empty;
	$('#pwdDiv').empty;
	$('#repwdDiv').empty;
	sw=0;
	if($('#name').val()==''){
		$('#nameDiv').text("이름을 입력하세요");
		sw=1;
	}
	if($('#id').val()==''){
		$('#idDiv').text("아이디를 입력하세요");
		sw=1;
	}
	if($('#pwd').val()==''){
		$('#pwdDiv').text("비밀번호를 입력하세요");
		sw=1;
	}
	if($('#pwd').val()!=$('#repwd').val()){
		$('#pwdDiv').text("비밀번호가 맞지 않습니다");
		sw=1;
	}
	if(sw==0) {
			$.ajax({
			url:'http://localhost:8080/miniProject_MVC/member/write.do',//서버로 요청할 url
			type:'post',//get or post
			data: $('#writeForm').serialize(),
			success:function(){
				alert("회원가입 성공");
				location.href="/miniProject_MVC/index.jsp";
			},
			error:function(err){
				console.log(err);
			}
			});//$.ajax
	}
		
});

$('#updateBtn').click(function(){
	
	
	$('#nameDiv').empty;
	$('#pwdDiv').empty;
	$('#repwdDiv').empty;
	sw=0;
	
	if($('#name').val()==''){
		$('#nameDiv').text("아이디를 입력하세요");
		sw=1;
	}
	if($('#pwd').val()==''){
		$('pwdDiv').text('비밀번호를 입력하세요');
		sw=1;
	}
	if($('#pwd').val()!=$('#repwd').val()){
		$('#repwdDiv').text('비밀번호가 일치하지 않습니다');
		sw=1;
	}
	if(sw==0){
		$.ajax({
			url:'http://localhost:8080/miniProject_MVC/member/update.do',
			type:'post',
			data: $('#updateForm').serialize(),
			dataType:'text',
			success:function(result){
				result=result.trim();
				if(result=='update_success'){
					alert('업데이트 완료');
					location.href="/miniProject_MVC/index.jsp";
				}else{
					alert('업데이트 실패');
					location.href="/miniProject_MVC/index.jsp";
				}
			},
			error:function(err){
				console.log(err);
			}
			
		});
	}
	

	
});

