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
	String fnq_type = request.getParameter("fnq_type");
	String fnq_title = request.getParameter("fnq_title");
	String fnq_con = request.getParameter("fnq_con");
	
	Fnq fnq = new Fnq(u_id,fnq_type,fnq_title,fnq_con);
	fnq.setFnq_time(new java.util.Date());
	try {
	Connection conn = ConnectionProvider.getConnection(); 

	
	FnqDao dao = new FnqDao();
	dao.insert(conn, fnq);
}catch(SQLException e){
	
}
response.sendRedirect("../fnq_complete.jsp");
%>
</body>
</html>