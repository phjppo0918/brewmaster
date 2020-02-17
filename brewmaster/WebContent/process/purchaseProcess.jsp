<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*,java.util.*" %> 
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
	int p_no = Integer.parseInt(request.getParameter("p_no"));
	int amount = Integer.parseInt(request.getParameter("amount"));
	if(u_id==null){
		%>
		<script type="text/javascript">
			alert('로그인 후 이용 가능합니다');
			location.href='../login.jsp';
		</script>
		<% 
	} 
	Integer pCount=(Integer)session.getAttribute("pCount");
	
	if(pCount==null)
	{
	 pCount = new Integer(0);
	}  
	
	//ArrayList<Cart> cartList = new ArrayList<Cart>();
	for(int i=1; i<= pCount.intValue(); i++) {
		if(session.getAttribute("p" + i)!=null){
			%>
				<script type="text/javascript">
					var ch_firm = confirm("장바구니에 상품이 있습니다. 같이 계산할까요??");
					
					if(ch_firm){
						alert("해당 상품을 장바구니에 넣었습니다!");
						location.href = "putcartProcess.jsp?p_no="+<%=p_no%>+"&amount="+<%=amount%>+"&goc=gocart";
						
					}else{
						sessionStorage.removeItem("cartList");
						location.href = "../order_purchase_solo.jsp?p_no="+<%=p_no%>+"&amount="+<%=amount%>;
					}
				</script>
			
			<%
			//cartList.add((Cart)session.getAttribute("p" + i));
			break; 
		}
		//books += cart.getBookId()+" : "+cart.getAmount()+"\\n";
	}
	
	////response.sendRedirect("../purchase.jsp");
	//session.setAttribute("cartList", cartList);
%>
<script type="text/javascript"> 
		location.href = "../order_purchase_solo.jsp?p_no="+<%=p_no%>+"&amount="+<%=amount%>;		
</script>
</body>
</html>