<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.douzone.guestbook.dao.GuestBookDao"%>
<%@page import="com.douzone.guestbook.vo.GuestBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String message = request.getParameter("message");
    
    // 현재 날짜/시간
    Date now = new Date();   
    // 포맷팅 정의
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
    // 포맷팅 적용
    String formatedNow = formatter.format(now);	
    
	GuestBookVo vo =new GuestBookVo(name,password,message,formatedNow);
	//System.out.println(vo.toString());
	new GuestBookDao().insert(vo);	
	//response.sendRedirect("/guestbook01");

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<table width=510 border=1>
		<tr>
			<td><%=name %></td>
			<td><%=formatedNow %></td>
		</tr>
		<tr>
			<td colspan=4><%=message.replace("\n", "<br>") %></td>
		</tr>
	</table>
	<br>
	<h3>위의 내용이 방명록에 추가 되었습니다.</h3>
	<br>
	<a href='/guestbook01/'>방명록으로 가기</a>
</body>
</html>