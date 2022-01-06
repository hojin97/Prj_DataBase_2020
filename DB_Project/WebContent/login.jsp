<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 프로젝트</title>
</head>
<body>
<%
session.invalidate();
%>
<div>
	<h1>반갑습니다!</h1>
	<p> 2016253004 정호진의 글귀 데이터베이스 프로젝트 입니다! 
	<br>
	<h2> [ L O G I N ] <h2>
	<div>
		<form action ="result.jsp" method="post">
			<table border style="width:300px; height:80px">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" size ="10" /></td>
				<td rowspan=2> <input type="submit" value="로그인"> </td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pw" size = "10" /></td>
			</tr>
			</table>
		</form>
	</div>
		<br>
	<div>
		<form action ="register_form.jsp" method="post">
			<input type="submit" value ="회원가입">
		</form>
		
	</div>
</div>
</body>
</html>