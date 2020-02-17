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
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<link href="css_all/cart.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#order_button{
	float: left;
	width: 180px;
	height: 65px;
	background-repeat: no-repeat;	
	border: none;
	background-size: contain;
	background-image: url(images/cart_images/buy_btn.png);
}
#delete_cart_button{
	float: left;
	width: 180px;
	height: 65px;
	margin-left: 10px;
	background-repeat: no-repeat;
	border: none;
	background-size: contain;
	background-image: url(images/cart_images/delete_cart.png);
}
#delete_button{
	
	width: 90px;
	height: 40px;
	background-image: url(images/cart_images/delete_button.png);	
	background-repeat: no-repeat;
	border: none;
	background-size: contain;
	margin-left: 10px;
}	
</style>
</head>
<body>
<div id="wrap">
  <div id="head">
    <jsp:include page="head.jsp"/>
  </div><!--head -->

  <div id="body">
  	<div id="cart_wrap">
  		<div id="cart_header">
    	  <div id="cart_title">
            <img src="images/cart_images/cart_title.png" width="170" height="65" /> 
          </div><!--cart_title -->
  	 	</div><!--cart_header -->
   <%
	  	String u_id = (String) session.getAttribute("LOGIN");
	  	ArrayList<Cart> cart = (ArrayList) session.getAttribute("cartList");
	  	//books += cart.getBookId()+" : "+cart.getAmount()+"\\n";
   %>
				  <c:set var="u_id" value="<%=u_id%>"/> 
				  <c:set var="list" value="<%=cart%>"/> 
  		<div id="cart_main">
  	      <table>
 		    <tr>   
		      <th>상품 아이디</th>
		      <th>상품이름</th>
		      <th>수량</th>
		      <th>총가격</th>
		      <th>삭제</th>
 		    </tr>
			 <c:forEach var="cart_for" items="${list}">
       	    <tr>     <%--for each문 시작 --%>
           	  <td>${cart_for.p_no}</td>
            	  <td>${cart_for.p_name}</td>
            	  <td>${cart_for.amount}</td>
            	  <td>${cart_for.p_price*cart_for.amount}</td>
			  <td>
			    <button type="button" name="delete_button" id="delete_button" value="삭제"  onclick="location.href='process/cartDelete.jsp?p_no=${cart_for.p_no}&amount=${cart_for.amount}'" />
		      </td>
            </tr>	<%--for each문 끝 --%> 
              <c:set var="p_name" value="${cart_for.p_name}"/>
				  </c:forEach>
            <tr>
              <td colspan="5" id="button_line"> 
                <div id="button">
                  <button type="button" id="order_button" value="" onclick="pur();"/>
		          <button type="button" id="delete_cart_button" value="" onclick="location.href='process/deleteCartAll.jsp'"/>
                </div><!--button -->
              </td>
           </tr>
	     </table>
       </div><!--cart_main -->
     </div><!--cart_wrap -->

  </div><!--body -->
  <div id="foot">
  
  
  </div><!--foot -->
  
  
  
  
</div><!--wrap -->
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