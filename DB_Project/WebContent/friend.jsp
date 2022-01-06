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
String tmp = (String)session.getAttribute("page_num");
System.out.println(tmp);
int page_num = Integer.parseInt(tmp);
session.setAttribute("page_num", Integer.toString(page_num));
String f_user = (String)session.getAttribute("f_user");

ArrayList <String> Title_music = (ArrayList)session.getAttribute("Title_music");
ArrayList <String> Artist_music = (ArrayList)session.getAttribute("Artist_music");
ArrayList <String> Year_music = (ArrayList)session.getAttribute("Year_music");
ArrayList <String> Situ_music = (ArrayList)session.getAttribute("Situ_music");
ArrayList <String> Phrase_music = (ArrayList)session.getAttribute("Phrase_music");
ArrayList <String> Share_music = (ArrayList)session.getAttribute("Share_music");

ArrayList <String> Title_video = (ArrayList)session.getAttribute("Title_video");
ArrayList <String> Artist_video = (ArrayList)session.getAttribute("Artist_video");
ArrayList <String> Year_video = (ArrayList)session.getAttribute("Year_video");
ArrayList <String> Charac_video = (ArrayList)session.getAttribute("Charac_video");
ArrayList <String> Genre_video = (ArrayList)session.getAttribute("Genre_video");
ArrayList <String> Type_video = (ArrayList)session.getAttribute("Type_video");
ArrayList <String> Situ_video = (ArrayList)session.getAttribute("Situ_video");
ArrayList <String> Phrase_video = (ArrayList)session.getAttribute("Phrase_video");
ArrayList <String> Share_video = (ArrayList)session.getAttribute("Share_video");
%>

<%=f_user %>님이 작성한 Music 문구!
<table border width="1200">
	<form method = "post">
	<tr>
		<th>제목</th>
		<td><%=Title_music.get(0) %></td>
		<input type="hidden" value="<%=Title_music.get(0)%>" name = "e_title"/>
		<th>아티스트</th>
		<td><%=Artist_music.get(0) %></td>
		<input type="hidden" value="<%=Artist_music.get(0)%>" name = "e_artist"/>
		<th>연도</th>
		<td><%=Year_music.get(0) %></td>
		<input type="hidden" value="<%=Year_music.get(0)%>" name = "e_year"/>
		<th>상황</th>
		<td><%=Situ_music.get(0) %></td>
		<input type="hidden" value="<%=Situ_music.get(0)%>" name = "e_situ"/>
		<th>문구</th>
		<td><%=Phrase_music.get(0) %></td>
		<input type="hidden" value="<%=Phrase_music.get(0)%>" name = "e_phrase"/>
	</tr>
	</form>
	<form method = "post">
	<tr>
		<th>제목</th>
		<td><%=Title_music.get(1) %></td>
		<input type="hidden" value="<%=Title_music.get(1)%>" name = "e_title"/>
		<th>아티스트</th>
		<td><%=Artist_music.get(1) %></td>
		<input type="hidden" value="<%=Artist_music.get(1)%>" name = "e_artist"/>
		<th>연도</th>
		<td><%=Year_music.get(1) %></td>
		<input type="hidden" value="<%=Year_music.get(1)%>" name = "e_year"/>
		<th>상황</th>
		<td><%=Situ_music.get(1) %></td>
		<input type="hidden" value="<%=Situ_music.get(1)%>" name = "e_situ"/>
		<th>문구</th>
		<td><%=Phrase_music.get(1) %></td>
		<input type="hidden" value="<%=Phrase_music.get(1)%>" name = "e_phrase"/>
	</tr>
	</form>
	<form method = "post">
	<tr>
		<th>제목</th>
		<td><%=Title_music.get(2) %></td>
		<input type="hidden" value="<%=Title_music.get(2)%>" name = "e_title"/>
		<th>아티스트</th>
		<td><%=Artist_music.get(2) %></td>
		<input type="hidden" value="<%=Artist_music.get(2)%>" name = "e_artist"/>
		<th>연도</th>
		<td><%=Year_music.get(2) %></td>
		<input type="hidden" value="<%=Year_music.get(2)%>" name = "e_year"/>
		<th>상황</th>
		<td><%=Situ_music.get(2) %></td>
		<input type="hidden" value="<%=Situ_music.get(2)%>" name = "e_situ"/>
		<th>문구</th>
		<td><%=Phrase_music.get(2) %></td>
		<input type="hidden" value="<%=Phrase_music.get(2)%>" name = "e_phrase"/>
	</tr>
	</form>
