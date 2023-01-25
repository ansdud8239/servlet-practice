<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  if문 -->
	<c:if test="">
	</c:if>
	<!--  case문 -->
	<c:choose>
		<c:when test='${param.color=="red"}'>
			<h1 style='color: red'>Hello</h1>
		</c:when>
		<c:when test='${param.color=="blue"}'>
			<h1 style='color: blue'>Hello</h1>
		</c:when>
		<c:when test='${param.color=="green"}'>
			<h1 style='color: green'>Hello</h1>
		</c:when>
		<c:otherwise>
			<h1>Hello</h1>
		</c:otherwise>
	</c:choose>

</body>
</html>