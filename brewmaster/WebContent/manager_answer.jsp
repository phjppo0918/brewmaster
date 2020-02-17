<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="css_all/manager_answer.css?var=1" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#mypage_button{
	width: 100px;
	height: 40px;
	border: none;
	background-image: url(images/manager_answer_images/mypage_btn2.png);
	background-color: #fff;
	background-repeat: no-repeat;
	background-size: contain;
}
#mainpage_button{
	float: left;
	width: 100px;
	height: 40px;
	border: none;
	background-image: url(images/manager_answer_images/mainpage_btn.png);
	background-color: #fff;
	background-repeat: no-repeat;
	background-size: contain;	
}
</style>

</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	int fnq_no = Integer.parseInt(request.getParameter("fnq_no"));
	
	 Connection conn = ConnectionProvider.getConnection(); 
	 	Fnq fnq = null;
	  
	  try {
		  FnqDao dao = new FnqDao();
		  fnq = dao.selectById(conn, fnq_no);
	   } catch(SQLException e){
	      e.printStackTrace();
	      out.print("error");
	   }
	
%>
<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
	<div id="fnq_wrap">
      <div id="fnq_header">
       	  답변 내역
      </div><!--fnq_header -->
      
      <div id="fnq_main">
        <div id="fnq_main_header">
          <div id="fnq_main_header1">
         	내용
          </div><!--fnq_main_header1 -->
          <div id="fnq_main_header2">
     	     문의일자
          </div><!--fnq_main_header2 -->
          <div id= "fnq_main_header3">
 	 	       답변여부
          </div><!--fnq_main_header3 -->
       </div><!--fnq_main_header -->
       
       <div id="fnq_user">
         <div id="fnq_story">
       	   <div id="fnq_story_header">
       		 Q.<%=fnq.getFnq_title() %></div><!--fnq_story_header -->
           <div id="fnq_story_main">
           	<%=fnq.getFnq_con() %>
           </div><!--fnq_story_main -->
         </div><!--fnq_story -->
         <div id="fnq_date">
       		<%=fnq.getFnq_time() %>
         </div><!--fnq_date -->
         <div id="fnq_ok">
       		답변완료
         </div><!--fnq_ok -->
       </div><!--fnq_user -->
       
       <div id="manager_answer">
     
         <%=fnq.getFnq_ans() %>
       </div><!--manager_answer -->
       
       <div id="answer_date">
         <%=fnq.getFnq_ans_time() %>
       </div><!--answer_date -->
    </div><!--fnq_main-->
      
    <div id="button">
      <div id="mybutton">
      	<button type="button" id="mypage_button" onclick="location.href='myPage.jsp'"/>
      </div><!--mybutton -->
      <div id="mainbutton">
        <button type="button" id="mainpage_button" onclick="location.href='main.jsp'"/>
      </div><!--mainbutton -->
    </div><!--button -->
  </div><!--fnq_wrap -->
</div><!--body -->
  <div id="foot">
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
</div><!--wrap -->
</body>
</html>