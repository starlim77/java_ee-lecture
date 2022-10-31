<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div{
	color:red;
	font-size:0.7em;
}
</style>
</head>
<body>
	<h3>로그인</h3>
	<form name = "loginForm">
		<table border="2px" cellspacing="0" cellpadding="3px">
			<tr>
				<td align="center">아이디</td>
				<td>
					<input type="text" name="id" id="loginId">
					<div id="idDiv"></div>
				</td>
			</tr>
			<tr>
				<td align="center">비밀번호</td>
				<td>
					<input type="password" name="pwd" id="loginPwd">
					<div id="pwdDiv"></div>
				</td>
			</tr>
			<tr >
				<th colspan="2">
					<input type="button" value="로그인" onclick="checkLogin()">
					<input type="button" value="회원가입" onclick="location.href='writeForm.do';">
				</th>
			</tr>
		</table>
	</form>
	<script src="../js/jquery-3.6.1.min.js"></script>
	<script src="../js/member.js"></script>
	<!-- <script>
		function checkLogin(){
			sw=0;
			document.getElementById("idDiv").innerText="";
			document.getElementById("pwdDiv").innerText="";
			if(document.loginForm.id.value==""){
				document.getElementById("idDiv").innerText="아이디를 입력하세요";
				sw=1;
			}
			if(document.loginForm.pwd.value=="") {
				document.getElementById("pwdDiv").innerText="비밀번호를 입력하세요";
				sw=1;
			}
			if(sw==0) document.loginForm.submit();
		}	
	</script> -->
</body>
</html>