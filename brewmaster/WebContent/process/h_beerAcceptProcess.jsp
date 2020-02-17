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
	  int h_beer_no = Integer.parseInt(request.getParameter("itemID"));
	  
	   Connection conn = ConnectionProvider.getConnection(); 
	  
	  try {
	     HBeerDao dao = new HBeerDao();
	     dao.updateAcc(conn,h_beer_no,"승인");
	   } catch(SQLException e){
	      e.printStackTrace();
	      out.print("error");
	   }
	 
	  response.sendRedirect("../h_beer_accept.jsp");
	 
	
%>


</body>
</html>