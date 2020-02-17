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
	   String id = request.getParameter("u_id");
	   String pw = request.getParameter("u_pw");
	   String pw_ck = request.getParameter("u_pw_ck");
	   String u_name = request.getParameter("u_name");
	   String u_ph = request.getParameter("u_ph1")+"-"+
	         request.getParameter("u_ph2")+"-"+
	         request.getParameter("u_ph3");
	   String u_birth = request.getParameter("u_year")+"-"+
	         request.getParameter("u_month")+"-"+
	         request.getParameter("u_day");
	   java.sql.Date d = java.sql.Date.valueOf(u_birth);
	   String u_email = request.getParameter("u_email_1")+"@"+
	         request.getParameter("u_email_2");
	   if(!(pw.equals(pw_ck))){
	      PrintWriter script = response.getWriter();
	      script.println("<script>");
	      script.println("alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.')");
	      script.println("history.back()");
	      script.println("</script>");

	   }
	   Connection conn = ConnectionProvider.getConnection(); 
	   User user = new User(id,pw,u_name,u_ph,d,u_email);
	  
	  try {
	      UserDao dao = new UserDao();
	      dao.insert(conn, user);
	   } catch(SQLException e){
	      e.printStackTrace();
	      out.print("error");
	   }
	  String urlU_name = URLEncoder.encode(u_name,"utf-8");
	  response.sendRedirect("../join_complete.jsp?u_name="+urlU_name+"&u_id="+id);
	 
	
%>


</body>
</html>