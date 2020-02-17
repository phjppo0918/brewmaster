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
<link href="css_all/product_mywish.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#table_purchase_button{
	float: left;
	width: 60px;
	height: 30px;
	background-repeat: no-repeat;
	border: none;
	background-size: contain;
	background-image: url(images/product_mywish/mywish_purchase_btn.png);
	background-color: #fff;
	margin-left: 30px;		
}
#table_delete_button{
	float: left;
	width: 60px;
	height: 30px;
	background-repeat: no-repeat;
	border: none;
	background-size: contain;
	background-image: url(images/product_mywish/mywish_delete_btn.png);
	background-color: #fff;
	margin-left: 30px;	
}

#mainpage_button{
	float: left;
	width: 100px;
	height: 40px;
	background-repeat: no-repeat;
	border: none;
	background-size: contain;
	background-image: url(images/charge_use_images/mainpage_btn.png);
	background-color: #fff;
}
#mypage_button{
	float: left;
	width: 100px;
	height: 40px;
	margin-left: 10px;
	background-repeat: no-repeat;
	border: none;
	background-size: contain;
	background-image: url(images/charge_use_images/mypage_btn2.png);
	background-color: #fff;
}

</style>

</head>
<body>
<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
    <div id="p_mywish_wrap">
  		<div id="p_mywish_header">
    	  <div id="p_mywish_title">
            <img src="images/product_mywish/mywish_title.png" width="170" height="65" /> 
          </div><!--p_mywish_title -->
  	 	</div><!--p_mywish_header -->
      <%
			String pageNumberStr = request.getParameter("page");
			int pageNumber = 1;
			if (pageNumberStr != null) {
				pageNumber = Integer.parseInt(pageNumberStr);
			}
			String u_id = (String)session.getAttribute("LOGIN");
			request.setCharacterEncoding("UTF-8");
		    String keyField = request.getParameter("keyField");
		    String keyWord = request.getParameter("keyWord");
		    List<Mark> list = null;
		    MarkListView view = null;
		    Connection conn = ConnectionProvider.getConnection();
				try{
					MarkDao dao = new MarkDao();
					//list=dao.selectLike(conn, keyField, keyWord);
					view = dao.getMarkList(conn, pageNumber, u_id); 
		   		}catch(SQLException e){}
		%>
    <c:set var="list" value="<%=view.getMarkList()%>"/> 
  		<div id="p_mywish_main">
  		  <table>
  		    <tr>
	          <th>날짜</th>
		      <th>상품이미지</th>
		      <th>상품이름</th>
              <th>상품가격</th>
              <th>구매</th>
              <th>삭제</th>	  				         
  			</tr>
				<c:forEach var="mark" items="${list}"> <%--foreach문 시작 --%>
       	    <tr>
              <td>${mark.mark_time}</td>
           	  <td>
                <div id="product_image">
           <img src="images/product_images/${mark.p_image}" width="30" height="54"/>
            </div><!--product_image -->
              </td>
           	  <td>${mark.p_name}</td>
              <td>${mark.p_price}</td>
              <td>
                <button type="button" id="table_purchase_button" value="" onclick="location.href='process/purchaseProcess.jsp?p_no=${mark.p_no}&amount=1'"/>
              </td>
              <td>
                <button type="button" id="table_delete_button" value="" onclick="location.href='process/markDeleteProcess.jsp?p_no=${mark.p_no}'"/>
              </td>
		    </tr>   
             </c:forEach>  	<%--foreach문 끝 --%>
               	
             <tr>
               <td colspan="6" id="paging">   
              <% for (int i = 1 ; i <= view.getPageTotalCount() ; i++) { %>
					  <a href="product_mywish.jsp?page=<%= i %>">[<%= i %>]</a> 
					<% } %>   <%--페이징 --%>
               </td>
             </tr>  	   	
            <tr>
              <td colspan="6" id="button_line">
                <div id="button">
			      <button type="button" id="mainpage_button" value="" onclick="location.href='main.jsp'"/>
			      <button type="button" id="mypage_button" value="" onclick="location.href='myPage.jsp'"/>
		        </div><!--button -->
             </td>
            </tr>   
	       </table>
  		 </div><!--p_mywish_main -->
       </div><!--p_mywish_wrap -->
</div><!--body -->
  <div id="foot">
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
</div><!--wrap -->
</body>
</html>