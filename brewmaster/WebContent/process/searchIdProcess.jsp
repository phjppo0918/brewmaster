<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*,java.util.*" %>
<%@ page import="java.io.PrintWriter, java.net.URLEncoder" %>
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

	String u_name=request.getParameter("u_name");
	String u_email=request.getParameter("u_email");
	String u_id = new String();
	Connection conn = ConnectionProvider.getConnection();
	try{
		UserDao dao = new UserDao();
		u_id = dao.searchUId(conn, u_name, u_email);
	 	
	}catch(SQLException e){
		
	}
	
	if(u_id.equals("")){
		 PrintWriter script1 = response.getWriter();
	      script1.println("<script>");
	      script1.println("alert('존재하는 아이디가 없습니다')");
	      script1.println("history.go(-1)");
	      script1.println("</script>");
	 }else {
			response.sendRedirect("../id_search_complete.jsp?u_id="+u_id); 
	 }
%>  	
   

</body>
</html>