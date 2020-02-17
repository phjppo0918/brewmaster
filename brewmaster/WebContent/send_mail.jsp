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
<link href="css_all/send_mail.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#submit_button{
   width: 100px;
   height: 40px;
   background-repeat: no-repeat;
   background-size: contain;
   background-image: url(images/send_email_images/send_email_btn.png);
   background-color: #fff;
   border-top-style: none;
   border-right-style: none;
   border-bottom-style: none;
   border-left-style: none;
}
</style>
</head>

<body>
<%
	request.setCharacterEncoding("utf-8");
	String u_id = request.getParameter("u_id");

	Connection conn = ConnectionProvider.getConnection();
	User user = null;

	try {
		UserDao dao = new UserDao();
		user = dao.selectById(conn, u_id);
	} catch (SQLException e) {
		e.printStackTrace();
		out.print("error");
	}
%>
<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
     <form action="process/sendMailProcess.jsp" method="post">
    <div id="send_email_wrap">
       <div id="send_email_header">
         <img src="images/send_email_images/send_email_title.png" width="130" height="60" />
       </div><!--send_email_header -->
     <div id="user_main">
        <div id="user_id">
          <div id="user_id_header">
              아이디:
          </div><!--user_id_header -->
         <div id="user_id_main">
           <%=user.getU_id() %>
          </div><!--user_id_main -->
        </div><!--user_id -->
      
        <div id="user_email">
           <div id="user_email_header">
              이메일:
          </div><!--user_email_header -->
          <div id="user_email_main">
             <%=user.getU_email() %>
          </div><!--user_email_main -->
        </div><!--user_email -->
      </div><!--user_main -->
    
       <div id="user_input">
        <div id="input_title">
          <div id="input_title_header">
            제목:
          </div><!--input_title_header -->
           <div id="input_title_main">
             <input type="text" name="title"/>
           </div><!--input_title_main -->
        </div><!--input_title -->
      
        <div id="user_content">
          <div id="user_content_header">
           내용:
        </div><!--user_content_header -->
        <div id="user_content_main">
          <textarea name="user_textarea" id="user_textarea">
          </textarea>
        </div><!--user_content_main -->
      </div><!-- user_content -->
    </div> <!--user_input -->
    
    <div id="submit">
    	<input type="hidden" name="u_id" value="<%=user.getU_id() %>"/>
    	<input type="hidden" name="u_email" value="<%=user.getU_email() %>"/>
       <input type="submit" id="submit_button" value=""/>
    </div><!--submit -->
    

</div><!--send_email_wrap -->
</form>
</div><!--body -->
  <div id="foot">
    <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
</div><!--wrap -->

</body>
</html>