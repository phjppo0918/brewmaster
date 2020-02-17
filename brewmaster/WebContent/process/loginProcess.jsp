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
<title>Insert title here</title>
</head>
<body>
<%
	String u_id  = request.getParameter("u_id");
	String u_pw = request.getParameter("u_pw");
	//int coin=0;
	Connection conn = ConnectionProvider.getConnection();
	boolean login = false;
	try{
		UserDao dao = new UserDao();
		login=dao.checkPassword(conn, u_id, u_pw);
		//conn = ConnectionProvider.getConnection();
		//coin = dao.bringCoin(conn, u_id);
		
	}catch(SQLException e){}
	if(login){
		session.setAttribute("LOGIN", u_id);
		//session.setAttribute("UCOIN", coin);
		response.sendRedirect("../main.jsp"); // 관리자 페이지
		
%>                 
                  <h2>로그인에 성공하였습니다.</h2>
<% } else { %>
<script>
	alert("로그인에 실패하였습니다.");
	history.go(-1);
</script> 
<%	 } %>
</body>
</html>