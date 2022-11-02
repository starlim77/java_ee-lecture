<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<c:if test="${memId==null}">
		<input type="button" value="로그인" onclick="location.href='/miniProject_MVC/member/loginForm.do'">
		<br>
		<br>
		<a href="/miniProject_MVC/member/writeForm.do">회원가입</a>
	</c:if>
	<c:if test="${memId!=null}">
		<h3><a href="/miniProject_MVC/member/updateForm.do">${memId}</a>님 로그인</h3>
		<input type="button" value="로그아웃" id="logoutBtn">
	</c:if>
</div>
<script type="text/javascript" src="/miniProject_MVC/js/jquery-3.6.1.min.js"></script>
<script>
$('#logoutBtn').click(function(){
	$.ajax({
		url:'/miniProject_MVC/member/logout.do',
		type:'post',
		success:function(){
			alert('로그아웃');
			location.href='/miniProject_MVC/index.jsp';
		},
		error:function(){
			console.log(err);
		}
	});
});
</script>
<script type="text/javascript" src="/miniProject_MVC/js/member.js"></script>