<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	//String nation = request.getParameter("nation");
	String p_name = request.getParameter("p_name");
	String urlP_name = URLEncoder.encode(p_name,"utf-8");
	
	response.sendRedirect("../h_beer_contents_key.jsp?target="+urlP_name);
		
		
		
	
%>
</body>
</html>