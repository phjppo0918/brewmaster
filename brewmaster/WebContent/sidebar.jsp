<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>사이드</title>
<style type="text/css">
body span {
    display: block; 
}
#side_bar {
	float: left;
	height: 1750px;
	width: 200px;
}
#side_bag {
	width: 200px;
	position: fixed;
	border:1px;
}
.bag_con {
	clear: both;
	float: left;
	height: 30px;
	width: 200px;
}
.bag_con_txt {
	font-size: 13pt;
	 overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
	height: 30px;
	width: 160px;
	float: left;
}
.bag_con_del {
	margin-left: 10px;
	height: 30px;
	width: 30px;
	float: left;
}
.ps_btn{
		height: 30px;
	width: 200px;
	float: left;
	
}
</style>

</head>

<body>

	<%  
	  	String u_id = (String)session.getAttribute("LOGIN");		 
		ArrayList<Cart> cart = (ArrayList)session.getAttribute("cartList");
    	//books += cart.getBookId()+" : "+cart.getAmount()+"\\n";
	%>
	
	  <c:set var="u_id" value="<%=u_id%>"/> 
	  <c:set var="list" value="<%=cart%>"/> 
	<div id="side_bag">
   <div class="ps_btn">
   <img src="images/sidebar_images/banner_mycart_title.png"/>
   
    </div><!--ps_btn -->
     <c:forEach var="cart_for" items="${list}">
    <div class="bag_con">
      <div class="bag_con_txt">
     	${cart_for.p_name}
      </div><!--bag_con_txt -->
  		<div class="bag_con_del">
       <img src="images/sidebar_images/banner_cancel_btn.png" onclick="location.href='process/cartDelete.jsp?p_no=${cart_for.p_no}&amount=${cart_for.amount}'" />
        </div><!--bag_con_del -->
    </div><!--bag_con -->
   <c:set var="p_name" value="${cart_for.p_name}"/>
      </c:forEach>
     
    <div class="ps_btn">
  	 <img src="images/sidebar_images/banner_purchase_btn.png" onclick="pur();"/>
    
    </div><!--ps_btn -->
    
      </div><!--side_bag -->
<script type="text/javascript">
function pur(){
	  var position = '${p_name}'; 
	  var u_id = '${u_id}';
	  if(u_id==''){
		  alert('로그인을 해주세요!');
		  location.href='login.jsp';
	  }
	  else if(position==''){
		alert('장바구니가 비었습니다!');
	}
	else{
		location.href='order_purchase_cart.jsp';
	}
	
}
</script>

</body>
</html>
