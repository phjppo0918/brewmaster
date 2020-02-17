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
<link href="css_all/join_layout.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#join_modify_button{
	width: 180px;
	height: 65px;
	padding: 0;
	border: none;
	margin-top: 15px;
	background: none;
	background: url("images/modify_user_images/modify_finish.png") no-repeat;
}
#cancel_button{
	width: 180px;
	height: 65px;
	padding: 0;
	margin-left: 8px;
	border: none;
	background: none;
	background: url("images/modify_user_images/modify_cancel.png" ) no-repeat;

}


</style>
<script type="text/javascript">

function form_ck() {
	var u_pw = document.getElementById('u_pw').value;
	var u_pw_ck = document.getElementById('u_pw_ck').value;
	var u_ph1 = document.getElementById('u_ph1').value;
	var u_ph2 = document.getElementById('u_ph2').value;
	var u_ph3 = document.getElementById('u_ph3').value;
	var u_email_1 = document.getElementById('u_email_1').value;
	var u_email_2 = document.getElementById('u_email_2').value;
	
	
	if(u_pw==''){
		alert('비밀번호를 입력해주세요');
		document.getElementById('u_pw').focus();
		return false;
	}
	if(u_pw_ck==''){
		alert('비밀번호확인을 입력해주세요');
		document.getElementById('u_pw_ck').focus();
		return false;
	}
	
	if(u_pw_ck!=u_pw){
		alert('비밀번호와 비밀번호확인이 일치하지 않습니다.');
		document.getElementById('u_pw').focus();
		return false;
	} 
	if((u_ph1=='')||(u_ph2=='')||(u_ph3=='')){
		alert('전화번호를 입력해주세요');
		document.getElementById('u_ph1').focus();
		return false;
	}
	if((u_email_1=='')||(u_email_2=='')){
		alert('이메일을 입력해주세요');
		document.getElementById('u_email_1').focus();
		return false;
	}

	return true;
}
function checkUserPwLive() {
	var u_pw = document.getElementById('u_pw').value.trim();
	if(!/^[A-Za-z0-9]{4,15}$/.test(u_pw)){
		//alert("4자 이상 아이디는 영어 대소문자, 숫자 조합만 가능합니다.");
		//document.getElementById('user_id').focus();
		document.getElementById('password_notice').innerHTML = '비밀번호는 4자이상의  영어 대소문자, 숫자 조합만 가능합니다.';
		
	}else{
		document.getElementById('password_notice').innerHTML = '';
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
	<div id="join_wrap">
  	<div id="join_header">
  		<div id="join_header_image"><img src="images/modify_user_images/modify_info_title.png" width="250" height="65" />
  		</div><!--join_header_image --> 
  	</div><!--join_header -->
		
	<div id="join_main">
    	<form action="process/updateUserProcess.jsp" method="post" onsubmit="return form_ck();">
        	<table>         	  			
    			<tr>
    				<th>비밀번호</th>
        			<td>
    					<input type="password" name="u_pw" id="u_pw" placeholder="비밀번호를 입력해주세요" onkeyup="checkUserPwLive();"/><p></p>
    					<div id="password_notice" style="color: red; font-size: 13pt;"></div>
    				</td>
    			</tr>
  
				<tr>
    				<th>비밀번호 확인</th>
        			<td>
    					<input type="password" name="u_pw_ck" id="u_pw_ck" placeholder="비밀번호를 확인해주세요"/><p></p>
    				</td>
    			</tr>

				<tr>
    				<th>전화번호</th>
    				<td>
        				<input type="text" name="u_ph1" id="u_ph1" maxlength="3"/>-
      					<input type="text" name="u_ph2" id="u_ph2" maxlength="4"/>-
      					<input type="text" name="u_ph3" id="u_ph3" maxlength="4"/><p></p>
      				</td>
    			</tr>
    		
    			<tr>
    				<th>이메일 주소</th>
    				<td>
    					<input type="text" name="u_email_1" id="u_email_1"/>@
    					<select name="u_email_2" id="u_email_2">
    					<option value="kpu.ac.kr">kpu.ac.kr</option>
      					<option value="naver.com">naver.com</option>
  				     	<option value="gmail.com">gmail.com</option>
    					</select>
    					<p></p><p></p>
    				</td>
  				</tr> 
 
   				<tr>
    				<td colspan="2" align="left">
      						<input type="submit" id="join_modify_button" value="" />
     						<input type="reset" id="cancel_button" value="" />    
     				</td>
    			</tr>           
		</table>
	</form>
</div><!--join_main -->
           
</div><!--join_wrap -->
</div><!--body -->
  <div id="foot">
  
   <img src="images/foot_images/foot.png" width="1200px" height="300px" />
  </div><!--foot -->
  
</div><!--wrap -->
</body>
</html>