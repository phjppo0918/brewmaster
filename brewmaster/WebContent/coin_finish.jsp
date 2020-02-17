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
<style type="text/css">
#mypage_button{
	float: left;
	width: 100px;
	height: 40px;
	margin-left: 160px;
	margin-top: 20px;
	
	background-image: url(images/coin_finish_images/mainpage_btn.png);
	background-repeat: no-repeat;
	border: none;
	background-size:contain;
	
}
</style>
<link href="css_all/coin_finish.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrap">
  <div id="head">
    <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
	<div id="coin_finish_wrap">
	  <div id="finish_image">
	  	<img src="images/coinpage_images/charge_finish.png" width="390" height="390" />
	  </div><!--finish_image -->
  	  
  	  <div id="finish_main">
      	<div id="finish_text1">
    		충전이 완료되었습니다 !
    	</div><!--finish_text1 -->
    <%
    request.setCharacterEncoding("utf-8");
    String u_money_before = request.getParameter("u_money_before");
    String u_money_after = request.getParameter("u_money_after");
    //session.setAttribute("UCOIN", Integer.parseInt(u_money_after));
    %>
    	<div id="finish_text2">
      	  <p>기준코인:<%=u_money_before %> 코인 </p>
      	  <p>현재코인:<%=u_money_after %>코인 </p>
      	  
    	</div><!--finish_text2 -->
    
    	<input type="button" id= "mypage_button" value="" onclick="location.href='main.jsp'"/>
    	
    	</div><!--finish_main -->

	</div><!--coin_finish_wrap -->
  </div><!--body -->
  <div id="foot">
  
  <img src="images/foot_images/foot.png" width="1200px" height="300px" /> 
  </div><!--foot -->
  
  
  
  
</div><!--wrap -->
</body>
</html>