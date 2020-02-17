<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BREW MASTER</title>

<link href="css_all/coin.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<script src="js_all/coinJs.js"></script>
<style type="text/css">
#charge_button{
	width: 120px;
	height: 50px;
	padding: 0;
	border: none;
	
	background: none;
	background: url( "images/coinpage_images/go_pay.png" ) no-repeat;	
}
</style>
</head>
<body>
<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
	<div id="coinpage">
	  	<div id="coincharge_img">
	  	  <img src="images/coinpage_images/coin_charge_title.png" width="190" height="70" />
	    </div><!--coincharge_img -->
	
	  	<div id="coin_select">
	  	  <img src="images/coinpage_images/charge_coin.png" width="640" height="50" />
	  	</div><!--coin_select -->
	    
	    <div id="coin_contents">
	      <div class="coin10000">
	      	<img src="images/coinpage_images/coin1.png" id="coin1" width="140" height="230"
	      			onclick="ck_coin1(this)"/>
	      </div><!--coin10000 -->
	      
	      <div class="coin20000">
	      	<img src="images/coinpage_images/coin2.png" id="coin2" width="140" height="230" 
	      			onclick="ck_coin2(this)"/>
	      </div><!--coin20000 -->
	      
	      <div class="coin50000">
			<img src="images/coinpage_images/coin3.png" id="coin3" width="140" height="230"
					onclick="ck_coin3(this)" />
	      </div><!--coin50000 -->
	      <div class="coin100000">	
			<img src="images/coinpage_images/coin4.png" id="coin4" width="140" height="230"
					onclick="ck_coin4(this)" />
		  </div><!--coin100000 -->
	    
	    </div><!--coin_contents -->
	  
		  <div id="pay_option">
		  	<img src="images/coinpage_images/pay_option.png"  width="640" height="50" />
		  </div><!--pay_option -->
		  
		  <div id="pay_contents">
		    <div class="cash_pay">
		      <img src="images/coinpage_images/cash_pay.png" id="way_cash" width="180" height="180"
		    		  onclick="ck_pay1(this)" /> 
		    </div><!--cash_pay -->
		    
		    <div class="phone_pay">
		      <img src="images/coinpage_images/phone_pay.png" id="way_phone" width="180" height="180" 
		      		 onclick="ck_pay2(this)"/>
		    </div><!--phone_pay -->
		    
		    <div class="card_pay">
		      <img src="images/coinpage_images/card_pay.png" id="way_card" width="180" height="180"
		      		 onclick="ck_pay3(this)" /> 
		    </div><!--card_pay -->
		  	
		  </div><!--pay_contents -->
		  <form action="process/coinProcess.jsp" method="post" onsubmit="return fin_test();">
		  	<input type="hidden" id="fin_coin" name="fin_coin" value="0"/>
		  	<input type="hidden" id="fin_way" name="fin_way" value="0"/>
			<div id="payment">
				<input type="submit" id="charge_button" value=""/>
		      
			</div><!--payment -->
			</form>
	</div><!--coinpage -->	

  </div><!--body -->
  <div id="foot">
   <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  
  </div><!--foot -->
  
  
  
  
</div><!--wrap -->
</body>
</html>