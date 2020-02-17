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
<link href="css_all/manager_fnq.css?var=1" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css?var=1" rel="stylesheet" type="text/css" />
<style type="text/css">
#manager_anw_button{
	float: left;
	width: 90px;
	height: 40px;
	border: none;
	background-color: #fff;
	background-repeat: no-repeat;
	background-size: contain;
	background-image: url(images/manager_fnq_images/answer_btn.png);
}
</style>
</head>
<body>
<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->
  <%
  	request.setCharacterEncoding("utf-8");
 	int fnq_no = Integer.parseInt(request.getParameter("fnq_no"));
    Connection conn = ConnectionProvider.getConnection();
    Fnq fnq = null;
	try{
		FnqDao dao = new FnqDao();
		//list=dao.selectLike(conn, keyField, keyWord);
		fnq = dao.selectById(conn, fnq_no);

		}catch(SQLException e){}
  %>
  <div id="body">
  
	<div id="manager_fnq_wrap">
      <div id="manager_fnq_header">관리자 답변</div><div id="manager_fnq_main">
	  
	  <div id="align">
	    문의유형
	  </div><!--align --><p></p>
	  <div id="fnq_type">
            <%=fnq.getFnq_type() %>
      </div><!--fnq_type --><p></p>
	  
	  <div id="align">
	  	문의날짜
	  </div><!--align --><p></p>
	  <div id="fnq_date">
         <%=fnq.getFnq_time() %>
      </div><!--fnq_date --><p></p>
      
      <div id="align">
      	문의제목
      </div><!--align --><p></p>
	  <div id="fnq_title">
       	  <%=fnq.getFnq_title() %>
      </div><!--fnq_title --><p></p>
	      
	  <div id="align">
	  	사용자ID
	  </div><!--align --><p></p>
	  <div id="fnq_user">
    	 <%=fnq.getU_id() %>
      </div><!--fnq_user --><p></p>

	  <div id="align">
	      문의내용
	  </div><!--align --><p></p>
      <div id="fnq_con">
       	 <%=fnq.getFnq_con() %>
      </div><!--fnq_con --><p></p>
       
      <div id="align"><span id="important_font">*</span>
      	답변내용
      </div><!--align --><p></p>
        <form action="process/fnqAnsProcess.jsp" method="post">    
      <textarea name="fnq_ans" id="fnq_ans" cols="65" rows="15">
	  </textarea>	   
	 <div id="manager_anw">
       <input type="hidden" name="fnq_no" value="<%=fnq.getFnq_no() %>"/>
    </div><!--manager_anw -->
		<input type="submit" id="manager_anw_button" value=""/>
      </form>
    </div><!--manager_fnq_main -->
	  
    
  </div><!--manager_fnq_wrap -->
</div><!--body -->
  <div id="foot">
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
</div><!--wrap -->
</body>
</html>