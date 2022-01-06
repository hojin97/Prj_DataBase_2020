<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 중...</title>
</head>
<body>
<%
	String dbName = "project";
	String jdbcDriver = "jdbc:mariadb://localhost:3307/" + dbName;
	String dbUser = "root";
	String dbPass = "root";
	String query = null;
	ResultSet result = null;
	Connection conn = null;
	Statement stmt = null;
	
	String ID = (String)request.getParameter("id");
	String PW = (String)request.getParameter("pw");
	
	System.out.println("ID : " + ID + " PW : " + PW);

	query = "select ID, 이름, 생년월일, 점수 from users "
			+ "where ID = '"+ ID +"' and pw = hex(aes_encrypt('"+ PW +"', 'eagle'))";
	
	try{
		String driver = "org.mariadb.jdbc.Driver";
		Class.forName(driver);
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		result = stmt.executeQuery(query);
		
		// 아이디 비밀번호 일치하면,
		if (result.next()){
			String u_id = result.getNString("ID");
			String u_name = result.getNString("이름");
			String u_birth = result.getNString("생년월일");
			String u_score = result.getNString("점수");
			
			session.setAttribute("id", u_id);
			session.setAttribute("name", u_name);
			session.setAttribute("birth", u_birth);
			session.setAttribute("score", u_score);
			
			response.sendRedirect("cur_feel.jsp");
		}
		else{
			%>
			<script type="text/javascript">
				alert("아이디 혹은 비밀번호가 잘못되었습니다.");
			</script>
			<%
			System.out.println("아이디 혹은 비밀번호가 잘못되었습니다.");
			response.sendRedirect("login.jsp");
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