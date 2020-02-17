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
<link href="css_all/user_manage.css?var=1" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css?var=1" rel="stylesheet" type="text/css" />
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
   background-image: url(images/user_manage_images/search_btn.png);
   background-repeat: no-repeat;   
    background-size:contain;   
}
#email_send_button{
   height: 25px;
   width: 50px;
   border-top-color: #f6c420;
   border-right-color: #f6c420;
   border-bottom-color: #f6c420;
   border-left-color: #f6c420;
   background: none;
   border: none;
   background-image: url(images/user_manage_images/send_btn.png);
   background-repeat: no-repeat;   
    background-size:contain;   
}
#admin_page_button{
   float: left;
   width: 180px; 
   height:65px;
   margin-left: 510px;
   margin-top: 35px;
   border: none;
      background-color:#fff;
   background-image: url(images/user_manage_images/managerpage_btn.png);
   background-repeat: no-repeat;
   background-size:contain;   
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
 
<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->

  <div id="body">
   <div id="user_manage_wrap">
       <div id="user_manage_header">
         <img src="images/user_manage_images/member_manage_title.png" width="120" height="35" /> 
        </div><!--user_manage_header -->
      
       <div id="search">
        <form action="process/userScarchProcess.jsp" method="post">
          검색유형:
         아이디 <input type="radio" name="sc" id="sc" value="u_id"/>
          이름<input type="radio" name="sc" id="sc" value="u_name"/> 
         검색어:<input type="text" name="keyword" id="keyword" />
         <input type="submit" name="search_keyword" id="search_keyword" value="검색"/>
          </form>
       </div><!--search --> 
       
          <div id="user_manage_main">
      
       <%
         String pageNumberStr = request.getParameter("page");
         int pageNumber = 1;
         if (pageNumberStr != null) {
            pageNumber = Integer.parseInt(pageNumberStr);
         }
      
         request.setCharacterEncoding("UTF-8");
          String keyField = request.getParameter("keyField");
          String keyWord = request.getParameter("keyWord");
          List<User> list = null;
          UserListView view = null;
          Connection conn = ConnectionProvider.getConnection();
            try{
            	UserDao dao = new UserDao();
               //list=dao.selectLike(conn, keyField, keyWord);
               view = dao.getUserList(conn, pageNumber);
               }catch(SQLException e){}
      %>
             
            <c:set var="list" value="<%=view.getUserList() %>"/> 
             <form action="" method="post">  <%--  form 위치!! --%>
             <table>
               <tr>
               <th>아이디</th>            
               <th>이름</th>
               <th>전화번호</th>
               <th>보유코인</th>
                  <th>생년월일</th>
                  <th>이메일</th>
                  <th>메일보내기</th>
               </tr>
              <c:forEach var="user" items="${list}">
               <tr>
                 <td>${user.u_id}</td>            
                 <td>${user.u_name}</td>          
                 <td>${user.u_ph}</td>
                  <td>${user.u_money}</td>
                  <td>${user.u_birth}</td>
                  <td>${user.u_email}</td>
                 <td width="100"> 
                   <button type="button" name="email_send_button" id="email_send_button" value="send" onclick="location.href='send_mail.jsp?u_id=${user.u_id}'" />
                 </td>
             </tr>              
               </c:forEach>
               
             <tr>
                <td colspan="7">
                 <% for (int i = 1 ; i <= view.getPageTotalCount() ; i++) { %>
                 <a href="user_manage.jsp?page=<%= i %>">[<%= i %>]</a> 
               <% } %>
                </td>
              </tr>
           </table>
            </form>
           <input type="button" id="admin_page_button" value="" onclick="locatioin.href='adminPage.jsp'"/>
       
        </div><!--user_manage_main -->
    </div><!--user_manage_wrap -->
</div><!--body -->
  <div id="foot">
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
</div><!--wrap -->
  <%-- form위치 !! --%>
</body>
</html>