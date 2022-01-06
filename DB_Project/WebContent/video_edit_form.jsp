<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>문구 넣기 창</title>
</head>
<body>
<%
	String e_title = request.getParameter("e_title");
	String e_artist = request.getParameter("e_artist");
	String e_year = request.getParameter("e_year");
	String e_charac = request.getParameter("e_charac");
	String e_genre = request.getParameter("e_genre");
	String e_type = request.getParameter("e_type");
	String e_situ = request.getParameter("e_situ");
	String e_phrase = request.getParameter("e_phrase");

	String u_id = (String)session.getAttribute("u_id");
	String p_type = "video";
	session.setAttribute("p_type", p_type);
	
%>
<div>
	<font size="5"><b>※영화/만화 문구 수정하기※</b></font>
	<hr size="1" align="left" style="border:dashed 1px; width:80%;">
	<br>
	<form action="edit_phrase.jsp" method="post">
	<table border width="600" height ="200">
		<tr height="25">
			<th>아이디</th>
			<td colspan = "5"><%=u_id%></td>
		</tr>
		<tr height="25">
			<th>제목</th>
			<td colspan = "5"><input type="text" name = "Title" style="width:95%;" value = "<%=e_title %>"/></td>
		</tr>
		<tr height="25">
			<th>아티스트</th>
			<td><input type="text" name = "Artist" style="width:90%;" value = "<%=e_artist %>"></td>
			<th>연도</th>
			<td><input type="number" name = "Year" maxlength="4" style="width:90%;" value = "<%=e_year %>"></td>
			<th>상황</th>
			<td>
				<select name="Situation" style="width:100%;">
					<option value="">-선택-</option>
					<option value="행복">행복</option>
					<option value="슬픔">슬픔</option>
					<option value="아쉬움">아쉬움</option>
					<option value="고민">고민</option>
					<option value="심심">심심</option>
					<option value="낮은자신감">낮은자신감</option>
				</select>
			</td>
		</tr>
		<tr height="25">
			<th>캐릭터</th>
			<td><input type="text" name = "Character" style="width:90%;" value = "<%=e_charac %>"></td>
			<th>장르</th>
			<td><input type="text" name = "Genre" style="width:90%;" value = "<%=e_genre %>"></td>
			<th>종류</th>
			<td>
				<select name="Type" style="width:100%;">
					<option value="">-선택-</option>
					<option value="Movie">영화</option>
					<option value="Animation">만화</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>문구</th>
			<td colspan = "5">
			<input type ="hidden" name = "O_phrase" value= "<%= e_phrase %>" />
			<input type="text" name = "Phrase" style="width:100%; height:100%;" value = "<%=e_phrase %>" />
			</td>
		</tr>
	</table>
	<input type="submit" value="수정하기" onclick = "window.close()"/>
	</form>
	
</div>
</body>
</html>