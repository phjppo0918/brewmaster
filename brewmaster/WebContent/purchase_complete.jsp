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
<link href="css_all/purchase_complete.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#mainpage_button {
	width: 100px;
	height: 40px;
	border: none;
	background-repeat: no-repeat;
	background-size: contain;
	margin-top: 10px;
	background-image: url(images/purchase_complete_images/mainpage_btn2.png);
	background-color: #fff;
}
#mypage_button {
	width:100px;
	height: 40px;		
	border: none;
	background-repeat: no-repeat;
	background-size: contain;
	margin-top: 10px;
	margin-left: 15px;
	background-image: url(images/purchase_complete_images/mypage_btn2.png);
	background-color: #fff;
}

</style>
</head>
<body>
<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
	<div id="purchase_complete_wrap">
	  <div id="purchase_complete_main">
  		<p><%=(String)session.getAttribute("LOGIN") %>님 상품이</p>
  		<p id="font_color">정상적으로 구매 완료되었습니다</p>
  		<p>BrewMaster를 이용해주셔서 감사합니다.</p><!--purchase_complete_main -->
	 </div><!--purchase_complete_main -->
	 <div id="purchase_complete_button">
	  <button type="button" id="mainpage_button" onclick="location.href='main.jsp'"/>
	  <button type="button" id="mypage_button" onclick="location.href='myPage.jsp'"/>
	 </div><!--purchase_complete_button -->
   </div><!--purchase_complete_wrap -->
</div><!--body -->
  <div id="foot">
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
</div><!--wrap -->
</body>
</html>