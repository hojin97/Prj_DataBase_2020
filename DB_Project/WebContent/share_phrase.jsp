<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>공유하기 하는 중...</title>
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
	
	String e_phrase = (String)request.getParameter("e_phrase");
	String e_share = (String)request.getParameter("e_share");
	String e_charac = (String)request.getParameter("e_charac");
	if(e_share.equals("yes")){
		if (e_charac == null){
			query = "update music set 공유 = 'no' where 문구 = '"+e_phrase+"';";
		}
		else{
			query = "update video set 공유 = 'no' where 문구 = '"+e_phrase+"';";
		}
	}
	else{
		if (e_charac == null){
			query = "update music set 공유 = 'yes' where 문구 = '"+e_phrase+"';";
		}
		else{
			query = "update video set 공유 = 'yes' where 문구 = '"+e_phrase+"';";
		}
	}
	
	stmt.executeUpdate(query);
	response.sendRedirect("my_phrase_sql.jsp");
	
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