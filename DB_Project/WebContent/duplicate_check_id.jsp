<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String dbName = "project";
	String jdbcDriver = "jdbc:mariadb://localhost:3307/" + dbName;
	String dbUser = "root";
	String dbPass = "root";
	String query = null;
	ResultSet result = null;
	Connection conn = null;
	Statement stmt = null;
	String []IDs = new String[1];
	int duplicate_id = 0;
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		String r_id = (String) request.getParameter("idinput");
		System.out.println("r_id :"+r_id);
		
		query = "select id from users where id = '"+r_id+"';";
		
		System.out.println(query);
		
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);
		
		if (r_id.equals("")){
			duplicate_id = -2;
			session.setAttribute("duplicate_id", duplicate_id);
		}
		
		else if (result.next()){
			System.out.println("사용불가");

			duplicate_id = -1;
			session.setAttribute("duplicate_id", duplicate_id);
		}
		else{
			System.out.println("사용가능");

			duplicate_id = 1;
			session.setAttribute("r_id", r_id);
			session.setAttribute("duplicate_id", duplicate_id);
		}
		response.sendRedirect("id_check.jsp");
		
		
	}catch (SQLException se){
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