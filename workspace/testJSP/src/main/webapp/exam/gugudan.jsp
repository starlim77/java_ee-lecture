<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%! int dan;
int i;
String gugudan=""; %>

<%


for(i=1;i<10;i++){
	gugudan = gugudan + "<br>";
	for(dan=2;dan<10;dan++){
		gugudan = gugudan + dan+"*"+i+"="+dan*i+"&#9;"; 
	}
}
%>    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="0" cellspacing="0" cellpadding="3">
<% for(i=1;i<10;i++){ %>
	<tr>
	<% for(dan=2;dan<10;dan++){ %>
		<td><%=dan%>*<%=i%>=<%=dan*i%></td>
	<%} %>
	</tr>
<%} %>
</table>




</body>
</html>