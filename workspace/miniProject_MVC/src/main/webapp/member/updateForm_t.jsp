<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.phone{
	width:80px;
}
.email{
	width:120px;
}
.address{
	width:450px;
	margin-top:3px;
}
.caution{
	color:red;
	font-size:0.7em;
	font-weight:bold;
}
</style>
</head>
<body>
<form name="updateForm" id="updateForm">
		<h3>업데이트</h3>
		<table border="1" cellpadding="5" cellspacing="0">
			<tr>
				<td align="center" width="80">이름</td>
				<td>
					<input type="text" name="name" id="name" placeholder="이름 입력">
					<div class="caution" id="nameDiv"></div>
				</td>
			</tr>
			<tr>
				<td align="center">아이디</td>
				<td>
					<input type="text" name="id" id="id" readonly>
				</td>
			</tr>
			<tr>
				<td align="center">비밀번호</td>
				<td>
					<input type="password" name="pwd" id="pwd">
					<div class="caution" id="pwdDiv"></div>
				</td>
			</tr>
			<tr>
				<td align="center">재확인</td>
				<td>
					<input type="password" id="repwd">
					<div class="caution" id="repwdDiv"></div>
				</td>
			</tr>
			<tr>
				<td align="center">성별</td>
				<td>
					
					<input type="radio" name="gender" id="male" value="0" />
					<label for="male">남</label>
					<input type="radio" name="gender" id="female" value="1"/>
					<label for="female">여</label>
				</td>
			</tr>
			<tr>
				<td align="center">이메일</td>
				<td>
					<input type="email" name="email1" id="email1" >
					<span>@</span>
					<input class="email2" type="email" name="email2" id="email2">
					<select class="email" name="email3" onchange="changeEmail()">
						<option value="">-이메일 직접 입력-</option>
						<option>gmail.com</option>
						<option>naver.com</option>
						<option>daum.net</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center">핸드폰</td>
				<td>
					<select name="tel1" id="tel1" class="phone">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="019">019</option>
					</select>
					<span>-</span>
					<input class="phone" type="tel" name="tel2" id="tel2" >
					<span>-</span>
					<input class="phone" type="tel" name="tel3" id="tel3" >
				</td>
			</tr>
			<tr>
				<td align="center">주소</td>
				<td>
					<input type="text" name="zipcode" id="zipcode" readonly >
					<input type="button" value="우편번호검색" onclick="checkPost()"><br>
					<input class="address" type="text" name="addr1" id="addr1" placeholder="주소" readonly ><br>
					<input class="address" type="text" name="addr2" id="addr2" placeholder="상세주소" >
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="업데이트" id="updateBtn">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.min.js"></script> <!-- CDN방식 -->
<!-- <script src="../js/jquery-3.6.1.min.js"></script> -->
<script type="text/javascript">
$(function(){//  window.onload=function(){} 인 자바스크립트와 같은 기능
	$.ajax({
		url: '/miniProject_MVC/member/getMember.do'
	   ,type: 'post'
	   ,dataType: 'json' /* text, html, json, xml */
	   ,success:function(data){
		   //alert(JSON.stringify(data));
		   $('#name').val(data.name);
		   $('#id').val(data.id);
		   $('input[name="gender"]:eq('+data.gender+')').attr("checked", true);
		   $('#email1').val(data.email1);
		   $('#email2').val(data.email2);
		   $('#tel1').val(data.tel1);
		   $('#tel2').val(data.tel2);
		   $('#tel3').val(data.tel3);
		   $('#zipcode').val(data.zipcode);
		   $('#addr1').val(data.addr1);
		   $('#addr2').val(data.addr2);
	   }
	   ,error:function(err){
		   console.log(err);
	   }
	});//$.ajax
});//$

</script>
<script src="../js/member.js"></script>
<!-- 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/post.js"></script>
</body>
</html>