<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	int fnq_no = Integer.parseInt(request.getParameter("fnq_no"));
	String fnq_ans = request.getParameter("fnq_ans");
	Fnq fnq = new Fnq(fnq_no,fnq_ans,new java.util.Date(),"yes");
	 Connection conn = ConnectionProvider.getConnection();
	try{
    	FnqDao dao = new FnqDao();
    	dao.updateAns(conn, fnq);
       	 PrintWriter script = response.getWriter();
	      script.println("<script>");
	      script.println("alert('답글을 성공적으로 달았습니다.')");
	      script.println("location.href='../fnq_manage_admin.jsp'");
	      script.println("</script>");
       }catch(SQLException e){
    	   
       }
	
	
%>
</body>
</html>