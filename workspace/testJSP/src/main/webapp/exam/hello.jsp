<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
//전역변수, 1번만 처리된다.
String name = "홍길동";
int age = 25;
%>

<%
//스크립트릿, 요청시 마다 호출된다.
age++;
%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Hello JSP!! <br> --> <!-- 웹브라우저에서 읽어들이고, 주석되어있으므로 출력되지 않음 -->

<%-- 안녕하세요 JSP!! <br> --%> <!-- 소멸 --> 
나의 이름은 <%= name %> 입니다. <br>

나의 이름은 <% out.println(name); %> 입니다. <br>

<!--내 나이는 <%= age %>살 입니다. <br>  -->
<%-- 내 나이는 <%= age살 입니다. <br> --%>
</body>
</html>

<!-- jsp는 내부에서 자동으로 서블릿 파일을 작성한다. 파일의 내용이 바뀌면 자동으로 컴파일 한다. > 톰캣 서버가 리로드 된다.
	 hello.jsp
	 hello_jsp.java
	 hello_jsp.class
 -->