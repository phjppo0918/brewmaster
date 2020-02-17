<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="css_all/user_fnq.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#fnq_submit{ 
   float: left;
   width: 180px;  
   height: 65px;
   margin-left: 330px;
   margin-top: 30px;
   border: none;
   background-color:#fff;
   background-image: url(images/user_fnq_images/qna_btn.png);
   background-repeat: no-repeat;   
   background-size:contain;      
}
</style>

</head>
<body>
<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
	<div id="user_fnq_wrap">
	  <div id="user_fnq_header">
	  	1:1문의하기 
	  </div><!--user_fnq_header -->
	  <div id="user_fnq_main">
	    <form action="process/userFnqProcess.jsp" method="post">
	  	  <div id="align">문의유형</div><!--align -->
	  	  <p></p>
	      <select name="fnq_type"id="fnq_type">
	    	<option value="상품문의">상품문의</option>
	        <option value="배송문의"> 배송문의</option>
	        <option value="환불문의"> 환불문의</option>
  	      </select>
	      <p></p>
	      <div id="align">문의제목</div><!--align -->
	      <p></p>
	      <input type="text" name="fnq_title" id="fnq_title"/>
	      <p></p>
	      <div id="align">문의내용<p></p></div><!--align -->
	      <textarea name="fnq_con" id="fnq_con" cols="70" rows="20">
	      </textarea>
	      <input type="submit" id="fnq_submit" value=""/>
  	    </form>
	  </div><!--user_fnq_main -->
	</div><!--user_fnq_wrap -->
  </div><!--body -->
  <div id="foot">
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
</div><!--wrap -->
</body>
</html>