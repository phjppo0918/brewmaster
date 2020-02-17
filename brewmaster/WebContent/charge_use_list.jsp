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
<link href="css_all/charge_use_list.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">

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
 <%
         String pageNumberStr = request.getParameter("page");
         int pageNumber = 1;
         if (pageNumberStr != null) {
            pageNumber = Integer.parseInt(pageNumberStr);
         }
      
         request.setCharacterEncoding("UTF-8");
         // String keyField = request.getParameter("keyField");
         // String keyWord = request.getParameter("keyWord");
         String u_id = (String)session.getAttribute("LOGIN");
          List<Chh> list = null;
          ChhListView view = null;
          User user = null;
          Connection conn = ConnectionProvider.getConnection();
            try{
            	ChhDao dao = new ChhDao();
            	UserDao udao = new UserDao();
               //list=dao.selectLike(conn, keyField, keyWord);
               view = dao.getChhList(conn, pageNumber, u_id);
               
               conn = ConnectionProvider.getConnection();
               user = udao.selectById(conn, u_id);
               }catch(SQLException e){}
      %>

<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
    <div id="charge_use_list_wrap">
  		<div id="charge_use_list_header">
    	  <div id="charge_use_list_title">
            <img src="images/charge_use_images/mycoin_title.png" width="170" height="65" /> 
          </div><!--charge_use_list_title -->
  	 	</div><!--charge_use_list_header -->
        <div id="rest_coin">
          <div id="rest_coin_header">
        	보유코인 : 
          </div><!--rest_coin_header -->
          <div id="rest_coin_main">
       		<%=user.getU_money() %>코인
          </div><!--rost_coin_main -->
        </div><!--rest_coin -->
  
  		<div id="charge_use_list_main">
  		  <table>
  		    <tr>
	          <th>충전/사용내역</th>
		      <th>결제금액</th>
		      <th>충전/사용시간</th>	           
  			</tr>
  			  <c:set var="list" value="<%=view.getChhList() %>"/> 
				<c:forEach var="chh" items="${list}"> <%--foreach문 시작 --%>
       	    <tr>
              <td>${chh.ch_way}</td>
           	  <td>${chh.ch_price}</td>
           	  <td>${chh.ch_time}</td>
		    </tr>   
              </c:forEach> 	<%--foreach문 끝 --%>
             <tr>
               <td colspan="3" id="paging">   
               <% for (int i = 1 ; i <= view.getPageTotalCount() ; i++) { %>
                 <a href="charge_use_list.jsp?page=<%= i %>">[<%= i %>]</a> 
               <% } %>
               </td>
             </tr>  	
            <tr>
              <td colspan="6" id="button_line">
                <div id="button">
			      <button type="button" id="mainpage_button" value="" onclick="location.href='main.jsp'"/>
			      <button type="button" id="mypage_button" value="" onclick="locatioin.href='myPage.jsp'"/>
		        </div><!--button -->
             </td>
            </tr>   
	       </table>
  		 </div><!--charge_use_list_main -->
       </div><!--charge_use_list_wrap -->
</div><!--body -->
  <div id="foot">
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
</div><!--wrap -->
</body>
</html>