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
	int p_no = Integer.parseInt(request.getParameter("h_beer_no"));
	int amount = Integer.parseInt(request.getParameter("amount"));
	if(u_id==null){
		%>
		<script type="text/javascript">
			alert('로그인 후 이용 가능합니다');
			location.href='../login.jsp';
		</script>
		<% 
	} 
	
%>
<script type="text/javascript"> 
		location.href = "../order_purchase_hbeer.jsp?h_beer_no="+<%=p_no%>+"&amount="+<%=amount%>;		
</script>
</body>
</html>