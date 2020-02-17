<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	String nation = request.getParameter("nation");
	String p_name = request.getParameter("p_name");
	String urlP_name = URLEncoder.encode(p_name,"utf-8");
	
	if(nation.equals("all")){
		if(p_name==""){
			response.sendRedirect("../wine_content_all.jsp");
		}else{
			response.sendRedirect("../wine_content_all_key.jsp?target="+urlP_name);
		}
		
		
	}else{
		if(p_name==""){
			response.sendRedirect("../wine_content_detail.jsp?nation="+nation);
		}else{
			response.sendRedirect("../wine_content_detail_key.jsp?nation="+nation+"&target="+urlP_name);
		}
	}
%>
</body>
</html>