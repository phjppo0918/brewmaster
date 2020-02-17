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
<link href="css_all/p_enroll_complete.css" rel="stylesheet" type="text/css" />
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
	    	상품등록이 완료되었습니다.
	  </div><!--p_complete_header -->
	  
	  <div id="p_complete_main">
	    <div id="p_button1">
	      <a href="product_manage.jsp">
	      	<img src="images/p_enroll_complete_images/enrolled_product_view.png" width="120" height="40"/>
	      </a>
	    </div><!--p_button -->
	    
	    <div id="p_button2">
	      <a href="product_enroll.jsp">
	      	<img src="images/p_enroll_complete_images/another_product_enroll.png" width="120" height="40"/>
	      </a>
	    </div><!--p_button -->
	  </div><!--p_complete_main -->
</div><!--p_complete_wrap -->

  
  </div><!--body -->
  <div id="foot">
  
  <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
  
  
  
</div><!--wrap -->
</body>
</html>