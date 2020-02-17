<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="css_all/mypage.css?var=1" rel="stylesheet" type="text/css"/>
<link href="css_all/main_layout.css?var=1" rel="stylesheet" type="text/css" />
<style type="text/css">

</style>
</head>
<body>
<div id="wrap">
  <div id="head">
	<jsp:include page="head.jsp" />
  </div><!--head -->
  <div id="body">
	<div id="mypage_wrap">
	  <div id="mypage_header">
	  	마이페이지
	  </div><!--mypage_header -->
	  
	  <div id="mypage_main">
		 <div class="mypage_action">
		   <a href="product_mywish.jsp">
		     <img src="images/mypage_images/mywish.png" width="230" height="170"/>
		   </a>
		 </div><!--mypage_action -->
		 
	     <div class="mypage_action">
	       <a href="purchase_list.jsp">
	         <img src="images/mypage_images/myorder.png" width="230" height="170"/>
	       </a>  
	     </div><!--mypage_action -->
	     
	     <div class="mypage_action">
	       <a href="fnq_manage_user.jsp">
	         <img src="images/mypage_images/myqna.png" width="230" height="170"/>
	       </a>  
	     </div><!--mypage_action -->
	     
	     <div class="mypage_action">
	       <a href="updateUser.jsp">
	         <img src="images/mypage_images/myinfo_revise.png" width="230" height="170"/>
	       </a>
	     </div><!--mypage_action -->
	     
	     <div class="mypage_action">
	       <a href="coin_charge.jsp">
	         <img src="images/mypage_images/coin_charge.png" width="230" height="170"/>
	       </a>  
	     </div><!--mypage_action_coin -->
		 
		 <div class="mypage_action">
		   <a href="charge_use_list.jsp">
		     <img src="images/mypage_images/mycoin.png" width="230" height="170"/>
		   </a> 
		 </div><!--mypage_action_coin -->      
     </div><!--mypage_main -->
   </div><!--mypage_wrap --> 


  </div><!--body -->
  <div id="foot">
  <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
  
  
  
</div><!--wrap -->
</body>
</html>