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
 	String u_id = (String) session.getAttribute("LOGIN");
 	int p_no = Integer.parseInt(request.getParameter("p_no"));
 	int ck_item = -2;
 	Mark mk = null;
 	Product pro = null;
 	Connection conn = ConnectionProvider.getConnection();
 	
 	// User user = new User(id,pw,u_name,u_ph,d,u_email);

 	try {
 		MarkDao mdao = new MarkDao();
 		ProductDao pdao = new ProductDao();
 		ck_item = mdao.chackIn(conn, u_id, p_no);
 		if (ck_item == 1) {
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('이미 찜을 하셨어요!')");
 			script.println("history.back()");
 			script.println("</script>");
 		} else {

 			conn = ConnectionProvider.getConnection();
			pro = pdao.selectById(conn, p_no);
			
			conn = ConnectionProvider.getConnection();
			mk = new Mark(u_id, p_no, pro.getP_image(),pro.getP_name_kr(), pro.getP_price(), new java.util.Date());
 			mdao.insert(conn, mk);
 			
 			PrintWriter script1 = response.getWriter();
 			script1.println("<script>");
 			script1.println("alert('찜 내역에 등록하였습니다!')");
 			script1.println("history.back()");
 			script1.println("</script>");
 		}
 	} catch (SQLException e) {
 		e.printStackTrace();
 		out.print("error");
 	}
 	//String urlU_name = URLEncoder.encode(u_name,"utf-8");
 	//  response.sendRedirect("../join_complete.jsp?u_name="+urlU_name+"&u_id="+id);
 %>


</body>
</html>