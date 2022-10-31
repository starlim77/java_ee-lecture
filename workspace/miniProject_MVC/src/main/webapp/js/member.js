function change(){
	document.writeForm.email2.value=document.writeForm.email3.value;
}
function checkWrite(){
	sw=0;
	document.getElementById("nameDiv").innerText="";
	document.getElementById("idDiv").innerText="";
	document.getElementById("pwdDiv").innerText="";
	document.getElementById("repwdDiv").innerText="";
	if(document.getElementById("name").value == ""){
		document.getElementById("nameDiv").innerText="이름을 입력하세요";
		sw=1;
	}
	if(document.getElementById("id").value == ""){
		document.getElementById("idDiv").innerText="아이디를 입력하세요";
		sw=1;
	}
	if(document.getElementById("pwd").value == ""){
		document.getElementById("pwdDiv").innerText="비밀번호를 입력하세요";
		sw=1;
	}
	if(document.getElementById("pwd").value != document.getElementById("repwd").value){
		document.getElementById("repwdDiv").innerText="비밀번호가 맞지 않습니다";
		sw=1;
	}
	if(sw==0) {
		if(document.writeForm.check.value==1) document.writeForm.submit();
		else alert("아이디 중복체크 하세요")
	}
	
	
}//checkWrite()
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
$('#loginPwd').focusout(function(){
		
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
			url:'/miniProject_MVC/member/login.do',//서버로 요청할 url
			type:'post',//get or post
			data: 'id='+$("#loginId").val() +'&'+ 'pwd='+$("#loginPwd").val(),//서버로 보낼 데이터
			dataType: 'text',//서버로부터 받은 데이터 자료형 (text, html, xml, json)
			success:function(data){
				data=data.trim();
				if(data == 'login_fail'){//사용불가능
					$('#pwdDiv').text('로그인 실패');
					$('#pwdDiv').css('color','red');
					
				}else if(data == 'login'){//사용 가능
					$('#pwdDiv').text('로그인 완료');
					$('#pwdDiv').css('color','blue');
				}
				
			},
			error:function(){}
		});//$.ajax
	}
});

