<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page import="dao.*,util.*,model.*,java.sql.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>무제 문서</title>
<link href="css_all/main_style.css?var=1" rel="stylesheet" type="text/css" />
<link href="css_all/main_layout.css?var=1" rel="stylesheet" type="text/css" />
<link rel="icon" href="data:;base64,iVBORw0KGgo="/>

<style type="text/css">
* {box-sizing: border-box;}
/* body {font-family: Verdana, sans-serif;} */
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
   max-heigth: 420px;
  position: relative;
  margin: auto;

}

/* Caption text */
.text {
  color: #000000;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #717171;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #0F514B;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 3s;
  animation-name: fade;
  animation-duration: 3s;
}
#dot_bar{
	float:left;
	margin-left: 570px;
}
@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
/*north america*/
#apDiv1 {
   position: absolute;

   width: 240px;
   height: 210px;
   z-index: 1;
   left: 450px;
   top: 600px;
}

/*south america*/
#apDiv2 {
   position: absolute;

   width: 240px;
   height: 210px;
   z-index: 1;
   left: 250px;
   top: 950px;
}

/*europe*/
#apDiv3 {
   position: absolute;
 
   width: 240px;
   height: 210px;
   z-index: 1;
   left: 700px;
   top: 580px;
}

/*asia*/
#apDiv4 {
   position: absolute;
 
   width: 240px;
   height: 210px;
   z-index: 1;
   left: 900px;
   top: 570px;
}

/*africa*/
#apDiv5 {
   position: absolute;
  
   width: 240px;
   height: 210px;
   z-index: 1;
   left: 600px;
   top: 1050px;
}

/*australia*/
#apDiv6 {
   position: absolute;
  
   width: 240px;
   height: 210px;
   z-index: 1;
   left: 830px;
   top: 1000px;
}
</style>
</head>

<body>

<div id="wrap">
   <div id="header">
<%
	request.setCharacterEncoding("utf-8");
	String u_id = (String)session.getAttribute("LOGIN");
%>
  <jsp:include page="head.jsp"/>

</div><!--header -->  
<div id="main">
	<div class="slideshow-container">

<div class="mySlides fade">
  <!-- <div class="numbertext">1 / 3</div> -->
  <img src="images/main_page_images/main_image1.png" width="1200px" height="420px"/>
  <!-- <div class="text">Caption One</div> -->
</div>

<div class="mySlides fade">
 <!--  <div class="numbertext">2 / 3</div> -->
  <img src="images/main_page_images/main_image2.png" width="1200px" height="420px"/>
<!--   <div class="text">Caption Two</div> -->
</div>

<div class="mySlides fade">
 <!--  <div class="numbertext">3 / 3</div> -->
  <img src="images/main_page_images/main_image3.png" width="1200px" height="420px"/>
 <!--  <div class="text">Caption Three</div> -->
</div>
</div>

<div id="dot_bar" style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>
	
	
	
	<script type="text/javascript">
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 5000); // Change image every 2 seconds
}

function north_america_over(){
	document.getElementById("ap_north_america").src="images/main_page_images/north_america_rollover.png";
}
function north_america_out(){
	document.getElementById("ap_north_america").src="";
}


function europe_over(){
	document.getElementById("ap_europe").src="images/main_page_images/europe_rollover.png";
}
function europe_out(){
	document.getElementById("ap_europe").src="";
}


function asia_over(){
	document.getElementById("ap_asia").src="images/main_page_images/asia_rollover.png";
}
function asia_out(){
	document.getElementById("ap_asia").src="";
}


function south_america_over(){
	document.getElementById("ap_south_america").src="images/main_page_images/south_america_rollover.png";
}
function south_america_out(){
	document.getElementById("ap_south_america").src="";
}
function africa_over(){
	document.getElementById("ap_africa").src="images/main_page_images/africa_rollover.png";
}
function africa_out(){
	document.getElementById("ap_africa").src="";
}
function australia_over(){
	document.getElementById("ap_australia").src="images/main_page_images/australia_rollover.png";
}
function australia_out(){
	document.getElementById("ap_australia").src="";
}

</script>
	<div id="world_map_title">
	  <div id="worldmap_title_img"><img src="images/main_page_images/world_map_title.png" width="200" height="40" /></div><!--world_map_title_img -->
	</div><!--world_map_title -->
	
	
