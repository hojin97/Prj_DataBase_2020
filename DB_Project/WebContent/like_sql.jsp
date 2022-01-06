<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>좋아요 하는 중...</title>
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

try{
	String driver = "org.mariadb.jdbc.Driver";
	Class.forName(driver);
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	
	String f_phrase = (String)session.getAttribute("f_phrase");
	String f_charac = (String)session.getAttribute("f_charac");
	String like_ch = (String)request.getParameter("like_ch");
	
	String f_like = (String)session.getAttribute("f_like");
	
	if (like_ch.equals("0")){
		System.out.println("좋아요!");
		session.setAttribute("f_like", Integer.toString(Integer.parseInt(f_like) + 1));
		session.setAttribute("like_ch", "1");
		if (f_charac.equals("")){
			query = "update music set 좋아요 = 좋아요 + 1 where 문구 = '" + f_phrase + "';";	
		}
		else{
			query = "update video set 좋아요 = 좋아요 + 1 where 문구 = '" + f_phrase + "';";
		}
		stmt.executeUpdate(query);
	}
	response.sendRedirect("index.jsp");
	
} catch(NumberFormatException e){
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