<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*,java.util.*" %>
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
	String sc = request.getParameter("sc");
	String keyword = request.getParameter("keyword");
	String urlKeyword = URLEncoder.encode(keyword,"utf-8");
	//sc가 null, keyword도 ""
	
	if(keyword==""){
		response.sendRedirect("../h_beer_accept.jsp");
	}else{
		if(sc==null){
			response.sendRedirect("../h_beer_manage_keyonly.jsp?keyword="+urlKeyword);
		}else{
			response.sendRedirect("../h_beer_manage_keyCon.jsp?target="+sc+"&keyword="+urlKeyword);
		}
	}
	
%>


</body>
</html>