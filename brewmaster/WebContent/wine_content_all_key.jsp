<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="css_all/wine_content.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<link rel="icon" href="data:;base64,iVBORw0KGgo="/>
<style type="text/css">
#search_button {
	width: 30px;
	height: 20px;
	background-image: url(images/wine_hbeer_contents_images/search_btn.png);
	border: none;
	background-repeat: no-repeat;   
    background-size:contain;   
}
#side_bagIn{
	width: 200px;
	position: fixed;
	border:1px;
}
</style>
<script type="text/javascript">
	function putcart(pno) {
		var id = pno;
		alert("장바구니에 넣었습니다!");
		location.href="process/putcartProcess.jsp?p_no="+id+"&amount=1";
	}


</script>
</head>
<body>
<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
	<div id="product_content_wrap">
  	  <div id="product_content_header">
  	     <a href="wine_content_all.jsp"><img src="images/wine_hbeer_contents_images/all_view_menu2.png" width="85" height="50" 
  	    		onmouseover="src='images/wine_hbeer_contents_images/all_view_rollover2.png'"
   				onmouseout="src='images/wine_hbeer_contents_images/all_view_menu2.png'"/></a>
  		 <a href="wine_content_detail.jsp?nation=redwine"><img src="images/wine_hbeer_contents_images/redwine_menu.png" width="115" height="50" 
  				onmouseover="src='images/wine_hbeer_contents_images/redwine_rollover.png'"
   				onmouseout="src='images/wine_hbeer_contents_images/redwine_menu.png'"/> </a>
  		<a href="wine_content_detail.jsp?nation=whitewine"><img src="images/wine_hbeer_contents_images/whitewine_menu.png" width="120" height="50"
  				onmouseover="src='images/wine_hbeer_contents_images/whitewine_rollover.png'"
   				onmouseout="src='images/wine_hbeer_contents_images/whitewine_menu.png'" /> </a>
  		<a href="wine_content_detail.jsp?nation=sparkling"><img src="images/wine_hbeer_contents_images/sparkling_menu.png" width="160" height="50"
  				onmouseover="src='images/wine_hbeer_contents_images/sparkling_rollover.png'"
   				onmouseout="src='images/wine_hbeer_contents_images/sparkling_menu.png'" /> </a>
  		<a href="wine_content_detail.jsp?nation=etc"><img src="images/wine_hbeer_contents_images/etc_menu.png" width="90" height="50" 
  				onmouseover="src='images/wine_hbeer_contents_images/etc_rollover.png'"
   				onmouseout="src='images/wine_hbeer_contents_images/etc_menu.png'"/></a>
   				</div> 
  	  <!--product_content_header -->
    <%
			String pageNumberStr = request.getParameter("page");
			int pageNumber = 1;
			if (pageNumberStr != null) {
				pageNumber = Integer.parseInt(pageNumberStr);
			}
		
			request.setCharacterEncoding("UTF-8");
			String target = request.getParameter("target");
			String keyword = request.getParameter("keyword");
			String nation = "all";
		    List<Product> list = null;
		    ProductListView view = null;
		    Connection conn = ConnectionProvider.getConnection();
				try{
					ProductDao dao = new ProductDao();
					//list=dao.selectLike(conn, keyField, keyWord);
					view = dao.getProductListShWAll(conn, pageNumber, target);
		   		}catch(SQLException e){}
	%>
     <div id="scroll_cart">
		 <jsp:include page="sidebar.jsp" /> 
     </div><!--scroll_cart --> 
  
     <div id="product_content_header2">
 	   <img src="images/wine_hbeer_contents_images/all_view_title2.png" width="170" height="45" />
	   <div id="product_content_header2_main">
  	   <div id="action_div">
  	    <form action="process/wnSearchUserProcess.jsp" method="post">
  	     <div id="p_name_div">
  		   <input type="text" name="p_name" id="p_name"/>
  		    <input type="hidden" name="nation" value="<%=nation %>"/>
  		 </div><!--p_name_div -->
  		 <div id="search_button_div">
  	  	   <input type="submit" name="search_button" id="search_button" value=""/>
  		 </div><!--search_button_div -->
  		 </form>
 	   </div><!--action_div -->
	  </div><!-- product_content_header2_main-->
    </div><!--product_content_header2 -->
  
   <div id="product_content_main">
    <c:set var="list" value="<%=view.getProductList()%>"/> 
	  <c:forEach var="product" items="${list}">
     <div id="product">
       <div id="product_image">
    		 <img src="images/product_images/${product.p_image}" width="150" height="270" onclick="location.href='wine_detail.jsp?p_no=${product.p_no}';"/>
       </div><!--product_image -->
 	   <div id="product_main">
       <div id="wine_name_kr" onclick="location.href='beer_detail.jsp?p_no=${product.p_no}';">
       		  ${product.p_name_kr}
       </div><!-- wine_name_kr-->
       <div id="wine_name_en" onclick="location.href='beer_detail.jsp?p_no=${product.p_no}';">
         ${product.p_name_en}
       </div><!--wine_name_en -->
        <p id="p_tag_price">${product.p_price}</p>
        <div id="product_action"> 
          <a href="#">
            <img src="images/wine_hbeer_contents_images/purchase_now_btn.png" width="45" height="20" onclick="location.href='process/purchaseProcess.jsp?p_no=${product.p_no}&amount=1'"/>
          </a>
          <a href="#">
            <img src="images/wine_hbeer_contents_images/cart_btn.png" width="20" height="20" onclick="putcart(${product.p_no})" />
          </a>
        </div><!--product_action -->
      </div><!--product_main -->
     </div><!-- product-->
     </c:forEach>
    </div><!--product_content_main -->
  
   <div id="paging">
   <% for (int i = 1 ; i <= view.getPageTotalCount() ; i++) { %>
					  <a href="wine_content_all_key.jsp?target=<%=target %>&page=<%= i %>">[<%= i %>]</a> 
					<% } %>
   </div><!--paging -->
</div> <!--   product_content_wrap -->
	
</div><!--body -->
  <div id="foot">
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
</div><!--wrap -->
</body>
</html>