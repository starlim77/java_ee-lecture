<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="angel" uri="/WEB-INF/elFunction.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${param['x'] } + ${param['y'] } = ${ angel:sum(param['x'],param['y']) }<br>
</body>
</html>