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
 	//int amount = Integer.parseInt(request.getParameter("amount"));
 	//int p_no = Integer.parseInt(request.getParameter("p_no"));
 	int total_coin = Integer.parseInt(request.getParameter("total_coin"));
 	int u_coin = Integer.parseInt(request.getParameter("u_coin"));
 	String input_address = request.getParameter("input_address");
 	String input_road_address = request.getParameter("input_road_address");
 	String sample4_jibunAddress = request.getParameter("sample4_jibunAddress");
 	String input_detailAddress = request.getParameter("input_detailAddress");
 	String order_request = request.getParameter("order_request");
 	
 	Product pro = null;
   	User user = null;
   	Purchase pur = null;
   	Chh chh = null;
   	
   	int p_no = -1;
   	int amount = 0;
   	int p_price = 0;
   	
   	Connection conn = null;
   	
   	
 	/* hBeer.setH_beer_time(new java.util.Date()); */
 	 Integer pCount=(Integer)session.getAttribute("pCount");

 	if(pCount==null){
 		
  		  pCount = new Integer(0);
  		  
  	} 
 	
 	Cart cart = null;
 		//ArrayList<Cart> cart = //(ArrayList)session.getAttribute("cartList");
	for(int i=1; i<= pCount.intValue(); i++) {
	 
		if((Cart)session.getAttribute("p" + i)==null){
		   	continue;
		}
		   	
		cart = (Cart)session.getAttribute("p" + i);
		   	
   		p_no = cart.getP_no();
   		amount = cart.getAmount();
   		p_price = cart.getP_price();
   
   		pur = new Purchase(p_no,amount,p_price*amount,u_id,input_address,input_road_address,
   				sample4_jibunAddress,input_detailAddress,order_request);
   		pur.setInvoice("415983697673");
   		pur.setPur_time(new java.util.Date());
   		 
   		chh = new Chh("제품구매",(p_price*amount*(-1)),new java.util.Date(),u_id);
   		
   		
   		try {
   			    		
    		ProductDao pdao = new ProductDao();
			UserDao udao = new UserDao();
			PurchaseDao dao = new PurchaseDao();
			ChhDao chdao = new ChhDao();

			conn = ConnectionProvider.getConnection();
			dao.insert(conn, pur);
			
			conn = ConnectionProvider.getConnection();
	 		chdao.insert(conn, chh);
			
			conn = ConnectionProvider.getConnection();
	 		udao.chargeMoney(conn, u_id, u_coin);

	 		conn = ConnectionProvider.getConnection();
	 		pdao.upScore(conn, p_no, amount);
	 		
   		}catch (SQLException e) {
   	 		e.printStackTrace();
   	 		out.print("error");
   	 	}
	}
	 for(int i=1; i<= pCount.intValue(); i++) {
	 		session.removeAttribute("p"+i);
	 	}
	 		session.removeAttribute("cartList");
 	response.sendRedirect("../purchase_complete.jsp");
 	/*   String urlU_name = URLEncoder.encode(u_name,"utf-8");
 	  response.sendRedirect("../join_complete.jsp?u_name="+urlU_name+"&u_id="+id); */
 	  
 
 	%>
 %>


</body>
</html>