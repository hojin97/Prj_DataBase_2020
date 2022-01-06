<%@page import="javax.naming.directory.InvalidSearchControlsException"%>
<%@page import="java.text.Normalizer.Form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
</head>
<%
int duplicate_id = -5;
String r_id = "";
try{
	duplicate_id = (int)session.getAttribute("duplicate_id");
	if (duplicate_id == 1){
		r_id = (String)session.getAttribute("r_id");
		System.out.println("사용 가능한 아이디 : "+ r_id);
	}
}catch (Exception e){
	
}

%>
<script>
	// 회원가입 창의 id 값을 불러옴.
	function pValue(){
		var dupli_id = "<%=duplicate_id%>";
		
		if (dupli_id == 0){
			document.getElementById("userId").value = opener.document.register_form.reg_id.value;
		}
		else if (dupli_id == 1){
			var sel = confirm("아이디 사용 가능합니다. 사용하시겠습니까?");
			if (sel == true){
				var id = "<%=r_id%>";
				
				document.getElementById("userId").readOnly = true;
				document.getElementById("userId").value = String(id);
				
				document.getElementById("r_id_check").value = "true";
				return true;
			}
		}
		else if (dupli_id == -2){
			alert("아이디를 입력하세요.");
		}
		else{
			alert("중복된 아이디가 존재합니다.");
			document.getElementById("userId").value = null;
		}
	}
	
	function btn_close(){
		var du_id = "<%=duplicate_id%>";
		if (du_id == 1){
			opener.document.register_form.reg_id.value = document.getElementById("userId").value;
			opener.document.register_form.reg_id.readOnly = true;
		}
		window.close();
	}
	
</script>
<body onload ="pValue()">
<div id="wrap">
    <br>
    <b><font size="4" color="gray">아이디 중복체크</font></b>
    <hr size="1" width="460">
    <br>
    <div id="chk">
        <form id="checkForm" action ="duplicate_check_id.jsp" method="post">
            <input type="text" name="idinput" id="userId" maxlength = "12">
            <input type="submit" value="중복확인"/>
            <input type="hidden" name = "r_id_check" value="false">
        </form>
        <div id="msg"></div>
        <br>
        <input id="cancelBtn" type="button" value="완료" onclick="btn_close()"><br>
    </div>
</div>
</body>
</html>