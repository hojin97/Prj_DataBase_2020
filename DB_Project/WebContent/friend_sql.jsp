<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
String p_type = (String)request.getParameter("page_btn");
String tmp = (String)session.getAttribute("page_num");
int page_num = Integer.parseInt(tmp);
try{
	if (p_type.equals("prev")){
	page_num -= 3;
	}
	else if (p_type.equals("next")){
		page_num += 3;
	}

}catch(Exception d){
	;
}

if (page_num < 0){
	page_num = 0;
}
session.removeAttribute("page_num");
session.setAttribute("page_num", Integer.toString(page_num));
System.out.println(page_num);

String f_user = (String)session.getAttribute("f_user");
session.setAttribute("f_user", f_user);

ArrayList <String> Title_music = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> Artist_music = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> Year_music = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> Situ_music = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> Phrase_music = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> Share_music = new ArrayList <String>(Arrays.asList("","",""));

ArrayList <String> Title_video = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> Artist_video = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> Year_video = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> Charac_video = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> Genre_video = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> Type_video = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> Situ_video = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> Phrase_video = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> Share_video = new ArrayList <String>(Arrays.asList("","",""));

String dbName = "project";
String jdbcDriver = "jdbc:mariadb://localhost:3307/" + dbName;
String dbUser = "root";
String dbPass = "root";
String query_music = null;
String query_video = null;
ResultSet result_music = null;
ResultSet result_video = null;
Connection conn = null;
Statement stmt_music = null;
Statement stmt_video = null;

query_music = "select * from music where ????????? = '"+ f_user +"' and ?????? = 'yes' limit "+ page_num +", 3;";
query_video = "select * from video where ????????? = '"+ f_user +"' and ?????? = 'yes' limit "+ page_num +", 3;";

try{
	String driver = "org.mariadb.jdbc.Driver";
	Class.forName(driver);
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt_music = conn.createStatement();
	stmt_video = conn.createStatement();
	result_music = stmt_music.executeQuery(query_music);
	result_video = stmt_video.executeQuery(query_video);
	
	int i = 0;
	while(result_music.next()){
		Title_music.set(i, result_music.getNString("??????"));
		Artist_music.set(i, result_music.getNString("????????????"));
		Year_music.set(i, result_music.getNString("??????"));
		Situ_music.set(i, result_music.getNString("??????"));
		Phrase_music.set(i, result_music.getNString("??????"));
		Share_music.set(i, result_music.getNString("??????"));
		i += 1;
	}
	
	i = 0;
	while(result_video.next()){
		Title_video.set(i, result_video.getNString("??????"));
		Artist_video.set(i, result_video.getNString("????????????"));
		Year_video.set(i, result_video.getNString("??????"));
		Charac_video.set(i, result_video.getNString("?????????"));
		Genre_video.set(i, result_video.getNString("??????"));
		Type_video.set(i, result_video.getNString("??????"));
		Situ_video.set(i, result_video.getNString("??????"));
		Phrase_video.set(i, result_video.getNString("??????"));
		Share_video.set(i, result_video.getNString("??????"));
		i += 1;
	}
	
	session.setAttribute("Title_music", Title_music);
	session.setAttribute("Artist_music", Artist_music);
	session.setAttribute("Year_music", Year_music);
	session.setAttribute("Situ_music", Situ_music);
	session.setAttribute("Phrase_music", Phrase_music);
	session.setAttribute("Share_music", Share_music);
	
	session.setAttribute("Title_video", Title_video);
	session.setAttribute("Artist_video", Artist_video);
	session.setAttribute("Year_video", Year_video);
	session.setAttribute("Charac_video", Charac_video);
	session.setAttribute("Genre_video", Genre_video);
	session.setAttribute("Type_video", Type_video);
	session.setAttribute("Situ_video", Situ_video);
	session.setAttribute("Phrase_video", Phrase_video);
	session.setAttribute("Share_video", Share_video);
	
	response.sendRedirect("friend.jsp");
} catch(NumberFormatException e){
} catch (SQLException se){
	se.printStackTrace();		
}finally{
	try{
		stmt_music.close();
		stmt_video.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>
</body>
</html>