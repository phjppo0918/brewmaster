<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/htaml; charset=utf-8" />
<title>BREW MASTER</title>
<link href="css_all/id_search_complete.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrap">
  <div id="head">
   <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
	<div id="p_complete_wrap">
		<div id="p_complete_header">
		<%
			request.setCharacterEncoding("utf-8");
			String u_id = request.getParameter("u_id");
		%>
			<p>회원님의 아이디는 </p>
			<p><%=u_id %> 입니다 </p>
		</div><!--p_complete_header -->
	  
  	<div id="p_complete_main">
		<div id="p_button1">
        	<input type="button"  id="complete" value="로그인하기" onclick="location.href='login.jsp'"/>
    	</div><!--p_button --><!--p_button -->
    	
    	<div id="p_button2">
        	<input type="button"  id="complete" value="비밀번호 찾기" onclick="location.href='searchPW.jsp'"/>
    	</div><!--p_button --><!--p_button -->
  	</div><!--p_complete_main -->
</div><!--p_complete_wrap -->

  
  </div><!--body -->
  <div id="foot">
  
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
  
  
  
</div><!--wrap -->
</body>
</html>