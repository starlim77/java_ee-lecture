<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${su=='1'}">
	update_success
</c:if>
<c:if test="${su=='0'}">
	update_fail
</c:if>
