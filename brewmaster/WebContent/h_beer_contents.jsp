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
<link href="css_all/h_beer_contents.css?var=1" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#search_button {
	width: 30px;
	height: 20px;
	background-image: url(images/h_beer_wine_contents_images/search_btn.png);		
	border: none;
	background-color: #fff;
	background-repeat: no-repeat;   
    background-size: contain;   

}
#h_beer_enroll_request_button{
	width: 150px;
	height: 35px;
	background-color: #fff;
	background-image: url(images/h_beer_wine_contents_images/housebeer_apply_btn.png);		
	border: none;
	background-repeat: no-repeat;   
    background-size:contain;   
}
</style>

</head>
<body>
<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
<div id="h_beer_content_wrap">
  <div id="h_beer_content_header2">
    <img src="images/h_beer_wine_contents_images/housebeer_title.png" width="170" height="45"/>
    <div id="h_beer_content_header2_main">  
	    <div id="header_keyword">
	      <form action="process/hbSearchUserProcess.jsp" method="post">
	      <div id="p_name_input">
     
      <input type="text" name="p_name" id="p_name"/>  
	      </div><!-- p_name_input-->
	    <div id="search">  
	      <input type="submit" name="search_button" id="search_button" value=""/>
	    </div><!--search -->
	      </form>
      </div><!--header_keyword -->
    </div><!-- h_beer_content_header2_main-->
  </div><!--h_beer_content_header2 -->
  
  <div id="h_beer_enroll_request">
    <button type="button" id="h_beer_enroll_request_button" onclick="location.href='h_beer_enroll.jsp'"/>
  </div><!--h_beer_enroll_request -->
  
  <div id="h_beer_content_main">
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
		    List<HBeer> list = null;
		    HBeerListView view = null;
		    Connection conn = ConnectionProvider.getConnection();
				try{
					HBeerDao dao = new HBeerDao();
					//list=dao.selectLike(conn, keyField, keyWord);
					view = dao.getHBeerListUV(conn, pageNumber);
		   		}catch(SQLException e){}
	%>
	
	<c:set var="list" value="<%=view.getHBeerList()%>"/> 
	<c:forEach var="h_beer" items="${list}">
  	<div id="h_beer">
      <div id="h_beer_image">
     		<img src="images/h_beer_images_user/${h_beer.h_beer_image}"
     		 width="150" height="270" onclick="location.href='h_beer_detail.jsp?h_beer_no=${h_beer.h_beer_no}';"/>
      </div><!--h_beer_image -->
 	
 	  <div id="h_beer_main">
        <div id="h_beer_name_kr"  onclick="location.href='h_beer_detail.jsp?h_beer_no=${h_beer.h_beer_no}';">
        	  ${h_beer.h_beer_name}
        </div><!-- h_beer_name_kr-->
        <div id="h_beer_name_en" onclick="location.href='h_beer_detail.jsp?h_beer_no=${h_beer.h_beer_no}';">
       제작자:   ${h_beer.h_beer_maker}
        </div><!--h_beer_name_en -->
        <p id="p_tag_price" >  ${h_beer.h_beer_price}</p>
            
        <div id="h_beer_action"> 
          <a href="#"><img src="images/h_beer_wine_contents_images/request.png" width="100" height="25" onclick="location.href='process/purchaseHBProcess.jsp?h_beer_no=${h_beer.h_beer_no}&amount=1'"/></a>
        </div><!--h_beer_action -->
      </div><!--h_beer_main -->   
    </div><!-- h_beer-->
    </c:forEach>
  </div><!--h_beer_content_main -->
  <div id="paging">
	<% for (int i = 1 ; i <= view.getPageTotalCount() ; i++) { %>
					  <a href="h_beer_contents.jsp?page=<%= i %>">[<%= i %>]</a> 
					<% } %> 
  </div><!--paging -->
  </div><!--h_beer_content_wrap -->
</div><!--body -->
  <div id="foot">
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
</div><!--wrap -->
</body>
</html>