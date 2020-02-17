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
<link href="css_all/beer_detail.css?var=1" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css?var=1" rel="stylesheet" type="text/css" />
<style type="text/css">
#cart_button {
	width: 95px;
	height: 25px; 		
	border: none;
	background-repeat: no-repeat;
	background-size: contain;
	margin-top: 10px;
	background-image: url(images/products_detail_images/cart_btn.png);
}
#side_bagIn{
	width: 200px;
	position: fixed;
	border:1px;
}
#purchase_button {
	width:95px;
	height: 25px;		
	border: none;
	background-repeat: no-repeat;
	background-size: contain;
	margin-top: 10px;
	background-image: url(images/products_detail_images/direct_buy_btn.png);
	margin-left: 10px;
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
	function putcart(pno){
		var pno1 = pno
		var amount = document.getElementById("count").value;
		alert("장바구니에 넣었습니다!");
		location.href="process/putcartProcess.jsp?p_no="+pno1+"&amount="+amount;
		
	}
	
	function purchase(pno){
		var pno1 = pno
		var amount = document.getElementById("count").value;
		location.href="process/purchaseProcess.jsp?p_no="+pno1+"&amount="+amount;
	}

</script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	int p_no = Integer.parseInt(request.getParameter("p_no"));
	String u_id = (String)session.getAttribute("LOGIN");
	 Connection conn = ConnectionProvider.getConnection(); 
	   Product pro = null;
	  
	  try {
		  ProductDao dao = new ProductDao();
	     pro = dao.selectById(conn, p_no);
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
	 <div id="worldbeer_detail_wrap">
  	    <div id="worldbeer_detail_header">
  		    <a href="worldbeer_contents.jsp"><img src="images/worldbeer_contents_images/all_view.png" width="85" height="50" 
   							onmouseover="src='images/worldbeer_contents_images/rollover_all_view.png'"
   							onmouseout="src='images/worldbeer_contents_images/all_view.png'"/></a>
    <a href="worldbeer_contents_nation.jsp?nation=north_america"><img src="images/worldbeer_contents_images/north_america.png" width="130" height="50" 
   							onmouseover="src='images/worldbeer_contents_images/rollover_north_america.png'"
   							onmouseout="src='images/worldbeer_contents_images/north_america.png'"/></a>
    <a href="worldbeer_contents_nation.jsp?nation=south_america"><img src="images/worldbeer_contents_images/south_america.png" width="130" height="50"
    						onmouseover="src='images/worldbeer_contents_images/rollover_south_america.png'"
   							onmouseout="src='images/worldbeer_contents_images/south_america.png'" /></a>
    <a href="worldbeer_contents_nation.jsp?nation=europe"><img src="images/worldbeer_contents_images/europe.png" width="75" height="50" 
    						onmouseover="src='images/worldbeer_contents_images/rollover_europe.png'"
   							onmouseout="src='images/worldbeer_contents_images/europe.png'" /></a>
    <a href="worldbeer_contents_nation.jsp?nation=asia"><img src="images/worldbeer_contents_images/asia.png" width="55" height="50" 
    						onmouseover="src='images/worldbeer_contents_images/rollover_asia.png'"
   							onmouseout="src='images/worldbeer_contents_images/asia.png'" /></a>
    <a href="worldbeer_contents_nation.jsp?nation=africa"><img src="images/worldbeer_contents_images/africa.png" width="65" height="50" 
    						onmouseover="src='images/worldbeer_contents_images/rollover_africa.png'"
   							onmouseout="src='images/worldbeer_contents_images/africa.png'" /></a>
    <a href="worldbeer_contents_nation.jsp?nation=australia"><img src="images/worldbeer_contents_images/australia.png" width="90" height="50"
    						onmouseover="src='images/worldbeer_contents_images/rollover_australia.png'"
   							onmouseout="src='images/worldbeer_contents_images/australia.png'" /></a>
  	    </div><!--worldbeer_content_header -->
  <div id="scroll_cart">
		 <div id="side_bagIn">
       <jsp:include page="sidebar.jsp" />
       </div>
        </div><!--scroll_cart --> 
          <c:set var="u_id" value="<%=u_id%>"/> 
	 <div id="worldbeer_detail_main">
  	   <div id="product_main">
  		 <div id="product_image">
  			 <img src="images/product_images/<%=pro.getP_image() %>" width="255" height="460"/>
  		 </div><!--product_image -->
  		 <div id="product_count">
  	 	수량 <select name="count" id="count">
  			 <option value="1">1</option>
    		 <option value="2">2</option>
    		 <option value="3">3</option>
    		 <option value="4">4</option>
    		 <option value="5">5</option>
  		    </select>
  		  </div><!--product_count -->
 		  <div id="product_button">
  		    <button type="button" id="cart_button" value="" onclick="putcart(<%=pro.getP_no() %>)"/>
  		    <button type="button" id="purchase_button" value="" onclick="purchase(<%=pro.getP_no() %>)"/>
 		  </div><!--product_button -->
  	   </div><!--product_main -->
  
  	 <div id="inf">
   	   <div id="product_name_kr">
   			<%=pro.getP_name_kr() %>
   	   </div><!--product_name_kr -->
    	  <div id="product_name_en">
   			<%=pro.getP_name_en() %>
   	   </div><!--product_name_en -->
   	   <div id="product_price">
   		<%=pro.getP_price() %>
   	   </div><!--product_price -->
   	   <div id="product_wish_button">
   	     <button type="button" id="mywish_button" value="" onclick="mark(<%=pro.getP_no() %>)" />
   	   </div><!--product_wish_button -->
   	   <div id="product_country">
   	     <div id="country_font">
   		  	생산국가
   		 </div><!--country_font -->
   	   <div id="country_content">
   		<%=pro.getP_country() %>
   	   </div><!--country_content -->
   	   </div><!--product_country -->
   	
   	 <div id="product_sugar">
   	   <div id="sugar_font">
  		 당도 
   	   </div><!--sugar_font -->
	   <div id="sugar_image">
   		 <img src="images/products_detail_images/sweet<%=pro.getP_suger() %>.png" width="230" height="10" /> 
   	   </div><!--sugar_image -->
      </div><!--product_sugar -->
   
    <div id="product_carbonic">
      <div id="carbonic_font">
   		 탄산강도
      </div><!--carbonic_font -->
  	  <div id="carbonic_image"> 
   	    <img src="images/products_detail_images/sparkling<%=pro.getP_carbonic() %>.png" width="230" height="10" /> 
   	  </div><!--carbonic_image -->
    </div><!--product_carbonic -->
   
    <div id="product_alchol">
      <div id="alchol_font">
   		도수
      </div><!--alchol_font -->
      <div id="alchol_content">
   		<%=pro.getP_alchol() %>%
      </div><!--alchol__content -->
    </div><!--product_alchol -->
    
    <div id="product_detail">
   	  <div id="product_detail_font">
  		 주류정보
    </div><!--product_detail_font -->
      <div id="product_detail_content">
   		<%=pro.getP_detail() %>
      </div><!--product_detail_content -->
    </div><!--product_detail -->
  
    <div id="product_explain">
      <div id="explain_font">
     		주류설명
      </div><!--explain_font -->
      <div id="explain_content">
 		<%=pro.getP_explain() %>
      </div><!--explain_content -->
    </div><!--product_explain -->
   </div><!--inf --> 
  </div><!--worldbeer_detail_main -->
 </div><!--worldbeer_detail_wrap -->

</div><!--body -->
  <div id="foot">
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
</div><!--wrap -->
<script type="text/javascript">
function mark(pno){
	var pno1 = pno;
	var u_id = '${u_id}';
	if(u_id==''){
		  alert('로그인을 해주세요!');
		  location.href='login.jsp';
	}else{
		location.href="process/markProcess.jsp?p_no="+pno1;
	}
	
}
</script>
</body>
</html>