<!-- 	<div id="apDiv1"></div> -->
 <div id="apDiv1"><img src="" width="240" height="210" id="ap_north_america" alt=""/></div>
   <div id="apDiv2"><img src="" width="240" height="210" id="ap_south_america" alt=""/></div>
   <div id="apDiv3"><img src="" width="240" height="210" id="ap_europe" alt=""/></div>
   <div id="apDiv4"><img src="" width="240" height="210" id="ap_asia" alt=""/></div>
   <div id="apDiv5"><img src="" width="240" height="210" id="ap_africa" alt=""/></div>
   <div id="apDiv6"><img src="" width="240" height="210" id="ap_australia" alt=""/></div>

	<div id="world_map">
	  <div id="world_map_imgs">
	    <div class="img01"><img src="images/main_page_images/image01.png" width="110" height="410" /></div><!--img01 -->
	    <div class="img02"><img src="images/main_page_images/image02.png" width="890" height="60" /></div><!--img02 -->
	    <div class="img03_north_america"><img src="images/main_page_images/image03_north_america.png" width="210" height="120" 
	    		onmouseover="north_america_over()" onmouseout="north_america_out()"/></div><!--img03_north_america -->
	    <div class="img04"><img src="images/main_page_images/image04.png" width="130" height="120" /></div><!--img04 -->
	    <div class="img05_europe"><img src="images/main_page_images/image05_europe.png" width="130" height="120" 
	    onmouseover="europe_over()" onmouseout="europe_out()"/></div><!--img05_europe -->
	    <div class="img06_asia"><img src="images/main_page_images/image06_asia.png" width="420" height="120" 
	    onmouseover="asia_over()" onmouseout="asia_out()" /></div><!--img06_asia -->
	    <div class="img07"><img src="images/main_page_images/image07.png" width="120" height="230" /></div><!--img07 -->
	    <div class="img08_south_america"><img src="images/main_page_images/image08_south_america.png" width="140" height="230"
	     onmouseover="south_america_over()" onmouseout="south_america_out()" /></div><!--img08_south_america -->
	    <div class="img09"><img src="images/main_page_images/image09.png" width="50" height="230" /></div><!--img09 -->
	    <div class="img10_africa"><img src="images/main_page_images/image10_africa.png" width="170" height="170"
	     onmouseover="africa_over()" onmouseout="africa_out()" /></div><!--img10_africa -->
	    <div class="img11"><img src="images/main_page_images/image11.png" width="410" height="100" /></div><!--img11 -->
        <div class="img12"><img src="images/main_page_images/image12.png" width="220" height="70" /></div><!--img12 -->
        <div class="img_13_australia"><img src="images/main_page_images/image13_australia.png" width="120" height="70" 
         onmouseover="australia_over()" onmouseout="australia_out()"/></div><!--img13_australia -->
	    <div class="img14"><img src="images/main_page_images/image14.png" width="70" height="70" /></div><!--img14 -->
	    <div class="img15"><img src="images/main_page_images/image15.png" width="580" height="60" /></div><!--img15 -->
	  </div><!--world_map_imgs -->
	</div><!--world_map -->
	<div id="bestbeer">
	  <div id="bestbeer_title"><img src="images/main_page_images/bestbeer_title.png" width="120" height="30" /></div><!--bestbeer_title -->
	</div><!--bestbeer -->
	<div id="bestbeer_contents">
	  <div id="beest_beers">
	    <div class="bestbeer1"><img src="images/main_page_images/bestbeer1.png" width="250" height="330" /></div><!--bestbeer1 -->
	    <div class="bestbeer2"><img src="images/main_page_images/bestbeer2.png" width="250" height="330" /></div><!--bestbeer2 -->
	    <div class="bestbeer3"><img src="images/main_page_images/bestbeer3.png" width="250" height="330" /></div><!--bestbeer3 -->
	  </div><!--best_beers -->
	</div><!--bestbeer_contents -->
	<%
	 List<Product> list = null;
   // ProductListView view = null;
    Connection conn = ConnectionProvider.getConnection();
		try{
			ProductDao dao = new ProductDao();
			//list=dao.selectLike(conn, keyField, keyWord);
			list = dao.selectListTop3(conn);
   		}catch(SQLException e){}
	
	%>
	 <c:set var="list" value="<%=list%>"/> 
	 
	<div id="top_beer">
	  <div id="top_beer_title"><img src="images/main_page_images/top_beer_title.png" width="130" height="30" /></div><!--top_beer_title -->
	</div><!--top_beer -->
	<div id="top_beer_contents">
	  <div id="top_beer_imgs">
	  <c:forEach var="product" items="${list}">
	    <div class="topbeer01">
	      <div class="topbeer01_img"> <img src="images/product_images/${product.p_image}" width="140" height="250" onclick="location.href='beer_detail.jsp?p_no=${product.p_no}';"/></div><!--topbeer01_img -->
	      <div class="topbeer01_name" style=" text-align: center;"> ${product.p_name_kr}</div><!--topbeer01_name -->
	      <div class="topbeer01_price" style=" text-align: center;"> ${product.p_price}</div><!--topbeer01_price -->
	    </div><!--topbeer01 -->
        </c:forEach>
         
	  </div><!--top_beer_imgs -->
	</div><!--top_beer_contents -->
</div><!--main -->
<div id="foot">
 <img src="images/foot_images/foot.png" width="1200px" height="300px" />
</div>
</div><!-- wrap -->
</body>
</html>
