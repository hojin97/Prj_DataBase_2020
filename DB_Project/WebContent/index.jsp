<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
<%
	String like_ch = "0";
	try{
		like_ch = (String)session.getAttribute("like_ch");
	}catch(Exception f){
	}
	if(like_ch == null){
		like_ch = "0";
	}
	System.out.println("추천 : "+ like_ch);
	String f_user = "";
	String f_title = "";
	String f_artist = "";
	String f_year = "";
	String f_charac = "";
	String f_genre = "";
	String f_type = "";
	String f_situ = "";
	String f_phrase = "";
	String f_like = "";

	String u_id = (String)session.getAttribute("u_id");
	String u_name = (String)session.getAttribute("u_name");
	String u_birth = (String)session.getAttribute("u_birth");
	String u_score = (String)session.getAttribute("u_score");
	
	String t = (String)session.getAttribute("f_num");
	int f_num = Integer.parseInt(t);
	
	try{
	f_like = (String)session.getAttribute("f_like");
	session.setAttribute("f_like", f_like);
	}catch(Exception a){}
	
	// f_num == 0 ? Video : Music
	if (f_num == 0){
		f_user = (String)session.getAttribute("f_user");
		f_title = (String)session.getAttribute("f_title");
		f_artist = (String)session.getAttribute("f_artist");
		f_year = (String)session.getAttribute("f_year");
		f_charac = (String)session.getAttribute("f_charac");
		f_genre = (String)session.getAttribute("f_genre");
		f_type = (String)session.getAttribute("f_type");
		f_situ = (String)session.getAttribute("f_situ");
		f_phrase = (String)session.getAttribute("f_phrase");
		
		System.out.println(f_title +" "+ f_type +" "+ f_genre + ", " + f_like);
	}
	else if(f_num == 1){
		f_user = (String)session.getAttribute("f_user");
		f_title = (String)session.getAttribute("f_title");
		f_artist = (String)session.getAttribute("f_artist");
		f_year = (String)session.getAttribute("f_year");
		f_situ = (String)session.getAttribute("f_situ");
		f_phrase = (String)session.getAttribute("f_phrase");
		
		System.out.println(f_title + " " + f_artist +" "+ f_situ + ", " + f_like);
	}
	else{
		%>
		추천 드릴 [ 명언 / 문구 ] 가 없네요 ㅠㅠ  <br><br>
		<%
	}
	// session set part.
	String s_null = null;
	session.setAttribute("page_num", "0");
	session.setAttribute("search_num", "0");
	session.setAttribute("u_id", u_id);
	session.setAttribute("f_charac", f_charac);
	session.setAttribute("f_phrase", f_phrase);
	session.setAttribute("f_user", f_user);
	session.setAttribute("s_type", s_null);
%>	
	<div>
		반갑습니다. <%=u_name %>님. <br>
		
		<%if (f_num == 0 || f_num == 1){%>
		현재, '<%=f_situ %>' 하신 상태군요! <br>
		그럴 땐, 이런 말을 머리에 새겨보세요. <br>
		
			<%if(f_num == 0){%>
			<table border>
			<tr align="center">
				<th>제목</th>
				<td colspan = "2"><%=f_title%></td>
				<th>작성자</th>
				<td><%=f_user %></td>
				<td colspa = "2">
				<form action = "friend_sql.jsp" method="post">
				<input type="hidden" value = "curr" name = "page_btn"/>
				<input type="submit" value = "구경하기" style="width:100%;"/>
				</form>
				</td>
			</tr>
			<tr align="center">
				<th>아티스트</th>
				<td><%=f_artist %></td>
				<th>연도</th>
				<td><%=f_year %></td>
				<th>좋아요</th>
				<td align="center"><%=f_like %></td>
			</tr>
			<tr align="center">
				<th>캐릭터</th>
				<td><%=f_charac %></td>
				<th>장르</th>
				<td><%=f_genre %></td>
				<th>타입</th>
				<td><%=f_type %></td>
			</tr>
			<tr>
				<th>문구</th>
				<td colspan = "5"><%=f_phrase %></td>
			</tr>
			</table>
			<%}
			else if(f_num == 1){%>
			<table border>
			<tr align="center">
				<th>제목</th>
				<td colspan = "2"><%=f_title%></td>
				<th>작성자</th>
				<td align="center"><%=f_user %></td>
				<td colspa = "2">
				<form action = "friend_sql.jsp" method="post">
				<input type="hidden" value = "curr" name = "page_btn"/>
				<input type="submit" value = "구경하기" style="width:100%;"/>
				</form>
				</td>
			</tr>
			<tr align="center">
				<th>아티스트</th>
				<td><%=f_artist %></td>
				<th>연도</th>
				<td><%=f_year %></td>
				<th>좋아요</th>
				<td align="center"><%=f_like %></td>
			</tr>
			<tr>
				<th>문구</th>
				<td colspan = "5"><%=f_phrase %></td>
			</tr>
			</table>
			<%}%>
		
	</div>
	<br>
	<form action="like_sql.jsp" method = "post">
	문구가 마음에 들었으면 <input type ="submit" value=" 좋아요! " />  버튼 눌러주세요!<br>
	<input type ="hidden" value="<%=like_ch %>" name = "like_ch"/>
	</form>
	<%}%>
	
	<script>
	function music_write_phrase(){
		window.name = "parentForm";
		window.open("music_write_form.jsp", "writeForm", "width = 720, height = 350, resizable = no, scrollbars = no");
	}
	function video_write_phrase(){
		window.name = "parentForm";
		window.open("video_write_form.jsp", "writeForm", "width = 720, height = 350, resizable = no, scrollbars = no");
	}
	</script>
	<br>
	<form action = "my_phrase_sql.jsp" method = "post">
	내가 작성한 문구 보러가기! <input type="submit" value=" 내 정보 " />
	<input type="hidden" value="curr" name = "page_btn"/>
	</form>
	
	<br><br>
	지금 바로 문구 등록하러 가기!
	<input type="button" value=" 음악 문구 등록 " onclick="music_write_phrase()"/>
	<input type="button" value=" 영상 문구 등록 " onclick="video_write_phrase()"/>
	<br><br>
	
	<form action = "search_sql.jsp">
	문구 검색하러 가기! <input type="submit" value=" 검색하기 "/>
	<input type="hidden" value="curr" name = "search_btn"/>
	</form>
	
	<br><br>
	<form action = "login.jsp">
	로그아웃 하기! <input type="submit" value=" 로그아웃 "/>
	</form>
	
</body>
</html>