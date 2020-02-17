<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*,java.util.*" %>
<%@ page import="java.io.PrintWriter, java.net.URLEncoder" %>
<%@ page import="java.io.*,com.oreilly.servlet.*,com.oreilly.servlet.multipart.*" %>
<%@ page import="web.mail.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	
	String u_id=request.getParameter("u_id");
	String u_name=request.getParameter("u_name");
	String u_email=request.getParameter("u_email");
	String u_new_pw = new String();
	Connection conn = ConnectionProvider.getConnection();
	MailSend ms = new MailSend();
	try{
		UserDao dao = new UserDao();
		u_new_pw = dao.searchUPW(conn, u_id, u_name, u_email);
	 	
	}catch(SQLException e){
		
	}
	
	if(u_new_pw.equals("")){
		 PrintWriter script1 = response.getWriter();
	      script1.println("<script>");
	      script1.println("alert('해당 아이디/이름에 존재하는 계정이 없습니다')");
	      script1.println("history.go(-1)");
	      script1.println("</script>");
	 }else {
		 out.print(u_new_pw);
		 ms.MailSendPW(u_email, u_new_pw);
		 response.sendRedirect("../pw_search_complete.jsp?u_email="+u_email); 
	 }
%>  	
 

</body>
</html>