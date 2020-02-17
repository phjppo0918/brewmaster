<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="dao.*,util.*,model.*,java.sql.*,java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
 		 Integer pCount=(Integer)session.getAttribute("pCount");

 		if(pCount==null)
 		 {
 		  pCount = new Integer(0);
 		 } 
 			request.setCharacterEncoding("utf-8");
 			int p_no = Integer.parseInt(request.getParameter("p_no"));
 			int amount = Integer.parseInt(request.getParameter("amount"));
	 		 Cart cart = null;
			//ArrayList<Cart> cart = (ArrayList)session.getAttribute("cartList");
		   	//books += cart.getBookId()+" : "+cart.getAmount()+"\\n";
		   	 for(int i=1; i<= pCount.intValue(); i++) {
		   		 if((Cart)session.getAttribute("p" + i)==null){
		   			continue;
		   		 }
		   		cart = (Cart)session.getAttribute("p" + i);
	    		if(cart.getP_no()==p_no){
	    			if(cart.getAmount()==amount){
	    				  session.removeAttribute("p" + i);
	    				  ArrayList<Cart> cartList = new ArrayList<Cart>();
	    				    for(int j=1; j<= pCount.intValue(); j++) {
	    				    	if(session.getAttribute("p" + j)!=null){
	    				    		cartList.add((Cart)session.getAttribute("p" + j));
	    				    	}
	    				    	//books += cart.getBookId()+" : "+cart.getAmount()+"\\n";
	    				   }
	    				    session.setAttribute("cartList", cartList);
	    				  PrintWriter script = response.getWriter();
	    			      script.println("<script>");
	    			      script.println("alert('삭제가 완료되었습니다.');");
	    			      script.println("location.href = document.referrer; ");
	    			      script.println("history.back();");
	    			      script.println("</script>");
	    			      break;
	    			}
	    		}
	   		}
		   
		%>

	<script type="text/javascript">
	location.href = document.referrer; 
	history.back();
</script>
</body>
</html>