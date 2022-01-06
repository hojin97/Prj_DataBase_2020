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

String u_id = (String)session.getAttribute("u_id");

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
String query_myinfo = null;
ResultSet result_music = null;
ResultSet result_video = null;
ResultSet result_myinfo = null;
Connection conn = null;
Statement stmt_music = null;
Statement stmt_video = null;
Statement stmt_myinfo = null;

query_music = "select * from music where 아이디 = '"+ u_id +"' limit "+ page_num +", 3;";
query_video = "select * from video where 아이디 = '"+ u_id +"' limit "+ page_num +", 3;";
query_myinfo = "select * from users where ID = '"+u_id+"';";

try{
	String driver = "org.mariadb.jdbc.Driver";
	Class.forName(driver);
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt_music = conn.createStatement();
	stmt_video = conn.createStatement();
	stmt_myinfo = conn.createStatement();
	result_music = stmt_music.executeQuery(query_music);
	result_video = stmt_video.executeQuery(query_video);
	result_myinfo = stmt_myinfo.executeQuery(query_myinfo);
	
	int i = 0;
	while(result_music.next()){
		Title_music.set(i, result_music.getNString("제목"));
		Artist_music.set(i, result_music.getNString("아티스트"));
		Year_music.set(i, result_music.getNString("연도"));
		Situ_music.set(i, result_music.getNString("상황"));
		Phrase_music.set(i, result_music.getNString("문구"));
		Share_music.set(i, result_music.getNString("공유"));
		i += 1;
	}
	
	i = 0;
	while(result_video.next()){
		Title_video.set(i, result_video.getNString("제목"));
		Artist_video.set(i, result_video.getNString("아티스트"));
		Year_video.set(i, result_video.getNString("연도"));
		Charac_video.set(i, result_video.getNString("캐릭터"));
		Genre_video.set(i, result_video.getNString("장르"));
		Type_video.set(i, result_video.getNString("타입"));
		Situ_video.set(i, result_video.getNString("상황"));
		Phrase_video.set(i, result_video.getNString("문구"));
		Share_video.set(i, result_video.getNString("공유"));
		i += 1;
	}
	
	result_myinfo.next();
	session.setAttribute("u_name", result_myinfo.getNString("이름"));
	session.setAttribute("u_birth", result_myinfo.getNString("생년월일"));
	session.setAttribute("u_score", result_myinfo.getNString("점수"));
	
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
	
	response.sendRedirect("my_phrase.jsp");
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