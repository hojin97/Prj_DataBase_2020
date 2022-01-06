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
String tmp = (String)session.getAttribute("search_num");
System.out.println(tmp);
int search_num = Integer.parseInt(tmp);
session.setAttribute("search_num", Integer.toString(search_num));

String tmp_s_type = (String)session.getAttribute("s_type");
String tmp_s_word = (String)session.getAttribute("s_word");

ArrayList <String> S_Title_music = (ArrayList)session.getAttribute("S_Title_music");
ArrayList <String> S_Artist_music = (ArrayList)session.getAttribute("S_Artist_music");
ArrayList <String> S_Year_music = (ArrayList)session.getAttribute("S_Year_music");
ArrayList <String> S_Situ_music = (ArrayList)session.getAttribute("S_Situ_music");
ArrayList <String> S_Phrase_music = (ArrayList)session.getAttribute("S_Phrase_music");

ArrayList <String> S_Title_video = (ArrayList)session.getAttribute("S_Title_video");
ArrayList <String> S_Artist_video = (ArrayList)session.getAttribute("S_Artist_video");
ArrayList <String> S_Year_video = (ArrayList)session.getAttribute("S_Year_video");
ArrayList <String> S_Charac_video = (ArrayList)session.getAttribute("S_Charac_video");
ArrayList <String> S_Genre_video = (ArrayList)session.getAttribute("S_Genre_video");
ArrayList <String> S_Type_video = (ArrayList)session.getAttribute("S_Type_video");
ArrayList <String> S_Situ_video = (ArrayList)session.getAttribute("S_Situ_video");
ArrayList <String> S_Phrase_video = (ArrayList)session.getAttribute("S_Phrase_video");
%>
<form action="search_sql.jsp" method = "post">
<select name="s_type">
					<option value="">-선택-</option>
					<option value="제목">제목</option>
					<option value="아티스트">아티스트</option>
					<option value="연도">연도</option>
					<option value="캐릭터">캐릭터</option>
					<option value="장르">장르</option>
					<option value="타입">타입</option>
					<option value="상황">상황</option>
					<option value="문구">문구</option>
				</select>
<input type="search" name = "s_word"/>
<input type="submit" value="검색"/>
</form>
<br>
검색 된 Music 문구!
<table border width="1200">
	<form method = "post">
	<tr>
		<th>제목</th>
		<td><%=S_Title_music.get(0) %></td>
		<input type="hidden" value="<%=S_Title_music.get(0)%>" name = "e_title"/>
		<th>아티스트</th>
		<td><%=S_Artist_music.get(0) %></td>
		<input type="hidden" value="<%=S_Artist_music.get(0)%>" name = "e_artist"/>
		<th>연도</th>
		<td><%=S_Year_music.get(0) %></td>
		<input type="hidden" value="<%=S_Year_music.get(0)%>" name = "e_year"/>
		<th>상황</th>
		<td><%=S_Situ_music.get(0) %></td>
		<input type="hidden" value="<%=S_Situ_music.get(0)%>" name = "e_situ"/>
		<th>문구</th>
		<td><%=S_Phrase_music.get(0) %></td>
		<input type="hidden" value="<%=S_Phrase_music.get(0)%>" name = "e_phrase"/>
	</tr>
	</form>
	<form method = "post">
	<tr>
		<th>제목</th>
		<td><%=S_Title_music.get(1) %></td>
		<input type="hidden" value="<%=S_Title_music.get(1)%>" name = "e_title"/>
		<th>아티스트</th>
		<td><%=S_Artist_music.get(1) %></td>
		<input type="hidden" value="<%=S_Artist_music.get(1)%>" name = "e_artist"/>
		<th>연도</th>
		<td><%=S_Year_music.get(1) %></td>
		<input type="hidden" value="<%=S_Year_music.get(1)%>" name = "e_year"/>
		<th>상황</th>
		<td><%=S_Situ_music.get(1) %></td>
		<input type="hidden" value="<%=S_Situ_music.get(1)%>" name = "e_situ"/>
		<th>문구</th>
		<td><%=S_Phrase_music.get(1) %></td>
		<input type="hidden" value="<%=S_Phrase_music.get(1)%>" name = "e_phrase"/>
	</tr>
	</form>
	<form method = "post">
	<tr>
		<th>제목</th>
		<td><%=S_Title_music.get(2) %></td>
		<input type="hidden" value="<%=S_Title_music.get(2)%>" name = "e_title"/>
		<th>아티스트</th>
		<td><%=S_Artist_music.get(2) %></td>
		<input type="hidden" value="<%=S_Artist_music.get(2)%>" name = "e_artist"/>
		<th>연도</th>
		<td><%=S_Year_music.get(2) %></td>
		<input type="hidden" value="<%=S_Year_music.get(2)%>" name = "e_year"/>
		<th>상황</th>
		<td><%=S_Situ_music.get(2) %></td>
		<input type="hidden" value="<%=S_Situ_music.get(2)%>" name = "e_situ"/>
		<th>문구</th>
		<td><%=S_Phrase_music.get(2) %></td>
		<input type="hidden" value="<%=S_Phrase_music.get(2)%>" name = "e_phrase"/>
	</tr>
	</form>
