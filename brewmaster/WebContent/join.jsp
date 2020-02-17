<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BREW MASTER</title>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon"/>
<link href="css_all/join_layout.css" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#join_button{
	width: 180px;
	height: 65px;
	padding: 0;
	border: none;
	margin-top: 15px;
	background: none;
	  background: url( "images/join_images/join_button.png" ) no-repeat;	
}
#cancel_button{
	width: 180px;
	height: 65px;
	padding: 0;
	margin-left: 8px;
	border: none;
	background: none;
	background: url( "images/join_images/modify_cancel.png" ) no-repeat;

}
#ck_id{
	width: 90px;
	height: 30px;
	padding: 0;
	border: none;
	background: none;
	background: url( "images/join_images/id_check.png" ) no-repeat;
	background-size:contain;
	
}
</style>
</head>

<body>
<div id="wrap">
<div id="head">
	<jsp:include page="head.jsp" />
</div><!-- head -->
<div id="body">
<div id="join_wrap">
  <div id="join_header">
  		<div id="join_header_image"><img src="images/join_images/join_title.png" width="170" height="65" />
    
    	</div><!--join_header_image --> 
  </div><!--join_header -->
		
	<div id="join_main">
    	<form action="process/joinProcess.jsp" id="form_join" onsubmit="return join_ck();" method="post">
        	<table>
            	<tr>
    				<th>아이디</th>
    				<td>
    					<input type="text" name="u_id" id="u_id" onkeyup="checkUserId()" placeholder="아이디를 입력해주세요"/>
    					 	<button type="button" id="ck_id"  onclick="goPopup()"></button> <p></p>
    					 <div id="id_notice" style="color: red; font-size: 13pt;"></div>
    					 <input type="hidden" name="ck_ok_hid" id="ck_ok_hid" value="unc"/>
    				</td>
   				</tr>
    			
    			<tr>
    				<th>비밀번호</th>
        			<td>
    					<input type="password" name="u_pw" id="u_pw" placeholder="비밀번호를 입력해주세요"/><p></p>
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
    				<th>이름</th>
        			<td>
    					<input type="text" name="u_name" id="u_name" placeholder="이름을 입력해주세요"/>
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
   					<th>생년월일</th>
   					<td>
    					<select name="u_year" id="year"></select>년  
    					<select name="u_month" id="month"></select>월    
    					<select name="u_day" id="day"></select>일
    					<p></p>
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
      						<input type="submit" id="join_button" value=""/>
     						<input type="reset" id="cancel_button" value="" />    
     				</td>
    			</tr>           
		</table>
	</form>

</div><!--join_main -->      
</div><!--join_wrap -->
</div><!-- body -->
<div id="foot">
 <img src="images/foot_images/foot.png" width="1200px" height="300px" />
</div><!-- foot -->
</div><!-- wrap -->
</body>
<script src="js_all/joinJs.js">
</script>
</html>
