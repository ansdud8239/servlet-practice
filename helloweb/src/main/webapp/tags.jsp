<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello world</h1>
	<h2>Hello world</h2>
	<h3>Hello world</h3>
	<h4>Hello world</h4>
	<h5>Hello world</h5>
	<h6>Hello world</h6>

	<table border="1" cellspacing="0">
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성자</th>
		</tr>
		<tr>
			<td>1</td>
			<td>안녕</td>
			<td>둘리</td>
		</tr>
		<tr>
			<td>2</td>
			<td>안녕</td>
			<td>마이콜</td>
		</tr>
	</table>
	<br>
	<%
	for (int i = 0; i < 10; i++) {
	%>
	<img src='/helloweb/assets/images/loopy.png'
		style="width: 120px; border: 1px solid;" title="절대 path">
	<%
	}
	%>
	<img src='assets/images/loopy.png'
		style="width: 120px; border: 1px solid;" title="상대 path">
	<img src='http://127.0.0.1:8080/helloweb/assets/images/loopy.png'
		style="width: 120px; border: 1px solid;" title="full path">

	<p>
		문장입니다. <br> 문장입니다. <br> 문장입니다. <br> 문장입니다. <br>
		문장입니다. <br>
	</p>

	<a href='/helloweb/hello'>hello로 가기</a>
	<br>
	<a href='/helloweb/form.jsp'>form으로 가기</a>

</body>
</html>