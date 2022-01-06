<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>Update title here</title>
</head>
<body>
<%


String dbName = "project";
String jdbcDriver = "jdbc:mariadb://localhost:3307/" + dbName;
String dbUser = "root";
String dbPass = "root";

Connection conn = null;
Statement stmt = null;

String p_type = (String) session.getAttribute("p_type");

String update_value = ";";

if (p_type.equals("music")){
	String ID = (String) session.getAttribute("u_id");
	String TITLE = (String) request.getParameter("Title");
	String ARTIST = (String) request.getParameter("Artist");
	int YEAR = Integer.parseInt(request.getParameter("Year"));
	String SITU = (String) request.getParameter("Situation");
	String PHRASE = (String) request.getParameter("Phrase");
	String O_PHRASE = (String) request.getParameter("O_phrase");
	
	update_value = "update music set 제목 = '"+TITLE+"', 아티스트 = '"+ARTIST+"', 연도 = '"+YEAR+"', 상황 = '"+SITU+"', "
			+ "문구 ='"+PHRASE+"' where 문구 = '"+O_PHRASE+"';";
			
}
else if(p_type.equals("video")){
	String ID = (String) session.getAttribute("u_id");
	String TITLE = (String) request.getParameter("Title");
	String ARTIST = (String) request.getParameter("Artist");
	int YEAR = Integer.parseInt(request.getParameter("Year"));
	String SITU = (String) request.getParameter("Situation");
	String CHARAC = (String) request.getParameter("Character");
	String GENRE = (String) request.getParameter("Genre");
	String TYPE = (String) request.getParameter("Type");
	String PHRASE = (String) request.getParameter("Phrase");
	String O_PHRASE = (String) request.getParameter("O_phrase");

	update_value = "update video set 제목 = '"+TITLE+"', 아티스트 = '"+ARTIST+"', 연도 = '"+YEAR+"', 상황 = '"+SITU+"'"
			+ ", 캐릭터 = '"+CHARAC+"', 장르 = '"+GENRE+"', 타입 = '"+TYPE+"', 문구 ='"+PHRASE+"' where 문구 = '"+O_PHRASE+"';";
	
}
try{
	String driver = "org.mariadb.jdbc.Driver";
	Class.forName(driver);
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt = conn.createStatement();
	stmt.executeUpdate(update_value);

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