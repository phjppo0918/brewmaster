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
	String u_id = (String)session.getAttribute("LOGIN");
	int amount = Integer.parseInt(request.getParameter("amount"));
	int p_no = Integer.parseInt(request.getParameter("p_no"));
	int total_coin = Integer.parseInt(request.getParameter("total_coin"));
	int u_coin = Integer.parseInt(request.getParameter("u_coin"));
	String input_address = request.getParameter("input_address");
	String input_road_address = request.getParameter("input_road_address");
	String sample4_jibunAddress = request.getParameter("sample4_jibunAddress");
	String input_detailAddress = request.getParameter("input_detailAddress");
	String order_request = request.getParameter("order_request");
	Product pro = null;
  	User user = null;
  
	/* hBeer.setH_beer_time(new java.util.Date()); */
	   
	Connection conn = ConnectionProvider.getConnection();
	Purchase pur = new Purchase(p_no,amount,total_coin,u_id,input_address,input_road_address,
			sample4_jibunAddress,input_detailAddress,order_request);
	pur.setPur_time(new java.util.Date());
	Chh chh = new Chh("제품구매",total_coin*(-1),new java.util.Date(),u_id);
	
	   /* User user = new User(id,pw,u_name,u_ph,d,u_email); */
	  
	  try {
		  ProductDao pdao = new ProductDao();
			UserDao udao = new UserDao();
		  PurchaseDao dao = new PurchaseDao(); 
		  ChhDao chdao = new ChhDao();
		  
	       dao.insert(conn, pur); 
	       
	       conn = ConnectionProvider.getConnection();
	       chdao.insert(conn, chh);
	       
	       conn = ConnectionProvider.getConnection();
	       udao.chargeMoney(conn, u_id, u_coin);
	       
	       conn = ConnectionProvider.getConnection();
	       pdao.upScore(conn, p_no, amount);
	       
	       
	   } catch(SQLException e){
	      e.printStackTrace();
	      out.print("error");
	   }
	   
	  response.sendRedirect("../purchase_complete.jsp");
	/*   String urlU_name = URLEncoder.encode(u_name,"utf-8");
	  response.sendRedirect("../join_complete.jsp?u_name="+urlU_name+"&u_id="+id); */
	 
	
%>


</body>
</html>