<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>Delete title here</title>
</head>
<body>
<%
String p_type = (String) session.getAttribute("p_type");

String dbName = "project";
String jdbcDriver = "jdbc:mariadb://localhost:3307/" + dbName;
String dbUser = "root";
String dbPass = "root";

Connection conn = null;
Statement stmt = null;

String delete_value = ";";

if (p_type.equals("music")){
	String E_PHRASE = (String) request.getParameter("e_phrase");
	
	delete_value = "delete from music where 문구 = '"+E_PHRASE+"';";
	
	System.out.println(delete_value);
}
else if(p_type.equals("video")){
	String E_PHRASE = (String) request.getParameter("e_phrase");

	delete_value = "delete from video where 문구 = '"+E_PHRASE+"';";
	System.out.println(delete_value);
}
try{
	String driver = "org.mariadb.jdbc.Driver";
	Class.forName(driver);
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	stmt.executeUpdate(delete_value);

	session.setAttribute("page_num", "0");
	response.sendRedirect("my_phrase_sql.jsp");
%>
<h1>성공</h1>
<p>
	성공적으로 데이터베이스 <%=dbName%>에 등록하였습니다.
<p>
	<%
	
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