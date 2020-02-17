<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*,java.util.*" %>
<%@ page import="java.io.PrintWriter" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BREW MASTER</title>
<script type="text/javascript">
</script>
<link href="css_all/id_check.css" rel="stylesheet" type="text/css" />
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	String u_id = request.getParameter("ck_id");
	Connection conn = ConnectionProvider.getConnection(); 
	
	int k=0;
	try {
		
		UserDao dao = new UserDao();
		k = dao.ch_id(conn, u_id);
		
	} catch(SQLException e){
		e.printStackTrace();
		
	}

%>
<div id="res">
</div>

<script type="text/javascript">
//사용하기 클릭 시 부모창으로 값 전달 
function sendCheckValue(){
	 var fin_id = "<%=u_id%>";
	// 중복체크 결과인 idCheck 값을 전달한다.
	window.opener.document.getElementById("ck_ok_hid").value ="cked";
	// 회원가입 화면의 ID입력란에 값을 전달
	window.opener.document.getElementById("u_id").value = fin_id;
	
	if (opener != null) {
    	opener.chkForm = null;
    	self.close();
	} 
	window.close();
	
}
function jungbok(){
	if(<%=k%>==1){
		alert('중복된 값입니다! 다른 아이디를 이용해주세요');
		window.close();
	}else{
		document.getElementById('res').innerHTML = '<div id="id_check_wrap">'+
		  '<div id="id_check_header">'+
		  '<img src="images/idcheck_images/idcheck_popup.png" width="550px" height="40px" /> </div>'+
		  '<div id="id_check_main">'+
		   '<center><p>사용 가능한 아이디입니다.</p></center>'+
		    '<div id="id_check_button">'+
		      '<div id="id_use" onclick="sendCheckValue()"><img src="images/idcheck_images/idcheck_use.png" width="70px" height="25px" /></div>'+
		    '</div>'+
		  '</div>'+ 
		'</div>';
	}	
	
}
jungbok();


	
</script>





</body>
</html>