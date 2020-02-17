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
	String u_id = (String)session.getAttribute("LOGIN");
	int amount = Integer.parseInt(request.getParameter("amount"));
	int h_beer_no = Integer.parseInt(request.getParameter("h_beer_no"));
	int total_coin = Integer.parseInt(request.getParameter("total_coin"));
	int u_coin = Integer.parseInt(request.getParameter("u_coin"));
	String input_address = request.getParameter("input_address");
	String input_road_address = request.getParameter("input_road_address");
	String sample4_jibunAddress = request.getParameter("sample4_jibunAddress");
	String input_detailAddress = request.getParameter("input_detailAddress");
	String order_request = request.getParameter("order_request");
	HBeer hb = null;
  	User user = null;
  
	/* hBeer.setH_beer_time(new java.util.Date()); */
	   
	Connection conn = ConnectionProvider.getConnection();
	Purchase pur = new Purchase(h_beer_no,amount,total_coin,u_id,input_address,input_road_address,
			sample4_jibunAddress,input_detailAddress,order_request);
	pur.setPur_time(new java.util.Date());
	Chh chh = new Chh("하우스맥주신청",total_coin*(-1),new java.util.Date(),u_id);
	
	   /* User user = new User(id,pw,u_name,u_ph,d,u_email); */
	  
	  try {
		  HBeerDao hdao = new HBeerDao();
			UserDao udao = new UserDao();
		  PurchaseDao dao = new PurchaseDao(); 
		  ChhDao chdao = new ChhDao();
		  
	       dao.insert(conn, pur); 
	       
	       conn = ConnectionProvider.getConnection();
	       chdao.insert(conn, chh);
	       
	       conn = ConnectionProvider.getConnection();
	       udao.chargeMoney(conn, u_id, u_coin);
	       
	       conn = ConnectionProvider.getConnection();
	       hb = hdao.selectById(conn, h_beer_no);
	       
	       conn = ConnectionProvider.getConnection();
	       user = udao.selectById(conn, hb.getH_beer_maker());
	       
	   } catch(SQLException e){
	      e.printStackTrace();
	      out.print("error");
	   }
	   
	  MailSend ms = new MailSend();
	  
	  ms.MailSendHB(user.getU_email(), h_beer_no, hb.getH_beer_name(), amount, u_id, user.getU_ph(), input_address, input_road_address, sample4_jibunAddress, input_detailAddress, order_request);

	  
	  
	  response.sendRedirect("../purchase_complete.jsp");
	/*   String urlU_name = URLEncoder.encode(u_name,"utf-8");
	  response.sendRedirect("../join_complete.jsp?u_name="+urlU_name+"&u_id="+id); */
	 
	
%>


</body>
</html>