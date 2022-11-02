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
					<input type="text" name="name" id="name" placeholder="이름 입력" value="${memberDTO.name}">
					<div class="caution" id="nameDiv"></div>
				</td>
			</tr>
			<tr>
				<td align="center">아이디</td>
				<td>
					<input type="text" name="id" id="id" readonly value="${memberDTO.id}">
				</td>
			</tr>
			<tr>
				<td align="center">비밀번호</td>
				<td>
					<input type="password" name="pwd" id="pwd" value="${memberDTO.pwd}">
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
					<c:choose>
						<c:when test="${memberDTO.gender=='0'}">
							<c:set var="male" value="checked"/>
						</c:when>
						<c:otherwise>
							<c:set var="female" value="checked"/>
						</c:otherwise>
					</c:choose>
					<input type="radio" name="gender" id="male" value="0" <c:out value="${male}"/>/>
					<label for="male">남</label>
					<input type="radio" name="gender" id="female" value="1" <c:out value="${female}"/>/>
					<label for="female">여</label>
				</td>
			</tr>
			<tr>
				<td align="center">이메일</td>
				<td>
					<input type="email" name="email1" id="emial1" value="${memberDTO.email1}">
					<span>@</span>
					<input class="email2" type="email" name="email2" value="${memberDTO.email2}">
					<select class="email" name="email3" onchange="change()">
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
					<select name="tel1" class="phone">
						<c:choose>
							<c:when test="${memberDTO.tel1=='010'}">
								<c:set var="t010" value="selected"/>
							</c:when>
							<c:when test="${memberDTO.tel1=='011'}">
								<c:set var="t011" value="selected"/>
							</c:when>
							<c:otherwise>
								<c:set var="t019" value="selected"/>
							</c:otherwise>
						</c:choose>
						<option <c:out value="${t010}"/>>010</option>
						<option <c:out value="${t011}"/>>011</option>
						<option <c:out value="${t019}"/>>019</option>
					</select>
					<span>-</span>
					<input class="phone" type="tel" name="tel2" id="tel2" value="${memberDTO.tel2}">
					<span>-</span>
					<input class="phone" type="tel" name="tel3" id="tel3" value="${memberDTO.tel3}">
				</td>
			</tr>
			<tr>
				<td align="center">주소</td>
				<td>
					<input type="text" name="zipcode" id="zipcode" readonly value="${memberDTO.zipcode}">
					<input type="button" value="우편번호검색" onclick="checkPost()"><br>
					<input class="address" type="text" name="addr1" id="addr1" placeholder="주소" readonly value="${memberDTO.addr1}"><br>
					<input class="address" type="text" name="addr2" id="addr2" placeholder="상세주소" value="${memberDTO.addr2}">
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
<script src="../js/member.js"></script>
<!-- 우편번호 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/post.js"></script>
</body>
</html>