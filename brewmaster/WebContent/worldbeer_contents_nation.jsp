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
<link href="css_all/worldbeer_contents.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#search_button {
	width: 30px;
	height: 20px;
	background-image: url(images/worldbeer_contents_images/search_btn.png);		
	border: none;
	background-repeat: no-repeat;   
    background-size:contain;   
	margin-top: 5px;
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
<% 
	request.setCharacterEncoding("utf-8");
	String nation = request.getParameter("nation");
%>
<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
<div id="worldbeer_content_wrap">
  <div id="worldbeer_content_header">
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
      <jsp:include page="sidebar.jsp" />
        </div><!--scroll_cart -->
   <%
			String pageNumberStr = request.getParameter("page");
			int pageNumber = 1;
			if (pageNumberStr != null) {
				pageNumber = Integer.parseInt(pageNumberStr);
			}
		
			request.setCharacterEncoding("UTF-8");
		    String target = request.getParameter("target");
		    String keyword = request.getParameter("keyword");
		   
		    List<Product> list = null;
		    ProductListView view = null;
		    Connection conn = ConnectionProvider.getConnection();
				try{
					ProductDao dao = new ProductDao();
		 			//list=dao.selectLike(conn, keyField, keyWord);
					view = dao.getProductListNatB(conn, pageNumber, nation);
		   		}catch(SQLException e){}
	%>
  <div id="worldbeer_content_header2">
    <img src="images/worldbeer_contents_images/<%=nation %>_title.png" width="170" height="45"/>
    <div id="worldbeer_content_header2_main">
    <form action="process/wbSearchUserProcess.jsp" method="post">
      <input type="hidden" name="nation" value="<%=nation %>"/>
      <input type="text" name="p_name" id="p_name"/>  
      <input type="submit" name="search_button" id="search_button" value=""/>
      </form>
    </div><!-- worldbeer_content_header2_main-->
  </div><!--worldbeer_content_header2 -->
  
  <div id="worldbeer_content_main">
  	
	 <c:set var="list" value="<%=view.getProductList()%>"/> 
	  <c:forEach var="product" items="${list}">
  	<div id="worldbeer">
      <div id="worldbeer_image">
     		 <img src="images/product_images/${product.p_image}" width="150" height="270" onclick="location.href='beer_detail.jsp?p_no=${product.p_no}';"/>
      </div><!--worldbeer_image -->
 	
 	  <div id="worldbeer_main">
        <div id="worldbeer_name_kr" onclick="location.href='beer_detail.jsp?p_no=${product.p_no}';">
           ${product.p_name_kr}
        </div><!-- worldbeer_name_kr-->
        <div id="worldbeer_name_en" onclick="location.href='beer_detail.jsp?p_no=${product.p_no}';">
       ${product.p_name_en}
        </div><!--worldbeer_name_en -->

        <p id="p_tag_price">${product.p_price}</p>
            
        <div id="worldbeer_action"> 
          <a href="#"><img src="images/worldbeer_contents_images/purchase_now_btn.png" width="45" height="20" onclick="location.href='process/purchaseProcess.jsp?p_no=${product.p_no}&amount=1'"/></a>
          <a href="#"><img src="images/worldbeer_contents_images/cart_btn.png" width="20" height="20" onclick="putcart(${product.p_no})"/></a>
        </div><!--worldbeer_action -->
      </div><!--worldbeer_main -->   
    </div><!-- worldbeer-->
    </c:forEach>
    
  </div><!--worldbeer_content_main -->
  <div id="paging">
	<% for (int i = 1 ; i <= view.getPageTotalCount() ; i++) { %>
					  <a href="worldbeer_contents_nation.jsp?nation=<%=nation %>&page=<%= i %>">[<%= i %>]</a> 
					<% } %>
  </div><!--paging -->
  </div><!--worldbeer_content_wrap -->
</div><!--body -->
  <div id="foot">
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
</div><!--wrap -->
</body>
</html>