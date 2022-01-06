<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 완료 페이지</title>
</head>
<body>
	<%
		String user_name = (String) session.getAttribute("NAME");
		String url = "login.jsp";
	%>
	<h1>환영합니다! <%=user_name %>님 :)</h1>
	가입이 완료되었습니다!
	로그인 후 이용 바랍니다. 고맙습니다!
	<input type="button" value="돌아가기" onclick="location.href='<%=url%>'">
	<%
		System.out.println(url);
	%>
</body>
</html>