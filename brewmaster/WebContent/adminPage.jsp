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
<link href="css_all/admin.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrap">
  <div id="head">
   <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
  
	  <div id="admin_wrap">
	  <div id="admin_header">관리자페이지</div><!-- admin_header -->
	  <div id="admin_main">
	    <div id="admin_action1"><a href="product_enroll.jsp">
	      <img src="images/admin_images/product_enroll.png" width="230" height="170" /></a>
	    </div><!--admin_action -->
	    
	    <div id="admin_action1"><a href="product_manage.jsp">
	      <img src="images/admin_images/product_manage.png" width="230" height="170" /></a>
	    </div><!--admin_action -->
	    
	    <div id="admin_action1"><a href="h_beer_accept.jsp">
	      <img src="images/admin_images/housebeer_permit.png" width="230" height="170" /></a>
	    </div><!--admin_action -->
	    
	    <div id="admin_action2"><a href="user_manage.jsp">
	      <img src="images/admin_images/member_manage.png" width="230" height="170" /></a>
	    </div><!--admin_action -->
	 
		<div id="admin_action3"><a href="fnq_manage_admin.jsp">
		   <img src="images/admin_images/question_manage.png" width="230" height="170" /></a>
		</div><!--admin_action -->    
	  
	  </div><!--admin_main -->
	  
	</div><!--adminwrap -->
  
  </div><!--body -->
  <div id="foot">
  
   <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
  
  
  
</div><!--wrap -->
</body>
</html>