<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String u_id = (String)session.getAttribute("LOGIN");
	int p_no = Integer.parseInt(request.getParameter("p_no"));
	
	  Connection conn = ConnectionProvider.getConnection();
		try{
			ProductDao dao = new ProductDao();
			//list=dao.selectLike(conn, keyField, keyWord);

			dao.deleteById(conn, p_no);
			
 		}catch(SQLException e){}


%>
<script type="text/javascript">
	alert("삭제했습니다!");
	location.href="../product_manage.jsp";

</script>

</body>
</html>