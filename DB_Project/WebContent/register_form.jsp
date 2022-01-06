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
int duplicate_id = 0;
session.setAttribute("duplicate_id", duplicate_id);
%>
<script>
function btn_id_check(){
	window.name = "parentForm";
	window.open("id_check.jsp", "chkForm", "width = 500, height = 300, resizable = no, scrollbars = no");
}

function checkValue(){
	var form = document.register_form;
	
	if(!form.r_pw1.value || !form.r_pw1.value || !form.reg_id.value || !form.r_name.value || !form.r_birth.value){
		alert("빈칸이 존재합니다.");
		return false;
	}
	
	if(form.reg_id.readOnly == false){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	
	if(!(form.r_pw1.value == form.r_pw2.value)){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
}

</script>
	<form action ="register.jsp" method="post" name="register_form" onsubmit="return checkValue()">
		<div>
			<table style="width:800px; height:auto; text-allign:left;" >
				<tr>
					<th> * 회원 ID </th>
					<td><input type="text" name = "reg_id" size = 20 maxlength = "12" required ></td>
					<td><input type="button" value="ID 중복 검사" onclick = "btn_id_check()" /></td>
					<td>최대 12자까지 가능합니다.</td>
				</tr>
				
				<tr>
					<th> * 비밀번호 </th>
					<td><input type="password" name = "r_pw1" size = 20 required>
				</tr>
				
				<tr>
					<th> * 비밀번호 확인 </th>
					<td><input type="password" name = "r_pw2" size = 20 required>
				</tr>
				
				<tr>
					<th> * 이름 </th>
					<td><input type="text" name = "r_name" size = 20 required>
				</tr>
				<tr>
					<th> * 생년월일 </th>
					<td><input type="text" name= "r_birth" size = 20 required>
				</tr>
			</table>
		</div>
		<div>
		<br>
			<input type="submit" value="회원가입 하기"/>
		</div>
	</form>
</body>
</html>