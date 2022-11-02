<%@page import="com.jstl.PersonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<PersonDTO> list = new ArrayList<PersonDTO>();

PersonDTO aa = new PersonDTO("홍길동", 25);
PersonDTO bb = new PersonDTO("네오", 23);
PersonDTO cc = new PersonDTO("프로도", 30);

list.add(aa);
list.add(bb);
list.add(cc);

request.setAttribute("list", list);
//페이지 이동
/* response.sendRedirect("jstlEnd.jsp"); */

RequestDispatcher dispatcher = request.getRequestDispatcher("jstlEnd.jsp");
dispatcher.forward(request, response);
%>
<%-- <jsp:forward page="jstlEnd.jsp"></jsp:forward> --%>