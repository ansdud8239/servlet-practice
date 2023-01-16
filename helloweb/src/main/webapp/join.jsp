<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");	
	String password = request.getParameter("password");	
	String birthYear = request.getParameter("birthYear");	
	String gender = request.getParameter("gender");	
	String profile = request.getParameter("profile");	
	String[] hobbies=request.getParameterValues("hobby");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<label>email : </label><%=email %>
	<br>
	<label>password : </label><%=password %>
	<br>
	<label>birthYear : </label><%=birthYear %>
	<br>
	<label>gender : </label><%=gender %>
	<br>
	<label>profile : </label><p><%=profile.replace("\n", "<br>") %></p>
	<label>hobby : </label>
<%
	for(int i=0;i<hobbies.length;i++){
%>
	<h4><%=hobbies[i] %></h4>
<%		
	}
%>
</body>
</html>