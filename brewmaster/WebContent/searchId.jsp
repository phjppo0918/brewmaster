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
<link href="css_all/searchIdStyle.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function ck_sub() {
	var u_name = document.getElementById('u_name').value;
	var u_email = document.getElementById('u_email').value;
	if(u_name==''){
		alert('이름을 입력해주세요');
		document.getElementById('u_name').focus();
		return false;
	}
	
	if(u_email==''){
		alert('이메일을 입력해주세요');
		document.getElementById('u_email').focus();
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
	<div class="login_main">
      <div class="login_header">아이디 찾기
      </div><!-- login_header--> 
      <div class="login_input">
      	<form action="process/searchIdProcess.jsp" method="post" onsubmit="return ck_sub();">
      		<input name="u_name" id="u_name" type="text" placeholder="이름" />
      		<p></p>
      		<input name="u_email" id="u_email" type="text" placeholder="이메일"/>
      		<p></p>
      			<input name="search_id_button" type="submit" id="search_id_button" value="아이디 찾기"/>
   	    </form>
      </div><!-- login_input-->
    </div><!-- login_main-->
  </div><!--body -->
  
  <div id="foot">
  
     <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
  
  
  
</div><!--wrap -->
</body>
</html>