<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
   margin: 0;
   padding: 0;
   height: 100%;
   width: auto;
}

#header {
   width: 100%;
   height: 10%;
   text-align: center;
}

#container {
   margin: auto;
   width: 100%;
   height: 500px;
}

#container:after {
   content: '';
   display: block;
   clear: both;
   float: none;
}

#nav {
   margin-left: 10px;
   /* width: 400px; */
   width: 25%;
   height: 100%;
   float: left;
}

#section {
   width: 70%;
   height: 100%;
   float: left;
}

#footer {
  
   height: 10%;
}
#outer{
	width="100%";
}
#head{
	display:inline-block;
}
#first__header{

}
</style>
</head>
<body>
<div id="wrap">
<div id="outer">
<div id="header">
	<div id="first__header">
		<img alt="사각새 gif" src="/miniProject_MVC/image/flying-bird.gif" style="cursor:pointer;" width="100"
			onclick="location.href='/miniProject_MVC/index.jsp'"/>
		<h1 id="head">
			<span>MVC 미니 프로젝트</span>
		</h1>
	</div>
	<jsp:include page="./main/menu.jsp"/>
</div><!-- #header -->

<div id="container">
	<div id="nav">
		<jsp:include page="./main/nav.jsp" />
	</div>
	<div id="section">
		<c:if test="${ empty display }">
		<h1>
			홈페이지를 방문해주셔서 감사합니다.<br>
			Have a nice day!! <br>
			<img alt="고양이 셀카" src="./image/self02.jpeg">
		</h1>
		</c:if>
		<c:if test="${ not empty display }">
			<jsp:include page="${display}"/>
		</c:if>
	</div>
</div><!-- #contianer -->

<div id ="footer">
</div><!-- #footer -->
</div>
</div><!-- #wrap -->
</body>
</html>