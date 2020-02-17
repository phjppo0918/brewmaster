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
<link rel="icon" href="data:;base64,iVBORw0KGgo="/>
<link href="css_all/product_manage.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#search_keyword{
	height: 25px;
	width: 50px;
	border-top-color: #f6c420;
	border-right-color: #f6c420;
	border-bottom-color: #f6c420;
	border-left-color: #f6c420;
	background: none;
	border: none;
	background-image: url(images/product_manage_images/search_btn.png);
	background-repeat: no-repeat;   
    background-size:contain;   
}

#manage_page_button{
	float: left;
	width: 130px; 
	height:40px;
	margin-left: 420px;
	margin-top: 15px;
	border: none;
   	background-color:#fff;
	background-image: url(images/product_manage_images/managerpage_btn.png);
	background-repeat: no-repeat;
	background-size:contain;   
}
#delete_button{
	float: left;
	width: 90px; 
	height:40px;
	border: none;
   	background-color:#fff;
	background-image: url(images/product_manage_images/delete_button.png);
	background-repeat: no-repeat;
	background-size:contain;   
}
#detail_view_button{
	width: 90px; 
	height:40px;
	border: none;
   	background-color:#fff;
	background-image: url(images/product_manage_images/detail_view_btn2.png);
	background-repeat: no-repeat;
	background-size:contain; 
	}
	 
	#body {	
	clear: both;
	float: left;
	height:1400px;
	width: 1200px;
	} 
}
</style>
</head>
<body>

<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->

  <div id="body">
	<div id="product_manage_wrap">
  	  <div id="product_manage_header">
   		<img src="images/product_manage_images/product_manage_title.png" width="120" height="35" /> 
   	  </div><!--product_manage_header -->
 		
 		<form action="process/product_manageScarchProcess.jsp" method="post">
	 		<div id="search">
	 		 맥주<input type="radio" name="sc" id="sc" value="맥주"/>
         	 와인<input type="radio" name="sc" id="sc" value="와인"/> 
			 상품명  검색:<input type="text" name="keyword" id="keyword" />
		 	  <input type="submit" value="검색" id="search_keyword"/>
	 		</div><!--search --> 
	  	</form>	
  		
   	    <div id="product_manage_main">
		
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
					view = dao.getProductListKeyCon(conn, pageNumber, target, keyword);
		   		}catch(SQLException e){}
		%>
 			  
 			  <c:set var="list" value="<%=view.getProductList()%>"/> 
 			<form action="" method="post">
  			  <table>
  			    <tr>
			      <th>상품코드</th>		      
			      <th>상품이미지</th>
			      <th>상품종류</th>
			      <th>상품명(한글명)</th>
			      <th>평점</th>
			      <th>상세보기</th>
			      <th>삭제</th>
			      
  			    </tr>
				  <c:forEach var="product" items="${list}">
        	    <tr>
            	  <td>${product.p_no}</td>            
            	  <td>
            	    <img src="images/product_images/${product.p_image}" width="30" height="54"/>
            	  </td>          
            	  <td>${product.p_kind}</td>
            	  <td>${product.p_name_kr}</td>
   				  <td>${product.p_score}</td>
   				  <td>
   				    <button type="button" name="detail_view_button" id="detail_view_button" onclick="location.href='beer_detail.jsp?p_no=${product.p_no}';" />
   				  </td>
   				  <td>
   				    <button type="button" name="delete_button" id="delete_button" onclick="location.href='process/deleteProductProcess.jsp?p_no=${product.p_no}';"/>
   				  </td>
   				  
			    </tr>              
    			  </c:forEach>
    			  
    			<tr>
     			  <td colspan="7">
     				<% for (int i = 1 ; i <= view.getPageTotalCount() ; i++) { %>
					  <a href="product_manage_keyCon.jsp?page=<%= i %>&target=<%=target %>&keyword=<%=keyword%>">[<%= i %>]</a> 
					<% } %>
 		    	  </td>
     			</tr>
			  </table>
			</form>
			  
			  <button type="button" id="manage_page_button" value=""  onclick="location.href='adminPage.jsp'"/>
  		</div><!--product_manage_main -->
    </div><!--product_manage_wrap -->
</div><!--body -->
 
</div><!--wrap -->

</body>
</html>