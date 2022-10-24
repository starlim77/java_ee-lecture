<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name;

Map<String, String> map = new HashMap<String, String>();
map.put("id",id);
map.put("pwd",pwd);

MemberDAO memberDAO = MemberDAO.getInstance();
name = memberDAO.memberLogin(map);

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
if(name == null){
	response.sendRedirect(".jsp");

}else{
	//response.sendRedirect("loginOk.jsp?name="+URLEncoder.encode(name, "UTF-8"));
	
	//세션
	//	HttpSession sssion = request.getSession(); //세션 생성 - servlet에 이미 만들어져있다

	//session.setAttribute("memName", name);

	//쿠키 
	Cookie cookie = new Cookie("memName", name);
	cookie.setMaxAge(30 * 60); //초
	//클라이언트에게 보내기
	response.addCookie(cookie);
	
	Cookie cookie2 = new Cookie("memId", id);
	cookie2.setMaxAge(30 * 60 ); //초
	//클라이언트에게 보내기
	response.addCookie(cookie2);
	
	//페이지 이동
	response.sendRedirect("loginOk.jsp");
}%>
	<br>
	<input type="button" value="로그인" onclick="location.href='loginForm.jsp';">
</body>
</html>