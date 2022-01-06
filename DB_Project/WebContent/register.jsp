<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%
	
	String dbName = "project";
	String jdbcDriver = "jdbc:mariadb://localhost:3307/" + dbName;
	String dbUser = "root";
	String dbPass = "root";
	
	Connection conn = null;
	Statement stmt = null;
	
	String ID = (String) request.getParameter("reg_id");
	String PW = (String) request.getParameter("r_pw1");
	String NAME = (String) request.getParameter("r_name");
	String BIRTH = (String) request.getParameter("r_birth");
	
	String insert_value = 
			"insert into users values"+
		"('"+ ID +"', HEX(AES_ENCRYPT('"+ PW +"', 'eagle')), '"+ NAME +"', '"+ BIRTH +"', '0');";
	System.out.println(insert_value);
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		stmt.executeUpdate(insert_value);
	%>
	<h1>성공</h1>
	<p>
		성공적으로 데이터베이스 <%=dbName%>에 등록하였습니다.
	<p class="lead">
		<%
			session.setAttribute("NAME", NAME);
			response.sendRedirect("welcome.jsp");
			System.out.println("Success");
			
		
			} catch (SQLException se){
				se.printStackTrace();	
			}finally{
				try{
					stmt.close();
					conn.close();
				}catch(Exception e){
					e.printStackTrace();
			 }
		}
		%>
</body>
</html>