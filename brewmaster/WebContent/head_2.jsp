<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BREW MASTER</title>
<link href="css_all/head_css.css" rel="stylesheet" type="text/css" />
<link rel="icon" href="data:;base64,iVBORw0KGgo="/>

</head>
<body onload="init()">

<%
	request.setCharacterEncoding("utf-8");
	String u_id = (String)session.getAttribute("LOGIN");
	//int u_coin = Integer.parseInt((String)session.getAttribute("UCOIN"));

%>
<input type="hidden" id="u_id_hd" value="<%=u_id %>"/>
<div id="header">
  <div id="top_header">
  	<div class="basket"><img src="images/head_images/cart.png" width="30px" height="30px" onclick="location.href='cart.jsp'"/></div><!--basket -->
     <div id="top_hd1"><!-- top_hd2요소 --></div><!--top_hd1 -->
  	<div id="top_hd2"><!-- top_hd2요소 --></div><!--top_hd2 -->
  	<div id="top_hd3"><!-- top_hd3요소 --></div><!--top_hd3 -->
</div><!--top_header -->
<div id="main_header">
    <div id="main_h_im1"><img src="images/head_images/header1.png" width="500" height="100" /></div><!--main_h_im1 -->
    <div id="main_h_im2"><a href="main.jsp"><img src="images/head_images/logo.png" width="200" height="100" /></a></div><!--main_h_im1 -->
    <div id="main_h_im3"><img src="images/head_images/header2.png" width="500" height="100" /></div><!--main_h_im1 -->
</div><!--main_header -->

<div id="menubar">
  <div id="menubar_contents">
  	<div id="manu_con1">
  	<a href="worldbeer_contents.jsp"><img id="wb_m" src="images/head_images/worldbeer.png"
   width="210" height="35" onmouseover="over1(this)"  onmouseout="out1(this)"/></a>
  	</div>
  	<div id="manu_con3">
  	<a href=""><img id="wn_m" src="images/head_images/wine.png"
   width="210" height="35" onmouseover="over3(this)"  onmouseout="out3(this)" /></a>
  	</div>
  	<div id="manu_con2">
  	<a href=""><img id="hb_m" src="images/head_images/housebeer.png"
   width="210" height="35" onmouseover="over2(this)"  onmouseout="out2(this)" /></a>
  	</div>
  	<div id="manu_con4">
  	<a href=""><img id="ev_m" src="images/head_images/events.png"
   width="210" height="35" onmouseover="over4(this)"  onmouseout="out4(this)" /></a>
  	</div>
  </div><!--manubar_contents -->
  
</div><!--menubar -->
</div><!--header -->
<script type="text/javascript">
var wb_m,hb_m, wn_m;
var us_id = document.getElementById('u_id_hd').value; 
if(us_id=='null'){
	document.getElementById('top_hd1').innerHTML = '<a href="join.jsp">회원가입</a>';
	document.getElementById('top_hd2').innerHTML = '<a href="login.jsp">로그인</a>';	
}else{
	if(us_id=='admin'){
		document.getElementById('top_hd1').innerHTML = '<a href="adminPage.jsp">관리자페이지</a>';
		document.getElementById('top_hd2').innerHTML = '<a href="process/logout.jsp">로그아웃</a>';
	}else{
		document.getElementById('top_hd1').innerHTML = '<a href="myPage.jsp">마이페이지</a>';
		document.getElementById('top_hd2').innerHTML = '<a href="process/logout.jsp">로그아웃</a>';
		document.getElementById('top_hd3').innerHTML = us_id+'님 환영합니다!';
	}
}
function init() { // 문서가 완전히 로드되었을 때 호출
	
}
function over1(obj) {
	obj.src="images/head_images/rollover_worldbeer.png";
}
function out1(obj) {
	obj.src="images/head_images/worldbeer.png";
}	

function over2(obj) {
	obj.src="images/head_images/rollover_housebeer.png";
}
function out2(obj) {
	obj.src="images/head_images/housebeer.png";
}	

function over3(obj) {
	obj.src="images/head_images/rollover_wine.png";
}
function out3(obj) {
	obj.src="images/head_images/wine.png";
}
function over4(obj) {
	obj.src="images/head_images/rollover_events.png";
}
function out4(obj) {
	obj.src="images/head_images/events.png";
}
/* function overmc(obj){
	var mcid = obj.id;
	var mcclass = obj.className;
	obj.src="images/head_images/rollover_"+mcid+".png";	
}
function outmc(obj){
	var mcid = obj.id;
	var mcclass = obj.className;
	obj.src="images/head_images/"+mcclass+"_"+mcid+".png";
} */
</script>
</body>

</html>
