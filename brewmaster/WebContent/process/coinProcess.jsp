<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*,java.util.*" %>
<%@ page import="java.io.PrintWriter, java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	int coin = Integer.parseInt(request.getParameter("fin_coin"));
	String way = request.getParameter("fin_way");
	String u_id = (String)session.getAttribute("LOGIN");

	int u_money_before=-1, u_money_after=-1, u_code=-1;
	User user = new User();
	Chh chh = null;
	Connection conn = ConnectionProvider.getConnection(); 
	try{
	
	UserDao dao = new UserDao(); //user
	
	user = dao.searchU_money(conn, u_id);
		
	u_money_before = user.getU_money();
	u_money_after = u_money_before+coin;
		
	conn = ConnectionProvider.getConnection(); 
	dao.chargeMoney(conn, u_id, u_money_after);

	ChhDao cdao = new ChhDao();
	u_id = user.getU_id();
	conn = ConnectionProvider.getConnection(); 
	chh = new Chh(way, coin,
			new java.util.Date(), u_id);
	cdao.insert(conn, chh); 
	
	}catch(SQLException e){}
 	response.sendRedirect("../coin_finish.jsp?u_money_before="+u_money_before+"&u_money_after="+u_money_after);
%>


충전 전 금액: <%=u_money_before %>
충전 후 금액: <%=u_money_after %>



</body>
</html>