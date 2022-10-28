<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="jstlResult.jsp" method="post">
	<table border="1" cellspacing="0" cellpadding="10">
		<tr>
			<td class="ques">이름</td>
			<td>
				<input type="text" name="name" placeholder="이름 입력">
				<div id="nameDiv"></div>
			</td>
		</tr>
		<tr>
			<td class="ques">나이</td>
			<td>
				<input type="text" name="age" placeholder="나이 입력">
			</td>
		</tr>
		<tr>
			<td class="ques">색깔</td>
			<td>
				<select class="color" name="color">
					<optgroup label="색깔">
						<option value="red">빨강</option>
						<option value="green">초록</option>
						<option value="blue">파랑</option>
						<option value="magenta">보라</option>
						<option value="cyan">하늘</option>
					</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="ques">취미</td>
			<td>
				<div class="border">
					<input type="checkbox" name="hobby" id="reading" value="독서"/>
					<label for="reading">독서</label>
					<input type="checkbox" name="hobby" id="movie" value="영화" />
					<label for="movie">영화</label>
					<input type="checkbox" name="hobby" id="music" value="음악" />
					<label for="music">음악</label>
					<input type="checkbox" name="hobby" id="game" value="게임" />
					<label for="game">게임</label>
					<input type="checkbox" name="hobby" id="shopping" value="쇼핑" />
					<label for="shopping">쇼핑</label>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="ques" align="center">
				<input type="submit" value="SEND">
				<input type="reset" value="CANCEL">
			</td>
		</tr>
	</table>
</form>
</body>
</html>