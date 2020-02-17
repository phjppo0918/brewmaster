<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>BREW MASTER</title>
<link href="css_all/head_css.css?var=1" rel="stylesheet" type="text/css" />
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
  <div id="header_title">
  <div id="top_hd3"><!-- top_hd3요소 --></div><!--top_hd3 -->
    <div id="header_logo"><a href="main.jsp"><img src="images/header_images/logo.png" width="280" height="45" /></a></div><!--header_logo -->
      <div id="cart"><img src="images/header_images/cart.png" width="18" height="18"  onclick="location.href='cart.jsp'" /></div><!--cart -->
   <div id="top_hd1"><!-- top_hd2요소 --></div><!--top_hd1 -->
  	<div id="top_hd2"><!-- top_hd2요소 --></div><!--top_hd2 -->
  	
  
  </div><!--header_title -->
  	<div id="greenbar"><img src="images/header_images/greenbar.png" width="1200" height="5" /></div><!--greenbar -->
  	<div id="menubar">
  	  <div id="menubar_contents">
  	    <div class="worldbeer_menu"><a href="worldbeer_contents.jsp"><img src="images/header_images/worldbeer_menubar.png" width="120" height="30" id="wb_m" onmouseover="over1(this)" onmouseout="out1(this)"/></a></div><!--worldbeer_menu -->
  	      <div class="wine_menu"><a href="wine_content_all.jsp"><img src="images/header_images/wine_menubar.png" width="80" height="30" id="wn_m" onmouseover="over2(this)" onmouseout="out2(this)" /></a></div><!--wine_menu -->
  	    <div class="housebeer_menu"><a href="h_beer_contents.jsp"><img src="images/header_images/housebeer_menubar.png" width="120" height="30" id="hb_m" onmouseover="over3(this)"  onmouseout="out3(this)"/></a></div><!--housebeer_menu -->
  	    <div class="events_menu"><a href="event_page.jsp"><img src="images/header_images/events_menubar.png" width="80" height="30" id="ev_m" onmouseover="over4(this)" onmouseout="out4(this)"/></a></div><!--events_menu -->
  	  </div><!--menubar_contents -->
  	</div><!--menubar -->
  	<div id="yellowbar"><img src="images/header_images/yellowbar.png" width="1200" height="2" /></div><!--yellowbar -->
</div><!--header -->

<script type="text/javascript">
var wb_m,hb_m, wn_m;
var us_id = document.getElementById('u_id_hd').value; 
if(us_id=='null'){
	document.getElementById('top_hd1').innerHTML = '<a href="join.jsp">회원가입</a>';
	document.getElementById('top_hd2').innerHTML = '<a href="login.jsp">로그인</a>';	
}else{
	if(us_id=='admin'){
		document.getElementById('top_hd1').innerHTML = '<a href="adminPage.jsp">관리페이지</a>';
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
	obj.src="images/header_images/worldbeer_rollover.png";
}
function out1(obj) {
	obj.src="images/header_images/worldbeer_menubar.png";
}	

function over2(obj) {
	obj.src="images/header_images/wine_rollover.png";
}
function out2(obj) {
	obj.src="images/header_images/wine_menubar.png";
}	

function over3(obj) {
	obj.src="images/header_images/housebeer_rollover.png";
}
function out3(obj) {
	obj.src="images/header_images/housebeer_menubar.png";
}
function over4(obj) {
	obj.src="images/header_images/events_rollover.png";
}
function out4(obj) {
	obj.src="images/header_images/events_menubar.png";
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
