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
String s_type = "";
String s_word = "";
String search_btn = request.getParameter("search_btn");
String tmp = (String)session.getAttribute("search_num");
int search_num = Integer.parseInt(tmp);

try{
	if (search_btn.equals("prev")){
		search_num -= 3;
	}
	else if (search_btn.equals("next")){
		search_num += 3;
	}
}catch(Exception d){
	;
}
s_type = (String)request.getParameter("s_type");
s_word = (String)request.getParameter("s_word");

if (s_type == null){
	s_type = (String) session.getAttribute("s_type");
	s_word = (String) session.getAttribute("s_word");
}

System.out.println(s_type +", " + s_word);

session.setAttribute("s_type", s_type);
session.setAttribute("s_word", s_word);
if (search_num < 0){
	search_num = 0;
}
session.removeAttribute("search_num");
session.setAttribute("search_num", Integer.toString(search_num));
System.out.println(search_num);

ArrayList <String> S_Title_music = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> S_Artist_music = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> S_Year_music = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> S_Situ_music = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> S_Phrase_music = new ArrayList <String>(Arrays.asList("","",""));

ArrayList <String> S_Title_video = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> S_Artist_video = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> S_Year_video = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> S_Charac_video = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> S_Genre_video = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> S_Type_video = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> S_Situ_video = new ArrayList <String>(Arrays.asList("","",""));
ArrayList <String> S_Phrase_video = new ArrayList <String>(Arrays.asList("","",""));

String dbName = "project";
String jdbcDriver = "jdbc:mariadb://localhost:3307/" + dbName;
String dbUser = "root";
String dbPass = "root";
String query_music = ";";
String query_video = ";";
ResultSet result_music = null;
ResultSet result_video = null;
Connection conn = null;
Statement stmt_music = null;
Statement stmt_video = null;
boolean pass = false;

try{
	String driver = "org.mariadb.jdbc.Driver";
	Class.forName(driver);
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	stmt_music = conn.createStatement();
	stmt_video = conn.createStatement();
	
	if(s_type == null || s_type.equals("")){
		pass = true;
	}
	else if (s_type.equals("캐릭터") || s_type.equals("장르") || s_type.equals("타입")){
		query_video = "select * from video where "+ s_type +" like '%"+ s_word +"%' limit "+search_num+", 3;";
	}
	else{
		query_music = "select * from music where "+ s_type +" like '%"+ s_word +"%' limit "+search_num+", 3;";
		query_video = "select * from video where "+ s_type +" like '%"+ s_word +"%' limit "+search_num+", 3;";
	}
	if(!pass){
		int i = 0;
		if(s_type.equals("제목") || s_type.equals("아티스트") || s_type.equals("연도") || s_type.equals("상황") || s_type.equals("문구")){
			result_music = stmt_music.executeQuery(query_music);
			while(result_music.next()){
				S_Title_music.set(i, result_music.getNString("제목"));
				S_Artist_music.set(i, result_music.getNString("아티스트"));
				S_Year_music.set(i, result_music.getNString("연도"));
				S_Situ_music.set(i, result_music.getNString("상황"));
				S_Phrase_music.set(i, result_music.getNString("문구"));
				i += 1;
			}
		}
		i = 0;
		result_video = stmt_video.executeQuery(query_video);
		while(result_video.next()){
			S_Title_video.set(i, result_video.getNString("제목"));
			S_Artist_video.set(i, result_video.getNString("아티스트"));
			S_Year_video.set(i, result_video.getNString("연도"));
			S_Charac_video.set(i, result_video.getNString("캐릭터"));
			S_Genre_video.set(i, result_video.getNString("장르"));
			S_Type_video.set(i, result_video.getNString("타입"));
			S_Situ_video.set(i, result_video.getNString("상황"));
			S_Phrase_video.set(i, result_video.getNString("문구"));
			i += 1;
		}
	}
	session.setAttribute("S_Title_music", S_Title_music);
	session.setAttribute("S_Artist_music", S_Artist_music);
	session.setAttribute("S_Year_music", S_Year_music);
	session.setAttribute("S_Situ_music", S_Situ_music);
	session.setAttribute("S_Phrase_music", S_Phrase_music);
	
	session.setAttribute("S_Title_video", S_Title_video);
	session.setAttribute("S_Artist_video", S_Artist_video);
	session.setAttribute("S_Year_video", S_Year_video);
	session.setAttribute("S_Charac_video", S_Charac_video);
	session.setAttribute("S_Genre_video", S_Genre_video);
	session.setAttribute("S_Type_video", S_Type_video);
	session.setAttribute("S_Situ_video", S_Situ_video);
	session.setAttribute("S_Phrase_video", S_Phrase_video);
	
	response.sendRedirect("search.jsp");
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