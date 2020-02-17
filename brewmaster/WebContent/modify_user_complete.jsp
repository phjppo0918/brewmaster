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
<link href="css_all/modify_user_complete.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrap">
  <div id="head">
   <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
  <div id="modify_user_complete_wrap">
	  <div id="modify_user_complete_header">
	    	회원정보 수정이 완료되었습니다.
	  </div><!--p_complete_header -->
	  
	  <div id="modify_user_complete_main">
	    <div id="main_button">
	      <a href="main.jsp">
	      	<img src="images/modify_user_complete_images/mainpage_btn.png" width="100" height="40"/>
	      </a>
	    </div><!--main_button -->
	    
	    <div id="my_button">
	      <a href="myPage.jsp">
	      	<img src="images/modify_user_complete_images/mypage_btn.png" width="100" height="40"/>
	      </a>
	    </div><!--my_button -->
	  </div><!--modify_user_complete_main -->
</div><!--modify_user_complete_wrap -->

  
  </div><!--body -->
  <div id="foot">
   <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  
  </div><!--foot -->
  
  
  
  
</div><!--wrap -->
</body>
</html>