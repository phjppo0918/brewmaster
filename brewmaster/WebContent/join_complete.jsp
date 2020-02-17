<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*,java.util.*" %>
<%@ page import="java.io.PrintWriter" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BREW MASTER</title>
<link href="css_all/main_layout.css?var=1" rel="stylesheet" type="text/css" />
<link href="css_all/join_complete.css?var=1" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrap">
  <div id="head">
    <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
  
  <div id="page_main">
  <div class="login_main">
    <div class="login_header">회원가입완료</div>
   
    <!-- login_header-->   
    <div id="join_main">
       <h2 align="center">&nbsp;</h2>
       <h1 align="center">환영합니다!</h1>
       <h1>
       
     </h1>
     
        <div align="center">
        <%
        	request.setCharacterEncoding("utf-8");
        	String u_name = request.getParameter("u_name");
        	String u_id= request.getParameter("u_id"); 	
        %>
          <h2><span id="join_complete_font_color"><%=u_name %></span>님, 회원가입을 축하합니다. </h2>
        </div>
        <h2 align="center"></h2>
        <div align="center">
          <h2>Brew Master의 새로운 아이디는 <span id="join_complete_font_color"><%=u_id %></span> 입니다. </h2>
        </div><!-- 가운데 정렬--> 
        <form action="main.jsp"method="post">
      <p>&nbsp;</p>
      <p></p>
        
    
   <div id="join_footer">
         <input name="join_start_button" type="submit"  id="join_start_button" value="시작하기" />
      
</div>    <!-- join_footer--> 
</form>
  </div><!-- join_main-->
    
  </div><!-- login_main-->
</div><!-- page_main-->
  
  </div><!--body -->
  <div id="foot">
   <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  
  </div><!--foot -->
  
  
  
  
</div><!--wrap -->
</body>
</html>