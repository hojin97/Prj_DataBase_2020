<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

Connection conn = null;
Statement stmt = null;

Connection conn2 = null;
Statement stmt2 = null;

String p_type = (String) session.getAttribute("p_type");
String insert_value="";
String score_query = "";
String ID = (String) session.getAttribute("u_id");
System.out.println(ID);
System.out.println(p_type);

if (p_type.equals("music")){
	String TITLE = (String) request.getParameter("Title");
	String ARTIST = (String) request.getParameter("Artist");
	String YEAR = (String)request.getParameter("Year");
	String SITUA = (String) request.getParameter("Situation");
	String PHRASE = (String) request.getParameter("Phrase");
	
	insert_value = "insert into music values"+
		"('"+ID+"', '"+TITLE+"', '"+ARTIST+"', '"+YEAR+"', '"+SITUA+"', '"+PHRASE+"', '0', 'no');";
	score_query = "update users set 점수 = 점수 + 5 where ID = '"+ ID +"';";
	
	System.out.println(insert_value);
	System.out.println(score_query);
}
else if(p_type.equals("video")){
	String TITLE = (String) request.getParameter("Title");
	String ARTIST = (String) request.getParameter("Artist");
	String YEAR = (String)request.getParameter("Year");
	String SITUA = (String) request.getParameter("Situation");
	String CHARAC = (String) request.getParameter("Character");
	String GENRE = (String) request.getParameter("Genre");
	String TYPE = (String) request.getParameter("Type");
	String PHRASE = (String) request.getParameter("Phrase");
	
	insert_value = "insert into video values"+
		"('"+ID+"', '"+TITLE+"', '"+ARTIST+"', '"+YEAR+"', '"+CHARAC+"', '"
													+GENRE+"', '"+TYPE+"', '"+SITUA+"', '"+PHRASE+"', '0', 'no');";
	score_query = "update users set 점수 = 점수 + 5 where ID = '"+ ID +"';";
	
	System.out.println(insert_value);
	System.out.println(score_query);
}
try{
	String driver = "org.mariadb.jdbc.Driver";
	Class.forName(driver);
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	stmt.executeUpdate(insert_value);
	
	Class.forName(driver);
	conn2 = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt2 = conn2.createStatement();
	stmt2.executeUpdate(score_query);
%>
	<script>
	window.close();
	</script>
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