</table>
</br></br></br>
검색 된 Video 문구!
<table border width="1200">
	<form method = "post">
	<tr>
		<th>제목</th>
		<td><%= S_Title_video.get(0) %></td>
		<input type="hidden" value="<%=S_Title_video.get(0)%>" name = "e_title"/>
		<th>아티스트</th>
		<td><%= S_Artist_video.get(0) %></td>
		<input type="hidden" value="<%=S_Artist_video.get(0)%>" name = "e_artist"/>
		<th>연도</th>
		<td><%= S_Year_video.get(0) %></td>
		<input type="hidden" value="<%=S_Year_video.get(0)%>" name = "e_year"/>
		<th>캐릭터</th>
		<td><a href="http://google.co.kr/search?q=<%=S_Title_video.get(0)%>+<%=S_Charac_video.get(0)%>" target="_black"><%= S_Charac_video.get(0) %></a></td>
		<input type="hidden" value="<%=S_Charac_video.get(0)%>" name = "e_charac"/>
		<th>장르</th>
		<td><%= S_Genre_video.get(0) %></td>
		<input type="hidden" value="<%=S_Genre_video.get(0)%>" name = "e_genre"/>
		<th>타입</th>
		<td><%= S_Type_video.get(0) %></td>
		<input type="hidden" value="<%=S_Type_video.get(0)%>" name = "e_type"/>
		<th>상황</th>
		<td><%= S_Situ_video.get(0) %></td>
		<input type="hidden" value="<%=S_Situ_video.get(0)%>" name = "e_situ"/>
		<th>문구</th>
		<td><%= S_Phrase_video.get(0) %></td>
		<input type="hidden" value="<%=S_Phrase_video.get(0)%>" name = "e_phrase"/>
	</tr>
	</form>
	
	<form method = "post">
	<tr>
		<th>제목</th>
		<td><%= S_Title_video.get(1) %></td>
		<input type="hidden" value="<%=S_Title_video.get(1)%>" name = "e_title"/>
		<th>아티스트</th>
		<td><%= S_Artist_video.get(1) %></td>
		<input type="hidden" value="<%=S_Artist_video.get(1)%>" name = "e_artist"/>
		<th>연도</th>
		<td><%= S_Year_video.get(1) %></td>
		<input type="hidden" value="<%=S_Year_video.get(1)%>" name = "e_year"/>
		<th>캐릭터</th>
		<td><a href="http://google.co.kr/search?q=<%=S_Title_video.get(1)%>+<%=S_Charac_video.get(1)%>" target="_black"><%= S_Charac_video.get(1) %></a></td>
		<input type="hidden" value="<%=S_Charac_video.get(1)%>" name = "e_charac"/>
		<th>장르</th>
		<td><%= S_Genre_video.get(1) %></td>
		<input type="hidden" value="<%=S_Genre_video.get(1)%>" name = "e_genre"/>
		<th>타입</th>
		<td><%= S_Type_video.get(1) %></td>
		<input type="hidden" value="<%=S_Type_video.get(1)%>" name = "e_type"/>
		<th>상황</th>
		<td><%= S_Situ_video.get(1) %></td>
		<input type="hidden" value="<%=S_Situ_video.get(1)%>" name = "e_situ"/>
		<th>문구</th>
		<td><%= S_Phrase_video.get(1) %></td>
		<input type="hidden" value="<%=S_Phrase_video.get(1)%>" name = "e_phrase"/>
	</tr>
	</form>
	
	<form method = "post">
	<tr>
		<th>제목</th>
		<td><%= S_Title_video.get(2) %></td>
		<input type="hidden" value="<%=S_Title_video.get(2)%>" name = "e_title"/>
		<th>아티스트</th>
		<td><%= S_Artist_video.get(2) %></td>
		<input type="hidden" value="<%=S_Artist_video.get(2)%>" name = "e_artist"/>
		<th>연도</th>
		<td><%= S_Year_video.get(2) %></td>
		<input type="hidden" value="<%=S_Year_video.get(2)%>" name = "e_year"/>
		<th>캐릭터</th>
		<td><a href="http://google.co.kr/search?q=<%=S_Title_video.get(2)%>+<%=S_Charac_video.get(2)%>" target="_black"><%= S_Charac_video.get(2) %></a></td>
		<input type="hidden" value="<%=S_Charac_video.get(2)%>" name = "e_charac"/>
		<th>장르</th>
		<td><%= S_Genre_video.get(2) %></td>
		<input type="hidden" value="<%=S_Genre_video.get(2)%>" name = "e_genre"/>
		<th>타입</th>
		<td><%= S_Type_video.get(2) %></td>
		<input type="hidden" value="<%=S_Type_video.get(2)%>" name = "e_type"/>
		<th>상황</th>
		<td><%= S_Situ_video.get(2) %></td>
		<input type="hidden" value="<%=S_Situ_video.get(2)%>" name = "e_situ"/>
		<th>문구</th>
		<td><%= S_Phrase_video.get(2) %></td>
		<input type="hidden" value="<%=S_Phrase_video.get(2)%>" name = "e_phrase"/>
	</tr>
	</form>
</table>
<br>
페이지 이동
<table>
	<tr>
		<td>
		<form action="search_sql.jsp">
			<input type="hidden" value="prev" name = "search_btn" />
			<input type="submit" value=" 이전 "/>
		</form>
		</td>
		<td>
		<form action="search_sql.jsp">
			<input type="hidden" value="next" name = "search_btn" />
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