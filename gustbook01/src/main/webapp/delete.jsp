<%@page import="java.io.PrintWriter"%>
<%@page import="com.douzone.guestbook.dao.GuestBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String password = request.getParameter("password");
	int no = Integer.parseInt(request.getParameter("no"));
	
	boolean result =new GuestBookDao().delete(no,password);
	if(result){
		response.sendRedirect("/guestbook01");
	}else{
	    PrintWriter pw = response.getWriter();
	    pw.println("<script>alert('비밀번호가 틀렸습니다.'); history.go(-1);</script>");
	    pw.flush();
	    pw.close();
	}
%>
