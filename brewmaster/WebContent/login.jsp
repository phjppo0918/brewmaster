<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BREW MASTER</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo="/>
<link href="css_all/login.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function form_ck() {
	var u_id = document.getElementById('u_id').value;
	var u_pw = document.getElementById('u_pw').value;
	
	if(u_id==''){
		alert("아이디를 입력해주세요!");
		return false;
	}
	
	if(u_pw==''){
		alert("비밀번호를 입력해주세요!");
		return false;
	}
	
	return true;
}

</script>

</head>
<body>
<div id="wrap">
  <div id="head">
     <jsp:include page="head.jsp"/>
  </div><!--head -->
  <div id="body">
  
  <div id="page_main">
  <div class="login_main">
    <div class="login_header">로그인</div><!-- login_header--> 
    <div class="login_input">
      <form action="process/loginProcess.jsp" method="post" onsubmit="return form_ck();">
      <input type="text" id="u_id" name="u_id" placeholder="아이디"/>
      <p>
      <input type="password" id="u_pw" name="u_pw" placeholder=" 비밀번호"/>
      </p>
      <p>
      <input type="submit" name="login_button" id="button" value=" 로그인" />
      </p>
      </form>
    </div><!-- login_input-->
   
   <div class="login_footer">
      <a href="join.jsp">회원가입</a> | <a href="searchId.jsp">아이디 찾기</a> | <a href="searchPW.jsp">비밀번호 찾기</a></div><!-- login_footer-->
  </div><!-- login_main-->
</div><!-- page_main-->
  
  </div><!--body -->
  <div id="foot">
   <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  
  </div><!--foot -->
  
  
  
  
</div><!--wrap -->
</body>
</html>