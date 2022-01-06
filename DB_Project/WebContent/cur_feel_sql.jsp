<%@page import="java.util.Random"%>
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
	// 세션 유지용
	String u_id = (String)session.getAttribute("u_id");
	String u_name = (String)session.getAttribute("u_name");
	String u_birth = (String)session.getAttribute("u_birth");
	String u_score = (String)session.getAttribute("u_score");

	session.setAttribute("u_id", u_id);
	session.setAttribute("u_name", u_name);
	session.setAttribute("u_birth", u_birth);
	session.setAttribute("u_score", u_score);
	
	String dbName = "project";
	String jdbcDriver = "jdbc:mariadb://localhost:3307/" + dbName;
	String dbUser = "root";
	String dbPass = "root";
	String query = null;
	ResultSet result = null;
	Connection conn = null;
	Statement stmt = null;
	
	
	String CUR_FEEL = (String)request.getParameter("cur_feel");
	
	System.out.println("Feel : " + CUR_FEEL);
	
	Random random = new Random();
	
	String []table_name = {"video", "music"}; 
	
	int num = random.nextInt(2);
	System.out.println("Random Num : " + num);
	String snum = Integer.toString(num);
	
	query = "select * from "+ table_name[num] +" where 상황 = '"+ CUR_FEEL +"' and 공유 ='yes' order by rand() limit 1;";
	System.out.println(query);
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);
		
		if (result.next()){
			session.setAttribute("f_num", snum);
			// 비디오면,
			if (num == 0){
				String f_user = result.getNString("아이디");
				String f_title = result.getNString("제목");
				String f_artist = result.getNString("아티스트");
				String f_year = result.getNString("연도");
				String f_charac = result.getNString("캐릭터");
				String f_genre = result.getNString("장르");
				String f_type = result.getNString("타입");
				String f_situ = result.getNString("상황");
				String f_phrase = result.getNString("문구");
				String f_like = result.getNString("좋아요");
				
				session.setAttribute("f_user", f_user);
				session.setAttribute("f_title", f_title);
				session.setAttribute("f_artist", f_artist);
				session.setAttribute("f_year", f_year);
				session.setAttribute("f_charac", f_charac);
				session.setAttribute("f_genre", f_genre);
				session.setAttribute("f_type", f_type);
				session.setAttribute("f_situ", f_situ);
				session.setAttribute("f_phrase", f_phrase);
				session.setAttribute("f_like", f_like);
				
				response.sendRedirect("index.jsp");
			}
			// 음악이면,
			else{
				String f_user = result.getNString("아이디");
				String f_title = result.getNString("제목");
				String f_artist = result.getNString("아티스트");
				String f_year = result.getNString("연도");
				String f_situ = result.getNString("상황");
				String f_phrase = result.getNString("문구");
				String f_like = result.getNString("좋아요");
				
				session.setAttribute("f_user", f_user);
				session.setAttribute("f_title", f_title);
				session.setAttribute("f_artist", f_artist);
				session.setAttribute("f_year", f_year);
				session.setAttribute("f_situ", f_situ);
				session.setAttribute("f_phrase", f_phrase);
				session.setAttribute("f_like", f_like);
				
				response.sendRedirect("index.jsp");
			}
			
		}
		else{
			session.setAttribute("f_num", Integer.toString(-1));
			System.out.println("data가 없습니다.");
			response.sendRedirect("index.jsp");
		}
	} catch(NumberFormatException e){
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