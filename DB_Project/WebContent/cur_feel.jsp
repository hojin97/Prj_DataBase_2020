<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>선택해주세요!</title>
</head>
<body>
<%
	String u_id = (String)session.getAttribute("id");
	String u_name = (String)session.getAttribute("name");
	String u_birth = (String)session.getAttribute("birth");
	String u_score = (String)session.getAttribute("score");
	
	session.setAttribute("u_id", u_id);
	session.setAttribute("u_name", u_name);
	session.setAttribute("u_birth", u_birth);
	session.setAttribute("u_score", u_score);
%>
	<form action ="cur_feel_sql.jsp" method="post">
	<div>
		반갑습니다, <font size = 5><b><%=u_name%></b></font>님!<br>
		지금 기분이 어떠신가요?? <br>
		<div>
			<input type="radio" name = "cur_feel" value="행복" checked>행복합니다!<br>
			<input type="radio" name = "cur_feel" value="슬픔">살짝 슬프네요..<br>
			<input type="radio" name = "cur_feel" value="아쉬움">기분이 조금 .. 말로 표현할 수 없네요.<br>
			<input type="radio" name = "cur_feel" value="고민">너무나 고민되는 상황이 있습니다.<br>
			<input type="radio" name = "cur_feel" value="심심">심심하네요.<br>
			<input type="radio" name = "cur_feel" value="낮은자신감">제가 할 수 있는 것들이 무엇이 있을가요?<br>
		</div>
		<div>
			<input type ="submit" value="선택" />
		</div>
	</div>
	</form>
</body>
</html>