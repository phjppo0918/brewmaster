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
<link href="css_all/h_beer_detail.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#cart_button {
	width: 95px;
	height: 25px; 		
	border: none;
	background-repeat: no-repeat;
	background-size: contain;
	margin-top: 20px;
	margin-left: 30px;
	background-image: url(images/products_detail_images/purchase_btn.png);
}
#mywish_button{
	width:50px;
	height: 20px;		
	border: none;
	background-repeat: no-repeat;
	background-size: contain;
	background-image: url(images/products_detail_images/mywish_btn.png);
	line-height: 1px;
}
</style>
<script type="text/javascript">
	function purchase(pno){
		var pno1 = pno
		var amount = document.getElementById("count").value;
		location.href="process/purchaseHBProcess.jsp?h_beer_no="+pno1+"&amount="+amount;
	}
</script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	int h_beer_no = Integer.parseInt(request.getParameter("h_beer_no"));
	
	 Connection conn = ConnectionProvider.getConnection(); 
	   HBeer hb = null;
	  
	  try {
		  HBeerDao dao = new HBeerDao();
		  hb = dao.selectById(conn, h_beer_no);
	   } catch(SQLException e){
	      e.printStackTrace();
	      out.print("error");
	   }
	
%>
<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
      <div id="h_beer_detail_wrap">
  		<div id="product_main">
  		  <div id="product_image">
  			<img src="images/h_beer_images_user/<%=hb.getH_beer_image() %>" width="255" height="460"/>
  		  </div><!--product_image -->
  		  <div id="product_count">
 		 	수량<select name="count" id="count">
  		         <option value="1">1</option>
				 <option value="2">2</option>
				 <option value="3">3</option>
				 <option value="4">4</option>
				 <option value="5">5</option>
  			   </select>
  		  </div><!--product_count -->
          <div id="product_button">
            <button type="button" id="cart_button" value=""  onclick="purchase(<%=hb.getH_beer_no() %>)"/>
          </div><!--product_button -->
        </div><!--product_main -->
       
        <div id="inf">
          <div id="product_name_kr">
  		       <%=hb.getH_beer_name() %>
   		  </div><!--product_name -->
   	      <div id="product_name_en">
   			
   		  </div><!--product_name_en -->
 	      <div id="product_price">
  			 <%=hb.getH_beer_price() %>
   		  </div><!--product_price -->
   		  <div id="product_wish_button">
  		    <button type="button" id="mywish_button" value="" onclick="location.href=''" />
  		  </div><!--product_wish_button -->
   	      <div id="product_salesman">
   	        <div id="salesman_font">
   	       		 판매자
   	        </div><!--salesman_font -->
            <div id="salesman_content">
   			  <%=hb.getH_beer_maker() %>
   	        </div><!--salesman_content -->
  	      </div><!--product_salesman-->
          <div id="product_sugar">
            <div id="sugar_font">
   				당도 
   			</div><!--sugar_font -->
   			<div id="sugar_image">
   			  <img src="images/products_detail_images/sweet<%=hb.getH_beer_suger()%>.png" width="230" height="10" /> 
   			</div><!--sugar_image -->
  		  </div><!--product_sugar -->
   		  <div id="product_carbonic">
  		    <div id="carbonic_font">
   				탄산강도
   			</div><!--carbonic_font -->
  			<div id="carbonic_image"> 
  			  <img src="images/products_detail_images/sparkling<%=hb.getH_beer_carbonic()%>.png" width="230" height="10" /> 
  		    </div><!--carbonic_image -->
  		  </div><!--product_carbonic -->
   		  <div id="product_alchol">
   		    <div id="alchol_font">
  			   도수
      		</div><!--alchol_font -->
   			<div id="alchol_content">
   				<%=hb.getH_beer_alchol()%>%
   		    </div><!--alchol__content -->
          </div><!--product_alchol -->
   	      <div id="product_detail">
   		    <div id="product_detail_font">
   				주류정보
   			</div><!--product_detail_font -->
   			<div id="product_detail_content">
 				  <%=hb.getH_beer_detail()%>
  	   	    </div><!--product_detail_content -->
   	      </div><!--product_detail -->
   
		  <div id="product_explain">
            <div id="explain_font">
     			주류설명
   	        </div><!--explain_font -->
   	        <div id="explain_content">
 				 <%=hb.getH_beer_explain()%>
   			</div><!--explain_content -->
          </div><!--product_explain -->
        </div><!--inf -->
      </div><!--h_beer_detail_wrap -->
</div><!--body -->
  <div id="foot">
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
</div><!--wrap -->
</body>
</html>