<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*,java.util.*" %>
<%@ page import="java.io.*,com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String u_id = (String)session.getAttribute("LOGIN");
	String u_pw = request.getParameter("u_pw");
	String u_ph = request.getParameter("u_ph1")+"-"+
	      request.getParameter("u_ph2")+"-"+
	      request.getParameter("u_ph3");
	String u_email = request.getParameter("u_email_1")+"@"+
	      request.getParameter("u_email_2");
	Connection conn = ConnectionProvider.getConnection(); 
	try {
	   UserDao dao = new UserDao();
	   dao.updateUserInfo(conn, u_id, u_pw, u_ph, u_email);
	} catch(SQLException e){
	   e.printStackTrace();
	   out.print("error");
	}
	response.sendRedirect("../modify_user_complete.jsp");

	
%>
 

</body>
</html>