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
<link href="css_all/purchase_list.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">

#mainpage_button{
	float: left;
	width: 100px;
	height: 40px;
	background-repeat: no-repeat;
	border: none;
	background-size: contain;
	background-image: url(images/purchase_list_images/mainpage_btn.png);
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
	background-image: url(images/purchase_list_images/mypage_btn2.png);
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
	<div id="purchase_list_wrap">
  		<div id="purchase_list_header">
    	  <div id="purchase_list_title">
            <img src="images/purchase_list_images/my_buy_title.png" width="170" height="65" /> 
          </div><!--purchase_list_title -->
  	 	</div><!--purchase_list_header -->
     <%
         String pageNumberStr = request.getParameter("page");
         int pageNumber = 1;
         if (pageNumberStr != null) {
            pageNumber = Integer.parseInt(pageNumberStr);
         }
      
         request.setCharacterEncoding("UTF-8");
         String u_id = (String)session.getAttribute("LOGIN");
          List<Purchase> list = null;
          PurchaseListView view = null;
          Connection conn = ConnectionProvider.getConnection();
            try{
            	PurchaseDao dao = new PurchaseDao();
               //list=dao.selectLike(conn, keyField, keyWord);
               view = dao.getPurchaseListUser(conn, pageNumber, u_id);
               }catch(SQLException e){}
      %>
       <c:set var="list" value="<%=view.getPurchaseList() %>"/> 
  		<div id="purchase_list_main">
  		  <table>
  		    <tr>
	          <th>날짜</th>
		      <th>상품 id</th>
		      <th>수량</th>
		      <th>총가격</th>
		      <th>주소</th>
		      <th>송장번호</th>
  			</tr>
  			 <c:forEach var="pur" items="${list}">
				 <%--foreach문 시작 --%>
       	    <tr>
              <td>${pur.pur_time}</td>
           	  <td>${pur.p_no}</td>
           	  <td>${pur.amount}</td>
           	  <td>${pur.pur_price_total}</td>
           	  <th>${pur.add_doro}</th>
  			  <td><a href="https://www.hanjin.co.kr/Delivery_html/inquiry/result_waybill.jsp?wbl_num=${pur.invoice}">${pur.invoice}</a></td>
		    </tr>   
		    </c:forEach>
               	<%--foreach문 끝 --%>
               	   
             <tr>
                <td colspan="6">
                 <% for (int i = 1 ; i <= view.getPageTotalCount() ; i++) { %>
                 <a href="purchase_list.jsp?page=<%= i %>">[<%= i %>]</a> 
               <% } %>
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
  		 </div><!--purchase_list_main -->
       </div><!--purchase_list_wrap -->
</div><!--body -->
  <div id="foot">
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
</div><!--wrap -->
</body>
</html>