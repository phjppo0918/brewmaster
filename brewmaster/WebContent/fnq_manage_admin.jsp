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
<link href="css_all/fnq_manage_admin.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#admin_page_button{
	float: left;
	width: 130px;
	height: 40px;
	border: none;
	background-color: #fff;
	border: none;
	background-repeat: no-repeat;
	background-size: contain;
	background-image: url(images/fnq_manage_admin_images/managerpage_btn.png);
	
}
#detail_view_button{
	width: 90px;
	height: 40px;
	border: none;
	background-color: #fff;
	background-repeat: no-repeat;
	background-size: contain;
	background-image: url(images/fnq_manage_admin_images/detail_view_btn2.png);
	
}
#anw_button{
	width: 90px;
	height: 40px;
	border: none;
	background-color: #fff;
	background-repeat: no-repeat;
	background-size: contain;
	background-image: url(images/fnq_manage_admin_images/answer_btn.png);
}
</style>
</head>
<body>
  
<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->

  <div id="body">
	<div id="fnq_manage_admin_wrap">
  	  <div id="fnq_manage_admin_header">
        <img src="images/fnq_manage_admin_images/question_manage_title.png" width="140" height="35" />
      </div><!--fnq_manage_admin_header -->	
  	  
  	  <div id="fnq_manage_admin_main">
  	  <%
			String pageNumberStr = request.getParameter("page");
			int pageNumber = 1;
			if (pageNumberStr != null) {
				pageNumber = Integer.parseInt(pageNumberStr);
			}
		
			request.setCharacterEncoding("UTF-8");
		    String keyField = request.getParameter("keyField");
		    String keyWord = request.getParameter("keyWord");
		    List<Fnq> list = null;
		    FnqListView view = null;
		    Connection conn = ConnectionProvider.getConnection();
				try{
					FnqDao dao = new FnqDao();
					//list=dao.selectLike(conn, keyField, keyWord);
					view = dao.getFnqListAdmin(conn, pageNumber);
		   		}catch(SQLException e){}
		%>
		 <c:set var="list" value="<%=view.getFnqList()%>"/> 
 			<form action="" method="post">   <%--form 위치!!!! --%>
  			  <table>
  			    <tr>
  			      <th>유저 아이디</th>
			      <th>날짜</th>		      
			      <th>문의제목</th>
			      <th>문의유형</th>
			     
			      <th>답변하기</th>
  			    </tr>
				  <c:forEach var="fnq" items="${list}">
        	    <tr>
        	      <td>${fnq.u_id }</td>
            	  <td>${fnq.fnq_time}</td>            
            	  <td>${fnq.fnq_title}</td>          
            	  <td>${fnq.fnq_type}</td>
   				
   				  <td> 
   				    <button type="button" name="anw_button" id="anw_button" onclick="location.href='manager_fnq.jsp?fnq_no=${fnq.fnq_no}'" />
   				  </td>	 				  
			    </tr> 
			    </c:forEach>   
			    
			    <tr>
     			  <td colspan="7">
     				<% for (int i = 1 ; i <= view.getPageTotalCount() ; i++) { %>
					  <a href="fnq_manage_admin.jsp?page=<%= i %>">[<%= i %>]</a> 
					<% } %>
 		    	  </td>
     			</tr>    
			  </table>
			</form>   <%--form위치!!! --%>                    
            
           
			  <div id="admin_button">
			  <button type="button" id="admin_page_button" value="" onclick="location.href='adminPage.jsp'"/>
		 </div><!--admin_button -->
  		</div><!--fnq_manage_admin_main -->
    </div><!--fnq_manage_admin_wrap -->
</div><!--body -->
  <div id="foot">
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
</div><!--wrap -->
 
</body>
</html>