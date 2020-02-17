<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*,java.util.*" %>
<%@ page import="java.io.PrintWriter" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>회원가입 완료!</title>
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<link href="css_all/h_beer_accept.css" rel="stylesheet" type="text/css" />
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
   background-image: url(images/h_beer_accept_images/search_btn.png);
   background-repeat: no-repeat;   
    background-size:contain;   
}
#h_beer_view_button{ 
   float: left;
   width: 180px;
   height: 65px;
   margin-left: 170px;
   margin-top: 30px;
   border: none;
   background-color:#fff;
   background-image: url(images/h_beer_accept_images/housebeer_view_btn.png);
   background-repeat: no-repeat;   
   background-size:contain;      
}
#admin_page_button{
   float: left;
   width: 180px; 
   height:65px;
   margin-left: 10px;
   margin-top: 30px;
   border: none;
   background-color:#fff;
   background-image: url(images/h_beer_accept_images/managerpage_go_btn.png);
   background-repeat: no-repeat;
   background-size:contain;
   
}
#detail_button{
   text-align: center;
   height: 25px;
   width: 70px;
   background-color:#fff;
   background-image: url(images/h_beer_accept_images/detail_view_btn.png);
   border: none;
   background-repeat: no-repeat;
   background-size:contain;
}
#accept_button{
   height: 25px;
   width: 50px;
   border: none;
   background-color:#fff;
   background-image: url(images/h_beer_accept_images/housebeer_permit_btn.png);
   background-repeat: no-repeat;
   background-size:contain;
}
#refuse_button{
   height: 25px;
   width: 50px;
   border: none;
   background-color:#fff;
   background-image: url(images/h_beer_accept_images/housebeer_nopermit_btn.png);
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
      <div id="h_beer_accept_wrap">
        <div id="h_beer_accept_header">
         <div id="h_beer_accept_title">
           <img src="images/h_beer_accept_images/housebeer_permit_title.png" width="160" height="35"/>
           </div><!--h_beer_accept_title -->
         </div><!--h_beer_accept_header -->
         
         <form action="process/hBeerScarchProcess.jsp" method="post">
          <div id="search">
                검색유형:
            제작자 <input type="radio" name="sc"id="sc" value="h_beer_maker"/>
              제품명<input type="radio" name="sc"id="sc" value="h_beer_name"/> 
             검색어:<input type="text" name="keyword" id="keyword" />
            <input type="submit" value="검색" id="search_keyword"/>
          </div><!--search --> 
      </form>       
  
        <div id="h_beer_accept_main">
           <%
            String pageNumberStr = request.getParameter("page");
            int pageNumber = 1;
            if (pageNumberStr != null) {
               pageNumber = Integer.parseInt(pageNumberStr);
            }
         
            request.setCharacterEncoding("UTF-8");
             String keyField = request.getParameter("keyField");
             String keyWord = request.getParameter("keyWord");
             List<HBeer> list = null;
             HBeerListView view = null;
             Connection conn = ConnectionProvider.getConnection();
               try{
                     HBeerDao dao = new HBeerDao();
                  //list=dao.selectLike(conn, keyField, keyWord);
                  view = dao.getHBeerList(conn, pageNumber);
                  }catch(SQLException e){}
         %>
      
            <c:set var="list" value="<%=view.getHBeerList()%>"/> 
            <form action="h_beer_accept.jsp" method="post"> 
             <table>
               <tr>
               <th>제품코드</th>
               <th>제작자</th>
               <th>제품명</th>
               <th>가격</th>
               <th>상세보기</th>
                  <th>제품검증</th>
                  <th>승인상태</th>
               </tr>
              <c:forEach var="h_beer" items="${list}">
               <tr>
                 <td>${h_beer.h_beer_no}</td>
                 <td>${h_beer.h_beer_maker}</td>
                 <td>${h_beer.h_beer_name}</td>          
                 <td>${h_beer.h_beer_price}</td>
                  <td>
                   <button type="button" name="detail_button" id="detail_button" value="상세보기" onclick="location.href=''" />
                 </td>
                 
                 <td width="100">
                   <button type="button" name="accept_button" id="accept_button" onclick="location.href='process/h_beerAcceptProcess.jsp?itemID='+${h_beer.h_beer_no}" />
                    <button type="button" name="refuse_button" id="refuse_button"  onclick="location.href='process/h_beerRefuseProcess.jsp?itemID='+${h_beer.h_beer_no}" />
                 </td>
                 <td>${h_beer.h_beer_acc}</td>
             </tr>  
              
               </c:forEach>
               <tr>
                <td colspan="7">
                 <% for (int i = 1 ; i <= view.getPageTotalCount() ; i++) { %>
                 <a href="h_beer_accept.jsp?page=<%= i %>">[<%= i %>]</a> 
               <% } %>
                </td>
              </tr>  
             </table>
           </form>
           
           <button type="button" id="h_beer_view_button" value="" onclick="location.href=''"/>
           <button type="button" id="admin_page_button" value="" onclick="location.href='adminPage.jsp'"/>
         
        </div><!--h_beer_accept_main -->
    </div><!--h_beer_accept_wrap -->
  
  
  </div><!--body -->
  <div id="foot">
   <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
  
  
  
</div><!--wrap -->
</body>
</html>