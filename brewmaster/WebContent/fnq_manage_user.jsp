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
<link href="css_all/fnq_manage_user.css?var=1" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css?var=1" rel="stylesheet" type="text/css" />
<style type="text/css">
#qna_button{
	float: left;
	width: 130px;
	height: 40px;
	border: none;
	background-color: #fff;
    background-repeat: no-repeat;   
	background-size: contain;
	background-image: url(images/fnq_manage_user_images/qna_btn.png);
}
#mypage_button{
	width: 130px;
	height: 40px;
	border: none;
	background-color: #fff;
    background-repeat: no-repeat;   
	background-size: contain;
	background-image: url(images/fnq_manage_user_images/mypage_btn.png);
}
#view_ans{
	width: 80px;
	height: 30px;
	border: none;
	background-color: #fff;
    background-repeat: no-repeat;   
	background-size: contain;
	background-image: url(images/fnq_manage_user_images/view_ans.png);
}

</style>
 <script type="text/javascript">
	    	function fnq_ans_btn(fno, ck) {
				if(ck=='no'){
					alert("아직 관리자가 확인을 못했어요! 조금만 기다려주세요~");
				}else{
					location.href="manager_answer.jsp?fnq_no="+fno;
				}
			}
	    </script>
</head>

<body>

<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->

  <div id="body">
	<div id="fnq_user_manage_wrap">
	  <div id="fnq_user_manage_header">
		<img src="images/fnq_manage_user_images/qna11_title.png" width="250" height="65" />
	  </div><!--fnq_user_manage_header-->
	  <div id="fnq_user_manage_header2">
		<button type="button" id="qna_button" value="" onclick="location.href='user_fnq.jsp'"/>
	  </div><!--fnq_user_manage_header2 -->
	  <div id="fnq_user_manage_main">
	   <%
         String pageNumberStr = request.getParameter("page");
         int pageNumber = 1;
         if (pageNumberStr != null) {
            pageNumber = Integer.parseInt(pageNumberStr);
         }
      
         request.setCharacterEncoding("UTF-8");
         String u_id = (String)session.getAttribute("LOGIN");
          String target = request.getParameter("target");
          String keyword = request.getParameter("keyword");
          List<Fnq> list = null;
          FnqListView view = null;
          Connection conn = ConnectionProvider.getConnection();
            try{
            	FnqDao dao = new FnqDao();
               //list=dao.selectLike(conn, keyField, keyWord);
               view = dao.getFnqList(conn, pageNumber,u_id);
               }catch(SQLException e){}
      %>
         <c:set var="list" value="<%=view.getFnqList() %>"/> 
		<form action="" method="post">
  		  <table>
  			<tr>
			  <th>날짜</th>		      
			  <th>문의제목</th>
			  <th>문의유형</th>
			  <th>답변여부</th>
			  <th>답변보기</th>
  			</tr>
			 <c:forEach var="fnq" items="${list}">
        	 <tr>
           	   <td>${fnq.fnq_time}</td>            
               <td>${fnq.fnq_title}</td>          
               <td>${fnq.fnq_type}</td>
   			   <td>${fnq.fnq_ans_ck}</td>
   			   <td>
					<button type="button" name="view_ans" id="view_ans" value="send" onclick="fnq_ans_btn(${fnq.fnq_no},'${fnq.fnq_ans_ck}')" />
				</td>
			 </tr>      
			 </c:forEach>  
			  <tr>
                <td colspan="5">
                 <% for (int i = 1 ; i <= view.getPageTotalCount() ; i++) { %>
                 <a href="fnq_manage_user.jsp?page=<%= i %>">[<%= i %>]</a> 
               <% } %>
                </td>
              </tr>  
   		  </table>
	    </form>
	   
	  </div><!--fnq_user_manage_main -->

	  <div id="mypage">
		<button type="button" id="mypage_button" value="" onclick="location.href='myPage.jsp'"/>
	  </div><!--my page -->
	  
	</div><!--fnq_user_manage_wrap -->
</div><!--body -->
  <div id="foot">
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
</div><!--wrap -->

</body>
</html>