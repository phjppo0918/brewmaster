<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*,java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 Integer pCount=(Integer)session.getAttribute("pCount");

if(pCount==null)
 {
  pCount = new Integer(0);
 }     
 int p_no = Integer.parseInt(request.getParameter("p_no"));
 int amount = Integer.parseInt(request.getParameter("amount")); 
 String go_cart = request.getParameter("goc");
 Connection conn = ConnectionProvider.getConnection();
 	Product pro = null;
 	String  p_name = "";
 	int p_price = 0;
	try{
		ProductDao dao = new ProductDao();
		pro = dao.selectById(conn, p_no);
		p_name = pro.getP_name_kr();
		p_price = pro.getP_price();
	}catch(SQLException e){}
 
      Cart cart = new Cart(p_no, p_name, p_price, amount);
      pCount = new Integer(pCount.intValue() +1);
   	  session.setAttribute("p"+pCount, cart);
      session.setAttribute("pCount", pCount);
 

  
		//String books = "";
		//Cart cart = null;
		ArrayList<Cart> cartList = new ArrayList<Cart>();
	    for(int i=1; i<= pCount.intValue(); i++) {
	    	if(session.getAttribute("p" + i)!=null){
	    		cartList.add((Cart)session.getAttribute("p" + i));
	    	}
	    	//books += cart.getBookId()+" : "+cart.getAmount()+"\\n";
	   }
	    session.setAttribute("cartList", cartList);
	    
	    if(go_cart!=null){
%> 
<script type="text/javascript">
location.href = document.referrer; 
	location.href="../cart.jsp";
</script>
<%}else{ %>
<script type="text/javascript">
	location.href = document.referrer; 
	history.back();
</script>
<%} %>
<%--   
<b><center> 당신이 지금까지 선택한 책들의 목록입니다</center></b>
<br><br>
<hr><br><br>
<%   
	String books = "";
	Cart cart = null;
    for(int i=1; i<= bookCount.intValue(); i++) {
    	cart = (Cart)session.getAttribute("book" + i);
    	books += cart.getBookId()+" : "+cart.getAmount()+"\\n";
   }
%>
<hr>
<a href= "select.jsp"> 처음으로 돌아가기 </a>&nbsp; 
<a href= "cartdelete.jsp"> 카트 비우기 </a>
<br><br>
<script>
	var input = confirm('<%=books%>'+'구매하시겠습니까?');
	if (input) {
		location.href="cartpurchase.jsp";
	}
</script>   --%>   
</body>
</html>