</table>
</br></br></br>
<%=f_user %>님이 작성한 Video 문구!
<table border width="1200">
	<form method = "post">
	<tr>
		<th>제목</th>
		<td><%= Title_video.get(0) %></td>
		<input type="hidden" value="<%=Title_video.get(0)%>" name = "e_title"/>
		<th>아티스트</th>
		<td><%= Artist_video.get(0) %></td>
		<input type="hidden" value="<%=Artist_video.get(0)%>" name = "e_artist"/>
		<th>연도</th>
		<td><%= Year_video.get(0) %></td>
		<input type="hidden" value="<%=Year_video.get(0)%>" name = "e_year"/>
		<th>캐릭터</th>
		<td><%= Charac_video.get(0) %></td>
		<input type="hidden" value="<%=Charac_video.get(0)%>" name = "e_charac"/>
		<th>장르</th>
		<td><%= Genre_video.get(0) %></td>
		<input type="hidden" value="<%=Genre_video.get(0)%>" name = "e_genre"/>
		<th>타입</th>
		<td><%= Type_video.get(0) %></td>
		<input type="hidden" value="<%=Type_video.get(0)%>" name = "e_type"/>
		<th>상황</th>
		<td><%= Situ_video.get(0) %></td>
		<input type="hidden" value="<%=Situ_video.get(0)%>" name = "e_situ"/>
		<th>문구</th>
		<td><%= Phrase_video.get(0) %></td>
		<input type="hidden" value="<%=Phrase_video.get(0)%>" name = "e_phrase"/>
	</tr>
	</form>
	
	<form method = "post">
	<tr>
		<th>제목</th>
		<td><%= Title_video.get(1) %></td>
		<input type="hidden" value="<%=Title_video.get(1)%>" name = "e_title"/>
		<th>아티스트</th>
		<td><%= Artist_video.get(1) %></td>
		<input type="hidden" value="<%=Artist_video.get(1)%>" name = "e_artist"/>
		<th>연도</th>
		<td><%= Year_video.get(1) %></td>
		<input type="hidden" value="<%=Year_video.get(1)%>" name = "e_year"/>
		<th>캐릭터</th>
		<td><%= Charac_video.get(1) %></td>
		<input type="hidden" value="<%=Charac_video.get(1)%>" name = "e_charac"/>
		<th>장르</th>
		<td><%= Genre_video.get(1) %></td>
		<input type="hidden" value="<%=Genre_video.get(1)%>" name = "e_genre"/>
		<th>타입</th>
		<td><%= Type_video.get(1) %></td>
		<input type="hidden" value="<%=Type_video.get(1)%>" name = "e_type"/>
		<th>상황</th>
		<td><%= Situ_video.get(1) %></td>
		<input type="hidden" value="<%=Situ_video.get(1)%>" name = "e_situ"/>
		<th>문구</th>
		<td><%= Phrase_video.get(1) %></td>
		<input type="hidden" value="<%=Phrase_video.get(1)%>" name = "e_phrase"/>
	</tr>
	</form>
	
	<form method = "post">
	<tr>
		<th>제목</th>
		<td><%= Title_video.get(2) %></td>
		<input type="hidden" value="<%=Title_video.get(2)%>" name = "e_title"/>
		<th>아티스트</th>
		<td><%= Artist_video.get(2) %></td>
		<input type="hidden" value="<%=Artist_video.get(2)%>" name = "e_artist"/>
		<th>연도</th>
		<td><%= Year_video.get(2) %></td>
		<input type="hidden" value="<%=Year_video.get(2)%>" name = "e_year"/>
		<th>캐릭터</th>
		<td><%= Charac_video.get(2) %></td>
		<input type="hidden" value="<%=Charac_video.get(2)%>" name = "e_charac"/>
		<th>장르</th>
		<td><%= Genre_video.get(2) %></td>
		<input type="hidden" value="<%=Genre_video.get(2)%>" name = "e_genre"/>
		<th>타입</th>
		<td><%= Type_video.get(2) %></td>
		<input type="hidden" value="<%=Type_video.get(2)%>" name = "e_type"/>
		<th>상황</th>
		<td><%= Situ_video.get(2) %></td>
		<input type="hidden" value="<%=Situ_video.get(2)%>" name = "e_situ"/>
		<th>문구</th>
		<td><%= Phrase_video.get(2) %></td>
		<input type="hidden" value="<%=Phrase_video.get(2)%>" name = "e_phrase"/>
	</tr>
	</form>
</table>
<br>
페이지 이동
<table>
	<tr>
		<td>
		<form action="friend_sql.jsp">
			<input type="hidden" value="prev" name = "page_btn" />
			<input type="submit" value=" 이전 "/>
		</form>
		</td>
		<td>
		<form action="friend_sql.jsp">
			<input type="hidden" value="next" name = "page_btn" />
			<input type="submit" value=" 다음 "/>
		</form>
		</td>
	</tr>
	
	<tr>
		<td>
		<form action="index.jsp">
			<input type="submit" value=" 메인으로 돌아가기 "/>
		</form>
		</td>
	</tr>
</table>


</body>
</html>