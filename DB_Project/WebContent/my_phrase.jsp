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
String u_id = (String)session.getAttribute("u_id");
String u_name = (String)session.getAttribute("u_name");
String u_birth = (String)session.getAttribute("u_birth");
String u_score = (String)session.getAttribute("u_score");

String tmp = (String)session.getAttribute("page_num");
System.out.println(tmp);
int page_num = Integer.parseInt(tmp);
session.setAttribute("page_num", Integer.toString(page_num));

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
<div>
		<h1>----- 내 정보 -----</h1>
		<table border width="250px">
			<tr>
				<th width="80px">이름</th>
				<td><%=u_name%></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><%=u_birth%></td>
			</tr>
			<tr>
				<th>점수</th>
				<td><%=u_score%></td>
			</tr>
		</table>
		<h1>--------------------</h1>
	</div>
	<br><br>

내가 쓴 Music 문구!
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
		<td>
		<input type="submit" value="수정하기" onclick="javascript: form.action='music_edit_form.jsp'"/>
		</td>
		<td>
		<input type="submit" value="삭제하기" onclick="javascript: form.action='delete_phrase.jsp'"/>
		</td>
		<td align = "center">
		<input type = "hidden" value="<%=Share_music.get(0) %>" name = "e_share" />
		<input type="submit" value="공유하기" onclick="javascript: form.action='share_phrase.jsp'"/><br>
		<%= Share_music.get(0) %>
		</td>
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
		<td>
		<input type="submit" value="수정하기" onclick="javascript: form.action='music_edit_form.jsp'"/>
		</td>
		<td>
		<input type="submit" value="삭제하기" onclick="javascript: form.action='delete_phrase.jsp'"/>
		</td>
		<td align = "center">
		<input type="submit" value="공유하기" onclick="javascript: form.action='share_phrase.jsp'"/><br>
		<input type = "hidden" value="<%=Share_music.get(1) %>" name = "e_share" />
		<%= Share_music.get(1) %>
		</td>
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
		<td>
		<input type="submit" value="수정하기" onclick="javascript: form.action='music_edit_form.jsp'"/>
		</td>
		<td>
		<input type="submit" value="삭제하기" onclick="javascript: form.action='delete_phrase.jsp'"/>
		</td>
		<td align = "center">
		<input type="submit" value="공유하기" onclick="javascript: form.action='share_phrase.jsp'"/><br>
		<input type = "hidden" value="<%=Share_music.get(2) %>" name = "e_share" />
		<%= Share_music.get(2) %>
		</td>
	</tr>
	</form>
</table>
</br></br></br>
내가 쓴 Video 문구!
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
		<td>
		<input type="submit" value="수정하기" onclick="javascript: form.action='video_edit_form.jsp'"/>
		</td>
		<td>
		<input type="submit" value="삭제하기" onclick="javascript: form.action='delete_phrase.jsp'"/>
		</td>
		<td align = "center">
		<input type="submit" value="공유하기" onclick="javascript: form.action='share_phrase.jsp'"/><br>
		<input type = "hidden" value="<%=Share_video.get(0) %>" name = "e_share" />
		<%= Share_video.get(0) %>
		</td>
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
		<td>
		<input type="submit" value="수정하기" onclick="javascript: form.action='video_edit_form.jsp'"/>
		</td>
		<td>
		<input type="submit" value="삭제하기" onclick="javascript: form.action='delete_phrase.jsp'"/>
		</td>
		<td align = "center">
		<input type="submit" value="공유하기" onclick="javascript: form.action='share_phrase.jsp'"/><br>
		<input type = "hidden" value="<%=Share_video.get(1) %>" name = "e_share" />
		<%= Share_video.get(1) %>
		</td>
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
		<td>
		<input type="submit" value="수정하기" onclick="javascript: form.action='video_edit_form.jsp'"/>
		</td>
		<td>
		<input type="submit" value="삭제하기" onclick="javascript: form.action='delete_phrase.jsp'"/>
		</td>
		<td align = "center">
		<input type="submit" value="공유하기" onclick="javascript: form.action='share_phrase.jsp'"/><br>
		<input type = "hidden" value="<%=Share_video.get(2) %>" name = "e_share" />
		<%= Share_video.get(2) %>
		</td>
	</tr>
	</form>
</table>
<br>
페이지 이동
<table>
	<tr>
		<td>
		<form action="my_phrase_sql.jsp">
			<input type="hidden" value="prev" name = "page_btn" />
			<input type="submit" value=" 이전 "/>
		</form>
		</td>
		<td>
		<form action="my_phrase_sql.jsp">
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